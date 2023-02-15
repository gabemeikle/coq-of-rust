(* Generated by coq-of-rust *)
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition Choice : Set :=
  u8.

(* Impl [Choice] of trait [_crate.marker.Copy]*)
Module ImplChoice.
  
End ImplChoice.
(* End impl [Choice] *)

(* Impl [Choice] of trait [_crate.clone.Clone]*)
Module ImplChoice.
  Definition clone (self : ref Self) : Choice :=
    let _ := tt in
    deref self.
End ImplChoice.
(* End impl [Choice] *)

(* Impl [Choice] of trait [_crate.fmt.Debug]*)
Module ImplChoice.
  Definition
    fmt
    (self : ref Self)
    (f : ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate::fmt::ImplFormatter.debug_tuple_field1_finish f "Choice" self.0.
End ImplChoice.
(* End impl [Choice] *)

(* Impl [Choice] *)
Module ImplChoice.
  Definition unwrap_u8 (self : ref Self) : u8 :=
    self.0.
End ImplChoice.
(* End impl [Choice] *)

(* Impl [bool] of trait [From]*)
Module Implbool.
  Definition from (source : Choice) : bool :=
    if true then
      if not (bit_or (eq source.0 0) (eq source.0 1)) then
        _crate.panicking.panic
          "assertion failed: (source.0 == 0u8) | (source.0 == 1u8)"
      else
        tt ;;
      tt
    else
      tt ;;
    ne source.0 0.
End Implbool.
(* End impl [bool] *)

(* Impl [Choice] of trait [BitAnd]*)
Module ImplChoice.
  Definition Output : Set :=
    Choice.
  
  Definition bitand (self : Self) (rhs : Choice) : Choice :=
    into (bit_and self.0 rhs.0).
End ImplChoice.
(* End impl [Choice] *)

(* Impl [Choice] of trait [BitAndAssign]*)
Module ImplChoice.
  Definition bitand_assign (self : ref Self) (rhs : Choice) :=
    assign deref self := bit_and (deref self) rhs ;;
    tt.
End ImplChoice.
(* End impl [Choice] *)

(* Impl [Choice] of trait [BitOr]*)
Module ImplChoice.
  Definition Output : Set :=
    Choice.
  
  Definition bitor (self : Self) (rhs : Choice) : Choice :=
    into (bit_or self.0 rhs.0).
End ImplChoice.
(* End impl [Choice] *)

(* Impl [Choice] of trait [BitOrAssign]*)
Module ImplChoice.
  Definition bitor_assign (self : ref Self) (rhs : Choice) :=
    assign deref self := bit_or (deref self) rhs ;;
    tt.
End ImplChoice.
(* End impl [Choice] *)

(* Impl [Choice] of trait [BitXor]*)
Module ImplChoice.
  Definition Output : Set :=
    Choice.
  
  Definition bitxor (self : Self) (rhs : Choice) : Choice :=
    into (bit_xor self.0 rhs.0).
End ImplChoice.
(* End impl [Choice] *)

(* Impl [Choice] of trait [BitXorAssign]*)
Module ImplChoice.
  Definition bitxor_assign (self : ref Self) (rhs : Choice) :=
    assign deref self := bit_xor (deref self) rhs ;;
    tt.
End ImplChoice.
(* End impl [Choice] *)

(* Impl [Choice] of trait [Not]*)
Module ImplChoice.
  Definition Output : Set :=
    Choice.
  
  Definition not (self : Self) : Choice :=
    into (bit_and 1 (not self.0)).
End ImplChoice.
(* End impl [Choice] *)

Definition black_box (_ : unit) :=
  if true then
    if not (bit_or (eq input 0) (eq input 1)) then
      _crate.panicking.panic "assertion failed: (input == 0u8) | (input == 1u8)"
    else
      tt ;;
    tt
  else
    tt ;;
  core.ptr.read_volatile input.

(* Impl [Choice] of trait [From]*)
Module ImplChoice.
  Definition from (input : u8) : Choice :=
    Choice (black_box input).
End ImplChoice.
(* End impl [Choice] *)

Class ConstantTimeEq : Set := {
  ct_eq : ref Self -> ref Self -> Choice;
  ct_ne : ref Self -> ref Self -> Choice;
}.

(* Impl [Slice] of trait [ConstantTimeEq]*)
Module ImplSlice.
  Definition ct_eq (self : ref Self) (_rhs : ref Slice) : Choice :=
    let len := len self in
    if ne len (len _rhs) then
      Return (ImplChoice.from 0) ;;
      tt
    else
      tt ;;
    let x := 1 in
    match into_iter (zip (iter self) (iter _rhs)) with
    | iter =>
      loop match next iter with
      | {|  |} => Break
      | {| Some.0 := (ai, bi); |} =>
        assign x := bit_and x (unwrap_u8 (ct_eq ai bi)) ;;
        tt
      end ;;
      tt from for
    end ;;
    into x.
End ImplSlice.
(* End impl [Slice] *)

(* Impl [Choice] of trait [ConstantTimeEq]*)
Module ImplChoice.
  Definition ct_eq (self : ref Self) (rhs : ref Choice) : Choice :=
    not (bit_xor (deref self) (deref rhs)).
End ImplChoice.
(* End impl [Choice] *)

(* Impl [u8] of trait [ConstantTimeEq]*)
Module Implu8.
  Definition ct_eq (self : ref Self) (other : ref u8) : Choice :=
    let x := bit_xor self other in
    let y := shr (bit_or x (wrapping_neg x)) (sub 8 1) in
    into (bit_xor y 1).
End Implu8.
(* End impl [u8] *)

(* Impl [i8] of trait [ConstantTimeEq]*)
Module Impli8.
  Definition ct_eq (self : ref Self) (other : ref i8) : Choice :=
    ct_eq (deref self) (deref other).
End Impli8.
(* End impl [i8] *)

(* Impl [u16] of trait [ConstantTimeEq]*)
Module Implu16.
  Definition ct_eq (self : ref Self) (other : ref u16) : Choice :=
    let x := bit_xor self other in
    let y := shr (bit_or x (wrapping_neg x)) (sub 16 1) in
    into (bit_xor y 1).
End Implu16.
(* End impl [u16] *)

(* Impl [i16] of trait [ConstantTimeEq]*)
Module Impli16.
  Definition ct_eq (self : ref Self) (other : ref i16) : Choice :=
    ct_eq (deref self) (deref other).
End Impli16.
(* End impl [i16] *)

(* Impl [u32] of trait [ConstantTimeEq]*)
Module Implu32.
  Definition ct_eq (self : ref Self) (other : ref u32) : Choice :=
    let x := bit_xor self other in
    let y := shr (bit_or x (wrapping_neg x)) (sub 32 1) in
    into (bit_xor y 1).
End Implu32.
(* End impl [u32] *)

(* Impl [i32] of trait [ConstantTimeEq]*)
Module Impli32.
  Definition ct_eq (self : ref Self) (other : ref i32) : Choice :=
    ct_eq (deref self) (deref other).
End Impli32.
(* End impl [i32] *)

(* Impl [u64] of trait [ConstantTimeEq]*)
Module Implu64.
  Definition ct_eq (self : ref Self) (other : ref u64) : Choice :=
    let x := bit_xor self other in
    let y := shr (bit_or x (wrapping_neg x)) (sub 64 1) in
    into (bit_xor y 1).
End Implu64.
(* End impl [u64] *)

(* Impl [i64] of trait [ConstantTimeEq]*)
Module Impli64.
  Definition ct_eq (self : ref Self) (other : ref i64) : Choice :=
    ct_eq (deref self) (deref other).
End Impli64.
(* End impl [i64] *)

(* Impl [usize] of trait [ConstantTimeEq]*)
Module Implusize.
  Definition ct_eq (self : ref Self) (other : ref usize) : Choice :=
    let x := bit_xor self other in
    let y := shr
      (bit_or x (wrapping_neg x))
      (sub (mul ({{root}}.core.mem.size_of tt) 8) 1) in
    into (bit_xor y 1).
End Implusize.
(* End impl [usize] *)

(* Impl [isize] of trait [ConstantTimeEq]*)
Module Implisize.
  Definition ct_eq (self : ref Self) (other : ref isize) : Choice :=
    ct_eq (deref self) (deref other).
End Implisize.
(* End impl [isize] *)

Class ConditionallySelectable : Set := {
  conditional_select : ref Self -> ref Self -> Choice -> Self;
  conditional_assign : ref Self -> ref Self -> Choice -> _;
  conditional_swap : ref Self -> ref Self -> Choice -> _;
}.

(* Impl [u8] of trait [ConditionallySelectable]*)
Module Implu8.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    let mask := neg (unwrap_u8 choice) in
    bit_xor a (bit_and mask (bit_xor a b)).
  
  Definition
    conditional_assign
    (self : ref Self)
    (other : ref Self)
    (choice : Choice)
    :=
    let mask := neg (unwrap_u8 choice) in
    assign deref self := bit_xor
      (deref self)
      (bit_and mask (bit_xor (deref self) (deref other))) ;;
    tt.
  
  Definition conditional_swap (a : ref Self) (b : ref Self) (choice : Choice) :=
    let mask := neg (unwrap_u8 choice) in
    let t := bit_and mask (bit_xor (deref a) (deref b)) in
    assign deref a := bit_xor (deref a) t ;;
    assign deref b := bit_xor (deref b) t ;;
    tt.
End Implu8.
(* End impl [u8] *)

(* Impl [i8] of trait [ConditionallySelectable]*)
Module Impli8.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    let mask := neg (unwrap_u8 choice) in
    bit_xor a (bit_and mask (bit_xor a b)).
  
  Definition
    conditional_assign
    (self : ref Self)
    (other : ref Self)
    (choice : Choice)
    :=
    let mask := neg (unwrap_u8 choice) in
    assign deref self := bit_xor
      (deref self)
      (bit_and mask (bit_xor (deref self) (deref other))) ;;
    tt.
  
  Definition conditional_swap (a : ref Self) (b : ref Self) (choice : Choice) :=
    let mask := neg (unwrap_u8 choice) in
    let t := bit_and mask (bit_xor (deref a) (deref b)) in
    assign deref a := bit_xor (deref a) t ;;
    assign deref b := bit_xor (deref b) t ;;
    tt.
End Impli8.
(* End impl [i8] *)

(* Impl [u16] of trait [ConditionallySelectable]*)
Module Implu16.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    let mask := neg (unwrap_u8 choice) in
    bit_xor a (bit_and mask (bit_xor a b)).
  
  Definition
    conditional_assign
    (self : ref Self)
    (other : ref Self)
    (choice : Choice)
    :=
    let mask := neg (unwrap_u8 choice) in
    assign deref self := bit_xor
      (deref self)
      (bit_and mask (bit_xor (deref self) (deref other))) ;;
    tt.
  
  Definition conditional_swap (a : ref Self) (b : ref Self) (choice : Choice) :=
    let mask := neg (unwrap_u8 choice) in
    let t := bit_and mask (bit_xor (deref a) (deref b)) in
    assign deref a := bit_xor (deref a) t ;;
    assign deref b := bit_xor (deref b) t ;;
    tt.
End Implu16.
(* End impl [u16] *)

(* Impl [i16] of trait [ConditionallySelectable]*)
Module Impli16.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    let mask := neg (unwrap_u8 choice) in
    bit_xor a (bit_and mask (bit_xor a b)).
  
  Definition
    conditional_assign
    (self : ref Self)
    (other : ref Self)
    (choice : Choice)
    :=
    let mask := neg (unwrap_u8 choice) in
    assign deref self := bit_xor
      (deref self)
      (bit_and mask (bit_xor (deref self) (deref other))) ;;
    tt.
  
  Definition conditional_swap (a : ref Self) (b : ref Self) (choice : Choice) :=
    let mask := neg (unwrap_u8 choice) in
    let t := bit_and mask (bit_xor (deref a) (deref b)) in
    assign deref a := bit_xor (deref a) t ;;
    assign deref b := bit_xor (deref b) t ;;
    tt.
End Impli16.
(* End impl [i16] *)

(* Impl [u32] of trait [ConditionallySelectable]*)
Module Implu32.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    let mask := neg (unwrap_u8 choice) in
    bit_xor a (bit_and mask (bit_xor a b)).
  
  Definition
    conditional_assign
    (self : ref Self)
    (other : ref Self)
    (choice : Choice)
    :=
    let mask := neg (unwrap_u8 choice) in
    assign deref self := bit_xor
      (deref self)
      (bit_and mask (bit_xor (deref self) (deref other))) ;;
    tt.
  
  Definition conditional_swap (a : ref Self) (b : ref Self) (choice : Choice) :=
    let mask := neg (unwrap_u8 choice) in
    let t := bit_and mask (bit_xor (deref a) (deref b)) in
    assign deref a := bit_xor (deref a) t ;;
    assign deref b := bit_xor (deref b) t ;;
    tt.
End Implu32.
(* End impl [u32] *)

(* Impl [i32] of trait [ConditionallySelectable]*)
Module Impli32.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    let mask := neg (unwrap_u8 choice) in
    bit_xor a (bit_and mask (bit_xor a b)).
  
  Definition
    conditional_assign
    (self : ref Self)
    (other : ref Self)
    (choice : Choice)
    :=
    let mask := neg (unwrap_u8 choice) in
    assign deref self := bit_xor
      (deref self)
      (bit_and mask (bit_xor (deref self) (deref other))) ;;
    tt.
  
  Definition conditional_swap (a : ref Self) (b : ref Self) (choice : Choice) :=
    let mask := neg (unwrap_u8 choice) in
    let t := bit_and mask (bit_xor (deref a) (deref b)) in
    assign deref a := bit_xor (deref a) t ;;
    assign deref b := bit_xor (deref b) t ;;
    tt.
End Impli32.
(* End impl [i32] *)

(* Impl [u64] of trait [ConditionallySelectable]*)
Module Implu64.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    let mask := neg (unwrap_u8 choice) in
    bit_xor a (bit_and mask (bit_xor a b)).
  
  Definition
    conditional_assign
    (self : ref Self)
    (other : ref Self)
    (choice : Choice)
    :=
    let mask := neg (unwrap_u8 choice) in
    assign deref self := bit_xor
      (deref self)
      (bit_and mask (bit_xor (deref self) (deref other))) ;;
    tt.
  
  Definition conditional_swap (a : ref Self) (b : ref Self) (choice : Choice) :=
    let mask := neg (unwrap_u8 choice) in
    let t := bit_and mask (bit_xor (deref a) (deref b)) in
    assign deref a := bit_xor (deref a) t ;;
    assign deref b := bit_xor (deref b) t ;;
    tt.
End Implu64.
(* End impl [u64] *)

(* Impl [i64] of trait [ConditionallySelectable]*)
Module Impli64.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    let mask := neg (unwrap_u8 choice) in
    bit_xor a (bit_and mask (bit_xor a b)).
  
  Definition
    conditional_assign
    (self : ref Self)
    (other : ref Self)
    (choice : Choice)
    :=
    let mask := neg (unwrap_u8 choice) in
    assign deref self := bit_xor
      (deref self)
      (bit_and mask (bit_xor (deref self) (deref other))) ;;
    tt.
  
  Definition conditional_swap (a : ref Self) (b : ref Self) (choice : Choice) :=
    let mask := neg (unwrap_u8 choice) in
    let t := bit_and mask (bit_xor (deref a) (deref b)) in
    assign deref a := bit_xor (deref a) t ;;
    assign deref b := bit_xor (deref b) t ;;
    tt.
End Impli64.
(* End impl [i64] *)

(* Impl [Choice] of trait [ConditionallySelectable]*)
Module ImplChoice.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    Choice (Implu8.conditional_select a.0 b.0 choice).
End ImplChoice.
(* End impl [Choice] *)

Class ConditionallyNegatable : Set := {
  conditional_negate : ref Self -> Choice -> _;
}.

(* Impl [T] of trait [ConditionallyNegatable]*)
Module ImplT.
  Definition conditional_negate (self : ref Self) (choice : Choice) :=
    let self_neg := neg self in
    conditional_assign self self_neg choice ;;
    tt.
End ImplT.
(* End impl [T] *)

Module CtOption.
  Record t : Set := {
    value : T;
    is_some : Choice;
  }.
End CtOption.
Definition CtOption : Set := CtOption.t.

(* Impl [CtOption] of trait [_crate.clone.Clone]*)
Module ImplCtOption.
  Definition clone (self : ref Self) : CtOption :=
    {|
      CtOption.value := _crate.clone.Clone.clone self.value;
      CtOption.is_some := _crate.clone.Clone.clone self.is_some;
    |}.
End ImplCtOption.
(* End impl [CtOption] *)

(* Impl [CtOption] of trait [_crate.marker.Copy]*)
Module ImplCtOption.
  
End ImplCtOption.
(* End impl [CtOption] *)

(* Impl [CtOption] of trait [_crate.fmt.Debug]*)
Module ImplCtOption.
  Definition
    fmt
    (self : ref Self)
    (f : ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate::fmt::ImplFormatter.debug_struct_field2_finish
      f
      "CtOption"
      "value"
      self.value
      "is_some"
      self.is_some.
End ImplCtOption.
(* End impl [CtOption] *)

(* Impl [Option] of trait [From]*)
Module ImplOption.
  Definition from (source : CtOption) : Option :=
    if eq (unwrap_u8 (is_some source)) 1 then
      Option.Some source.value
    else
      None.
End ImplOption.
(* End impl [Option] *)

(* Impl [CtOption] *)
Module ImplCtOption.
  Definition new (value : T) (is_some : Choice) : CtOption :=
    {| CtOption.value := value; CtOption.is_some := is_some; |}.
  
  Definition expect (self : Self) (msg : ref str) : T :=
    match (unwrap_u8 self.is_some, 1) with
    | (left_val, right_val) =>
      if not (eq (deref left_val) (deref right_val)) then
        let kind := _crate.panicking.AssertKind.Eq in
        _crate.panicking.assert_failed
          kind
          (deref left_val)
          (deref right_val)
          (_crate.option.Option.Some
            (_crate::fmt::ImplArguments.new_v1
              [""]
              [_crate::fmt::ImplArgumentV1.new_display msg])) ;;
        tt
      else
        tt
    end ;;
    self.value.
  
  Definition unwrap (self : Self) : T :=
    match (unwrap_u8 self.is_some, 1) with
    | (left_val, right_val) =>
      if not (eq (deref left_val) (deref right_val)) then
        let kind := _crate.panicking.AssertKind.Eq in
        _crate.panicking.assert_failed
          kind
          (deref left_val)
          (deref right_val)
          _crate.option.Option.None ;;
        tt
      else
        tt
    end ;;
    self.value.
  
  Definition unwrap_or (self : Self) (def : T) : T :=
    ImplT.conditional_select def self.value self.is_some.
  
  Definition unwrap_or_else (self : Self) (f : F) : T :=
    ImplT.conditional_select (f tt) self.value self.is_some.
  
  Definition is_some (self : ref Self) : Choice :=
    self.is_some.
  
  Definition is_none (self : ref Self) : Choice :=
    not self.is_some.
  
  Definition map (self : Self) (f : F) : CtOption :=
    ImplCtOption.new
      (f (ImplT.conditional_select (ImplT.default tt) self.value self.is_some))
      self.is_some.
  
  Definition and_then (self : Self) (f : F) : CtOption :=
    let tmp := f
      (ImplT.conditional_select (ImplT.default tt) self.value self.is_some) in
    assign tmp.is_some := bit_and tmp.is_some self.is_some ;;
    tmp.
  
  Definition or_else (self : Self) (f : F) : CtOption :=
    let is_none := is_none self in
    let f := f tt in
    ImplSelf.conditional_select self f is_none.
End ImplCtOption.
(* End impl [CtOption] *)

(* Impl [CtOption] of trait [ConditionallySelectable]*)
Module ImplCtOption.
  Definition
    conditional_select
    (a : ref Self)
    (b : ref Self)
    (choice : Choice)
    : Self :=
    ImplCtOption.new
      (ImplT.conditional_select a.value b.value choice)
      (ImplChoice.conditional_select a.is_some b.is_some choice).
End ImplCtOption.
(* End impl [CtOption] *)

(* Impl [CtOption] of trait [ConstantTimeEq]*)
Module ImplCtOption.
  Definition ct_eq (self : ref Self) (rhs : ref CtOption) : Choice :=
    let a := is_some self in
    let b := is_some rhs in
    bit_or
      (bit_and (bit_and a b) (ct_eq self.value rhs.value))
      (bit_and (not a) (not b)).
End ImplCtOption.
(* End impl [CtOption] *)

Class ConstantTimeGreater : Set := {
  ct_gt : ref Self -> ref Self -> Choice;
}.

(* Impl [u8] of trait [ConstantTimeGreater]*)
Module Implu8.
  Definition ct_gt (self : ref Self) (other : ref u8) : Choice :=
    let gtb := bit_and self (not other) in
    let ltb := bit_and (not self) other in
    let pow := 1 in
    loop (if lt pow 8 then
      assign ltb := bit_or ltb (shr ltb pow) ;;
      assign pow := add pow pow ;;
      tt
    else
      Break ;;
      tt) from while ;;
    let bit := bit_and gtb (not ltb) in
    let pow := 1 in
    loop (if lt pow 8 then
      assign bit := bit_or bit (shr bit pow) ;;
      assign pow := add pow pow ;;
      tt
    else
      Break ;;
      tt) from while ;;
    ImplChoice.from (bit_and bit 1).
End Implu8.
(* End impl [u8] *)

(* Impl [u16] of trait [ConstantTimeGreater]*)
Module Implu16.
  Definition ct_gt (self : ref Self) (other : ref u16) : Choice :=
    let gtb := bit_and self (not other) in
    let ltb := bit_and (not self) other in
    let pow := 1 in
    loop (if lt pow 16 then
      assign ltb := bit_or ltb (shr ltb pow) ;;
      assign pow := add pow pow ;;
      tt
    else
      Break ;;
      tt) from while ;;
    let bit := bit_and gtb (not ltb) in
    let pow := 1 in
    loop (if lt pow 16 then
      assign bit := bit_or bit (shr bit pow) ;;
      assign pow := add pow pow ;;
      tt
    else
      Break ;;
      tt) from while ;;
    ImplChoice.from (bit_and bit 1).
End Implu16.
(* End impl [u16] *)

(* Impl [u32] of trait [ConstantTimeGreater]*)
Module Implu32.
  Definition ct_gt (self : ref Self) (other : ref u32) : Choice :=
    let gtb := bit_and self (not other) in
    let ltb := bit_and (not self) other in
    let pow := 1 in
    loop (if lt pow 32 then
      assign ltb := bit_or ltb (shr ltb pow) ;;
      assign pow := add pow pow ;;
      tt
    else
      Break ;;
      tt) from while ;;
    let bit := bit_and gtb (not ltb) in
    let pow := 1 in
    loop (if lt pow 32 then
      assign bit := bit_or bit (shr bit pow) ;;
      assign pow := add pow pow ;;
      tt
    else
      Break ;;
      tt) from while ;;
    ImplChoice.from (bit_and bit 1).
End Implu32.
(* End impl [u32] *)

(* Impl [u64] of trait [ConstantTimeGreater]*)
Module Implu64.
  Definition ct_gt (self : ref Self) (other : ref u64) : Choice :=
    let gtb := bit_and self (not other) in
    let ltb := bit_and (not self) other in
    let pow := 1 in
    loop (if lt pow 64 then
      assign ltb := bit_or ltb (shr ltb pow) ;;
      assign pow := add pow pow ;;
      tt
    else
      Break ;;
      tt) from while ;;
    let bit := bit_and gtb (not ltb) in
    let pow := 1 in
    loop (if lt pow 64 then
      assign bit := bit_or bit (shr bit pow) ;;
      assign pow := add pow pow ;;
      tt
    else
      Break ;;
      tt) from while ;;
    ImplChoice.from (bit_and bit 1).
End Implu64.
(* End impl [u64] *)

Class ConstantTimeLess : Set := {
  ct_lt : ref Self -> ref Self -> Choice;
}.

(* Impl [u8] of trait [ConstantTimeLess]*)
Module Implu8.
  
End Implu8.
(* End impl [u8] *)

(* Impl [u16] of trait [ConstantTimeLess]*)
Module Implu16.
  
End Implu16.
(* End impl [u16] *)

(* Impl [u32] of trait [ConstantTimeLess]*)
Module Implu32.
  
End Implu32.
(* End impl [u32] *)

(* Impl [u64] of trait [ConstantTimeLess]*)
Module Implu64.
  
End Implu64.
(* End impl [u64] *)