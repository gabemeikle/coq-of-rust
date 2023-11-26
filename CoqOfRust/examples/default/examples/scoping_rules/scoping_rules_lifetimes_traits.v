(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Borrowed.
Section Borrowed.
  Record t : Set := {
    x : ref i32.t;
  }.
  
  Global Instance Get_x : Notations.Dot "x" := {
    Notations.dot := Ref.map (fun x' => x'.(x)) (fun v x' => x' <| x := v |>);
  }.
  Global Instance Get_AF_x : Notations.DoubleColon t "x" := {
    Notations.double_colon (x' : M.Val t) := x'.["x"];
  }.
End Borrowed.
End Borrowed.

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed_t.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed_t.
  Ltac Self := exact scoping_rules_lifetimes_traits.Borrowed.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : M.Val core.fmt.Formatter.t := deref α0 in
      let* α2 : mut_ref core.fmt.Formatter.t := borrow_mut α1 in
      let* α3 : ref str.t := M.read (mk_str "Borrowed") in
      let* α4 : M.Val str.t := deref α3 in
      let* α5 : ref str.t := borrow α4 in
      let* α6 : ref str.t := M.read (mk_str "x") in
      let* α7 : M.Val str.t := deref α6 in
      let* α8 : ref str.t := borrow α7 in
      let* α9 : ref scoping_rules_lifetimes_traits.Borrowed.t := M.read self in
      let* α10 : M.Val scoping_rules_lifetimes_traits.Borrowed.t := deref α9 in
      let* α11 : ref (ref i32.t) := borrow α10.["x"] in
      let* α12 : M.Val (ref (ref i32.t)) := M.alloc α11 in
      let* α13 : ref (ref (ref i32.t)) := borrow α12 in
      let* α14 : M.Val (ref (ref i32.t)) := deref α13 in
      let* α15 : ref (ref (ref i32.t)) := borrow α14 in
      let* α16 : M.Val (ref (ref (ref i32.t))) := M.alloc α15 in
      let* α17 : M.Val (ref type not implemented) :=
        pointer_coercion "Unsize" α16 in
      let* α18 : ref type not implemented := M.read α17 in
      let* α19 : core.result.Result.t unit core.fmt.Error.t :=
        core.fmt.Formatter.t::["debug_struct_field1_finish"] α2 α5 α8 α18 in
      let* α0 : M.Val (core.result.Result.t unit core.fmt.Error.t) :=
        M.alloc α19 in
      M.read α0).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed_t.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed_t.

Module  Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed_t.
Section Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed_t.
  Ltac Self := exact scoping_rules_lifetimes_traits.Borrowed.t.
  
  (*
      fn default() -> Self {
          Self { x: &10 }
      }
  *)
  Definition default : M ltac:(Self) :=
    M.function_body
      (let* α0 : M.Val i32.t := M.alloc 10 in
      let* α1 : ref i32.t := borrow α0 in
      let* α2 : M.Val i32.t := deref α1 in
      let* α3 : ref i32.t := borrow α2 in
      let* α0 : M.Val scoping_rules_lifetimes_traits.Borrowed.t :=
        M.alloc {| scoping_rules_lifetimes_traits.Borrowed.x := α3; |} in
      M.read α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon ltac:(Self) "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed_t.
End Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed_t.

(*
fn main() {
    let b: Borrowed = Default::default();
    println!("b is {:?}", b);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* b : M.Val scoping_rules_lifetimes_traits.Borrowed.t :=
      let* α0 : scoping_rules_lifetimes_traits.Borrowed.t :=
        core.default.Default.default
          (Self := scoping_rules_lifetimes_traits.Borrowed.t)
          (Trait := ltac:(refine _)) in
      M.alloc α0 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "b is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref scoping_rules_lifetimes_traits.Borrowed.t := borrow b in
        let* α8 : M.Val scoping_rules_lifetimes_traits.Borrowed.t := deref α7 in
        let* α9 : ref scoping_rules_lifetimes_traits.Borrowed.t := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α11 ] in
        let* α13 : ref (array core.fmt.rt.Argument.t) := borrow α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := deref α13 in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
