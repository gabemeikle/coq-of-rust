(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let output = Command::new("rustc")
        .arg("--version")
        .output()
        .unwrap_or_else(|e| panic!("failed to execute process: {}", e));

    if output.status.success() {
        let s = String::from_utf8_lossy(&output.stdout);

        print!("rustc succeeded and stdout was:\n{}", s);
    } else {
        let s = String::from_utf8_lossy(&output.stderr);

        print!("rustc failed and stderr was:\n{}", s);
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* output :=
      let* α0 := M.read (mk_str "rustc") in
      let* α1 := M.call ((Ty.path "std::process::Command")::["new"] α0) in
      let* α2 := M.alloc α1 in
      let* α3 := M.read (mk_str "--version") in
      let* α4 :=
        M.call
          ((Ty.path "std::process::Command")::["arg"] (borrow_mut α2) α3) in
      let* α5 := M.call ((Ty.path "std::process::Command")::["output"] α4) in
      let* α6 :=
        M.call
          ((Ty.apply
                (Ty.path "core::result::Result")
                [Ty.path "std::process::Output";
                  Ty.path "std::io::error::Error"])::["unwrap_or_else"]
            α5
            (fun (α0 : Ty.path "std::io::error::Error") =>
              (let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    (let* e := M.copy γ in
                    let* α0 := M.read (mk_str "failed to execute process: ") in
                    let* α1 := M.alloc [ α0 ] in
                    let* α2 :=
                      M.call
                        ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                          (borrow e)) in
                    let* α3 := M.alloc [ α2 ] in
                    let* α4 :=
                      M.call
                        ((Ty.path "core::fmt::Arguments")::["new_v1"]
                          (pointer_coercion "Unsize" (borrow α1))
                          (pointer_coercion "Unsize" (borrow α3))) in
                    let* α5 :=
                      M.call ((M.var "core::panicking::panic_fmt") α4) in
                    never_to_any α5) :
                    Ty.path "std::process::Output"
                ]) :
              Ty.path "std::process::Output")) in
      M.alloc α6 in
    let* α0 :=
      M.call
        ((Ty.path "std::process::ExitStatus")::["success"]
          (borrow ((M.var "std::process::Output::Get_status") output))) in
    let* α1 := M.alloc α0 in
    let* α2 := M.read (use α1) in
    let* α0 :=
      if α2 then
        let* s :=
          let* α0 :=
            ltac:(M.get_method (fun ℐ =>
              core.ops.deref.Deref.deref
                (Self :=
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [Ty.path "u8"; Ty.path "alloc::alloc::Global"])
                (Trait := ℐ))) in
          let* α1 :=
            M.call
              (α0
                (borrow ((M.var "std::process::Output::Get_stdout") output))) in
          let* α2 :=
            M.call
              ((Ty.path "alloc::string::String")::["from_utf8_lossy"] α1) in
          M.alloc α2 in
        let* _ :=
          let* _ :=
            let* α0 := M.read (mk_str "rustc succeeded and stdout was:
") in
            let* α1 := M.alloc [ α0 ] in
            let* α2 :=
              M.call
                ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                  (borrow s)) in
            let* α3 := M.alloc [ α2 ] in
            let* α4 :=
              M.call
                ((Ty.path "core::fmt::Arguments")::["new_v1"]
                  (pointer_coercion "Unsize" (borrow α1))
                  (pointer_coercion "Unsize" (borrow α3))) in
            let* α5 := M.call ((M.var "std::io::stdio::_print") α4) in
            M.alloc α5 in
          M.alloc tt in
        M.alloc tt
      else
        let* s :=
          let* α0 :=
            ltac:(M.get_method (fun ℐ =>
              core.ops.deref.Deref.deref
                (Self :=
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [Ty.path "u8"; Ty.path "alloc::alloc::Global"])
                (Trait := ℐ))) in
          let* α1 :=
            M.call
              (α0
                (borrow ((M.var "std::process::Output::Get_stderr") output))) in
          let* α2 :=
            M.call
              ((Ty.path "alloc::string::String")::["from_utf8_lossy"] α1) in
          M.alloc α2 in
        let* _ :=
          let* _ :=
            let* α0 := M.read (mk_str "rustc failed and stderr was:
") in
            let* α1 := M.alloc [ α0 ] in
            let* α2 :=
              M.call
                ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                  (borrow s)) in
            let* α3 := M.alloc [ α2 ] in
            let* α4 :=
              M.call
                ((Ty.path "core::fmt::Arguments")::["new_v1"]
                  (pointer_coercion "Unsize" (borrow α1))
                  (pointer_coercion "Unsize" (borrow α3))) in
            let* α5 := M.call ((M.var "std::io::stdio::_print") α4) in
            M.alloc α5 in
          M.alloc tt in
        M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
