(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error ForeignMod.

(*
fn cos(z: Complex) -> Complex {
    unsafe { ccosf(z) }
}
*)
Definition cos
    (z : foreign_function_interface.Complex.t)
    : M foreign_function_interface.Complex.t :=
  let* z : M.Val foreign_function_interface.Complex.t := M.alloc z in
  M.function_body
    (let* α0 : foreign_function_interface.Complex.t := M.read z in
    let* α1 : foreign_function_interface.Complex.t :=
      "unimplemented parent_kind" α0 in
    let* α0 : M.Val foreign_function_interface.Complex.t := M.alloc α1 in
    M.read α0).

(*
fn main() {
    // z = -1 + 0i
    let z = Complex { re: -1., im: 0. };

    // calling a foreign function is an unsafe operation
    let z_sqrt = unsafe { csqrtf(z) };

    println!("the square root of {:?} is {:?}", z, z_sqrt);

    // calling safe API wrapped around unsafe operation
    println!("cos({:?}) = {:?}", z, cos(z));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* z : M.Val foreign_function_interface.Complex.t :=
      let* α0 : M.Val f32.t := M.alloc (- 1 (* 1. *)) in
      let* α1 : f32.t := M.read α0 in
      let* α2 : M.Val f32.t := M.alloc 0 (* 0. *) in
      let* α3 : f32.t := M.read α2 in
      M.alloc
        {|
          foreign_function_interface.Complex.re := α1;
          foreign_function_interface.Complex.im := α3;
        |} in
    let* z_sqrt : M.Val foreign_function_interface.Complex.t :=
      let* α0 : foreign_function_interface.Complex.t := M.read z in
      let* α1 : foreign_function_interface.Complex.t :=
        "unimplemented parent_kind" α0 in
      let* α0 : M.Val foreign_function_interface.Complex.t := M.alloc α1 in
      M.copy α0 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "the square root of "; mk_str " is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref foreign_function_interface.Complex.t := borrow z in
        let* α8 : M.Val foreign_function_interface.Complex.t := deref α7 in
        let* α9 : ref foreign_function_interface.Complex.t := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : ref foreign_function_interface.Complex.t := borrow z_sqrt in
        let* α13 : M.Val foreign_function_interface.Complex.t := deref α12 in
        let* α14 : ref foreign_function_interface.Complex.t := borrow α13 in
        let* α15 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α14 in
        let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
        let* α17 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α11; α16 ] in
        let* α18 : ref (array core.fmt.rt.Argument.t) := borrow α17 in
        let* α19 : M.Val (array core.fmt.rt.Argument.t) := deref α18 in
        let* α20 : ref (array core.fmt.rt.Argument.t) := borrow α19 in
        let* α21 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α20 in
        let* α22 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α21 in
        let* α23 : ref (slice core.fmt.rt.Argument.t) := M.read α22 in
        let* α24 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α23 in
        let* α25 : unit := std.io.stdio._print α24 in
        M.alloc α25 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "cos("; mk_str ") = "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (array (ref str.t)) := deref α1 in
        let* α3 : ref (array (ref str.t)) := borrow α2 in
        let* α4 : M.Val (ref (array (ref str.t))) := M.alloc α3 in
        let* α5 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ref (slice (ref str.t)) := M.read α5 in
        let* α7 : ref foreign_function_interface.Complex.t := borrow z in
        let* α8 : M.Val foreign_function_interface.Complex.t := deref α7 in
        let* α9 : ref foreign_function_interface.Complex.t := borrow α8 in
        let* α10 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α9 in
        let* α11 : M.Val core.fmt.rt.Argument.t := M.alloc α10 in
        let* α12 : foreign_function_interface.Complex.t := M.read z in
        let* α13 : foreign_function_interface.Complex.t :=
          foreign_function_interface.cos α12 in
        let* α14 : M.Val foreign_function_interface.Complex.t := M.alloc α13 in
        let* α15 : ref foreign_function_interface.Complex.t := borrow α14 in
        let* α16 : M.Val foreign_function_interface.Complex.t := deref α15 in
        let* α17 : ref foreign_function_interface.Complex.t := borrow α16 in
        let* α18 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α17 in
        let* α19 : M.Val core.fmt.rt.Argument.t := M.alloc α18 in
        let* α20 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α11; α19 ] in
        let* α21 : ref (array core.fmt.rt.Argument.t) := borrow α20 in
        let* α22 : M.Val (array core.fmt.rt.Argument.t) := deref α21 in
        let* α23 : ref (array core.fmt.rt.Argument.t) := borrow α22 in
        let* α24 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α23 in
        let* α25 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α24 in
        let* α26 : ref (slice core.fmt.rt.Argument.t) := M.read α25 in
        let* α27 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α6 α26 in
        let* α28 : unit := std.io.stdio._print α27 in
        M.alloc α28 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).

Module  Complex.
Section Complex.
  Record t : Set := {
    re : f32.t;
    im : f32.t;
  }.
  
  Global Instance Get_re : Notations.Dot "re" := {
    Notations.dot := Ref.map (fun x => x.(re)) (fun v x => x <| re := v |>);
  }.
  Global Instance Get_AF_re : Notations.DoubleColon t "re" := {
    Notations.double_colon (x : M.Val t) := x.["re"];
  }.
  Global Instance Get_im : Notations.Dot "im" := {
    Notations.dot := Ref.map (fun x => x.(im)) (fun v x => x <| im := v |>);
  }.
  Global Instance Get_AF_im : Notations.DoubleColon t "im" := {
    Notations.double_colon (x : M.Val t) := x.["im"];
  }.
End Complex.
End Complex.

Module  Impl_core_clone_Clone_for_foreign_function_interface_Complex_t.
Section Impl_core_clone_Clone_for_foreign_function_interface_Complex_t.
  Ltac Self := exact foreign_function_interface.Complex.t.
  
  (*
  Clone
  *)
  Definition clone
      (self : ref ltac:(Self))
      : M foreign_function_interface.Complex.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    M.function_body
      (let* _ : M.Val unit := M.alloc tt in
      let* α0 : ref foreign_function_interface.Complex.t := M.read self in
      let* α0 : M.Val foreign_function_interface.Complex.t := deref α0 in
      M.read α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_foreign_function_interface_Complex_t.
End Impl_core_clone_Clone_for_foreign_function_interface_Complex_t.

Module  Impl_core_marker_Copy_for_foreign_function_interface_Complex_t.
Section Impl_core_marker_Copy_for_foreign_function_interface_Complex_t.
  Ltac Self := exact foreign_function_interface.Complex.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_foreign_function_interface_Complex_t.
End Impl_core_marker_Copy_for_foreign_function_interface_Complex_t.

Module  Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
Section Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
  Ltac Self := exact foreign_function_interface.Complex.t.
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          if self.im < 0. {
              write!(f, "{}-{}i", self.re, -self.im)
          } else {
              write!(f, "{}+{}i", self.re, self.im)
          }
      }
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : ref foreign_function_interface.Complex.t := M.read self in
      let* α1 : M.Val foreign_function_interface.Complex.t := deref α0 in
      let* α2 : M.Val f32.t := M.alloc 0 (* 0. *) in
      let* α3 : M.Val bool.t := BinOp.lt α1.["im"] α2 in
      let* α4 : M.Val bool.t := use α3 in
      let* α5 : bool.t := M.read α4 in
      let* α0 : M.Val (core.result.Result.t unit core.fmt.Error.t) :=
        if (α5 : bool) then
          let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
          let* α1 : M.Val core.fmt.Formatter.t := deref α0 in
          let* α2 : mut_ref core.fmt.Formatter.t := borrow_mut α1 in
          let* α3 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str ""; mk_str "-"; mk_str "i" ] in
          let* α4 : ref (array (ref str.t)) := borrow α3 in
          let* α5 : M.Val (array (ref str.t)) := deref α4 in
          let* α6 : ref (array (ref str.t)) := borrow α5 in
          let* α7 : M.Val (ref (array (ref str.t))) := M.alloc α6 in
          let* α8 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α7 in
          let* α9 : ref (slice (ref str.t)) := M.read α8 in
          let* α10 : ref foreign_function_interface.Complex.t := M.read self in
          let* α11 : M.Val foreign_function_interface.Complex.t := deref α10 in
          let* α12 : ref f32.t := borrow α11.["re"] in
          let* α13 : M.Val f32.t := deref α12 in
          let* α14 : ref f32.t := borrow α13 in
          let* α15 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α14 in
          let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
          let* α17 : ref foreign_function_interface.Complex.t := M.read self in
          let* α18 : M.Val foreign_function_interface.Complex.t := deref α17 in
          let* α19 : M.Val f32.t := UnOp.neg α18.["im"] in
          let* α20 : ref f32.t := borrow α19 in
          let* α21 : M.Val f32.t := deref α20 in
          let* α22 : ref f32.t := borrow α21 in
          let* α23 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α22 in
          let* α24 : M.Val core.fmt.rt.Argument.t := M.alloc α23 in
          let* α25 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α16; α24 ] in
          let* α26 : ref (array core.fmt.rt.Argument.t) := borrow α25 in
          let* α27 : M.Val (array core.fmt.rt.Argument.t) := deref α26 in
          let* α28 : ref (array core.fmt.rt.Argument.t) := borrow α27 in
          let* α29 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α28 in
          let* α30 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α29 in
          let* α31 : ref (slice core.fmt.rt.Argument.t) := M.read α30 in
          let* α32 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α9 α31 in
          let* α33 : core.result.Result.t unit core.fmt.Error.t :=
            core.fmt.Formatter.t::["write_fmt"] α2 α32 in
          M.alloc α33
        else
          let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
          let* α1 : M.Val core.fmt.Formatter.t := deref α0 in
          let* α2 : mut_ref core.fmt.Formatter.t := borrow_mut α1 in
          let* α3 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str ""; mk_str "+"; mk_str "i" ] in
          let* α4 : ref (array (ref str.t)) := borrow α3 in
          let* α5 : M.Val (array (ref str.t)) := deref α4 in
          let* α6 : ref (array (ref str.t)) := borrow α5 in
          let* α7 : M.Val (ref (array (ref str.t))) := M.alloc α6 in
          let* α8 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α7 in
          let* α9 : ref (slice (ref str.t)) := M.read α8 in
          let* α10 : ref foreign_function_interface.Complex.t := M.read self in
          let* α11 : M.Val foreign_function_interface.Complex.t := deref α10 in
          let* α12 : ref f32.t := borrow α11.["re"] in
          let* α13 : M.Val f32.t := deref α12 in
          let* α14 : ref f32.t := borrow α13 in
          let* α15 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α14 in
          let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
          let* α17 : ref foreign_function_interface.Complex.t := M.read self in
          let* α18 : M.Val foreign_function_interface.Complex.t := deref α17 in
          let* α19 : ref f32.t := borrow α18.["im"] in
          let* α20 : M.Val f32.t := deref α19 in
          let* α21 : ref f32.t := borrow α20 in
          let* α22 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α21 in
          let* α23 : M.Val core.fmt.rt.Argument.t := M.alloc α22 in
          let* α24 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α16; α23 ] in
          let* α25 : ref (array core.fmt.rt.Argument.t) := borrow α24 in
          let* α26 : M.Val (array core.fmt.rt.Argument.t) := deref α25 in
          let* α27 : ref (array core.fmt.rt.Argument.t) := borrow α26 in
          let* α28 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α27 in
          let* α29 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α28 in
          let* α30 : ref (slice core.fmt.rt.Argument.t) := M.read α29 in
          let* α31 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α9 α30 in
          let* α32 : core.result.Result.t unit core.fmt.Error.t :=
            core.fmt.Formatter.t::["write_fmt"] α2 α31 in
          M.alloc α32 in
      M.read α0).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
