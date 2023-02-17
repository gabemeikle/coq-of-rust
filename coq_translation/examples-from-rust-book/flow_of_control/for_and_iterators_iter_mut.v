(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

(* Approximation *)

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

Definition f32 : Set := Z.
Definition f64 : Set := Z.

Definition main (_ : unit) :=
  let names := ComplexTypePath.into_vec ["Bob";"Frank";"Ferris"] in
  match into_iter (iter_mut names) with
  | iter =>
    loop match next iter with
    | {|  |} => Break
    | {| Some.0 := name; |} =>
      assign deref name := match name with
      | Str("Ferris", Cooked) => "There is a rustacean among us!"
      | _ => "Hello"
      end
    end ;;
    tt from for
  end ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["names: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug names]) ;;
  tt ;;
  tt.