(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn create_fn() -> impl Fn() {
    let text = "Fn".to_owned();

    move || println!("This is a: {}", text)
}
*)
Definition create_fn (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* text :=
      let* α0 :=
        M.get_method
          "alloc::borrow::ToOwned"
          "to_owned"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "Fn") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "This is a: ") in
                  let* α2 := M.read (mk_str "
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [ text ] in
                  let* α5 := M.alloc [ α4 ] in
                  let* α6 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" α3;
                        pointer_coercion "Unsize" α5
                      ] in
                  let* α7 := M.call α0 [ α6 ] in
                  M.alloc α7 in
                let* α0 := M.alloc tt in
                M.read α0) :
                _
            ]) :
          _) in
    M.read α0
  | _, _ => M.impossible
  end.

Error OpaqueTy.

(*
fn create_fnmut() -> impl FnMut() {
    let text = "FnMut".to_owned();

    move || println!("This is a: {}", text)
}
*)
Definition create_fnmut (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* text :=
      let* α0 :=
        M.get_method
          "alloc::borrow::ToOwned"
          "to_owned"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "FnMut") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "This is a: ") in
                  let* α2 := M.read (mk_str "
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [ text ] in
                  let* α5 := M.alloc [ α4 ] in
                  let* α6 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" α3;
                        pointer_coercion "Unsize" α5
                      ] in
                  let* α7 := M.call α0 [ α6 ] in
                  M.alloc α7 in
                let* α0 := M.alloc tt in
                M.read α0) :
                _
            ]) :
          _) in
    M.read α0
  | _, _ => M.impossible
  end.

Error OpaqueTy.

(*
fn create_fnonce() -> impl FnOnce() {
    let text = "FnOnce".to_owned();

    move || println!("This is a: {}", text)
}
*)
Definition create_fnonce (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* text :=
      let* α0 :=
        M.get_method
          "alloc::borrow::ToOwned"
          "to_owned"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "FnOnce") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "This is a: ") in
                  let* α2 := M.read (mk_str "
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [ text ] in
                  let* α5 := M.alloc [ α4 ] in
                  let* α6 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" α3;
                        pointer_coercion "Unsize" α5
                      ] in
                  let* α7 := M.call α0 [ α6 ] in
                  M.alloc α7 in
                let* α0 := M.alloc tt in
                M.read α0) :
                _
            ]) :
          _) in
    M.read α0
  | _, _ => M.impossible
  end.

Error OpaqueTy.

(*
fn main() {
    let fn_plain = create_fn();
    let mut fn_mut = create_fnmut();
    let fn_once = create_fnonce();

    fn_plain();
    fn_mut();
    fn_once();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* fn_plain :=
      let* α0 := M.var "functions_closures_as_output_parameters::create_fn" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* fn_mut :=
      let* α0 :=
        M.var "functions_closures_as_output_parameters::create_fnmut" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* fn_once :=
      let* α0 :=
        M.var "functions_closures_as_output_parameters::create_fnonce" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::Fn"
          "call"
          [ (* Self *) _; (* Args *) Ty.tuple [] ] in
      let* α1 := M.call α0 [ fn_plain; tt ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::FnMut"
          "call_mut"
          [ (* Self *) _; (* Args *) Ty.tuple [] ] in
      let* α1 := M.call α0 [ fn_mut; tt ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::FnOnce"
          "call_once"
          [ (* Self *) _; (* Args *) Ty.tuple [] ] in
      let* α1 := M.read fn_once in
      let* α2 := M.call α0 [ α1; tt ] in
      M.alloc α2 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
