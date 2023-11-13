(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  DoubleError.
Section DoubleError.
  Inductive t : Set := Build.
End DoubleError.
End DoubleError.

Module  Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError_t.
Section Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError_t.
  Ltac Self := exact defining_an_error_type.DoubleError.t.
  
  (*
  Debug
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
End Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError_t.
End Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError_t.

Module  Impl_core_clone_Clone_for_defining_an_error_type_DoubleError_t.
Section Impl_core_clone_Clone_for_defining_an_error_type_DoubleError_t.
  Ltac Self := exact defining_an_error_type.DoubleError.t.
  
  (*
  Clone
  *)
  Parameter clone :
      (M.Val (ref ltac:(Self))) ->
        M (M.Val defining_an_error_type.DoubleError.t).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_defining_an_error_type_DoubleError_t.
End Impl_core_clone_Clone_for_defining_an_error_type_DoubleError_t.

Ltac Result T :=
  exact (core.result.Result.t T defining_an_error_type.DoubleError.t).

Module  Impl_core_fmt_Display_for_defining_an_error_type_DoubleError_t.
Section Impl_core_fmt_Display_for_defining_an_error_type_DoubleError_t.
  Ltac Self := exact defining_an_error_type.DoubleError.t.
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "invalid first item to double")
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
  
  Global Instance ℐ : core.fmt.Display.Trait ltac:(Self) := {
    core.fmt.Display.fmt := fmt;
  }.
End Impl_core_fmt_Display_for_defining_an_error_type_DoubleError_t.
End Impl_core_fmt_Display_for_defining_an_error_type_DoubleError_t.

(*
fn double_first(vec: Vec<&str>) -> Result<i32> {
    vec.first()
        // Change the error to our new type.
        .ok_or(DoubleError)
        .and_then(|s| {
            s.parse::<i32>()
                // Update to the new error type here also.
                .map_err(|_| DoubleError)
                .map(|i| 2 * i)
        })
}
*)
Parameter double_first :
    (M.Val (alloc.vec.Vec.t (ref str.t) alloc.vec.Vec.Default.A)) ->
      M (M.Val ltac:(defining_an_error_type.Result i32.t)).

(*
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Parameter print :
    (M.Val ltac:(defining_an_error_type.Result i32.t)) -> M (M.Val unit).

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    print(double_first(numbers));
    print(double_first(empty));
    print(double_first(strings));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
