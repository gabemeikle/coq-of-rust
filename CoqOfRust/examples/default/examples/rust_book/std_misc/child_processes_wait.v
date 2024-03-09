(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut child = Command::new("sleep").arg("5").spawn().unwrap();
    let _result = child.wait().unwrap();

    println!("reached end of main");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* child :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.path "std::process::Child"; Ty.path "std::io::error::Error" ])
          "unwrap" in
      let* α1 :=
        M.get_associated_function (Ty.path "std::process::Command") "spawn" in
      let* α2 :=
        M.get_associated_function (Ty.path "std::process::Command") "arg" in
      let* α3 :=
        M.get_associated_function (Ty.path "std::process::Command") "new" in
      let* α4 := M.read (mk_str "sleep") in
      let* α5 := M.call α3 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 := M.read (mk_str "5") in
      let* α8 := M.call α2 [ α6; α7 ] in
      let* α9 := M.call α1 [ α8 ] in
      let* α10 := M.call α0 [ α9 ] in
      M.alloc α10 in
    let* _result :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::result::Result")
            [
              Ty.path "std::process::ExitStatus";
              Ty.path "std::io::error::Error"
            ])
          "unwrap" in
      let* α1 :=
        M.get_associated_function (Ty.path "std::process::Child") "wait" in
      let* α2 := M.call α1 [ child ] in
      let* α3 := M.call α0 [ α2 ] in
      M.alloc α3 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const" in
        let* α2 := M.read (mk_str "reached end of main
") in
        let* α3 := M.alloc [ α2 ] in
        let* α4 := M.call α1 [ M.pointer_coercion "Unsize" α3 ] in
        let* α5 := M.call α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
