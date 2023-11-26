(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let some_vector = vec![1, 2, 3, 4];

    let pointer = some_vector.as_ptr();
    let length = some_vector.len();

    unsafe {
        let my_slice: &[u32] = slice::from_raw_parts(pointer, length);

        assert_eq!(some_vector.as_slice(), my_slice);
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* some_vector : M.Val (alloc.vec.Vec.t u32.t alloc.alloc.Global.t) :=
      let* α0 : M.Val u32.t := M.alloc 1 in
      let* α1 : M.Val u32.t := M.alloc 2 in
      let* α2 : M.Val u32.t := M.alloc 3 in
      let* α3 : M.Val u32.t := M.alloc 4 in
      let* α4 : M.Val (array u32.t) := M.alloc [ α0; α1; α2; α3 ] in
      let* α5 : M.Val (alloc.boxed.Box.t (array u32.t) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α4 in
      let* α6 : M.Val (alloc.boxed.Box.t (slice u32.t) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α5 in
      let* α7 : alloc.boxed.Box.t (slice u32.t) alloc.alloc.Global.t :=
        M.read α6 in
      let* α8 : alloc.vec.Vec.t u32.t alloc.alloc.Global.t :=
        (slice u32.t)::["into_vec"] α7 in
      M.alloc α8 in
    let* pointer : M.Val (ref u32.t) :=
      let* α0 : ref (alloc.vec.Vec.t u32.t alloc.alloc.Global.t) :=
        borrow some_vector in
      let* α1 : ref u32.t :=
        (alloc.vec.Vec.t u32.t alloc.alloc.Global.t)::["as_ptr"] α0 in
      M.alloc α1 in
    let* length : M.Val usize.t :=
      let* α0 : ref (alloc.vec.Vec.t u32.t alloc.alloc.Global.t) :=
        borrow some_vector in
      let* α1 : usize.t :=
        (alloc.vec.Vec.t u32.t alloc.alloc.Global.t)::["len"] α0 in
      M.alloc α1 in
    let* my_slice : M.Val (ref (slice u32.t)) :=
      let* α0 : ref u32.t := M.read pointer in
      let* α1 : usize.t := M.read length in
      let* α2 : ref (slice u32.t) := core.slice.raw.from_raw_parts α0 α1 in
      let* α3 : M.Val (slice u32.t) := deref α2 in
      let* α4 : ref (slice u32.t) := borrow α3 in
      M.alloc α4 in
    let* _ : M.Val unit :=
      let* α0 : ref (alloc.vec.Vec.t u32.t alloc.alloc.Global.t) :=
        borrow some_vector in
      let* α1 : ref (slice u32.t) :=
        (alloc.vec.Vec.t u32.t alloc.alloc.Global.t)::["as_slice"] α0 in
      let* α2 : M.Val (ref (slice u32.t)) := M.alloc α1 in
      let* α3 : ref (ref (slice u32.t)) := borrow α2 in
      let* α4 : ref (ref (slice u32.t)) := borrow my_slice in
      let* α5 : M.Val ((ref (ref (slice u32.t))) * (ref (ref (slice u32.t)))) :=
        M.alloc (α3, α4) in
      let* α6 := M.read α5 in
      match α6 with
      | (left_val, right_val) =>
        let* right_val := M.alloc right_val in
        let* left_val := M.alloc left_val in
        let* α0 : ref (ref (slice u32.t)) := M.read left_val in
        let* α1 : M.Val (ref (slice u32.t)) := deref α0 in
        let* α2 : ref (ref (slice u32.t)) := borrow α1 in
        let* α3 : ref (ref (slice u32.t)) := M.read right_val in
        let* α4 : M.Val (ref (slice u32.t)) := deref α3 in
        let* α5 : ref (ref (slice u32.t)) := borrow α4 in
        let* α6 : bool.t :=
          (core.cmp.PartialEq.eq
              (Self := ref (slice u32.t))
              (Trait := ltac:(refine _)))
            α2
            α5 in
        let* α7 : M.Val bool.t := M.alloc α6 in
        let* α8 : M.Val bool.t := UnOp.not α7 in
        let* α9 : M.Val bool.t := use α8 in
        let* α10 : bool.t := M.read α9 in
        if (α10 : bool) then
          let* kind : M.Val core.panicking.AssertKind.t :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : M.Val never.t :=
            let* α0 : core.panicking.AssertKind.t := M.read kind in
            let* α1 : ref (ref (slice u32.t)) := M.read left_val in
            let* α2 : M.Val (ref (slice u32.t)) := deref α1 in
            let* α3 : ref (ref (slice u32.t)) := borrow α2 in
            let* α4 : M.Val (ref (slice u32.t)) := deref α3 in
            let* α5 : ref (ref (slice u32.t)) := borrow α4 in
            let* α6 : ref (ref (slice u32.t)) := M.read right_val in
            let* α7 : M.Val (ref (slice u32.t)) := deref α6 in
            let* α8 : ref (ref (slice u32.t)) := borrow α7 in
            let* α9 : M.Val (ref (slice u32.t)) := deref α8 in
            let* α10 : ref (ref (slice u32.t)) := borrow α9 in
            let* α11 : never.t :=
              core.panicking.assert_failed α0 α5 α10 core.option.Option.None in
            M.alloc α11 in
          let* α0 : M.Val unit := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
