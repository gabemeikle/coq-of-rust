(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Droppable.
Section Droppable.
  Record t : Set := {
    name : ref str.t;
  }.
  
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(name) : M _;
  }.
  Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(name) : M _;
  }.
End Droppable.
End Droppable.

Module  Impl_core_ops_drop_Drop_for_drop_Droppable_t.
Section Impl_core_ops_drop_Drop_for_drop_Droppable_t.
  Ltac Self := exact drop.Droppable.t.
  
  (*
      fn drop(&mut self) {
          println!("> Dropping {}", self.name);
      }
  *)
  Definition drop (self : M.Val (mut_ref ltac:(Self))) : M (M.Val unit) :=
    M.function_body
      (let* _ : ltac:(refine (M.Val unit)) :=
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
            M.alloc [ mk_str "> Dropping "; mk_str "
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val drop.Droppable.t)) := deref self in
          let* α4 : ltac:(refine (M.Val (ref str.t))) := α3.["name"] in
          let* α5 : ltac:(refine (M.Val (ref (ref str.t)))) := borrow α4 in
          let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
          let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
            M.alloc [ α6 ] in
          let* α8 :
              ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
            borrow α7 in
          let* α9 :
              ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
            pointer_coercion "Unsize" α8 in
          let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_v1"] α2 α9 in
          std.io.stdio._print α10 in
        M.alloc tt in
      M.alloc tt).
  
  Global Instance AssociatedFunction_drop :
    Notation.DoubleColon ltac:(Self) "drop" := {
    Notation.double_colon := drop;
  }.
  
  Global Instance ℐ : core.ops.drop.Drop.Trait ltac:(Self) := {
    core.ops.drop.Drop.drop := drop;
  }.
End Impl_core_ops_drop_Drop_for_drop_Droppable_t.
End Impl_core_ops_drop_Drop_for_drop_Droppable_t.

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
Definition main : M (M.Val unit) :=
  M.function_body
    (let* _a : ltac:(refine (M.Val drop.Droppable.t)) :=
      let* α0 := M.read (mk_str "a") in
      M.alloc {| drop.Droppable.name := α0; |} in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _b : ltac:(refine (M.Val drop.Droppable.t)) :=
        let* α0 := M.read (mk_str "b") in
        M.alloc {| drop.Droppable.name := α0; |} in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* _c : ltac:(refine (M.Val drop.Droppable.t)) :=
          let* α0 := M.read (mk_str "c") in
          M.alloc {| drop.Droppable.name := α0; |} in
        let* _d : ltac:(refine (M.Val drop.Droppable.t)) :=
          let* α0 := M.read (mk_str "d") in
          M.alloc {| drop.Droppable.name := α0; |} in
        let* _ : ltac:(refine (M.Val unit)) :=
          let* _ : ltac:(refine (M.Val unit)) :=
            let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
              M.alloc [ mk_str "Exiting block B
" ] in
            let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
              borrow α0 in
            let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
              pointer_coercion "Unsize" α1 in
            let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
              core.fmt.Arguments.t::["new_const"] α2 in
            std.io.stdio._print α3 in
          M.alloc tt in
        M.alloc tt in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
            M.alloc [ mk_str "Just exited block B
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
            M.alloc [ mk_str "Exiting block A
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Just exited block A
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) := core.mem.drop _a in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "end of the main function
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    M.alloc tt).
