(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Ltac Result T := exact (core.result.Result.t T wrapping_errors.DoubleError.t).

Module DoubleError.
  Inductive t : Set :=
  | EmptyVec
  | Parse (_ : core.num.error.ParseIntError.t).
End DoubleError.

Module  Impl_core_fmt_Debug_for_wrapping_errors_DoubleError_t.
Section Impl_core_fmt_Debug_for_wrapping_errors_DoubleError_t.
  Definition Self : Set := wrapping_errors.DoubleError.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : ref wrapping_errors.DoubleError.t := M.read self in
    let* α1 : M.Val (core.result.Result.t unit core.fmt.Error.t) :=
      match α0 with
      | wrapping_errors.DoubleError.EmptyVec =>
        let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
        let* α1 : ref str.t := M.read (mk_str "EmptyVec") in
        let* α2 : core.result.Result.t unit core.fmt.Error.t :=
          M.call (core.fmt.Formatter.t::["write_str"] α0 α1) in
        M.alloc α2
      | wrapping_errors.DoubleError.Parse __self_0 =>
        let* __self_0 := M.alloc __self_0 in
        let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
        let* α1 : ref str.t := M.read (mk_str "Parse") in
        let* α2 : M.Val (ref (ref core.num.error.ParseIntError.t)) :=
          M.alloc (borrow __self_0) in
        let* α3 : ref dynamic := M.read (pointer_coercion "Unsize" α2) in
        let* α4 : core.result.Result.t unit core.fmt.Error.t :=
          M.call
            (core.fmt.Formatter.t::["debug_tuple_field1_finish"] α0 α1 α3) in
        M.alloc α4
      end in
    M.read α1.
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_wrapping_errors_DoubleError_t.
End Impl_core_fmt_Debug_for_wrapping_errors_DoubleError_t.

Module  Impl_core_fmt_Display_for_wrapping_errors_DoubleError_t.
Section Impl_core_fmt_Display_for_wrapping_errors_DoubleError_t.
  Definition Self : Set := wrapping_errors.DoubleError.t.
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          match *self {
              DoubleError::EmptyVec => write!(f, "please use a vector with at least one element"),
              // The wrapped error contains additional information and is available
              // via the source() method.
              DoubleError::Parse(..) => write!(f, "the provided string could not be parsed as int"),
          }
      }
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : ref wrapping_errors.DoubleError.t := M.read self in
    let* α1 : wrapping_errors.DoubleError.t := M.read (deref α0) in
    let* α2 : M.Val (core.result.Result.t unit core.fmt.Error.t) :=
      match α1 with
      | wrapping_errors.DoubleError.EmptyVec =>
        let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
        let* α1 : ref str.t :=
          M.read (mk_str "please use a vector with at least one element") in
        let* α2 : M.Val (array (ref str.t)) := M.alloc [ α1 ] in
        let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
        let* α4 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α3) in
        let* α5 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_const"] α4) in
        let* α6 : core.result.Result.t unit core.fmt.Error.t :=
          M.call (core.fmt.Formatter.t::["write_fmt"] α0 α5) in
        M.alloc α6
      | wrapping_errors.DoubleError.Parse =>
        let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
        let* α1 : ref str.t :=
          M.read (mk_str "the provided string could not be parsed as int") in
        let* α2 : M.Val (array (ref str.t)) := M.alloc [ α1 ] in
        let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
        let* α4 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α3) in
        let* α5 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_const"] α4) in
        let* α6 : core.result.Result.t unit core.fmt.Error.t :=
          M.call (core.fmt.Formatter.t::["write_fmt"] α0 α5) in
        M.alloc α6
      end in
    M.read α2.
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt := fmt;
  }.
End Impl_core_fmt_Display_for_wrapping_errors_DoubleError_t.
End Impl_core_fmt_Display_for_wrapping_errors_DoubleError_t.

Module  Impl_core_error_Error_for_wrapping_errors_DoubleError_t.
Section Impl_core_error_Error_for_wrapping_errors_DoubleError_t.
  Definition Self : Set := wrapping_errors.DoubleError.t.
  
  (*
      fn source(&self) -> Option<&(dyn error::Error + 'static)> {
          match *self {
              DoubleError::EmptyVec => None,
              // The cause is the underlying implementation error type. Is implicitly
              // cast to the trait object `&error::Error`. This works because the
              // underlying type already implements the `Error` trait.
              DoubleError::Parse(ref e) => Some(e),
          }
      }
  *)
  Definition source
      (self : ref Self)
      : M (core.option.Option.t (ref _ (* dyn *))) :=
    let* self := M.alloc self in
    let* α0 : ref wrapping_errors.DoubleError.t := M.read self in
    let* α1 : wrapping_errors.DoubleError.t := M.read (deref α0) in
    let* α2 : M.Val (core.option.Option.t (ref dynamic)) :=
      match α1 with
      | wrapping_errors.DoubleError.EmptyVec => M.alloc core.option.Option.None
      | wrapping_errors.DoubleError.Parse e =>
        let* e := M.alloc e in
        let* α0 : ref core.num.error.ParseIntError.t := M.read e in
        let* α1 : M.Val (ref core.num.error.ParseIntError.t) := M.alloc α0 in
        let* α2 : ref dynamic := M.read (pointer_coercion "Unsize" α1) in
        M.alloc (core.option.Option.Some α2)
      end in
    M.read α2.
  
  Global Instance AssociatedFunction_source :
    Notations.DoubleColon Self "source" := {
    Notations.double_colon := source;
  }.
  
  Global Instance ℐ : core.error.Error.Required.Trait Self := {
    core.error.Error.source := Datatypes.Some source;
    core.error.Error.type_id := Datatypes.None;
    core.error.Error.description := Datatypes.None;
    core.error.Error.cause := Datatypes.None;
    core.error.Error.provide := Datatypes.None;
  }.
End Impl_core_error_Error_for_wrapping_errors_DoubleError_t.
End Impl_core_error_Error_for_wrapping_errors_DoubleError_t.

Module  Impl_core_convert_From_core_num_error_ParseIntError_t_for_wrapping_errors_DoubleError_t.
Section Impl_core_convert_From_core_num_error_ParseIntError_t_for_wrapping_errors_DoubleError_t.
  Definition Self : Set := wrapping_errors.DoubleError.t.
  
  (*
      fn from(err: ParseIntError) -> DoubleError {
          DoubleError::Parse(err)
      }
  *)
  Definition from
      (err : core.num.error.ParseIntError.t)
      : M wrapping_errors.DoubleError.t :=
    let* err := M.alloc err in
    let* α0 : core.num.error.ParseIntError.t := M.read err in
    M.pure (wrapping_errors.DoubleError.Parse α0).
  
  Global Instance AssociatedFunction_from :
    Notations.DoubleColon Self "from" := {
    Notations.double_colon := from;
  }.
  
  Global Instance ℐ :
    core.convert.From.Trait Self (T := core.num.error.ParseIntError.t) := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_core_num_error_ParseIntError_t_for_wrapping_errors_DoubleError_t.
End Impl_core_convert_From_core_num_error_ParseIntError_t_for_wrapping_errors_DoubleError_t.

(*
fn double_first(vec: Vec<&str>) -> Result<i32> {
    let first = vec.first().ok_or(DoubleError::EmptyVec)?;
    // Here we implicitly use the `ParseIntError` implementation of `From` (which
    // we defined above) in order to create a `DoubleError`.
    let parsed = first.parse::<i32>()?;

    Ok(2 * parsed)
}
*)
Definition double_first
    (vec : alloc.vec.Vec.t (ref str.t) alloc.vec.Vec.Default.A)
    : M ltac:(wrapping_errors.Result i32.t) :=
  let* vec := M.alloc vec in
  let return_ := M.return_ (R := ltac:(wrapping_errors.Result i32.t)) in
  M.catch_return
    (let* first : M.Val (ref (ref str.t)) :=
      let* α0 : ref (slice (ref str.t)) :=
        M.call
          ((core.ops.deref.Deref.deref
              (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            (borrow vec)) in
      let* α1 : core.option.Option.t (ref (ref str.t)) :=
        M.call ((slice (ref str.t))::["first"] α0) in
      let* α2 :
          core.result.Result.t
            (ref (ref str.t))
            wrapping_errors.DoubleError.t :=
        M.call
          ((core.option.Option.t (ref (ref str.t)))::["ok_or"]
            α1
            wrapping_errors.DoubleError.EmptyVec) in
      let* α3 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              wrapping_errors.DoubleError.t)
            (ref (ref str.t)) :=
        M.call
          ((core.ops.try_trait.Try.branch
              (Self :=
                core.result.Result.t
                  (ref (ref str.t))
                  wrapping_errors.DoubleError.t)
              (Trait := ltac:(refine _)))
            α2) in
      let* α4 : M.Val (ref (ref str.t)) :=
        match α3 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 :
              core.result.Result.t
                core.convert.Infallible.t
                wrapping_errors.DoubleError.t :=
            M.read residual in
          let* α1 : core.result.Result.t i32.t wrapping_errors.DoubleError.t :=
            M.call
              ((core.ops.try_trait.FromResidual.from_residual
                  (Self :=
                    core.result.Result.t i32.t wrapping_errors.DoubleError.t)
                  (Trait := ltac:(refine _)))
                α0) in
          let* α2 : M.Val never.t := return_ α1 in
          let* α3 := M.read α2 in
          let* α4 : ref (ref str.t) := never_to_any α3 in
          M.alloc α4
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      M.copy α4 in
    let* parsed : M.Val i32.t :=
      let* α0 : ref (ref str.t) := M.read first in
      let* α1 : ref str.t := M.read (deref α0) in
      let* α2 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
        M.call (str.t::["parse"] α1) in
      let* α3 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              core.num.error.ParseIntError.t)
            i32.t :=
        M.call
          ((core.ops.try_trait.Try.branch
              (Self :=
                core.result.Result.t i32.t core.num.error.ParseIntError.t)
              (Trait := ltac:(refine _)))
            α2) in
      let* α4 : M.Val i32.t :=
        match α3 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 :
              core.result.Result.t
                core.convert.Infallible.t
                core.num.error.ParseIntError.t :=
            M.read residual in
          let* α1 : core.result.Result.t i32.t wrapping_errors.DoubleError.t :=
            M.call
              ((core.ops.try_trait.FromResidual.from_residual
                  (Self :=
                    core.result.Result.t i32.t wrapping_errors.DoubleError.t)
                  (Trait := ltac:(refine _)))
                α0) in
          let* α2 : M.Val never.t := return_ α1 in
          let* α3 := M.read α2 in
          let* α4 : i32.t := never_to_any α3 in
          M.alloc α4
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      M.copy α4 in
    let* α0 : i32.t := M.read parsed in
    let* α1 : i32.t := BinOp.Panic.mul (Integer.of_Z 2) α0 in
    let* α0 :
        M.Val (core.result.Result.t i32.t wrapping_errors.DoubleError.t) :=
      M.alloc (core.result.Result.Ok α1) in
    M.read α0).

(*
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => {
            println!("Error: {}", e);
            if let Some(source) = e.source() {
                println!("  Caused by: {}", source);
            }
        }
    }
}
*)
Definition print (result : ltac:(wrapping_errors.Result i32.t)) : M unit :=
  let* result := M.alloc result in
  let* α0 : core.result.Result.t i32.t wrapping_errors.DoubleError.t :=
    M.read result in
  let* α1 : M.Val unit :=
    match α0 with
    | core.result.Result.Ok n =>
      let* n := M.alloc n in
      let* _ : M.Val unit :=
        let* α0 : ref str.t := M.read (mk_str "The first doubled is ") in
        let* α1 : ref str.t := M.read (mk_str "
") in
        let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
        let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
        let* α4 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α3) in
        let* α5 : core.fmt.rt.Argument.t :=
          M.call (core.fmt.rt.Argument.t::["new_display"] (borrow n)) in
        let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
        let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
          M.alloc (borrow α6) in
        let* α8 : ref (slice core.fmt.rt.Argument.t) :=
          M.read (pointer_coercion "Unsize" α7) in
        let* α9 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
        let* α10 : unit := M.call (std.io.stdio._print α9) in
        M.alloc α10 in
      M.alloc tt
    | core.result.Result.Err e =>
      let* e := M.alloc e in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "Error: ") in
          let* α1 : ref str.t := M.read (mk_str "
") in
          let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
          let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
          let* α4 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α3) in
          let* α5 : core.fmt.rt.Argument.t :=
            M.call (core.fmt.rt.Argument.t::["new_display"] (borrow e)) in
          let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
          let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc (borrow α6) in
          let* α8 : ref (slice core.fmt.rt.Argument.t) :=
            M.read (pointer_coercion "Unsize" α7) in
          let* α9 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
          let* α10 : unit := M.call (std.io.stdio._print α9) in
          M.alloc α10 in
        M.alloc tt in
      let* α0 : core.option.Option.t (ref dynamic) :=
        M.call
          ((core.error.Error.source
              (Self := wrapping_errors.DoubleError.t)
              (Trait := ltac:(refine _)))
            (borrow e)) in
      let* α1 : M.Val (core.option.Option.t (ref dynamic)) := M.alloc α0 in
      let* α2 : M.Val bool.t := let_if core.option.Option.Some source := α1 in
      let* α3 : bool.t := M.read α2 in
      if α3 then
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : ref str.t := M.read (mk_str "  Caused by: ") in
            let* α1 : ref str.t := M.read (mk_str "
") in
            let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
            let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
            let* α4 : ref (slice (ref str.t)) :=
              M.read (pointer_coercion "Unsize" α3) in
            let* α5 : core.fmt.rt.Argument.t :=
              M.call
                (core.fmt.rt.Argument.t::["new_display"] (borrow source)) in
            let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
            let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc (borrow α6) in
            let* α8 : ref (slice core.fmt.rt.Argument.t) :=
              M.read (pointer_coercion "Unsize" α7) in
            let* α9 : core.fmt.Arguments.t :=
              M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
            let* α10 : unit := M.call (std.io.stdio._print α9) in
            M.alloc α10 in
          M.alloc tt in
        M.alloc tt
      else
        M.alloc tt
    end in
  M.read α1.

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
Definition main : M unit :=
  let* numbers : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : ref str.t := M.read (mk_str "42") in
    let* α1 : ref str.t := M.read (mk_str "93") in
    let* α2 : ref str.t := M.read (mk_str "18") in
    let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
    let* α4 :
        M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3) in
    let* α5 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call ((slice (ref str.t))::["into_vec"] α5) in
    M.alloc α6 in
  let* empty : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)::["new"] in
    M.alloc α0 in
  let* strings : M.Val (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t) :=
    let* α0 : ref str.t := M.read (mk_str "tofu") in
    let* α1 : ref str.t := M.read (mk_str "93") in
    let* α2 : ref str.t := M.read (mk_str "18") in
    let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
    let* α4 :
        M.Val (alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t) :=
      M.call ((alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3) in
    let* α5 : alloc.boxed.Box.t (slice (ref str.t)) alloc.alloc.Global.t :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call ((slice (ref str.t))::["into_vec"] α5) in
    M.alloc α6 in
  let* _ : M.Val unit :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.read numbers in
    let* α1 : core.result.Result.t i32.t wrapping_errors.DoubleError.t :=
      M.call (wrapping_errors.double_first α0) in
    let* α2 : unit := M.call (wrapping_errors.print α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.read empty in
    let* α1 : core.result.Result.t i32.t wrapping_errors.DoubleError.t :=
      M.call (wrapping_errors.double_first α0) in
    let* α2 : unit := M.call (wrapping_errors.print α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.read strings in
    let* α1 : core.result.Result.t i32.t wrapping_errors.DoubleError.t :=
      M.call (wrapping_errors.double_first α0) in
    let* α2 : unit := M.call (wrapping_errors.print α1) in
    M.alloc α2 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
