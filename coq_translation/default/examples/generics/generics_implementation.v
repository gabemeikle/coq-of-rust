(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Val.
Section Val.
  Record t : Set := {
    val : f64.t;
  }.
  
  Global Instance Get_val : Notation.Dot "val" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(val) : M _;
  }.
  Global Instance Get_AF_val : Notation.DoubleColon t "val" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(val) : M _;
  }.
End Val.
End Val.

Module  GenVal.
Section GenVal.
  Context (T : Set).
  
  Record t : Set := {
    gen_val : T;
  }.
  
  Global Instance Get_gen_val : Notation.Dot "gen_val" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(gen_val) : M _;
  }.
  Global Instance Get_AF_gen_val : Notation.DoubleColon t "gen_val" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(gen_val) : M _;
  }.
End GenVal.
End GenVal.

Module  Impl_generics_implementation_Val_t.
Section Impl_generics_implementation_Val_t.
  Ltac Self := exact generics_implementation.Val.t.
  
  (*
      fn value(&self) -> &f64 {
          &self.val
      }
  *)
  Definition value (self : M.Val (ref ltac:(Self))) : M (M.Val (ref f64.t)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val generics_implementation.Val.t)) :=
        deref self in
      let* α1 : ltac:(refine (M.Val f64.t)) := α0.["val"] in
      borrow α1).
  
  Global Instance AssociatedFunction_value :
    Notation.DoubleColon ltac:(Self) "value" := {
    Notation.double_colon := value;
  }.
End Impl_generics_implementation_Val_t.
End Impl_generics_implementation_Val_t.

Module  Impl_generics_implementation_GenVal_t_T.
Section Impl_generics_implementation_GenVal_t_T.
  Context {T : Set}.
  
  Ltac Self := exact (generics_implementation.GenVal.t T).
  
  (*
      fn value(&self) -> &T {
          &self.gen_val
      }
  *)
  Definition value (self : M.Val (ref ltac:(Self))) : M (M.Val (ref T)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val (generics_implementation.GenVal.t T))) :=
        deref self in
      let* α1 : ltac:(refine (M.Val T)) := α0.["gen_val"] in
      borrow α1).
  
  Global Instance AssociatedFunction_value :
    Notation.DoubleColon ltac:(Self) "value" := {
    Notation.double_colon := value;
  }.
End Impl_generics_implementation_GenVal_t_T.
End Impl_generics_implementation_GenVal_t_T.

(*
fn main() {
    let x = Val { val: 3.0 };
    let y = GenVal { gen_val: 3i32 };

    println!("{}, {}", x.value(), y.value());
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* x : ltac:(refine (M.Val generics_implementation.Val.t)) :=
      let* α0 : ltac:(refine (M.Val f64.t)) := M.alloc 3 (* 3.0 *) in
      let* α1 := M.read α0 in
      M.alloc {| generics_implementation.Val.val := α1; |} in
    let* y : ltac:(refine (M.Val (generics_implementation.GenVal.t i32.t))) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 3 in
      let* α1 := M.read α0 in
      M.alloc {| generics_implementation.GenVal.gen_val := α1; |} in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str ""; mk_str ", "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref generics_implementation.Val.t))) :=
          borrow x in
        let* α4 : ltac:(refine (M.Val (ref f64.t))) :=
          generics_implementation.Val.t::["value"] α3 in
        let* α5 : ltac:(refine (M.Val (ref (ref f64.t)))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 :
            ltac:(refine
              (M.Val (ref (generics_implementation.GenVal.t i32.t)))) :=
          borrow y in
        let* α8 : ltac:(refine (M.Val (ref i32.t))) :=
          (generics_implementation.GenVal.t i32.t)::["value"] α7 in
        let* α9 : ltac:(refine (M.Val (ref (ref i32.t)))) := borrow α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6; α10 ] in
        let* α12 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α11 in
        let* α13 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).
