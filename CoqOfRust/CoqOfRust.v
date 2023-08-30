(* This file is under MIT license:

The MIT License (MIT)

Copyright (c) 2023 Formal Land

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*)

Require Export Coq.Strings.Ascii.
Require Export Coq.Strings.String.
Require Export Coq.ZArith.ZArith.

(* Global settings for files importing this file *)
Global Set Primitive Projections.
Global Set Printing Projections.
Global Open Scope list_scope.
Global Open Scope string_scope.
Global Open Scope type_scope.
Global Open Scope Z_scope.

Export List.ListNotations.

Require Export CoqOfRust.Monad.
Export Monad.Notations.

(** Notation for a function call. Translated directly to function application
    for now. It will drive the monadic transformation in near future. *)
Notation "e (| e1 , .. , en |)" :=
  ((.. (e e1) ..) en)
  (at level 0,
    only parsing).

(** Particular case when there are no arguments. *)
Notation "e (||)" :=
  (e tt)
  (at level 0,
    only parsing).

Require CoqOfRust.lib.lib.
Module Notation := CoqOfRust.lib.lib.Notation.

(** Note that we revert the arguments in this notation. *)
Notation "e1 .[ e2 ]" := (Notation.dot e2 e1)
  (at level 0).

Notation "e1 ::[ e2 ]" := (Notation.double_colon e1 e2)
  (at level 0).

Notation "e1 ::type[ e2 ]" := (Notation.double_colon_type e1 e2)
  (at level 0).

(** A method is also an associated function for its type. *)
Global Instance AssociatedFunctionFromMethod
  (type : Set) (name : string) (T : Set)
  `(Notation.Dot (Kind := string) name (T := type -> T)) :
  Notation.DoubleColon type name (T := type -> T) := {
  Notation.double_colon := Notation.dot name;
}.

Definition defaultType (T : option Set) (Default : Set) : Set :=
  match T with
  | Some T => T
  | None => Default
  end.

Parameter axiom : forall {A : Set}, A.

Parameter cast : forall {A : Set}, A -> forall (B : Set), B.

Parameter assign : forall `{State.Trait} {A : Set}, A -> A -> M unit.

Definition usize : Set := Z.
Definition isize : Set := Z.

Definition u8 : Set := Z.
Definition u16 : Set := Z.
Definition u32 : Set := Z.
Definition u64 : Set := Z.
Definition u128 : Set := Z.

Definition i8 : Set := Z.
Definition i16 : Set := Z.
Definition i32 : Set := Z.
Definition i64 : Set := Z.
Definition i128 : Set := Z.

(* We approximate floating point numbers with integers *)
Definition f32 : Set := Z.
Definition f64 : Set := Z.

Definition str : Set := string.
Definition char : Set := ascii.

Definition ref (A : Set) : Set := A.
Definition mut_ref : Set -> Set := ref.

Parameter eqb : forall {A : Set}, A -> A -> bool.

(** The functions on [Z] should eventually be replaced by functions on the
    corresponding integer types. *)
Global Instance Method_Z_abs `{State.Trait} : Notation.Dot "abs" := {
  Notation.dot (z : Z) := Pure (Z.abs z);
}.

(* TODO: find a better place for this instance *)
Global Instance Method_Z_neg `{State.Trait} : Notation.Dot "neg" := {
  Notation.dot (x : Z) := Pure (Z.opp x);
}.

(* TODO: find a better place for this instance *)
Global Instance Method_Z_lt `{State.Trait} : Notation.Dot "lt" := {
  Notation.dot (x y : Z) := Pure (Z.ltb x y);
}.

(* TODO: find a better place for this instance *)
Global Instance Method_Z_gt `{State.Trait} : Notation.Dot "gt" := {
  Notation.dot (x y : Z) := Pure (Z.gtb x y);
}.

(* TODO: find a better place for this instance *)
Global Instance Method_Z_eq `{State.Trait} : Notation.Dot "eq" := {
  Notation.dot (x y : Z) := Pure (Z.eqb x y);
}.

(* TODO: find a better place for this instance *)
Global Instance Method_bool_andb `{State.Trait} : Notation.Dot "andb" := {
  Notation.dot (x y : bool) := Pure (andb x y);
}.

Global Instance Method_destroy `{State.Trait} (A : Set) :
  Notation.Dot "destroy" := {
  Notation.dot (x : A) := Pure tt;
}.

Global Instance Method_ne_u64 `{State.Trait} :
  Notation.Dot "ne" (T := u64 -> u64 -> M bool). Admitted.

Require CoqOfRust.alloc.boxed.
Require CoqOfRust.alloc.string.
Require CoqOfRust.alloc.vec.

Module alloc.
  Export CoqOfRust.alloc.boxed.
  Export CoqOfRust.alloc.string.
  Export CoqOfRust.alloc.vec.
End alloc.

(* @TODO:
   1. Move this to its folders
   2. Make std reexport these definitions were appropriated

   In Rust [std] depends and reexports [core]. We added the
   definitions in this file ad-hocly as we need them, and added the
   defitions for [std] also, but at some points they are duplicates,
   it would be nice if we deduplicate them by making [std] files
   reexport [core] definitions.

   An observation is that during the translation the names are
   resolved so we never see these aliases between [std] and [core] in
   translated code, it always use the real definition (in [core] in
   this case).
*)

Require CoqOfRust.core.alloc.
Require CoqOfRust.core.any.
Require CoqOfRust.core.borrow.
Require CoqOfRust.core.cell.
Require CoqOfRust.core.clone.
Require CoqOfRust.core.cmp.
Require CoqOfRust.core.convert.
Require CoqOfRust.core.default.
Require CoqOfRust.core.hash.
Require CoqOfRust.core.marker.
Require CoqOfRust.core.mem.
Require CoqOfRust.core.option.
Require CoqOfRust.core.result.
Require CoqOfRust.core.panic.unwind_safe.

Module core.
  Export CoqOfRust.core.alloc.
  Export CoqOfRust.core.any.
  Export CoqOfRust.core.borrow.
  Export CoqOfRust.core.cell.
  Export CoqOfRust.core.clone.
  Export CoqOfRust.core.cmp.
  Export CoqOfRust.core.convert.
  Export CoqOfRust.core.default.
  Export CoqOfRust.core.hash.
  Export CoqOfRust.core.marker.
  Export CoqOfRust.core.mem.
  Export CoqOfRust.core.option.
  Export CoqOfRust.core.result.

  Module fmt.
    Parameter Alignment : Set.

    Parameter Error : Set.

    Definition Result : Set := result.Result unit Error.

    Module Arguments.
      Parameter t : Set.
    End Arguments.
    Definition Arguments := Arguments.t.

    Module Write.
      Class Trait (Self : Set) : Set := {
        write_str `{State.Trait} : mut_ref Self -> ref str -> M Result;
        write_char `{State.Trait} : mut_ref Self -> char -> M Result;
        write_fmt `{State.Trait} : mut_ref Self -> Arguments -> M Result;
      }.

      Global Instance Method_write_str `{State.Trait} `(Trait) : Notation.Dot "write_str" := {
        Notation.dot := write_str;
      }.
      Global Instance Method_write_char `{State.Trait} `(Trait) : Notation.Dot "write_char" := {
        Notation.dot := write_char;
      }.
      Global Instance Method_write_fmt `{State.Trait} `(Trait) : Notation.Dot "write_fmt" := {
        Notation.dot := write_fmt;
      }.
    End Write.

    Module Formatter.
      Parameter t : Set.
    End Formatter.
    Definition Formatter := Formatter.t.

    Module DebugTuple.
      Parameter t : Set.
    End DebugTuple.
    Definition DebugTuple := DebugTuple.t.

    Module Display.
      Class Trait (Self : Set) : Set := {
        fmt `{State.Trait} : ref Self -> mut_ref Formatter -> M Result;
      }.
    End Display.

    Module Debug.
      Class Trait (Self : Set) : Set := {
        fmt `{State.Trait} : ref Self -> mut_ref Formatter -> M Result;
      }.
    End Debug.

    Module ImplDebugTuple.
      Definition Self := DebugTuple.

      (** field(&mut self, value: &dyn Debug) -> &mut DebugTuple<'a, 'b> *)
      Parameter field :
        forall `{State.Trait} {T : Set} `{Debug.Trait T},
          mut_ref Self -> ref T -> M (mut_ref DebugTuple).

      Global Instance Method_field `{State.Trait} {T : Set} `{Debug.Trait T} :
        Notation.Dot "field" := {
        Notation.dot := field;
      }.

      (** finish(&mut self) -> Result<(), Error> *)
      Parameter finish : forall `{State.Trait}, mut_ref Self -> M Result.

      Global Instance Method_finish `{State.Trait} :
        Notation.Dot "finish" := {
        Notation.dot := finish;
      }.
    End ImplDebugTuple.

    Module ImplFormatter.
      Definition Self := Formatter.

      Parameter new : forall `{State.Trait} {W : Set} `{Write.Trait W},
        mut_ref W -> M Formatter.

      Global Instance Formatter_new `{State.Trait} {W : Set} `{Write.Trait W} :
        Notation.DoubleColon Formatter "new" := {
        Notation.double_colon := new;
      }.

      (*
      pub(super) fn debug_tuple_new<'a, 'b>(
          fmt: &'a mut fmt::Formatter<'b>,
          name: &str,
      ) -> DebugTuple<'a, 'b> {
          let result = fmt.write_str(name);
          DebugTuple { fmt, result, fields: 0, empty_name: name.is_empty() }
      }
      *)
      Parameter debug_tuple_new :
        forall `{State.Trait} (fmt : mut_ref Formatter) (name : ref str),
          M DebugTuple.

      Global Instance Method_debug_tuple `{State.Trait} :
        Notation.Dot "debug_tuple_new" := {
        Notation.dot := debug_tuple_new;
      }.

      (*
      pub fn debug_tuple_field1_finish<'b>(&'b mut self, name: &str, value1: &dyn Debug) -> Result {
          let mut builder = builders::debug_tuple_new(self, name);
          builder.field(value1);
          builder.finish()
      }
      *)
      Definition debug_tuple_field1_finish `{State.Trait} {T : Set}
        `{core.fmt.Debug.Trait T} (f : core.fmt.Formatter) (x : ref str) (y : T) :
        M core.fmt.Result :=
        let* dt := f.["debug_tuple_new"] x in
        let* fld := dt.["field"] y in
        fld.["finish"].

      Global Instance Formatter_debug_tuple_field1_finish `{State.Trait}
        {T : Set} `{core.fmt.Debug.Trait T} :
        Notation.DoubleColon core.fmt.Formatter "debug_tuple_field1_finish" := {
        Notation.double_colon := debug_tuple_field1_finish (T := T);
      }.
    End ImplFormatter.

    Module Octal.
      Class Trait (Self : Set) : Set := {
        fmt `{State.Trait} : ref Self -> mut_ref Formatter -> M Result;
      }.
    End Octal.

    Module LowerHex.
      Class Trait (Self : Set) : Set := {
        fmt `{State.Trait} : ref Self -> mut_ref Formatter -> M Result;
      }.
    End LowerHex.

    Module UpperHex.
      Class Trait (Self : Set) : Set := {
        fmt `{State.Trait} : ref Self -> mut_ref Formatter -> M Result;
      }.
    End UpperHex.

    Module Pointer.
      Class Trait (Self : Set) : Set := {
        fmt `{State.Trait} : ref Self -> mut_ref Formatter -> M Result;
      }.
    End Pointer.

    Module Binary.
      Class Trait (Self : Set) : Set := {
        fmt `{State.Trait} : ref Self -> mut_ref Formatter -> M Result;
      }.
    End Binary.

    Module LowerExp.
      Class Trait (Self : Set) : Set := {
        fmt `{State.Trait} : ref Self -> mut_ref Formatter -> M Result;
      }.
    End LowerExp.

    Module UpperExp.
      Class Trait (Self : Set) : Set := {
        fmt `{State.Trait} : ref Self -> mut_ref Formatter -> M Result;
      }.
    End UpperExp.

    Module ArgumentV1.
      Parameter t : Set.
    End ArgumentV1.
    Definition ArgumentV1 := ArgumentV1.t.

    Module ImplArgumentV1.
      Definition Self := ArgumentV1.

      Parameter new :
        forall `{State.Trait} {T : Set},
        ref T -> (ref T -> mut_ref Formatter -> M Result) -> M Self.

      Global Instance ArgumentV1_new `{State.Trait} {T : Set} :
        Notation.DoubleColon ArgumentV1 "new" := {
        Notation.double_colon := new (T := T);
      }.

      Parameter new_display :
        forall `{State.Trait} {T : Set} `{Display.Trait T}, ref T -> M Self.

      Global Instance ArgumentV1_new_display
        `{State.Trait} {T : Set} `{Display.Trait T} :
        Notation.DoubleColon ArgumentV1 "new_display" := {
        Notation.double_colon := new_display (T := T);
      }.

      Parameter new_debug :
        forall `{State.Trait} {T : Set} `{Debug.Trait T}, ref T -> M Self.

      Global Instance ArgumentV1_new_debug
        `{State.Trait} {T : Set} `{Debug.Trait T} :
        Notation.DoubleColon ArgumentV1 "new_debug" := {
        Notation.double_colon := new_debug (T := T);
      }.

      Parameter new_octal :
        forall `{State.Trait} {T : Set} `{Octal.Trait T}, ref T -> M Self.

      Global Instance ArgumentV1_new_octal
        `{State.Trait} {T : Set} `{Octal.Trait T} :
        Notation.DoubleColon ArgumentV1 "new_octal" := {
        Notation.double_colon := new_octal (T := T);
      }.

      Parameter new_lower_hex :
        forall `{State.Trait} {T : Set} `{LowerHex.Trait T}, ref T -> M Self.

      Global Instance ArgumentV1_new_lower_hex
        `{State.Trait} {T : Set} `{LowerHex.Trait T} :
        Notation.DoubleColon ArgumentV1 "new_lower_hex" := {
        Notation.double_colon := new_lower_hex (T := T);
      }.

      Parameter new_upper_hex :
        forall `{State.Trait} {T : Set} `{UpperHex.Trait T}, ref T -> M Self.

      Global Instance ArgumentV1_new_upper_hex
        `{State.Trait} {T : Set} `{UpperHex.Trait T} :
        Notation.DoubleColon ArgumentV1 "new_upper_hex" := {
        Notation.double_colon := new_upper_hex (T := T);
      }.

      Parameter new_pointer :
        forall `{State.Trait} {T : Set} `{Pointer.Trait T}, ref T -> M Self.

      Global Instance ArgumentV1_new_pointer
        `{State.Trait} {T : Set} `{Pointer.Trait T} :
        Notation.DoubleColon ArgumentV1 "new_pointer" := {
        Notation.double_colon := new_pointer (T := T);
      }.

      Parameter new_binary :
        forall `{State.Trait} {T : Set} `{Binary.Trait T}, ref T -> M Self.

      Global Instance ArgumentV1_new_binary
        `{State.Trait} {T : Set} `{Binary.Trait T} :
        Notation.DoubleColon ArgumentV1 "new_binary" := {
        Notation.double_colon := new_binary (T := T);
      }.

      Parameter new_lower_exp :
        forall `{State.Trait} {T : Set} `{LowerExp.Trait T}, ref T -> M Self.

      Global Instance ArgumentV1_new_lower_exp
        `{State.Trait} {T : Set} `{LowerExp.Trait T} :
        Notation.DoubleColon ArgumentV1 "new_lower_exp" := {
        Notation.double_colon := new_lower_exp (T := T);
      }.

      Parameter new_upper_exp :
        forall `{State.Trait} {T : Set} `{UpperExp.Trait T}, ref T -> M Self.

      Global Instance ArgumentV1_new_upper_exp
        `{State.Trait} {T : Set} `{UpperExp.Trait T} :
        Notation.DoubleColon ArgumentV1 "new_upper_exp" := {
        Notation.double_colon := new_upper_exp (T := T);
      }.
    End ImplArgumentV1.

    Module ImplArguments.
      Parameter new_const :
        forall `{State.Trait}, ref (list (ref str)) -> M Arguments.

      Global Instance Arguments_new_const `{State.Trait} :
        Notation.DoubleColon Arguments "new_const" := {
        Notation.double_colon := new_const;
      }.

      Parameter new_v1 :
        forall `{State.Trait},
          ref (list (ref str)) -> ref (list ArgumentV1) -> M Arguments.

      Global Instance Arguments_new_v1 `{State.Trait} :
        Notation.DoubleColon Arguments "new_v1" := {
        Notation.double_colon := new_v1;
      }.
    End ImplArguments.

    Global Instance Write_for_Formatter : Write.Trait Formatter.
    Admitted.
  End fmt.

  Module panic.
    Export CoqOfRust.core.panic.unwind_safe.
  End panic.

  Module panicking.
    Module AssertKind.
      Inductive t : Set :=
      | Eq : t
      | Ne : t
      | Match.
    End AssertKind.
    Definition AssertKind := AssertKind.t.

    Parameter assert_failed :
      forall `{State.Trait} {T U : Set} `{fmt.Debug.Trait T} `{fmt.Debug.Trait U},
      AssertKind -> ref T -> ref U -> option.Option fmt.Arguments -> M Empty_set.
  End panicking.

  Module ops.
    Module arith.
      Module Add.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          add `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_add `{State.Trait} `(Trait) :
          Notation.Dot "add" := {
          Notation.dot := add;
        }.
      End Add.

      Module AddAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          add_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_add_assign `{State.Trait} `(Trait) :
          Notation.Dot "add_assign" := {
          Notation.dot := add_assign;
        }.
      End AddAssign.

      Module Sub.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          sub `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_sub `{State.Trait} `(Trait) :
          Notation.Dot "sub" := {
          Notation.dot := sub;
        }.
      End Sub.

      Module SubAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          sub_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_sub_assign `{State.Trait} `(Trait) :
          Notation.Dot "sub_assign" := {
          Notation.dot := sub_assign;
        }.
      End SubAssign.

      Module Mul.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          mul `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_mul `{State.Trait} `(Trait) :
          Notation.Dot "mul" := {
          Notation.dot := mul;
        }.
      End Mul.

      Module MulAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          mul_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_mul_assign `{State.Trait} `(Trait) :
          Notation.Dot "mul_assign" := {
          Notation.dot := mul_assign;
        }.
      End MulAssign.

      Module Div.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          div `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_div `{State.Trait} `(Trait) :
          Notation.Dot "div" := {
          Notation.dot := div;
        }.
      End Div.

      Module DivAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          div_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_div_assign `{State.Trait} `(Trait) :
          Notation.Dot "div_assign" := {
          Notation.dot := div_assign;
        }.
      End DivAssign.

      Module Rem.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          rem `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_rem `{State.Trait} `(Trait) :
          Notation.Dot "rem" := {
          Notation.dot := rem;
        }.
      End Rem.

      Module RemAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          rem_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_rem_assign `{State.Trait} `(Trait) :
          Notation.Dot "rem_assign" := {
          Notation.dot := rem_assign;
        }.
      End RemAssign.

      Module BitXor.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          bitxor `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_bitxor `{State.Trait} `(Trait) :
          Notation.Dot "bitxor" := {
          Notation.dot := bitxor;
        }.
      End BitXor.

      Module BitXorAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          bitxor_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_bitxor_assign `{State.Trait} `(Trait) :
          Notation.Dot "bitxor_assign" := {
          Notation.dot := bitxor_assign;
        }.
      End BitXorAssign.

      Module BitAnd.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          bitand `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_bitand `{State.Trait} `(Trait) :
          Notation.Dot "bitand" := {
          Notation.dot := bitand;
        }.
      End BitAnd.

      Module BitAndAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          bitand_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_bitand_assign `{State.Trait} `(Trait) :
          Notation.Dot "bitand_assign" := {
          Notation.dot := bitand_assign;
        }.
      End BitAndAssign.

      Module BitOr.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          bitor `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_bitor `{State.Trait} `(Trait) :
          Notation.Dot "bitor" := {
          Notation.dot := bitor;
        }.
      End BitOr.

      Module BitOrAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          bitor_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_bitor_assign `{State.Trait} `(Trait) :
          Notation.Dot "bitor_assign" := {
          Notation.dot := bitor_assign;
        }.
      End BitOrAssign.

      Module Shl.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          shl `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_shl `{State.Trait} `(Trait) :
          Notation.Dot "shl" := {
          Notation.dot := shl;
        }.
      End Shl.

      Module ShlAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          shl_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_shl_assign `{State.Trait} `(Trait) :
          Notation.Dot "shl_assign" := {
          Notation.dot := shl_assign;
        }.
      End ShlAssign.

      Module Shr.
        Class Trait (Self : Set) {Rhs : option Set} : Type := {
          Output : Set;
          Rhs := defaultType Rhs Self;
          shr `{State.Trait} : Self -> Rhs -> M Output;
        }.

        Global Instance Method_shr `{State.Trait} `(Trait) :
          Notation.Dot "shr" := {
          Notation.dot := shr;
        }.
      End Shr.

      Module ShrAssign.
        Class Trait (Self : Set) {Rhs : option Set} : Set := {
          Rhs := defaultType Rhs Self;
          shr_assign `{State.Trait} : mut_ref Self -> Rhs -> M unit;
        }.

        Global Instance Method_shr_assign `{State.Trait} `(Trait) :
          Notation.Dot "shr_assign" := {
          Notation.dot := shr_assign;
        }.
      End ShrAssign.

      Module Neg.
        Class Trait (Self : Set) : Type := {
          Output : Set;
          neg `{State.Trait} : Self -> M Output;
        }.

        Global Instance Method_neg `{State.Trait} `(Trait) :
          Notation.Dot "neg" := {
          Notation.dot := neg;
        }.
      End Neg.

      Module Not.
        Class Trait (Self : Set) : Type := {
          Output : Set;
          not `{State.Trait} : Self -> M Output;
        }.

        Global Instance Method_not `{State.Trait} `(Trait) :
          Notation.Dot "not" := {
          Notation.dot := not;
        }.
      End Not.
    End arith.

    Module Deref.
      Class Trait (Self : Set) {Target : Set} : Set := {
        Target := Target;
        deref `{State.Trait} : ref Self -> M (ref Target);
      }.

      Global Instance Method_deref `{State.Trait} `(Trait) :
        Notation.Dot "deref" := {
        Notation.dot := deref;
      }.
    End Deref.

    Module function.
      Module FnOnce.
        Class Trait (Self : Set) {Args : Set} : Type := {
          Output : Set;
          call_once `{State.Trait} : Self -> Args -> M Output;
        }.
      End FnOnce.

      Module FnMut.
        Class Trait (Self : Set) {Args : Set}
          `{FnOnce.Trait (Args := Args) Self} : Set := {
          call_mut `{State.Trait} : mut_ref Self -> Args -> M FnOnce.Output;
        }.
      End FnMut.
    End function.
    

    (* The trait implementations for [Z] are convenient but should be replaced
       by the implementations for the native types eventually. *)
    Module Impl_Add_for_Z.
      Definition add `{State.Trait} (z1 z2 : Z) : M Z := Pure (Z.add z1 z2).

      Global Instance Method_add `{State.Trait} : Notation.Dot "add" := {
        Notation.dot := add;
      }.

      Global Instance Add_for_Z : arith.Add.Trait Z (Rhs := None) := {
        add `{State.Trait} := add;
      }.
    End Impl_Add_for_Z.

    Module Impl_AddAssign_for_Z.
      Parameter add_assign : forall `{State.Trait}, mut_ref Z -> Z -> M unit.

      Global Instance Method_add_assign `{State.Trait} :
        Notation.Dot "add_assign" := {
        Notation.dot := add_assign;
      }.

      Global Instance AddAssign_for_Z :
        arith.AddAssign.Trait Z (Rhs := None) := {
        add_assign `{State.Trait} := add_assign;
      }.
    End Impl_AddAssign_for_Z.

    Module Impl_Sub_for_Z.
      Definition sub `{State.Trait} (z1 z2 : Z) : M Z := Pure (Z.sub z1 z2).

      Global Instance Method_sub `{State.Trait} : Notation.Dot "sub" := {
        Notation.dot := sub;
      }.

      Global Instance Sub_for_Z : arith.Sub.Trait Z (Rhs := None) := {
        sub `{State.Trait} := sub;
      }.
    End Impl_Sub_for_Z.

    Module Impl_SubAssign_for_Z.
      Parameter sub_assign : forall `{State.Trait}, mut_ref Z -> Z -> M unit.

      Global Instance Method_sub_assign `{State.Trait} :
        Notation.Dot "sub_assign" := {
        Notation.dot := sub_assign;
      }.

      Global Instance SubAssign_for_Z :
        arith.SubAssign.Trait Z (Rhs := None) := {
        sub_assign `{State.Trait} := sub_assign;
      }.
    End Impl_SubAssign_for_Z.

    Module Impl_Mul_for_Z.
      Definition mul `{State.Trait} (z1 z2 : Z) : M Z := Pure (Z.mul z1 z2).

      Global Instance Method_mul `{State.Trait} : Notation.Dot "mul" := {
        Notation.dot := mul;
      }.

      Global Instance Mul_for_Z : arith.Mul.Trait Z (Rhs := None) := {
        mul `{State.Trait} := mul;
      }.
    End Impl_Mul_for_Z.

    Module Impl_MulAssign_for_Z.
      Parameter mul_assign : forall `{State.Trait}, mut_ref Z -> Z -> M unit.

      Global Instance Method_mul_assign `{State.Trait} :
        Notation.Dot "mul_assign" := {
        Notation.dot := mul_assign;
      }.

      Global Instance MulAssign_for_Z :
        arith.MulAssign.Trait Z (Rhs := None) := {
        mul_assign `{State.Trait} := mul_assign;
      }.
    End Impl_MulAssign_for_Z.

    Module Impl_Div_for_Z.
      Definition div `{State.Trait} (z1 z2 : Z) : M Z := Pure (Z.div z1 z2).

      Global Instance Method_div `{State.Trait} : Notation.Dot "div" := {
        Notation.dot := div;
      }.

      Global Instance Div_for_Z : arith.Div.Trait Z (Rhs := None) := {
        div `{State.Trait} := div;
      }.
    End Impl_Div_for_Z.

    Module Impl_DivAssign_for_Z.
      Parameter div_assign : forall `{State.Trait}, mut_ref Z -> Z -> M unit.

      Global Instance Method_div_assign `{State.Trait} :
        Notation.Dot "div_assign" := {
        Notation.dot := div_assign;
      }.

      Global Instance DivAssign_for_Z :
        arith.DivAssign.Trait Z (Rhs := None) := {
        div_assign `{State.Trait} := div_assign;
      }.
    End Impl_DivAssign_for_Z.

    Module Impl_Rem_for_Z.
      Definition rem `{State.Trait} (z1 z2 : Z) : M Z := Pure (Z.rem z1 z2).

      Global Instance Method_rem `{State.Trait} : Notation.Dot "rem" := {
        Notation.dot := rem;
      }.

      Global Instance Rem_for_Z : arith.Rem.Trait Z (Rhs := None) := {
        rem `{State.Trait} := rem;
      }.
    End Impl_Rem_for_Z.

    Module Impl_RemAssign_for_Z.
      Parameter rem_assign : forall `{State.Trait}, mut_ref Z -> Z -> M unit.

      Global Instance Method_rem_assign `{State.Trait} :
        Notation.Dot "rem_assign" := {
        Notation.dot := rem_assign;
      }.

      Global Instance RemAssign_for_Z :
        arith.RemAssign.Trait Z (Rhs := None) := {
        rem_assign `{State.Trait} := rem_assign;
      }.
    End Impl_RemAssign_for_Z.

    Module Impl_Neg_for_Z.
      Definition neg `{State.Trait} (z : Z) : M Z := Pure (Z.opp z).

      Global Instance Method_neg `{State.Trait} : Notation.Dot "neg" := {
        Notation.dot := neg;
      }.

      Global Instance Neg_for_Z : arith.Neg.Trait Z := {
        neg `{State.Trait} := neg;
      }.
    End Impl_Neg_for_Z.

    Module Impl_Not_for_bool.
      Definition not `{State.Trait} (b : bool) : M bool := Pure (negb b).

      Global Instance Method_not `{State.Trait} : Notation.Dot "not" := {
        Notation.dot := not;
      }.

      Global Instance Not_for_bool : arith.Not.Trait bool := {
        not `{State.Trait} := not;
      }.
    End Impl_Not_for_bool.

    (** For now we implement the dereferencing operator on any types, as the
        identity. *)
    Module Impl_Deref_for_any.
      Definition deref `{State.Trait} {A : Set} (x : A) : M A := Pure x.

      Global Instance Method_deref `{State.Trait} (A : Set) :
        Notation.Dot "deref" := {
        Notation.dot := deref (A := A);
      }.

      Global Instance Deref_for_any (A : Set) : Deref.Trait A := {
        deref `{State.Trait} := deref;
      }.
    End Impl_Deref_for_any.
  End ops.
End core.

Require CoqOfRust._std.arch.
Require CoqOfRust._std.array.
Require CoqOfRust._std.ascii.
Require CoqOfRust._std.assert_matches.
Require CoqOfRust._std.async_iter.
Require CoqOfRust._std.backtrace.
Require CoqOfRust._std.char.
Require CoqOfRust._std.collections.
Require CoqOfRust._std.env.
Require CoqOfRust._std.error.
Require CoqOfRust._std.ffi.
Require CoqOfRust._std.fmt.
Require CoqOfRust._std.fs.
Require CoqOfRust._std.future.
Require CoqOfRust._std.hint.
Require CoqOfRust._std.intrinsics.
Require CoqOfRust._std.io.
(* Require CoqOfRust._std.iter. *)
(* Require Import CoqOfRust._std.iter_type. *)
(* Require Import CoqOfRust._std.net. *)
Require Import CoqOfRust._std.num.
Require Import CoqOfRust._std.ops.
(* Require Import CoqOfRust._std.os. *)
Require Import CoqOfRust._std.panic.
Require Import CoqOfRust._std.path.
Require Import CoqOfRust._std.pin.
Require Import CoqOfRust._std.prelude.
Require Import CoqOfRust._std.primitive.
Require Import CoqOfRust._std.process.
Require Import CoqOfRust._std.ptr.
Require Import CoqOfRust._std.rc.
Require Import CoqOfRust._std.simd.
Require Import CoqOfRust._std.slice.
Require Import CoqOfRust._std.str.
Require Import CoqOfRust._std.sync.
Require Import CoqOfRust._std.task.
Require Import CoqOfRust._std.thread.
Require Import CoqOfRust._std.time.


Module std.
  Module arch := _std.arch.
  Module array := _std.array.
  Module ascii := _std.ascii.
  Module backtrace := _std.backtrace.
  Module borrow := core.borrow.
  Module char := _std.char.
  Module clone := core.clone.
  Module cmp := core.cmp.
  Module collections := _std.collections.
  Module env := _std.env.
  Module error := _std.error.
  Module ffi := _std.ffi.
  Module fmt := _std.fmt.
  Module fs := _std.fs.
  Module future := _std.future.
  Module hint := _std.hint.
  Module intrinsics := _std.intrinsics.
  Module io := _std.io.
  (* Module iter := _std.iter. *)
  (* Module net := _std.net. *)
  Module num := _std.num.
  Module ops := _std.ops.
  (* Module os := _std.os. *)
  Module panic := _std.panic.
  Module path := _std.path.
  Module pin := _std.pin.
  Module prelude := _std.prelude.
  Module primitive := _std.primitive.
  Module process := _std.process.
  Module ptr := _std.ptr.
  Module rc := _std.rc.
  Module simd := _std.simd.
  Module slice := _std.slice.
  Module str := _std.str.
  Module sync := _std.sync.
  Module task := _std.task.
  Module thread := _std.thread.
  Module time := _std.time.
End std.

(*** std instances *)

Module hash_Instances.
  (** Hasher instance functions *)
  Global Instance Hasher_Method_finish (T : Set) `{core.hash.Hasher.Trait T} :
    Notation.Dot "finish" := {
    Notation.dot (x : T) := core.hash.Hasher.finish x;
  }.

  (** Hash instance functions *)
  Global Instance Hash_Method_hash
    `{State.Trait} (T : Set) `{core.hash.Hasher.Trait} `{core.hash.Hash.Trait T} :
    Notation.Dot "hash" := {
      Notation.dot (x : T) := core.hash.Hash.hash x;
  }.

  (** Hasher implementation for DefaultHasher *)
  Global Instance DefaultHasher_Hasher :
    core.hash.Hasher.Trait std.collections.hash.map.DefaultHasher. Admitted.

  (** Hash implementation for primitive types *)
  Global Instance Hash_for_unit : core.hash.Hash.Trait unit. Admitted.
  Global Instance Hash_for_bool : core.hash.Hash.Trait unit. Admitted.
  Global Instance Hash_for_i32 : core.hash.Hash.Trait i32. Admitted.
  Global Instance Hash_for_u32 : core.hash.Hash.Trait u32. Admitted.
  Global Instance Hash_for_String : core.hash.Hash.Trait alloc.string.String. Admitted.
  Global Instance Hash_for_i64 : core.hash.Hash.Trait i64. Admitted.
  Global Instance Hash_for_u64 : core.hash.Hash.Trait u64. Admitted.
End hash_Instances.

Module unit_Instances.
  Global Instance IDisplay : core.fmt.Display.Trait unit.
  Admitted.

  Global Instance IDebug : core.fmt.Debug.Trait unit.
  Admitted.
End unit_Instances.

Module bool_Instances.
  Global Instance IDisplay : core.fmt.Display.Trait bool.
  Admitted.

  Global Instance IDebug : core.fmt.Debug.Trait bool.
  Admitted.
End bool_Instances.

Module char_Instances.
  Global Instance IDisplay : core.fmt.Display.Trait char.
  Admitted.

  Global Instance IDebug : core.fmt.Debug.Trait char.
  Admitted.
End char_Instances.

Module str_Instances.
  Global Instance IDisplay : core.fmt.Display.Trait str.
  Admitted.

  Global Instance IDebug : core.fmt.Debug.Trait str.
  Admitted.
End str_Instances.

Module Z_Instances.
  Global Instance IDisplay : core.fmt.Display.Trait Z.
  Admitted.

  Global Instance IDebug : core.fmt.Debug.Trait Z.
  Admitted.
End Z_Instances.

Module Debug_Tuple_Instances.
  Global Instance IDebug2 {A1 A2 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2) :
    core.fmt.Debug.Trait (A1 * A2).
  Admitted.

  Global Instance IDebug3 {A1 A2 A3 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3) :
    core.fmt.Debug.Trait (A1 * A2 * A3).
  Admitted.

  Global Instance IDebug4 {A1 A2 A3 A4 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3)
    `(core.fmt.Debug.Trait A4) :
   core.fmt.Debug.Trait (A1 * A2 * A3 * A4).
  Admitted.

  Global Instance IDebug5 {A1 A2 A3 A4 A5 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3)
    `(core.fmt.Debug.Trait A4)
    `(core.fmt.Debug.Trait A5) :
   core.fmt.Debug.Trait (A1 * A2 * A3 * A4 * A5).
  Admitted.

  Global Instance IDebug6 {A1 A2 A3 A4 A5 A6 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3)
    `(core.fmt.Debug.Trait A4)
    `(core.fmt.Debug.Trait A5)
    `(core.fmt.Debug.Trait A6) :
   core.fmt.Debug.Trait (A1 * A2 * A3 * A4 * A5 * A6).
  Admitted.

  Global Instance IDebug7 {A1 A2 A3 A4 A5 A6 A7 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3)
    `(core.fmt.Debug.Trait A4)
    `(core.fmt.Debug.Trait A5)
    `(core.fmt.Debug.Trait A6)
    `(core.fmt.Debug.Trait A7) :
   core.fmt.Debug.Trait (A1 * A2 * A3 * A4 * A5 * A6 * A7).
  Admitted.

  Global Instance IDebug8 {A1 A2 A3 A4 A5 A6 A7 A8 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3)
    `(core.fmt.Debug.Trait A4)
    `(core.fmt.Debug.Trait A5)
    `(core.fmt.Debug.Trait A6)
    `(core.fmt.Debug.Trait A7)
    `(core.fmt.Debug.Trait A8) :
    core.fmt.Debug.Trait (A1 * A2 * A3 * A4 * A5 * A6 * A7 * A8).
  Admitted.

  Global Instance IDebug9 {A1 A2 A3 A4 A5 A6 A7 A8 A9 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3)
    `(core.fmt.Debug.Trait A4)
    `(core.fmt.Debug.Trait A5)
    `(core.fmt.Debug.Trait A6)
    `(core.fmt.Debug.Trait A7)
    `(core.fmt.Debug.Trait A8)
    `(core.fmt.Debug.Trait A9) :
    core.fmt.Debug.Trait (A1 * A2 * A3 * A4 * A5 * A6 * A7 * A8 * A9).
  Admitted.

  Global Instance IDebug10 {A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3)
    `(core.fmt.Debug.Trait A4)
    `(core.fmt.Debug.Trait A5)
    `(core.fmt.Debug.Trait A6)
    `(core.fmt.Debug.Trait A7)
    `(core.fmt.Debug.Trait A8)
    `(core.fmt.Debug.Trait A9)
    `(core.fmt.Debug.Trait A10) :
    core.fmt.Debug.Trait (A1 * A2 * A3 * A4 * A5 * A6 * A7 * A8 * A9 * A10).
  Admitted.

Global Instance IDebug11 {A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3)
    `(core.fmt.Debug.Trait A4)
    `(core.fmt.Debug.Trait A5)
    `(core.fmt.Debug.Trait A6)
    `(core.fmt.Debug.Trait A7)
    `(core.fmt.Debug.Trait A8)
    `(core.fmt.Debug.Trait A9)
    `(core.fmt.Debug.Trait A10)
    `(core.fmt.Debug.Trait A11) :
    core.fmt.Debug.Trait (A1 * A2 * A3 * A4 * A5 * A6 * A7 * A8 * A9 * A10 * A11).
  Admitted.

  Global Instance IDebug12 {A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 : Set}
    `(core.fmt.Debug.Trait A1)
    `(core.fmt.Debug.Trait A2)
    `(core.fmt.Debug.Trait A3)
    `(core.fmt.Debug.Trait A4)
    `(core.fmt.Debug.Trait A5)
    `(core.fmt.Debug.Trait A6)
    `(core.fmt.Debug.Trait A7)
    `(core.fmt.Debug.Trait A8)
    `(core.fmt.Debug.Trait A9)
    `(core.fmt.Debug.Trait A10)
    `(core.fmt.Debug.Trait A11)
    `(core.fmt.Debug.Trait A12) :
    core.fmt.Debug.Trait (A1 * A2 * A3 * A4 * A5 * A6 * A7 * A8 * A9 * A10 * A11 * A12).
  Admitted.
End Debug_Tuple_Instances.

Module ToString_Instances.
  Global Instance ToString_on_Display {Self : Set}
    `{core.fmt.Display.Trait Self} :
    alloc.string.ToString.Trait Self.
  Admitted.
End ToString_Instances.

Module Parse_Instances.
  Global Instance Parse_u32 `{H : State.Trait} :
    Notation.Dot "parse" (T := string -> M u32).
  Admitted.

  Global Instance Parse_bool `{H : State.Trait} :
    Notation.Dot "parse" (T := string -> M bool).
  Admitted.
End Parse_Instances.

Module _crate.
  Module intrinsics.
    Parameter discriminant_value : forall {A : Set}, ref A -> u128.
  End intrinsics.

  Module marker.
    Module Copy.
      Unset Primitive Projections.
      Class Trait (Self : Set) : Set := {
      }.
      Global Set Primitive Projections.
    End Copy.

    Module StructuralEq.
      Unset Primitive Projections.
      Class Trait (Self : Set) : Set := {
      }.
      Global Set Primitive Projections.
    End StructuralEq.

    Module StructuralPartialEq.
      Unset Primitive Projections.
      Class Trait (Self : Set) : Set := {
      }.
      Global Set Primitive Projections.
    End StructuralPartialEq.
  End marker.

  Module clone.
    Module Clone.
      Class Trait (Self : Set) : Set := {
        clone `{State.Trait} : ref Self -> M Self;
      }.
    End Clone.
  End clone.

  Module cmp.
    Module Eq.
      Class Trait (Self : Set) : Set := {
        assert_receiver_is_total_eq `{State.Trait} : ref Self -> M unit;
      }.
    End Eq.

    Module PartialEq.
      Class Trait (Self : Set) : Set := {
        eq `{State.Trait} : ref Self -> ref Self -> M bool;
      }.
    End PartialEq.
  End cmp.

  Module fmt := core.fmt.

  Module hash := core.hash.

  Module log.
    Parameter sol_log : forall `{State.Trait}, str -> M unit.
  End log.

  Module panicking.
    Parameter panic : forall `{State.Trait}, alloc.string.String -> M unit.
  End panicking.
End _crate.

Module num_derive.
  Module FromPrimitive.
  End FromPrimitive.
End num_derive.

Module solana_program.
  Module decode_error.
    Module DecodeError.
      Class Class (E : Set) (Self : Set) : Set := {
        type_of `{State.Trait} : unit -> M (ref str);
      }.
    End DecodeError.
  End decode_error.

  Module msg.
  End msg.

  Module program_error.
    Module PrintProgramError.
      Class Class (Self : Set) : Set := {
        print `{State.Trait} : ref Self -> M unit;
      }.
    End PrintProgramError.

    Module ProgramError.
      Inductive t : Set :=
      | Custom (_ : u32)
      | InvalidArgument
      | InvalidInstructionData
      | InvalidAccountData
      | AccountDataTooSmall
      | InsufficientFunds
      | IncorrectProgramId
      | MissingRequiredSignature
      | AccountAlreadyInitialized
      | UninitializedAccount
      | NotEnoughAccountKeys
      | AccountBorrowFailed
      | MaxSeedLengthExceeded
      | InvalidSeeds
      | BorshIoError (_ : alloc.string.String)
      | AccountNotRentExempt
      | UnsupportedSysvar
      | IllegalOwner
      | MaxAccountsDataSizeExceeded
      | InvalidRealloc.
    End ProgramError.
    Definition ProgramError := ProgramError.t.
  End program_error.
End solana_program.

Module thiserror.
  Module Error.
  End Error.
End thiserror.

Parameter _num_traits : Set.
Module _num_traits.
  Module FromPrimitive.
    Class Class (Self : Set) : Set := {
      from_i64 `{State.Trait} : i64 -> M (option Self);
      from_u64 `{State.Trait} : u64 -> M (option Self);
    }.
  End FromPrimitive.
End _num_traits.

Module crate.
  Parameter check_program_account : forall `{State.Trait}, unit -> M unit.
End crate.

Module rand.
  Parameter thread_rng : unit -> Set.
  Module Rng.
  End Rng.
End rand.

(** For now we assume that all types implement [to_owned] and that this is the
    identity function. *)
Global Instance Method_to_owned `{State.Trait} {A : Set} :
  Notation.Dot "to_owned" := {
  Notation.dot (x : A) := Pure x;
}.

Definition addr_of {A : Set} (v : A) : ref A := v.

(** A LangItem generated by the Rust compiler. *)
Definition format_argument : Set := core.fmt.ArgumentV1.

(** A LangItem generated by the Rust compiler. *)
Definition format_arguments : Set := core.fmt.Arguments.

Definition Slice := lib.slice.

(* This is a specialized instance to make try_from_and_into.v work.
 * It is necessary because Coq has a problem with inferring the correct value of
 * the parameter T of core.fmt.ImplFormatter.Formatter_debug_tuple_field1_finish
 * and in result does not use this instance at all.
 *)
Global Instance Formatter_debug_tuple_field1_finish_for_i32 `{State.Trait} :
  Notation.DoubleColon core.fmt.Formatter "debug_tuple_field1_finish" :=
    core.fmt.ImplFormatter.Formatter_debug_tuple_field1_finish (T := i32).

(* derived implementation of Debug for Result *)
Module Impl_Debug_for_Result.
  Section Impl_Debug_for_Result.
    Context {T E : Set}.
    Context `{core.fmt.Debug.Trait T}.
    Context `{core.fmt.Debug.Trait E}.

    Parameter fmt :
      forall `{State.Trait}, ref (core.result.Result T E) ->
        mut_ref core.fmt.Formatter -> M core.fmt.Result.

    Global Instance I : core.fmt.Debug.Trait (core.result.Result T E) := {
      fmt `{State.Trait} := fmt;
    }.
  End Impl_Debug_for_Result.
End Impl_Debug_for_Result.

Module Impl_RangeInclusive.
  Section Impl_RangeInclusive.
  Context {Idx : Set}.

  Definition Self := RangeInclusive Idx.

  Parameter new : forall `{State.Trait}, Idx -> Idx -> M Self.

  Global Instance RangeInclusive_new `{State.Trait} :
    Notation.DoubleColon RangeInclusive "new" := {
    Notation.double_colon := new;
  }.
  End Impl_RangeInclusive.
End Impl_RangeInclusive.

Module Impl_Slice.
  (* TODO: is it the right place for this module? *)
  Module hack.
    Parameter t : Set.

    (* defined only for A = Global *)
    Parameter into_vec :
      forall `{State.Trait} {T (* A *) : Set}
      (* `{(* core. *) alloc.Allocator.Trait A} *)
      (b : alloc.boxed.Box (Slice T) (* A *)),
        M (alloc.vec.Vec T (* (Some A) *)).
  End hack.
  Definition hack := hack.t.

  Module hack_notations.
    Global Instance hack_into_vec `{State.Trait}
      {T (* A *) : Set} (* `{(* core. *) alloc.Allocator.Trait A} *) :
      Notation.DoubleColon hack "into_vec" := {
      Notation.double_colon (b : alloc.boxed.Box (Slice T) (* A *)) :=
        hack.into_vec (T := T) (* (A := A) *) b;
    }.
  End hack_notations.

  Section Impl_Slice.
    Context {T : Set}.
    Definition Self := Slice T.

    Definition into_vec `{State.Trait}
      {A : Set} `{alloc.Allocator.Trait A}
      (self : ref Self) (alloc : A) :
      M (alloc.vec.Vec T).
    Admitted.

    Global Instance Method_into_vec `{State.Trait}
      (* {A : Set} `{(* core. *) alloc.Allocator.Trait A} *) :
      Notation.DoubleColon (Slice T) "into_vec" := {
        Notation.double_colon (self : ref Self) (* (alloc : A) *) :=
          into_vec self (* alloc *);
      }.

    Global Instance Method_into_vec_box `{State.Trait}
      (* {A : Set} `{(* core. *) alloc.Allocator.Trait A} *) :
      Notation.DoubleColon (Slice T) "into_vec" := {
        Notation.double_colon (self : alloc.boxed.Box Self) (* (alloc : A) *) :=
          hack.into_vec self (* alloc *);
      }.
  End Impl_Slice.
End Impl_Slice.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
Module Impl_Iterator_for_Slice_Iter.
  Section Impl_Iterator_for_Slice_Iter.
  Context {A : Set}.

  Definition Self := std.slice.Iter A.

  Definition Item := A.

  Parameter next :
    forall `{State.Trait}, mut_ref Self -> M (core.option.Option A).

  Global Instance Method_next `{State.Trait} : Notation.Dot "next" := {
    Notation.dot := next;
  }.
  End Impl_Iterator_for_Slice_Iter.
End Impl_Iterator_for_Slice_Iter.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
(* this should be replaced with a generic instance of IntoIterator for Iterator *)
Module Impl_IntoIterator_for_Slice_Iter.
  Section Impl_IntoIterator_for_Slice_Iter.
  Context {A : Set}.
  Definition I := std.slice.Iter A.

  Definition Self := I.

  Definition Item := A.
  Definition IntoIter := I.

  Parameter into_iter :
    forall `{State.Trait}, Self -> M IntoIter.

  Global Instance Method_into_iter `{State.Trait} :
    Notation.Dot "into_iter" := {
    Notation.dot := into_iter;
  }.
  End Impl_IntoIterator_for_Slice_Iter.
End Impl_IntoIterator_for_Slice_Iter.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
Module Impl_Iterator_for_Slice_IterMut.
  Section Impl_Iterator_for_Slice_IterMut.
  Context {A : Set}.

  Definition Self := std.slice.IterMut A.

  Definition Item := A.

  Parameter next :
    forall `{State.Trait}, mut_ref Self -> M (core.option.Option A).

  Global Instance Method_next `{State.Trait} : Notation.Dot "next" := {
    Notation.dot := next;
  }.
  End Impl_Iterator_for_Slice_IterMut.
End Impl_Iterator_for_Slice_IterMut.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
(* this should be replaced with a generic instance of IntoIterator for Iterator *)
Module Impl_IntoIterator_for_Slice_IterMut.
  Section Impl_IntoIterator_for_Slice_IterMut.
  Context {A : Set}.
  Definition I := std.slice.IterMut A.

  Definition Self := I.

  Definition Item := A.
  Definition IntoIter := I.

  Parameter into_iter :
    forall `{State.Trait}, Self -> M IntoIter.

  Global Instance Method_into_iter `{State.Trait} :
    Notation.Dot "into_iter" := {
    Notation.dot := into_iter;
  }.
  End Impl_IntoIterator_for_Slice_IterMut.
End Impl_IntoIterator_for_Slice_IterMut.

Module Impl_IntoIter_for_Vec.
  Section Impl_IntoIter_for_Vec.
  Context {T (* A *) : Set}.
(*   Context `{alloc.Allocator.Trait A}. *)
  Definition Self := alloc.vec.Vec T (* (Some A) *).

  Definition Item := T.
  Definition IntoIter := alloc.vec.IntoIter T None (* (Some A) *).

  Parameter into_iter :
    forall `{State.Trait}, Self -> M IntoIter.

(* TODO: uncomment after fixing iter_type.v *)
(*   Global Instance IntoIter_for_Vec `{State.Trait} :
    std.iter_type.IntoIterator Self Item IntoIter := {
    into_iter := into_iter;
  }. *)
  Global Instance Method_into_iter `{State.Trait} :
    Notation.Dot "into_iter" := {
    Notation.dot := into_iter;
  }.
  End Impl_IntoIter_for_Vec.
End Impl_IntoIter_for_Vec.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
Module Impl_Iterator_for_Vec_IntoIter.
  Section Impl_Iterator_for_Vec_IntoIter.
  Context {T (* A *) : Set}.
(*   Context `{alloc.Allocator.Trait A}. *)
  Definition Self := alloc.vec.IntoIter T None (* (Some A) *).

  Definition Item := T.

  Parameter next : forall `{State.Trait} (self : mut_ref Self),
    M (core.option.Option T).

  Global Instance Method_next `{State.Trait} : Notation.Dot "next" := {
    Notation.dot := next;
  }.
  End Impl_Iterator_for_Vec_IntoIter.
End Impl_Iterator_for_Vec_IntoIter.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
Module Impl_IntoIter_for_Vec_IntoIter.
  Section Impl_IntoIter_for_Vec_IntoIter.
  Context {T (* A *) : Set}.
(*   Context `{alloc.Allocator.Trait A}. *)
  Definition Self := alloc.vec.IntoIter T None (* (Some A) *).

  Definition Item := T.
  Definition IntoIter := alloc.vec.IntoIter T None (* (Some A) *).

  Definition into_iter `{State.Trait} (self : Self) : M IntoIter := Pure self.

  Global Instance Method_into_iter `{State.Trait} :
    Notation.Dot "into_iter" := {
    Notation.dot := into_iter;
  }.
  End Impl_IntoIter_for_Vec_IntoIter.
End Impl_IntoIter_for_Vec_IntoIter.

(* TODO: a temporary implementation providing methods,
         which can be called in Rust on Vec,
         but only after applying a coercion *)
Module Temp_Impl_for_Vec.
  Section Temp_Impl_for_Vec.
  Context {T : Set}.

  Definition Self := alloc.vec.Vec T.

  Parameter iter : forall `{State.Trait}, ref Self -> M (std.slice.Iter T).
  Parameter iter_mut :
    forall `{State.Trait}, ref Self -> M (std.slice.IterMut T).

  Global Instance Method_iter `{State.Trait} : Notation.Dot "iter" := {
    Notation.dot := iter;
  }.

  Global Instance Method_iter_mut `{State.Trait} : Notation.Dot "iter_mut" := {
    Notation.dot := iter_mut;
  }.
  End Temp_Impl_for_Vec.
End Temp_Impl_for_Vec.

Module Impl_Debug_for_Vec.
  Section Impl_Debug_for_Vec.
  Context {T (* A *) : Set}.
  Context `{core.fmt.Debug.Trait T}.
(*   Context `{alloc.Allocator.Trait A}. *)

  Definition Self := alloc.vec.Vec T (* (Some A) *).

  Global Instance IDebug : core.fmt.Debug.Trait Self. Admitted.
  End Impl_Debug_for_Vec.
End Impl_Debug_for_Vec.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
Module Impl_Iterator_for_Range.
  Section Impl_Iterator_for_Range.
  Context {A : Set}.
(*   Context `{std.iter_type.Step.Trait A}. *)

  Definition Self := Range A.

  Definition Item := A.

  Parameter next : forall `{State.Trait}, mut_ref Self -> M (core.option.Option A).

  Global Instance Method_next `{State.Trait} : Notation.Dot "next" := {
    Notation.dot := next;
  }.
  End Impl_Iterator_for_Range.
End Impl_Iterator_for_Range.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
(* this should be replaced with a generic instance of IntoIterator for Iterator *)
Module Impl_IntoIterator_for_Range.
  Section Impl_IntoIterator_for_Range.
  Context {A : Set}.
  Definition I := Range A.

  Definition Self := I.

  Definition Item := A.
  Definition IntoIter := I.

  Parameter into_iter :
    forall `{State.Trait}, Self -> M IntoIter.

  Global Instance Method_into_iter `{State.Trait} :
    Notation.Dot "into_iter" := {
    Notation.dot := into_iter;
  }.
  End Impl_IntoIterator_for_Range.
End Impl_IntoIterator_for_Range.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
Module Impl_Iterator_for_RangeInclusive.
  Section Impl_Iterator_for_RangeInclusive.
  Context {A : Set}.
(*   Context `{std.iter_type.Step.Trait A}. *)

  Definition Self := RangeInclusive A.

  Definition Item := A.

  Parameter next : forall `{State.Trait}, mut_ref Self -> M (core.option.Option A).

  Global Instance Method_next `{State.Trait} : Notation.Dot "next" := {
    Notation.dot := next;
  }.
  End Impl_Iterator_for_RangeInclusive.
End Impl_Iterator_for_RangeInclusive.

(* TODO: this is only a temporary implementation,
         it needs to be rewritten when all std files will be fixed *)
(* this should be replaced with a generic instance of IntoIterator for Iterator *)
Module Impl_IntoIterator_for_RangeInclusive.
  Section Impl_IntoIterator_for_RangeInclusive.
  Context {A : Set}.
  Definition I := RangeInclusive A.

  Definition Self := I.

  Definition Item := A.
  Definition IntoIter := I.

  Parameter into_iter :
    forall `{State.Trait}, Self -> M IntoIter.

  Global Instance Method_into_iter `{State.Trait} :
    Notation.Dot "into_iter" := {
    Notation.dot := into_iter;
  }.
  End Impl_IntoIterator_for_RangeInclusive.
End Impl_IntoIterator_for_RangeInclusive.

(* TODO: remove - it is a temporary definition *)
Module Impl_Iterator_for_Range_Z.
  Global Instance Method_next {A : Set} `{State.Trait} :
    Notation.Dot "next" (T := std.ops.Range A -> M (core.option.Option Z)).
  Admitted.
(*   Impl_Iterator_for_Range.Method_next (A := Z). *)
End Impl_Iterator_for_Range_Z.

(* TODO: remove - it is a temporary definition *)
Module Impl_Iterator_for_RangeInclusive_Z.
  Global Instance Method_next {A : Set} `{State.Trait} :
    Notation.Dot "next"
      (T := std.ops.RangeInclusive A -> M (core.option.Option Z)).
  Admitted.
(*   Impl_Iterator_for_Range.Method_next (A := Z). *)
End Impl_Iterator_for_RangeInclusive_Z.

(* a hint for eauto to automatically solve existential goals *)
Global Hint Resolve ex_intro : core.
