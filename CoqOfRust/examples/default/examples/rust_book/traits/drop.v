(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Droppable *)

Module Impl_core_ops_drop_Drop_for_drop_Droppable.
  Definition Self : Ty.t := Ty.path "drop::Droppable".
  
  (*
      fn drop(&mut self) {
          println!("> Dropping {}", self.name);
      }
  *)
  Definition drop (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "> Dropping ") in
          let* α1 := M.read (mk_str "
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 := M.read self in
          let* α4 :=
            M.call
              ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                (borrow ((M.var "drop::Droppable::Get_name") (deref α3)))) in
          let* α5 := M.alloc [ α4 ] in
          let* α6 :=
            M.call
              ((Ty.path "core::fmt::Arguments")::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α5))) in
          let* α7 := M.call ((M.var "std::io::stdio::_print") α6) in
          M.alloc α7 in
        M.alloc tt in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("drop", InstanceField.Method drop)].
End Impl_core_ops_drop_Drop_for_drop_Droppable.

(*
fn main() {
    let _a = Droppable { name: "a" };

    // block A
    {
        let _b = Droppable { name: "b" };

        // block B
        {
            let _c = Droppable { name: "c" };
            let _d = Droppable { name: "d" };

            println!("Exiting block B");
        }
        println!("Just exited block B");

        println!("Exiting block A");
    }
    println!("Just exited block A");

    // Variable can be manually dropped using the `drop` function
    drop(_a);
    // TODO ^ Try commenting this line

    println!("end of the main function");

    // `_a` *won't* be `drop`ed again here, because it already has been
    // (manually) `drop`ed
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _a :=
      let* α0 := M.read (mk_str "a") in
      M.alloc {| drop.Droppable.name := α0; |} in
    let* _ :=
      let* _b :=
        let* α0 := M.read (mk_str "b") in
        M.alloc {| drop.Droppable.name := α0; |} in
      let* _ :=
        let* _c :=
          let* α0 := M.read (mk_str "c") in
          M.alloc {| drop.Droppable.name := α0; |} in
        let* _d :=
          let* α0 := M.read (mk_str "d") in
          M.alloc {| drop.Droppable.name := α0; |} in
        let* _ :=
          let* _ :=
            let* α0 := M.read (mk_str "Exiting block B
") in
            let* α1 := M.alloc [ α0 ] in
            let* α2 :=
              M.call
                ((Ty.path "core::fmt::Arguments")::["new_const"]
                  (pointer_coercion "Unsize" (borrow α1))) in
            let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
            M.alloc α3 in
          M.alloc tt in
        M.alloc tt in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "Just exited block B
") in
          let* α1 := M.alloc [ α0 ] in
          let* α2 :=
            M.call
              ((Ty.path "core::fmt::Arguments")::["new_const"]
                (pointer_coercion "Unsize" (borrow α1))) in
          let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
          M.alloc α3 in
        M.alloc tt in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "Exiting block A
") in
          let* α1 := M.alloc [ α0 ] in
          let* α2 :=
            M.call
              ((Ty.path "core::fmt::Arguments")::["new_const"]
                (pointer_coercion "Unsize" (borrow α1))) in
          let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
          M.alloc α3 in
        M.alloc tt in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "Just exited block A
") in
        let* α1 := M.alloc [ α0 ] in
        let* α2 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_const"]
              (pointer_coercion "Unsize" (borrow α1))) in
        let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
        M.alloc α3 in
      M.alloc tt in
    let* _ :=
      let* α0 := M.read _a in
      let* α1 := M.call ((M.var "core::mem::drop") α0) in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "end of the main function
") in
        let* α1 := M.alloc [ α0 ] in
        let* α2 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_const"]
              (pointer_coercion "Unsize" (borrow α1))) in
        let* α3 := M.call ((M.var "std::io::stdio::_print") α2) in
        M.alloc α3 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
