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
  Definition fmt
      (self : M.Val (ref ltac:(Self)))
      (f : M.Val (mut_ref core.fmt.Formatter.t))
      : M (M.Val ltac:(core.fmt.Result)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val core.fmt.Formatter.t)) := deref f in
      let* α1 : ltac:(refine (M.Val (mut_ref core.fmt.Formatter.t))) :=
        borrow_mut α0 in
      let* α2 : ltac:(refine (M.Val str.t)) := deref (mk_str "DoubleError") in
      let* α3 : ltac:(refine (M.Val (ref str.t))) := borrow α2 in
      core.fmt.Formatter.t::["write_str"] α1 α3).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
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
  Definition clone
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val defining_an_error_type.DoubleError.t) :=
    M.function_body (M.alloc defining_an_error_type.DoubleError.Build_t).
  
  Global Instance AssociatedFunction_clone :
    Notation.DoubleColon ltac:(Self) "clone" := {
    Notation.double_colon := clone;
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
  Definition fmt
      (self : M.Val (ref ltac:(Self)))
      (f : M.Val (mut_ref core.fmt.Formatter.t))
      : M (M.Val ltac:(core.fmt.Result)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val core.fmt.Formatter.t)) := deref f in
      let* α1 : ltac:(refine (M.Val (mut_ref core.fmt.Formatter.t))) :=
        borrow_mut α0 in
      let* α2 : ltac:(refine (M.Val (array (ref str.t)))) :=
        M.alloc [ mk_str "invalid first item to double" ] in
      let* α3 : ltac:(refine (M.Val (ref (array (ref str.t))))) := borrow α2 in
      let* α4 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
        pointer_coercion "Unsize" α3 in
      let* α5 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
        core.fmt.Arguments.t::["new_const"] α4 in
      core.fmt.Formatter.t::["write_fmt"] α1 α5).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
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
Definition double_first
    (vec : M.Val (alloc.vec.Vec.t (ref str.t) alloc.vec.Vec.Default.A))
    : M (M.Val ltac:(defining_an_error_type.Result i32.t)) :=
  M.function_body
    (let* α0 :
        ltac:(refine
          (M.Val (ref (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)))) :=
      borrow vec in
    let* α1 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
      (core.ops.deref.Deref.deref
          (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
          (Trait := ltac:(refine _)))
        α0 in
    let* α2 : ltac:(refine (M.Val (slice (ref str.t)))) := deref α1 in
    let* α3 : ltac:(refine (M.Val (ref (slice (ref str.t))))) := borrow α2 in
    let* α4 : ltac:(refine (M.Val (core.option.Option.t (ref (ref str.t))))) :=
      (slice (ref str.t))::["first"] α3 in
    let* α5 : ltac:(refine (M.Val defining_an_error_type.DoubleError.t)) :=
      M.alloc defining_an_error_type.DoubleError.Build_t in
    let* α6 :
        ltac:(refine
          (M.Val
            (core.result.Result.t
              (ref (ref str.t))
              defining_an_error_type.DoubleError.t))) :=
      (core.option.Option.t (ref (ref str.t)))::["ok_or"] α4 α5 in
    (core.result.Result.t
          (ref (ref str.t))
          defining_an_error_type.DoubleError.t)::["and_then"]
      α6
      (let* α0 : ltac:(refine (M.Val (ref str.t))) := deref s in
      let* α1 : ltac:(refine (M.Val str.t)) := deref α0 in
      let* α2 : ltac:(refine (M.Val (ref str.t))) := borrow α1 in
      let* α3 :
          ltac:(refine
            (M.Val
              (core.result.Result.t i32.t core.num.error.ParseIntError.t))) :=
        str.t::["parse"] α2 in
      let* α4 :
          ltac:(refine
            (M.Val
              (core.result.Result.t
                i32.t
                defining_an_error_type.DoubleError.t))) :=
        (core.result.Result.t i32.t core.num.error.ParseIntError.t)::["map_err"]
          α3
          (M.alloc defining_an_error_type.DoubleError.Build_t) in
      (core.result.Result.t i32.t defining_an_error_type.DoubleError.t)::["map"]
        α4
        (let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 2 in
        BinOp.mul α0 i))).

(*
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print
    (result : M.Val ltac:(defining_an_error_type.Result i32.t))
    : M (M.Val unit) :=
  M.function_body
    (let* α0 := M.read result in
    match α0 with
    | core.result.Result.Ok n =>
      let* n := M.alloc n in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "The first doubled is "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow n in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt
    | core.result.Result.Err e =>
      let* e := M.alloc e in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Error: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (M.Val (ref defining_an_error_type.DoubleError.t))) :=
          borrow e in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt
    end).

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
Definition main : M (M.Val unit) :=
  M.function_body
    (let* numbers :
        ltac:(refine
          (M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t))) :=
      let* α0 : ltac:(refine (M.Val str.t)) := deref (mk_str "93") in
      let* α1 : ltac:(refine (M.Val (ref str.t))) := borrow α0 in
      let* α2 : ltac:(refine (M.Val str.t)) := deref (mk_str "18") in
      let* α3 : ltac:(refine (M.Val (ref str.t))) := borrow α2 in
      let* α4 : ltac:(refine (M.Val (array (ref str.t)))) :=
        M.alloc [ mk_str "42"; α1; α3 ] in
      let* α5 :
          ltac:(refine
            (M.Val
              (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t))) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α4 in
      let* α6 :
          ltac:(refine
            (M.Val
              (alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t))) :=
        pointer_coercion "Unsize" α5 in
      (slice (ref str.t))::["into_vec"] α6 in
    let* empty :
        ltac:(refine
          (M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t))) :=
      (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)::["new"] in
    let* strings :
        ltac:(refine
          (M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t))) :=
      let* α0 : ltac:(refine (M.Val str.t)) := deref (mk_str "93") in
      let* α1 : ltac:(refine (M.Val (ref str.t))) := borrow α0 in
      let* α2 : ltac:(refine (M.Val str.t)) := deref (mk_str "18") in
      let* α3 : ltac:(refine (M.Val (ref str.t))) := borrow α2 in
      let* α4 : ltac:(refine (M.Val (array (ref str.t)))) :=
        M.alloc [ mk_str "tofu"; α1; α3 ] in
      let* α5 :
          ltac:(refine
            (M.Val
              (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t))) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α4 in
      let* α6 :
          ltac:(refine
            (M.Val
              (alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t))) :=
        pointer_coercion "Unsize" α5 in
      (slice (ref str.t))::["into_vec"] α6 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (core.result.Result.t
                i32.t
                defining_an_error_type.DoubleError.t))) :=
        defining_an_error_type.double_first numbers in
      defining_an_error_type.print α0 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (core.result.Result.t
                i32.t
                defining_an_error_type.DoubleError.t))) :=
        defining_an_error_type.double_first empty in
      defining_an_error_type.print α0 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (core.result.Result.t
                i32.t
                defining_an_error_type.DoubleError.t))) :=
        defining_an_error_type.double_first strings in
      defining_an_error_type.print α0 in
    M.alloc tt).
