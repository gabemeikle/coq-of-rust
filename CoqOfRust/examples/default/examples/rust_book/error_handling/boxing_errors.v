(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Ltac Result T :=
  exact
    (core.result.Result.t
      T
      (alloc.boxed.Box.t
        (dyn [core.error.Error.Trait])
        alloc.boxed.Box.Default.A)).

Module  EmptyVec.
Section EmptyVec.
  Inductive t : Set := Build.
End EmptyVec.
End EmptyVec.

Module  Impl_core_fmt_Debug_for_boxing_errors_EmptyVec_t.
Section Impl_core_fmt_Debug_for_boxing_errors_EmptyVec_t.
  Definition Self : Set := boxing_errors.EmptyVec.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "EmptyVec") in
    M.call (core.fmt.Formatter.t::["write_str"] α0 α1).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_boxing_errors_EmptyVec_t.
End Impl_core_fmt_Debug_for_boxing_errors_EmptyVec_t.

Module  Impl_core_clone_Clone_for_boxing_errors_EmptyVec_t.
Section Impl_core_clone_Clone_for_boxing_errors_EmptyVec_t.
  Definition Self : Set := boxing_errors.EmptyVec.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref Self) : M boxing_errors.EmptyVec.t :=
    let* self := M.alloc self in
    M.pure boxing_errors.EmptyVec.Build.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_boxing_errors_EmptyVec_t.
End Impl_core_clone_Clone_for_boxing_errors_EmptyVec_t.

Module  Impl_core_fmt_Display_for_boxing_errors_EmptyVec_t.
Section Impl_core_fmt_Display_for_boxing_errors_EmptyVec_t.
  Definition Self : Set := boxing_errors.EmptyVec.t.
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "invalid first item to double")
      }
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "invalid first item to double") in
    let* α2 : M.Val (array (ref str.t)) := M.alloc [ α1 ] in
    let* α3 : core.fmt.Arguments.t :=
      M.call
        (core.fmt.Arguments.t::["new_const"]
          (pointer_coercion "Unsize" (borrow α2))) in
    M.call (core.fmt.Formatter.t::["write_fmt"] α0 α3).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Display.Trait Self := {
    core.fmt.Display.fmt := fmt;
  }.
End Impl_core_fmt_Display_for_boxing_errors_EmptyVec_t.
End Impl_core_fmt_Display_for_boxing_errors_EmptyVec_t.

Module  Impl_core_error_Error_for_boxing_errors_EmptyVec_t.
Section Impl_core_error_Error_for_boxing_errors_EmptyVec_t.
  Definition Self : Set := boxing_errors.EmptyVec.t.
  
  Global Instance ℐ : core.error.Error.Required.Trait Self := {
    core.error.Error.source := Datatypes.None;
    core.error.Error.type_id := Datatypes.None;
    core.error.Error.description := Datatypes.None;
    core.error.Error.cause := Datatypes.None;
    core.error.Error.provide := Datatypes.None;
  }.
End Impl_core_error_Error_for_boxing_errors_EmptyVec_t.
End Impl_core_error_Error_for_boxing_errors_EmptyVec_t.

(*
fn double_first(vec: Vec<&str>) -> Result<i32> {
    vec.first()
        .ok_or_else(|| EmptyVec.into()) // Converts to Box
        .and_then(|s| {
            s.parse::<i32>()
                .map_err(|e| e.into()) // Converts to Box
                .map(|i| 2 * i)
        })
}
*)
Definition double_first
    (vec : alloc.vec.Vec.t (ref str.t) alloc.vec.Vec.Default.A)
    : M ltac:(boxing_errors.Result i32.t) :=
  let* vec := M.alloc vec in
  let* α0 :
      (ref (alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)) -> M (ref _) :=
    ltac:(M.get_method (fun ℐ =>
      core.ops.deref.Deref.deref
        (Self := alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t)
        (Trait := ℐ))) in
  let* α1 : ref (slice (ref str.t)) := M.call (α0 (borrow vec)) in
  let* α2 : core.option.Option.t (ref (ref str.t)) :=
    M.call ((slice (ref str.t))::["first"] α1) in
  let* α3 :
      core.result.Result.t
        (ref (ref str.t))
        (alloc.boxed.Box.t
          (dyn [core.error.Error.Trait])
          alloc.alloc.Global.t) :=
    M.call
      ((core.option.Option.t (ref (ref str.t)))::["ok_or_else"]
        α2
        (fun (α0 : unit) =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* α0 :
                    boxing_errors.EmptyVec.t ->
                      M
                        (alloc.boxed.Box.t
                          (dyn [core.error.Error.Trait])
                          alloc.alloc.Global.t) :=
                  ltac:(M.get_method (fun ℐ =>
                    core.convert.Into.into
                      (Self := boxing_errors.EmptyVec.t)
                      (T :=
                        alloc.boxed.Box.t
                          (dyn [core.error.Error.Trait])
                          alloc.alloc.Global.t)
                      (Trait := ℐ))) in
                M.call (α0 boxing_errors.EmptyVec.Build)) :
                M
                  (alloc.boxed.Box.t
                    (dyn [core.error.Error.Trait])
                    alloc.alloc.Global.t)
            ]) :
          M
            (alloc.boxed.Box.t
              (dyn [core.error.Error.Trait])
              alloc.alloc.Global.t))) in
  M.call
    ((core.result.Result.t
          (ref (ref str.t))
          (alloc.boxed.Box.t
            (dyn [core.error.Error.Trait])
            alloc.alloc.Global.t))::["and_then"]
      α3
      (fun (α0 : ref (ref str.t)) =>
        (let* α0 := M.alloc α0 in
        match_operator
          α0
          [
            fun γ =>
              (let* s := M.copy γ in
              let* α0 : ref (ref str.t) := M.read s in
              let* α1 : ref str.t := M.read (deref α0) in
              let* α2 :
                  core.result.Result.t i32.t core.num.error.ParseIntError.t :=
                M.call (str.t::["parse"] α1) in
              let* α3 :
                  core.result.Result.t
                    i32.t
                    (alloc.boxed.Box.t
                      (dyn [core.error.Error.Trait])
                      alloc.alloc.Global.t) :=
                M.call
                  ((core.result.Result.t
                        i32.t
                        core.num.error.ParseIntError.t)::["map_err"]
                    α2
                    (fun (α0 : core.num.error.ParseIntError.t) =>
                      (let* α0 := M.alloc α0 in
                      match_operator
                        α0
                        [
                          fun γ =>
                            (let* e := M.copy γ in
                            let* α0 :
                                core.num.error.ParseIntError.t ->
                                  M
                                    (alloc.boxed.Box.t
                                      (dyn [core.error.Error.Trait])
                                      alloc.alloc.Global.t) :=
                              ltac:(M.get_method (fun ℐ =>
                                core.convert.Into.into
                                  (Self := core.num.error.ParseIntError.t)
                                  (T :=
                                    alloc.boxed.Box.t
                                      (dyn [core.error.Error.Trait])
                                      alloc.alloc.Global.t)
                                  (Trait := ℐ))) in
                            let* α1 : core.num.error.ParseIntError.t :=
                              M.read e in
                            M.call (α0 α1)) :
                            M
                              (alloc.boxed.Box.t
                                (dyn [core.error.Error.Trait])
                                alloc.alloc.Global.t)
                        ]) :
                      M
                        (alloc.boxed.Box.t
                          (dyn [core.error.Error.Trait])
                          alloc.alloc.Global.t))) in
              M.call
                ((core.result.Result.t
                      i32.t
                      (alloc.boxed.Box.t
                        (dyn [core.error.Error.Trait])
                        alloc.alloc.Global.t))::["map"]
                  α3
                  (fun (α0 : i32.t) =>
                    (let* α0 := M.alloc α0 in
                    match_operator
                      α0
                      [
                        fun γ =>
                          (let* i := M.copy γ in
                          let* α0 : i32.t := M.read i in
                          BinOp.Panic.mul ((Integer.of_Z 2) : i32.t) α0) :
                          M i32.t
                      ]) :
                    M i32.t))) :
              M
                (core.result.Result.t
                  i32.t
                  (alloc.boxed.Box.t
                    (dyn [core.error.Error.Trait])
                    alloc.alloc.Global.t))
          ]) :
        M
          (core.result.Result.t
            i32.t
            (alloc.boxed.Box.t
              (dyn [core.error.Error.Trait])
              alloc.alloc.Global.t)))).

(*
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print (result : ltac:(boxing_errors.Result i32.t)) : M unit :=
  let* result := M.alloc result in
  let* α0 : M.Val unit :=
    match_operator
      result
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.result.Result.Ok _ =>
            let γ0_0 := core.result.Result.Get_Ok_0 γ in
            let* n := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "The first doubled is ") in
              let* α1 : ref str.t := M.read (mk_str "
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow n)) in
              let* α4 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α3 ] in
              let* α5 : core.fmt.Arguments.t :=
                M.call
                  (core.fmt.Arguments.t::["new_v1"]
                    (pointer_coercion "Unsize" (borrow α2))
                    (pointer_coercion "Unsize" (borrow α4))) in
              let* α6 : unit := M.call (std.io.stdio._print α5) in
              M.alloc α6 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit);
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | core.result.Result.Err _ =>
            let γ0_0 := core.result.Result.Get_Err_0 γ in
            let* e := M.copy γ0_0 in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "Error: ") in
              let* α1 : ref str.t := M.read (mk_str "
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow e)) in
              let* α4 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α3 ] in
              let* α5 : core.fmt.Arguments.t :=
                M.call
                  (core.fmt.Arguments.t::["new_v1"]
                    (pointer_coercion "Unsize" (borrow α2))
                    (pointer_coercion "Unsize" (borrow α4))) in
              let* α6 : unit := M.call (std.io.stdio._print α5) in
              M.alloc α6 in
            M.alloc tt
          | _ => M.break_match
          end) :
          M (M.Val unit)
      ] in
  M.read α0.

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
      M.call ((alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"] α3) in
    let* α5 : alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t :=
      M.read α4 in
    let* α6 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call
        ((slice (ref str.t))::["into_vec"] (pointer_coercion "Unsize" α5)) in
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
      M.call ((alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"] α3) in
    let* α5 : alloc.boxed.Box.t (array (ref str.t)) alloc.alloc.Global.t :=
      M.read α4 in
    let* α6 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.call
        ((slice (ref str.t))::["into_vec"] (pointer_coercion "Unsize" α5)) in
    M.alloc α6 in
  let* _ : M.Val unit :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.read numbers in
    let* α1 :
        core.result.Result.t
          i32.t
          (alloc.boxed.Box.t
            (dyn [core.error.Error.Trait])
            alloc.alloc.Global.t) :=
      M.call (boxing_errors.double_first α0) in
    let* α2 : unit := M.call (boxing_errors.print α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.read empty in
    let* α1 :
        core.result.Result.t
          i32.t
          (alloc.boxed.Box.t
            (dyn [core.error.Error.Trait])
            alloc.alloc.Global.t) :=
      M.call (boxing_errors.double_first α0) in
    let* α2 : unit := M.call (boxing_errors.print α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : alloc.vec.Vec.t (ref str.t) alloc.alloc.Global.t :=
      M.read strings in
    let* α1 :
        core.result.Result.t
          i32.t
          (alloc.boxed.Box.t
            (dyn [core.error.Error.Trait])
            alloc.alloc.Global.t) :=
      M.call (boxing_errors.double_first α0) in
    let* α2 : unit := M.call (boxing_errors.print α1) in
    M.alloc α2 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
