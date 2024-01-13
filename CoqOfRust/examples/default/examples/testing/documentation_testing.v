(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
*)
Definition add (a : i32.t) (b : i32.t) : M i32.t :=
  let* a := M.alloc a in
  let* b := M.alloc b in
  let* α0 : i32.t := M.read a in
  let* α1 : i32.t := M.read b in
  BinOp.Panic.add α0 α1.

(*
pub fn div(a: i32, b: i32) -> i32 {
    if b == 0 {
        panic!("Divide-by-zero error");
    }

    a / b
}
*)
Definition div (a : i32.t) (b : i32.t) : M i32.t :=
  let* a := M.alloc a in
  let* b := M.alloc b in
  let* _ : M.Val unit :=
    let* α0 : i32.t := M.read b in
    let* α1 : M.Val bool.t :=
      M.alloc (BinOp.Pure.eq α0 ((Integer.of_Z 0) : i32.t)) in
    let* α2 : bool.t := M.read (use α1) in
    if α2 then
      let* α0 : ref str.t := M.read (mk_str "Divide-by-zero error") in
      let* α1 : never.t := M.call (std.panicking.begin_panic α0) in
      let* α2 : unit := never_to_any α1 in
      M.alloc α2
    else
      M.alloc tt in
  let* α0 : i32.t := M.read a in
  let* α1 : i32.t := M.read b in
  let* α2 : i32.t := BinOp.Panic.div α0 α1 in
  let* α0 : M.Val i32.t := M.alloc α2 in
  M.read α0.
