(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
*)
Definition add (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ a; b ] =>
    let* a := M.alloc a in
    let* b := M.alloc b in
    let* α0 := M.read a in
    let* α1 := M.read b in
    BinOp.Panic.add α0 α1
  | _, _ => M.impossible
  end.

(*
pub fn div(a: i32, b: i32) -> i32 {
    if b == 0 {
        panic!("Divide-by-zero error");
    }

    a / b
}
*)
Definition div (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ a; b ] =>
    let* a := M.alloc a in
    let* b := M.alloc b in
    let* _ :=
      let* α0 := M.read b in
      let* α1 := M.alloc (BinOp.Pure.eq α0 (Value.Integer Integer.I32 0)) in
      let* α2 := M.read (M.use α1) in
      if Value.is_true α2 then
        let* α0 :=
          M.get_function
            "std::panicking::begin_panic"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α1 := M.read (mk_str "Divide-by-zero error") in
        let* α2 := M.call_closure α0 [ α1 ] in
        let* α3 := M.never_to_any α2 in
        M.alloc α3
      else
        M.alloc (Value.Tuple []) in
    let* α0 := M.read a in
    let* α1 := M.read b in
    let* α2 := BinOp.Panic.div α0 α1 in
    let* α0 := M.alloc α2 in
    M.read α0
  | _, _ => M.impossible
  end.
