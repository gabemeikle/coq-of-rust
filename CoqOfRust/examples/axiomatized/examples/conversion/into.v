(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Number.
Section Number.
  Record t : Set := {
    value : i32.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => Some x.(value)) (fun v x => Some (x <| value := v |>));
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Number.
End Number.

Module  Impl_core_convert_From_i32_t_for_into_Number_t.
Section Impl_core_convert_From_i32_t_for_into_Number_t.
  Definition Self : Set := into.Number.t.
  
  (*
      fn from(item: i32) -> Self {
          Number { value: item }
      }
  *)
  Parameter from : i32.t -> M Self.
  
  Global Instance AssociatedFunction_from :
    Notations.DoubleColon Self "from" := {
    Notations.double_colon := from;
  }.
  
  Global Instance ℐ : core.convert.From.Trait Self (T := i32.t) := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_i32_t_for_into_Number_t.
End Impl_core_convert_From_i32_t_for_into_Number_t.

(*
fn main() {
    <i32 as std::convert::Into<Number>>::into(5);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M unit.
