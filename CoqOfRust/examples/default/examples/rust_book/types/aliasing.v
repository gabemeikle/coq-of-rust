(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom NanoSecond : (Ty.path "aliasing::NanoSecond") = (Ty.path "u64").

Axiom Inch : (Ty.path "aliasing::Inch") = (Ty.path "u64").

Axiom U64 : (Ty.path "aliasing::U64") = (Ty.path "u64").

(*
fn main() {
    // `NanoSecond` = `Inch` = `U64` = `u64`.
    let nanoseconds: NanoSecond = 5 as U64;
    let inches: Inch = 2 as U64;

    // Note that type aliases *don't* provide any extra type safety, because
    // aliases are *not* new types
    println!(
        "{} nanoseconds + {} inches = {} unit?",
        nanoseconds,
        inches,
        nanoseconds + inches
    );
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* nanoseconds :=
      let* α0 := M.alloc (Value.Integer Integer.U64 5) in
      M.copy (M.use α0) in
    let* inches :=
      let* α0 := M.alloc (Value.Integer Integer.U64 2) in
      M.copy (M.use α0) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str " nanoseconds + ") in
        let* α4 := M.read (mk_str " inches = ") in
        let* α5 := M.read (mk_str " unit?
") in
        let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
        let* α7 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u64" ] in
        let* α8 := M.call_closure α7 [ nanoseconds ] in
        let* α9 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u64" ] in
        let* α10 := M.call_closure α9 [ inches ] in
        let* α11 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u64" ] in
        let* α12 := M.read nanoseconds in
        let* α13 := M.read inches in
        let* α14 := BinOp.Panic.add α12 α13 in
        let* α15 := M.alloc α14 in
        let* α16 := M.call_closure α11 [ α15 ] in
        let* α17 := M.alloc (Value.Array [ α8; α10; α16 ]) in
        let* α18 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α6;
              M.pointer_coercion (* Unsize *) α17
            ] in
        let* α19 := M.call_closure α0 [ α18 ] in
        M.alloc α19 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
