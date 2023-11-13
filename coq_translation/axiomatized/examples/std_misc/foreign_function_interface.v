(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error ForeignMod.

(*
fn cos(z: Complex) -> Complex {
    unsafe { ccosf(z) }
}
*)
Parameter cos :
    (M.Val foreign_function_interface.Complex.t) ->
      M (M.Val foreign_function_interface.Complex.t).

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
Parameter main : M (M.Val unit).

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
  Parameter clone :
      (M.Val (ref ltac:(Self))) ->
        M (M.Val foreign_function_interface.Complex.t).
  
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
  Parameter fmt :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (mut_ref core.fmt.Formatter.t)) ->
        M (M.Val ltac:(core.fmt.Result)).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
