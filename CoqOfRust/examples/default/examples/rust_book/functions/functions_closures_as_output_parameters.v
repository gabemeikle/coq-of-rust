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
        M.get_trait_method
          "alloc::borrow::ToOwned"
          "to_owned"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "Fn") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::Arguments")
                          "new_v1" in
                      let* α2 := M.read (mk_str "This is a: ") in
                      let* α3 := M.read (mk_str "
") in
                      let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                      let* α5 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::rt::Argument")
                          "new_display" in
                      let* α6 := M.call α5 [ text ] in
                      let* α7 := M.alloc (Value.Array [ α6 ]) in
                      let* α8 :=
                        M.call
                          α1
                          [
                            M.pointer_coercion (* Unsize *) α4;
                            M.pointer_coercion (* Unsize *) α7
                          ] in
                      let* α9 := M.call α0 [ α8 ] in
                      M.alloc α9 in
                    let* α0 := M.alloc (Value.Tuple []) in
                    M.read α0
                ]
            | _ => M.impossible
            end)) in
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
        M.get_trait_method
          "alloc::borrow::ToOwned"
          "to_owned"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "FnMut") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::Arguments")
                          "new_v1" in
                      let* α2 := M.read (mk_str "This is a: ") in
                      let* α3 := M.read (mk_str "
") in
                      let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                      let* α5 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::rt::Argument")
                          "new_display" in
                      let* α6 := M.call α5 [ text ] in
                      let* α7 := M.alloc (Value.Array [ α6 ]) in
                      let* α8 :=
                        M.call
                          α1
                          [
                            M.pointer_coercion (* Unsize *) α4;
                            M.pointer_coercion (* Unsize *) α7
                          ] in
                      let* α9 := M.call α0 [ α8 ] in
                      M.alloc α9 in
                    let* α0 := M.alloc (Value.Tuple []) in
                    M.read α0
                ]
            | _ => M.impossible
            end)) in
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
        M.get_trait_method
          "alloc::borrow::ToOwned"
          "to_owned"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "FnOnce") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::Arguments")
                          "new_v1" in
                      let* α2 := M.read (mk_str "This is a: ") in
                      let* α3 := M.read (mk_str "
") in
                      let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                      let* α5 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::rt::Argument")
                          "new_display" in
                      let* α6 := M.call α5 [ text ] in
                      let* α7 := M.alloc (Value.Array [ α6 ]) in
                      let* α8 :=
                        M.call
                          α1
                          [
                            M.pointer_coercion (* Unsize *) α4;
                            M.pointer_coercion (* Unsize *) α7
                          ] in
                      let* α9 := M.call α0 [ α8 ] in
                      M.alloc α9 in
                    let* α0 := M.alloc (Value.Tuple []) in
                    M.read α0
                ]
            | _ => M.impossible
            end)) in
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
      let* α0 :=
        M.get_function
          "functions_closures_as_output_parameters::create_fn"
          [] in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* fn_mut :=
      let* α0 :=
        M.get_function
          "functions_closures_as_output_parameters::create_fnmut"
          [] in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* fn_once :=
      let* α0 :=
        M.get_function
          "functions_closures_as_output_parameters::create_fnonce"
          [] in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::ops::function::Fn"
          "call"
          [ (* Self *) _; (* Args *) Ty.tuple [] ] in
      let* α1 := M.call α0 [ fn_plain; Value.Tuple [] ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::ops::function::FnMut"
          "call_mut"
          [ (* Self *) _; (* Args *) Ty.tuple [] ] in
      let* α1 := M.call α0 [ fn_mut; Value.Tuple [] ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::ops::function::FnOnce"
          "call_once"
          [ (* Self *) _; (* Args *) Ty.tuple [] ] in
      let* α1 := M.read fn_once in
      let* α2 := M.call α0 [ α1; Value.Tuple [] ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
