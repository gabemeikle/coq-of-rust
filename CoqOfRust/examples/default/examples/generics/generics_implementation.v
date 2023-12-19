(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Val.
Section Val.
  Record t : Set := {
    val : f64.t;
  }.
  
  Global Instance Get_val : Notations.Dot "val" := {
    Notations.dot := Ref.map (fun x => x.(val)) (fun v x => x <| val := v |>);
  }.
  Global Instance Get_AF_val : Notations.DoubleColon t "val" := {
    Notations.double_colon (x : M.Val t) := x.["val"];
  }.
End Val.
End Val.

Module  GenVal.
Section GenVal.
  Context (T : Set).
  
  Record t : Set := {
    gen_val : T;
  }.
  
  Global Instance Get_gen_val : Notations.Dot "gen_val" := {
    Notations.dot :=
      Ref.map (fun x => x.(gen_val)) (fun v x => x <| gen_val := v |>);
  }.
  Global Instance Get_AF_gen_val : Notations.DoubleColon t "gen_val" := {
    Notations.double_colon (x : M.Val t) := x.["gen_val"];
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
  Definition value (self : ref ltac:(Self)) : M (ref f64.t) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref generics_implementation.Val.t := M.read self in
    M.pure (borrow (deref α0).["val"]).
  
  Global Instance AssociatedFunction_value :
    Notations.DoubleColon ltac:(Self) "value" := {
    Notations.double_colon := value;
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
  Definition value (self : ref ltac:(Self)) : M (ref T) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref (generics_implementation.GenVal.t T) := M.read self in
    M.pure (borrow (deref α0).["gen_val"]).
  
  Global Instance AssociatedFunction_value :
    Notations.DoubleColon ltac:(Self) "value" := {
    Notations.double_colon := value;
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
Definition main : M unit :=
  let* x : M.Val generics_implementation.Val.t :=
    let* α0 : f64.t := M.read UnsupportedLiteral in
    M.alloc {| generics_implementation.Val.val := α0; |} in
  let* y : M.Val (generics_implementation.GenVal.t i32.t) :=
    M.alloc {| generics_implementation.GenVal.gen_val := Integer.of_Z 3; |} in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "") in
      let* α1 : ref str.t := M.read (mk_str ", ") in
      let* α2 : ref str.t := M.read (mk_str "
") in
      let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
      let* α4 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α3) in
      let* α5 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α4) in
      let* α6 : ref f64.t :=
        M.call (generics_implementation.Val.t::["value"] (borrow x)) in
      let* α7 : M.Val (ref f64.t) := M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
      let* α9 : ref i32.t :=
        M.call
          ((generics_implementation.GenVal.t i32.t)::["value"] (borrow y)) in
      let* α10 : M.Val (ref i32.t) := M.alloc α9 in
      let* α11 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α10)) in
      let* α12 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8; α11 ] in
      let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α12) in
      let* α14 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α13) in
      let* α15 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α5 α14) in
      let* α16 : unit := M.call (std.io.stdio._print α15) in
      M.alloc α16 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
