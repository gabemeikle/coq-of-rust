(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition NanoSecond `{State.Trait} : Set := u64.

Definition Inch `{State.Trait} : Set := u64.

Definition U64 `{State.Trait} : Set := u64.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* nanoseconds :=
    let* α0 := M.alloc 5 in
    use α0 in
  let* inches :=
    let* α0 := M.alloc 2 in
    use α0 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [
            mk_str "";
            mk_str " nanoseconds + ";
            mk_str " inches = ";
            mk_str " unit?
"
          ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow nanoseconds u64 in
      let* α5 := deref α4 u64 in
      let* α6 := borrow α5 u64 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow inches u64 in
      let* α9 := deref α8 u64 in
      let* α10 := borrow α9 u64 in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := add nanoseconds inches in
      let* α13 := borrow α12 u64 in
      let* α14 := deref α13 u64 in
      let* α15 := borrow α14 u64 in
      let* α16 := core.fmt.rt.Argument::["new_display"] α15 in
      let* α17 := borrow [ α7; α11; α16 ] (list core.fmt.rt.Argument) in
      let* α18 := deref α17 (list core.fmt.rt.Argument) in
      let* α19 := borrow α18 (list core.fmt.rt.Argument) in
      let* α20 := pointer_coercion "Unsize" α19 in
      let* α21 := core.fmt.Arguments::["new_v1"] α3 α20 in
      std.io.stdio._print α21 in
    Pure tt in
  Pure tt.
