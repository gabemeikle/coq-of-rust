/// This module implements the reordering of the definitions in the output
use crate::configuration::*;
use crate::env::*;
use itertools::Itertools;
use rustc_hir::intravisit::Map;
use rustc_hir::{HirId, Impl, ImplItemRef, Item, ItemId, ItemKind, Node, QPath, Ty, TyKind};
use rustc_middle::ty::TyCtxt;
use std::string::ToString;

pub(crate) trait GetHirId {
    fn hir_id(&self) -> HirId;
}

impl GetHirId for ItemId {
    fn hir_id(&self) -> HirId {
        self.hir_id()
    }
}

impl GetHirId for ImplItemRef {
    fn hir_id(&self) -> HirId {
        self.id.hir_id()
    }
}

pub(crate) fn get_name(tcx: &TyCtxt, a_id: HirId) -> String {
    let a_name = tcx.hir().ident(a_id).as_str().to_string();
    if a_name.is_empty() {
        let a_node_opt = tcx.hir().find(a_id);
        match a_node_opt {
            Some(node) => get_impl_type_opt(node).unwrap_or(a_name),
            None => a_name,
        }
    } else {
        a_name
    }
}

/// Given a HirId returns the name of the context/scope
/// where such item is. Example top_level::inner_mod::other_mod
fn get_context_name(tcx: &TyCtxt, id: HirId) -> String {
    let name = tcx
        .hir()
        .parent_iter(id)
        .filter_map(|(_, parent)| match get_impl_type_opt(parent) {
            Some(typ) => Some(typ),
            None => parent.ident().map(|ident| ident.as_str().to_string()),
        })
        .collect::<Vec<String>>()
        .into_iter()
        .rev()
        .collect::<Vec<String>>()
        .join("::");
    if name.is_empty() {
        "top_level".to_string()
    } else {
        format!("top_level::{}", name)
    }
}

pub(crate) fn get_full_name(tcx: &TyCtxt, id: HirId) -> String {
    format!("{}::{}", get_context_name(tcx, id), get_name(tcx, id))
}

fn vec_move<T>(v: &mut Vec<T>, src: usize, dst: usize) {
    let x = v.remove(src);
    v.insert(dst, x);
}

/// Reorder a vector of definitions to match the contents of the
/// configuration file. The reordering happens before the compilation
/// i.e. before calling the `compile_...` functions, in the
/// HIR.
///
/// In the configuration file:
///
/// `{ "reorder": { "somefile.rs": { "area": { "move": "down", "after": "height" }, ... }}}
///
/// This means that "area" should be moved down, after "height".
/// If the area already happens after height a warning is reported
/// the move is not performed and the compilation continues
#[allow(clippy::ptr_arg)] // Disable warning over &mut Vec<...>, using &mut[...] wont compile
pub(crate) fn reorder_definitions_inplace(
    tcx: &TyCtxt,
    env: &mut Env,
    parent_context: &str,
    definitions: &mut Vec<impl GetHirId>,
) {
    if definitions.is_empty() {
        return;
    }

    if env.configuration.debug_reorder {
        eprintln!(
            "{}",
            definitions
                .iter()
                .enumerate()
                .map(|(i, def)| format!(
                    // \x1b[0;31m <- red
                    // \x1b[0m <- reset
                    "\x1b[0;31mreorder before: {i:6} {}/{} {}\x1b[0m",
                    env.file,
                    get_context_name(tcx, def.hir_id()),
                    get_name(tcx, def.hir_id())
                ))
                .collect::<Vec<String>>()
                .join("\n")
        );
    }

    let definitions_ids: Vec<HirId> = definitions.iter().map(|def| def.hir_id()).collect();

    for def_id in &definitions_ids {
        let def_name = get_name(tcx, *def_id);
        let context = get_context_name(tcx, *def_id);
        if context != parent_context {
            continue;
        }
        let pos = definitions
            .iter()
            .position(|elm| elm.hir_id() == *def_id)
            .unwrap();

        match config_get_reorder(env, &context, &def_name) {
            Some(move_) => {
                let move_up = move_.move_ == "up";
                let move_before = move_.is_before();
                let direction = &move_.move_;
                let befaft = if move_before { "before" } else { "after" };
                if let Some(config_identifier) = move_.get_ident() {
                    let config_id_pos = definitions
                        .iter()
                        .map(|def| get_name(tcx, def.hir_id()))
                        .position(|elm| elm == config_identifier);
                    let file = &env.file;
                    if config_id_pos.is_none() {
                        eprintln!("Warning: No symbol {config_identifier} found in the context {file}/{context}, is this a typo?");
                        eprintln!("Warning: Enable `debug_reorder` to see the identifiers in {file}/{context} scope");
                        eprintln!("Warning: Example `cargo coq-of-rust 2>&1 | grep -e 'reorder before: .* {file}/{context} '`");
                        continue;
                    }
                    let config_id_pos = config_id_pos.unwrap()
                        + (if (!move_before && move_up) || (move_before && !move_up) {
                            1
                        } else {
                            0
                        });
                    if (move_up && config_id_pos > pos) || (!move_up && config_id_pos < pos) {
                        eprintln!("Warning: Asked to move {def_name} {direction}, {befaft} of {config_identifier}, but it already comes {befaft} it, ignoring");
                        continue;
                    }

                    if env.configuration.debug_reorder {
                        eprintln!("reoder: moving {def_name} ({pos}) {direction} {befaft} of {config_identifier} ({config_id_pos})");
                    }
                    vec_move(definitions, pos, config_id_pos);
                } else {
                    // if the destination is not specified it means an item should be removed
                    // this change was introduced to temporarily remove blocking modules from a file
                    definitions.remove(pos);
                }
            }
            None => {
                continue;
            }
        }
    }

    if env.configuration.debug_reorder {
        eprintln!(
            "{}",
            definitions
                .iter()
                .map(|def| {
                    let id = def.hir_id();
                    let pos = definitions_ids.iter().position(|x| *x == id).unwrap_or(0);
                    format!(
                        // \x1b[0;32m <- green
                        // \x1b[0m <- reset
                        "\x1b[0;32mreorder after:  {pos:6} {}/{} {}\x1b[0m",
                        env.file,
                        get_context_name(tcx, def.hir_id()),
                        get_name(tcx, def.hir_id())
                    )
                })
                .collect::<Vec<String>>()
                .join("\n")
        );
    }
}

/// Extract the type name for a node if is a trait
/// implementation, otherwise returns None
fn get_impl_type_opt(node: Node) -> Option<String> {
    match node {
        Node::Item(Item {
            kind:
                ItemKind::Impl(Impl {
                    self_ty:
                        Ty {
                            kind: TyKind::Path(QPath::Resolved(_, rustc_hir::Path { segments, .. })),
                            ..
                        },
                    of_trait,
                    ..
                }),
            ..
        }) => {
            let ty_name: String = segments.iter().map(|x| x.ident.as_str()).join("::");
            match of_trait {
                Some(rustc_hir::TraitRef { path, .. }) => {
                    let trait_name = path.segments.iter().map(|x| x.ident.as_str()).join("::");
                    Some(format!("Impl_{trait_name}_for_{ty_name}"))
                }
                None => Some(format!("Impl_{ty_name}")),
            }
        }
        _ => None,
    }
}
