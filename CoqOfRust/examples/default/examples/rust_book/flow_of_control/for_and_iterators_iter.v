(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let names = vec!["Bob", "Frank", "Ferris"];

    for name in names.iter() {
        match name {
            &"Ferris" => println!("There is a rustacean among us!"),
            // TODO ^ Try deleting the & and matching just "Ferris"
            _ => println!("Hello {}", name),
        }
    }

    println!("names: {:?}", names);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* names :=
      let* α0 := M.read (mk_str "Bob") in
      let* α1 := M.read (mk_str "Frank") in
      let* α2 := M.read (mk_str "Ferris") in
      let* α3 := M.alloc [ α0; α1; α2 ] in
      let* α4 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α3 ] in
      let* α5 := M.read α4 in
      let* α6 :=
        M.call
          (Ty.apply
              (Ty.path "slice")
              [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ])::["into_vec"]
          [ pointer_coercion "Unsize" α5 ] in
      M.alloc α6 in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::slice::iter::Iter")
                [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ]
          ] in
      let* α1 :=
        M.get_method
          "core::ops::deref::Deref"
          "deref"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                  Ty.path "alloc::alloc::Global"
                ]
          ] in
      let* α2 := M.call α1 [ borrow names ] in
      let* α3 :=
        M.call
          (Ty.apply
              (Ty.path "slice")
              [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ])::["iter"]
          [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      let* α5 := M.alloc α4 in
      let* α6 :=
        match_operator
          α5
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_method
                      "core::iter::traits::iterator::Iterator"
                      "next"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::slice::iter::Iter")
                            [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ]
                      ] in
                  let* α1 := M.call α0 [ borrow_mut iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.None =>
                          let* α0 := M.break in
                          let* α1 := M.read α0 in
                          let* α2 := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match 
                        end) :
                        Ty.tuple [];
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.Some _ =>
                          let γ0_0 :=
                            (M.var "core::option::Option::Get_Some_0") γ in
                          let* name := M.copy γ0_0 in
                          match_operator
                            name
                            [
                              fun γ =>
                                (let* γ :=
                                  let* α0 := M.read γ in
                                  M.pure (deref α0) in
                                let* _ :=
                                  let* α0 :=
                                    M.read
                                      (mk_str
                                        "There is a rustacean among us!
") in
                                  let* α1 := M.alloc [ α0 ] in
                                  let* α2 :=
                                    M.call
                                      (Ty.path
                                          "core::fmt::Arguments")::["new_const"]
                                      [ pointer_coercion "Unsize" (borrow α1)
                                      ] in
                                  let* α3 :=
                                    M.call
                                      (M.var "std::io::stdio::_print")
                                      [ α2 ] in
                                  M.alloc α3 in
                                M.alloc tt) :
                                Ty.tuple [];
                              fun γ =>
                                (let* _ :=
                                  let* α0 := M.read (mk_str "Hello ") in
                                  let* α1 := M.read (mk_str "
") in
                                  let* α2 := M.alloc [ α0; α1 ] in
                                  let* α3 :=
                                    M.call
                                      (Ty.path
                                          "core::fmt::rt::Argument")::["new_display"]
                                      [ borrow name ] in
                                  let* α4 := M.alloc [ α3 ] in
                                  let* α5 :=
                                    M.call
                                      (Ty.path
                                          "core::fmt::Arguments")::["new_v1"]
                                      [
                                        pointer_coercion "Unsize" (borrow α2);
                                        pointer_coercion "Unsize" (borrow α4)
                                      ] in
                                  let* α6 :=
                                    M.call
                                      (M.var "std::io::stdio::_print")
                                      [ α5 ] in
                                  M.alloc α6 in
                                M.alloc tt) :
                                Ty.tuple []
                            ]
                        | _ => M.break_match 
                        end) :
                        Ty.tuple []
                    ] in
                M.alloc tt)) :
              Ty.tuple []
          ] in
      M.pure (use α6) in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "names: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow names ] in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α2);
              pointer_coercion "Unsize" (borrow α4)
            ] in
        let* α6 := M.call (M.var "std::io::stdio::_print") [ α5 ] in
        M.alloc α6 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
