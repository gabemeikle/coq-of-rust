(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    (1, 2, 3, 4);
    vec![5, 6, 7, 8];
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      M.alloc
        (Value.Tuple
          [
            Value.Integer Integer.I32 1;
            Value.Integer Integer.I32 2;
            Value.Integer Integer.I32 3;
            Value.Integer Integer.I32 4
          ]) in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply (Ty.path "array") [ Ty.path "i32" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α2 :=
        M.alloc
          (Value.Array
            [
              Value.Integer Integer.I32 5;
              Value.Integer Integer.I32 6;
              Value.Integer Integer.I32 7;
              Value.Integer Integer.I32 8
            ]) in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.read α3 in
      let* α5 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α4 ] in
      M.alloc α5 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
