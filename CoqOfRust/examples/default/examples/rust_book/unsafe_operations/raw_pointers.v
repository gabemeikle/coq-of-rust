(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let raw_p: *const u32 = &10;

    unsafe {
        assert!( *raw_p == 10);
    }
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* raw_p :=
      let* α0 := M.alloc (Value.Integer Integer.U32 10) in
      M.alloc α0 in
    let* _ :=
      let* α0 := M.read raw_p in
      let* α1 := M.read α0 in
      let* α2 :=
        M.alloc
          (UnOp.Pure.not (BinOp.Pure.eq α1 (Value.Integer Integer.U32 10))) in
      let* α3 := M.read (M.use α2) in
      if Value.is_true α3 then
        let* α0 := M.get_function "core::panicking::panic" [] in
        let* α1 := M.read (mk_str "assertion failed: *raw_p == 10") in
        let* α2 := M.call_closure α0 [ α1 ] in
        let* α3 := M.never_to_any α2 in
        M.alloc α3
      else
        M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
