(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn division(dividend: i32, divisor: i32) -> i32 {
    if divisor == 0 {
        // Division by zero triggers a panic
        panic!("division by zero");
    } else {
        dividend / divisor
    }
}
*)
Definition division (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ dividend; divisor ] =>
    let* dividend := M.alloc dividend in
    let* divisor := M.alloc divisor in
    let* α0 := M.var "BinOp::Pure::eq" in
    let* α1 := M.read divisor in
    let* α2 := M.alloc (α0 α1 ((Integer.of_Z 0) : Ty.path "i32")) in
    let* α3 := M.read (use α2) in
    let* α4 :=
      if α3 then
        let* α0 := M.var "std::panicking::begin_panic" in
        let* α1 := M.read (mk_str "division by zero") in
        let* α2 := M.call α0 [ α1 ] in
        let* α3 := never_to_any α2 in
        M.alloc α3
      else
        let* α0 := M.var "BinOp::Panic::div" in
        let* α1 := M.read dividend in
        let* α2 := M.read divisor in
        let* α3 := α0 α1 α2 in
        M.alloc α3 in
    M.read α4
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Heap allocated integer
    let _x = Box::new(0i32);

    // This operation will trigger a task failure
    division(3, 0);

    println!("This point won't be reached!");

    // `_x` should get destroyed at this point
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _x :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::boxed::Box")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])::["new"]
          [ (Integer.of_Z 0) : Ty.path "i32" ] in
      M.alloc α0 in
    let* _ :=
      let* α0 := M.var "panic::division" in
      let* α1 :=
        M.call
          α0
          [ (Integer.of_Z 3) : Ty.path "i32"; (Integer.of_Z 0) : Ty.path "i32"
          ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "This point won't be reached!
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" α2 ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
