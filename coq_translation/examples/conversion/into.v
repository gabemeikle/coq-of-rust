(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Number.
  Record t : Set := {
    value : i32;
  }.
  
  Global Instance Get_value : Notation.Dot "value" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Number.
Definition Number : Set := Number.t.

Module Impl_core_fmt_Debug_for_into_Number.
  Definition Self := into.Number.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    core.fmt.Formatter::["debug_struct_field1_finish"]
      f
      "Number"
      "value"
      (addr_of (addr_of self.["value"])).
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_into_Number.

Module Impl_core_convert_From_for_into_Number.
  Definition Self := into.Number.
  
  Definition from (item : i32) : M Self :=
    Pure {| into.Number.value := item; |}.
  
  Global Instance AssociatedFunction_from :
    Notation.DoubleColon Self "from" := {
    Notation.double_colon := from;
  }.
  
  Global Instance I : core.convert.From.Trait Self := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_for_into_Number.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let int := 5 in
  let* num := int.["into"] in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of num) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "My number is "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
