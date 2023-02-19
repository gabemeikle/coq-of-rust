(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Choice.
  Inductive t : Set := Build (_ : u8).
  
  Global Instance Get_0 : IndexedField.Class t 0 u8 := {|
    IndexedField.get '(Build x0) := x0;
  |}.
End Choice.
Definition Choice := Choice.t.

Module Impl__crate_marker_Copy_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : _crate.marker.Copy.Class Self :=
      _crate.marker.Copy.Build_Class _.
Module ImplChoice.

Module Impl__crate_clone_Clone_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : _crate.clone.Clone.Class Self := {|
    _crate.clone.Clone.clone (self : ref Choice) :=
      let _ := tt in
      deref self;
  |}.
Module ImplChoice.

Module Impl__crate_fmt_Debug_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : _crate.fmt.Debug.Class Self := {|
    _crate.fmt.Debug.fmt
        (self : ref Choice)
        (f : mut_ref _crate.fmt.Formatter) :=
      _crate::fmt::ImplFormatter.debug_tuple_field1_finish
        f
        "Choice"
        (IndexedField.get (index := 0) self);
  |}.
Module ImplChoice.

(* Impl [Choice] *)
Module ImplChoice.
  Definition unwrap_u8 (self : ref Choice) : u8 :=
    IndexedField.get (index := 0) self.
End ImplChoice.
(* End impl [Choice] *)

Module Impl_From_for_bool.
  Definition Self := bool.
  
  Global Instance I : From.Class Self := {|
    From.from (source : Choice) :=
      if true then
        if
          not
            (bit_or
              (eq (IndexedField.get (index := 0) source) 0)
              (eq (IndexedField.get (index := 0) source) 1))
        then
          _crate.panicking.panic
            "assertion failed: (source.0 == 0u8) | (source.0 == 1u8)"
        else
          tt ;;
        tt
      else
        tt ;;
      ne (IndexedField.get (index := 0) source) 0;
  |}.
Module Implbool.

Module Impl_BitAnd_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : BitAnd.Class Self := {|
    BitAnd.Output := Choice;
    BitAnd.bitand (self : Choice) (rhs : Choice) :=
      into
        (bit_and
          (IndexedField.get (index := 0) self)
          (IndexedField.get (index := 0) rhs));
  |}.
Module ImplChoice.

Module Impl_BitAndAssign_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : BitAndAssign.Class Self := {|
    BitAndAssign.bitand_assign (self : mut_ref Choice) (rhs : Choice) :=
      assign deref self := bit_and (deref self) rhs ;;
      tt;
  |}.
Module ImplChoice.

Module Impl_BitOr_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : BitOr.Class Self := {|
    BitOr.Output := Choice;
    BitOr.bitor (self : Choice) (rhs : Choice) :=
      into
        (bit_or
          (IndexedField.get (index := 0) self)
          (IndexedField.get (index := 0) rhs));
  |}.
Module ImplChoice.

Module Impl_BitOrAssign_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : BitOrAssign.Class Self := {|
    BitOrAssign.bitor_assign (self : mut_ref Choice) (rhs : Choice) :=
      assign deref self := bit_or (deref self) rhs ;;
      tt;
  |}.
Module ImplChoice.

Module Impl_BitXor_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : BitXor.Class Self := {|
    BitXor.Output := Choice;
    BitXor.bitxor (self : Choice) (rhs : Choice) :=
      into
        (bit_xor
          (IndexedField.get (index := 0) self)
          (IndexedField.get (index := 0) rhs));
  |}.
Module ImplChoice.

Module Impl_BitXorAssign_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : BitXorAssign.Class Self := {|
    BitXorAssign.bitxor_assign (self : mut_ref Choice) (rhs : Choice) :=
      assign deref self := bit_xor (deref self) rhs ;;
      tt;
  |}.
Module ImplChoice.

Module Impl_Not_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : Not.Class Self := {|
    Not.Output := Choice;
    Not.not (self : Choice) :=
      into (bit_and 1 (not (IndexedField.get (index := 0) self)));
  |}.
Module ImplChoice.

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

Module Impl_From_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : From.Class Self := {|
    From.from (input : u8) := Choice (black_box input);
  |}.
Module ImplChoice.

Module ConstantTimeEq.
  Class Class (Self : Set) : Set := {
    ct_eq : ref Self -> ref Self -> Choice;
    ct_ne : ref Self -> ref Self -> Choice;
  }.
End ConstantTimeEq.

Module Impl_ConstantTimeEq_for_Slice.
  Definition Self := Slice.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref [T]) (_rhs : ref Slice) :=
      let len := len self in
      if ne len (len _rhs) then
        Return (ImplChoice.from 0) ;;
        tt
      else
        tt ;;
      let x := 1 in
      match into_iter (zip (iter self) (iter _rhs)) with
      | iter =>
        loop
          match next iter with
          | {|  |} => Break
          | {| Some.0 := (ai, bi); |} =>
            assign x := bit_and x (unwrap_u8 (ct_eq ai bi)) ;;
            tt
          end ;;
          tt
          from
          for
      end ;;
      into x;
  |}.
Module ImplSlice.

Module Impl_ConstantTimeEq_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref Choice) (rhs : ref Choice) :=
      not (bit_xor (deref self) (deref rhs));
  |}.
Module ImplChoice.

Module Impl_ConstantTimeEq_for_u8.
  Definition Self := u8.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref u8) (other : ref u8) :=
      let x := bit_xor self other in
      let y := shr (bit_or x (wrapping_neg x)) (sub 8 1) in
      into (bit_xor y 1);
  |}.
Module Implu8.

Module Impl_ConstantTimeEq_for_i8.
  Definition Self := i8.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref i8) (other : ref i8) :=
      ct_eq (deref self) (deref other);
  |}.
Module Impli8.

Module Impl_ConstantTimeEq_for_u16.
  Definition Self := u16.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref u16) (other : ref u16) :=
      let x := bit_xor self other in
      let y := shr (bit_or x (wrapping_neg x)) (sub 16 1) in
      into (bit_xor y 1);
  |}.
Module Implu16.

Module Impl_ConstantTimeEq_for_i16.
  Definition Self := i16.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref i16) (other : ref i16) :=
      ct_eq (deref self) (deref other);
  |}.
Module Impli16.

Module Impl_ConstantTimeEq_for_u32.
  Definition Self := u32.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref u32) (other : ref u32) :=
      let x := bit_xor self other in
      let y := shr (bit_or x (wrapping_neg x)) (sub 32 1) in
      into (bit_xor y 1);
  |}.
Module Implu32.

Module Impl_ConstantTimeEq_for_i32.
  Definition Self := i32.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref i32) (other : ref i32) :=
      ct_eq (deref self) (deref other);
  |}.
Module Impli32.

Module Impl_ConstantTimeEq_for_u64.
  Definition Self := u64.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref u64) (other : ref u64) :=
      let x := bit_xor self other in
      let y := shr (bit_or x (wrapping_neg x)) (sub 64 1) in
      into (bit_xor y 1);
  |}.
Module Implu64.

Module Impl_ConstantTimeEq_for_i64.
  Definition Self := i64.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref i64) (other : ref i64) :=
      ct_eq (deref self) (deref other);
  |}.
Module Impli64.

Module Impl_ConstantTimeEq_for_usize.
  Definition Self := usize.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref usize) (other : ref usize) :=
      let x := bit_xor self other in
      let y :=
        shr
          (bit_or x (wrapping_neg x))
          (sub (mul ({{root}}.core.mem.size_of tt) 8) 1) in
      into (bit_xor y 1);
  |}.
Module Implusize.

Module Impl_ConstantTimeEq_for_isize.
  Definition Self := isize.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref isize) (other : ref isize) :=
      ct_eq (deref self) (deref other);
  |}.
Module Implisize.

Module ConditionallySelectable.
  Class Class (Self : Set) : Set := {
    conditional_select : ref Self -> ref Self -> Choice -> Self;
    conditional_assign : mut_ref Self -> ref Self -> Choice -> _;
    conditional_swap : mut_ref Self -> mut_ref Self -> Choice -> _;
  }.
End ConditionallySelectable.

Module Impl_ConditionallySelectable_for_u8.
  Definition Self := u8.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref u8)
        (b : ref u8)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      bit_xor a (bit_and mask (bit_xor a b));
    ConditionallySelectable.conditional_assign
        (self : mut_ref u8)
        (other : ref u8)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      assign
        deref self
        :=
        bit_xor
          (deref self)
          (bit_and mask (bit_xor (deref self) (deref other))) ;;
      tt;
    ConditionallySelectable.conditional_swap
        (a : mut_ref u8)
        (b : mut_ref u8)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      let t := bit_and mask (bit_xor (deref a) (deref b)) in
      assign deref a := bit_xor (deref a) t ;;
      assign deref b := bit_xor (deref b) t ;;
      tt;
  |}.
Module Implu8.

Module Impl_ConditionallySelectable_for_i8.
  Definition Self := i8.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref i8)
        (b : ref i8)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      bit_xor a (bit_and mask (bit_xor a b));
    ConditionallySelectable.conditional_assign
        (self : mut_ref i8)
        (other : ref i8)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      assign
        deref self
        :=
        bit_xor
          (deref self)
          (bit_and mask (bit_xor (deref self) (deref other))) ;;
      tt;
    ConditionallySelectable.conditional_swap
        (a : mut_ref i8)
        (b : mut_ref i8)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      let t := bit_and mask (bit_xor (deref a) (deref b)) in
      assign deref a := bit_xor (deref a) t ;;
      assign deref b := bit_xor (deref b) t ;;
      tt;
  |}.
Module Impli8.

Module Impl_ConditionallySelectable_for_u16.
  Definition Self := u16.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref u16)
        (b : ref u16)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      bit_xor a (bit_and mask (bit_xor a b));
    ConditionallySelectable.conditional_assign
        (self : mut_ref u16)
        (other : ref u16)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      assign
        deref self
        :=
        bit_xor
          (deref self)
          (bit_and mask (bit_xor (deref self) (deref other))) ;;
      tt;
    ConditionallySelectable.conditional_swap
        (a : mut_ref u16)
        (b : mut_ref u16)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      let t := bit_and mask (bit_xor (deref a) (deref b)) in
      assign deref a := bit_xor (deref a) t ;;
      assign deref b := bit_xor (deref b) t ;;
      tt;
  |}.
Module Implu16.

Module Impl_ConditionallySelectable_for_i16.
  Definition Self := i16.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref i16)
        (b : ref i16)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      bit_xor a (bit_and mask (bit_xor a b));
    ConditionallySelectable.conditional_assign
        (self : mut_ref i16)
        (other : ref i16)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      assign
        deref self
        :=
        bit_xor
          (deref self)
          (bit_and mask (bit_xor (deref self) (deref other))) ;;
      tt;
    ConditionallySelectable.conditional_swap
        (a : mut_ref i16)
        (b : mut_ref i16)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      let t := bit_and mask (bit_xor (deref a) (deref b)) in
      assign deref a := bit_xor (deref a) t ;;
      assign deref b := bit_xor (deref b) t ;;
      tt;
  |}.
Module Impli16.

Module Impl_ConditionallySelectable_for_u32.
  Definition Self := u32.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref u32)
        (b : ref u32)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      bit_xor a (bit_and mask (bit_xor a b));
    ConditionallySelectable.conditional_assign
        (self : mut_ref u32)
        (other : ref u32)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      assign
        deref self
        :=
        bit_xor
          (deref self)
          (bit_and mask (bit_xor (deref self) (deref other))) ;;
      tt;
    ConditionallySelectable.conditional_swap
        (a : mut_ref u32)
        (b : mut_ref u32)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      let t := bit_and mask (bit_xor (deref a) (deref b)) in
      assign deref a := bit_xor (deref a) t ;;
      assign deref b := bit_xor (deref b) t ;;
      tt;
  |}.
Module Implu32.

Module Impl_ConditionallySelectable_for_i32.
  Definition Self := i32.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref i32)
        (b : ref i32)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      bit_xor a (bit_and mask (bit_xor a b));
    ConditionallySelectable.conditional_assign
        (self : mut_ref i32)
        (other : ref i32)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      assign
        deref self
        :=
        bit_xor
          (deref self)
          (bit_and mask (bit_xor (deref self) (deref other))) ;;
      tt;
    ConditionallySelectable.conditional_swap
        (a : mut_ref i32)
        (b : mut_ref i32)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      let t := bit_and mask (bit_xor (deref a) (deref b)) in
      assign deref a := bit_xor (deref a) t ;;
      assign deref b := bit_xor (deref b) t ;;
      tt;
  |}.
Module Impli32.

Module Impl_ConditionallySelectable_for_u64.
  Definition Self := u64.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref u64)
        (b : ref u64)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      bit_xor a (bit_and mask (bit_xor a b));
    ConditionallySelectable.conditional_assign
        (self : mut_ref u64)
        (other : ref u64)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      assign
        deref self
        :=
        bit_xor
          (deref self)
          (bit_and mask (bit_xor (deref self) (deref other))) ;;
      tt;
    ConditionallySelectable.conditional_swap
        (a : mut_ref u64)
        (b : mut_ref u64)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      let t := bit_and mask (bit_xor (deref a) (deref b)) in
      assign deref a := bit_xor (deref a) t ;;
      assign deref b := bit_xor (deref b) t ;;
      tt;
  |}.
Module Implu64.

Module Impl_ConditionallySelectable_for_i64.
  Definition Self := i64.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref i64)
        (b : ref i64)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      bit_xor a (bit_and mask (bit_xor a b));
    ConditionallySelectable.conditional_assign
        (self : mut_ref i64)
        (other : ref i64)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      assign
        deref self
        :=
        bit_xor
          (deref self)
          (bit_and mask (bit_xor (deref self) (deref other))) ;;
      tt;
    ConditionallySelectable.conditional_swap
        (a : mut_ref i64)
        (b : mut_ref i64)
        (choice : Choice) :=
      let mask := neg (unwrap_u8 choice) in
      let t := bit_and mask (bit_xor (deref a) (deref b)) in
      assign deref a := bit_xor (deref a) t ;;
      assign deref b := bit_xor (deref b) t ;;
      tt;
  |}.
Module Impli64.

Module Impl_ConditionallySelectable_for_Choice.
  Definition Self := Choice.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref Choice)
        (b : ref Choice)
        (choice : Choice) :=
      Choice
        (Implu8.conditional_select
          (IndexedField.get (index := 0) a)
          (IndexedField.get (index := 0) b)
          choice);
  |}.
Module ImplChoice.

Module ConditionallyNegatable.
  Class Class (Self : Set) : Set := {
    conditional_negate : mut_ref Self -> Choice -> _;
  }.
End ConditionallyNegatable.

Module Impl_ConditionallyNegatable_for_T.
  Definition Self := T.
  
  Global Instance I : ConditionallyNegatable.Class Self := {|
    ConditionallyNegatable.conditional_negate
        (self : mut_ref T)
        (choice : Choice) :=
      let self_neg := neg self in
      conditional_assign self self_neg choice ;;
      tt;
  |}.
Module ImplT.

Module CtOption.
  Record t : Set := {
    value : T;
    is_some : Choice;
  }.
End CtOption.
Definition CtOption : Set := CtOption.t.

Module Impl__crate_clone_Clone_for_CtOption.
  Definition Self := CtOption.
  
  Global Instance I : _crate.clone.Clone.Class Self := {|
    _crate.clone.Clone.clone (self : ref CtOption<T>) :=
      {|
        CtOption.value := _crate.clone.Clone.clone self.value;
        CtOption.is_some := _crate.clone.Clone.clone self.is_some;
      |};
  |}.
Module ImplCtOption.

Module Impl__crate_marker_Copy_for_CtOption.
  Definition Self := CtOption.
  
  Global Instance I : _crate.marker.Copy.Class Self :=
      _crate.marker.Copy.Build_Class _.
Module ImplCtOption.

Module Impl__crate_fmt_Debug_for_CtOption.
  Definition Self := CtOption.
  
  Global Instance I : _crate.fmt.Debug.Class Self := {|
    _crate.fmt.Debug.fmt
        (self : ref CtOption<T>)
        (f : mut_ref _crate.fmt.Formatter) :=
      _crate::fmt::ImplFormatter.debug_struct_field2_finish
        f
        "CtOption"
        "value"
        self.value
        "is_some"
        self.is_some;
  |}.
Module ImplCtOption.

Module Impl_From_for_Option.
  Definition Self := Option.
  
  Global Instance I : From.Class Self := {|
    From.from (source : CtOption) :=
      if eq (unwrap_u8 (is_some source)) 1 then
        Option.Some source.value
      else
        None;
  |}.
Module ImplOption.

(* Impl [CtOption] *)
Module ImplCtOption.
  Definition new (value : T) (is_some : Choice) : CtOption :=
    {| CtOption.value := value; CtOption.is_some := is_some; |}.
  
  Definition expect (self : CtOption<T>) (msg : ref str) : T :=
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
  
  Definition unwrap (self : CtOption<T>) : T :=
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
  
  Definition unwrap_or (self : CtOption<T>) (def : T) : T :=
    ImplT.conditional_select def self.value self.is_some.
  
  Definition unwrap_or_else (self : CtOption<T>) (f : F) : T :=
    ImplT.conditional_select (f tt) self.value self.is_some.
  
  Definition is_some (self : ref CtOption<T>) : Choice := self.is_some.
  
  Definition is_none (self : ref CtOption<T>) : Choice := not self.is_some.
  
  Definition map (self : CtOption<T>) (f : F) : CtOption :=
    ImplCtOption.new
      (f (ImplT.conditional_select (ImplT.default tt) self.value self.is_some))
      self.is_some.
  
  Definition and_then (self : CtOption<T>) (f : F) : CtOption :=
    let tmp :=
      f (ImplT.conditional_select (ImplT.default tt) self.value self.is_some) in
    assign tmp.is_some := bit_and tmp.is_some self.is_some ;;
    tmp.
  
  Definition or_else (self : CtOption<T>) (f : F) : CtOption :=
    let is_none := is_none self in
    let f := f tt in
    ImplSelf.conditional_select self f is_none.
End ImplCtOption.
(* End impl [CtOption] *)

Module Impl_ConditionallySelectable_for_CtOption.
  Definition Self := CtOption.
  
  Global Instance I : ConditionallySelectable.Class Self := {|
    ConditionallySelectable.conditional_select
        (a : ref CtOption<T>)
        (b : ref CtOption<T>)
        (choice : Choice) :=
      ImplCtOption.new
        (ImplT.conditional_select a.value b.value choice)
        (ImplChoice.conditional_select a.is_some b.is_some choice);
  |}.
Module ImplCtOption.

Module Impl_ConstantTimeEq_for_CtOption.
  Definition Self := CtOption.
  
  Global Instance I : ConstantTimeEq.Class Self := {|
    ConstantTimeEq.ct_eq (self : ref CtOption<T>) (rhs : ref CtOption) :=
      let a := is_some self in
      let b := is_some rhs in
      bit_or
        (bit_and (bit_and a b) (ct_eq self.value rhs.value))
        (bit_and (not a) (not b));
  |}.
Module ImplCtOption.

Module ConstantTimeGreater.
  Class Class (Self : Set) : Set := {
    ct_gt : ref Self -> ref Self -> Choice;
  }.
End ConstantTimeGreater.

Module Impl_ConstantTimeGreater_for_u8.
  Definition Self := u8.
  
  Global Instance I : ConstantTimeGreater.Class Self := {|
    ConstantTimeGreater.ct_gt (self : ref u8) (other : ref u8) :=
      let gtb := bit_and self (not other) in
      let ltb := bit_and (not self) other in
      let pow := 1 in
      loop
        (if lt pow 8 then
          assign ltb := bit_or ltb (shr ltb pow) ;;
          assign pow := add pow pow ;;
          tt
        else
          Break ;;
          tt)
        from
        while ;;
      let bit := bit_and gtb (not ltb) in
      let pow := 1 in
      loop
        (if lt pow 8 then
          assign bit := bit_or bit (shr bit pow) ;;
          assign pow := add pow pow ;;
          tt
        else
          Break ;;
          tt)
        from
        while ;;
      ImplChoice.from (bit_and bit 1);
  |}.
Module Implu8.

Module Impl_ConstantTimeGreater_for_u16.
  Definition Self := u16.
  
  Global Instance I : ConstantTimeGreater.Class Self := {|
    ConstantTimeGreater.ct_gt (self : ref u16) (other : ref u16) :=
      let gtb := bit_and self (not other) in
      let ltb := bit_and (not self) other in
      let pow := 1 in
      loop
        (if lt pow 16 then
          assign ltb := bit_or ltb (shr ltb pow) ;;
          assign pow := add pow pow ;;
          tt
        else
          Break ;;
          tt)
        from
        while ;;
      let bit := bit_and gtb (not ltb) in
      let pow := 1 in
      loop
        (if lt pow 16 then
          assign bit := bit_or bit (shr bit pow) ;;
          assign pow := add pow pow ;;
          tt
        else
          Break ;;
          tt)
        from
        while ;;
      ImplChoice.from (bit_and bit 1);
  |}.
Module Implu16.

Module Impl_ConstantTimeGreater_for_u32.
  Definition Self := u32.
  
  Global Instance I : ConstantTimeGreater.Class Self := {|
    ConstantTimeGreater.ct_gt (self : ref u32) (other : ref u32) :=
      let gtb := bit_and self (not other) in
      let ltb := bit_and (not self) other in
      let pow := 1 in
      loop
        (if lt pow 32 then
          assign ltb := bit_or ltb (shr ltb pow) ;;
          assign pow := add pow pow ;;
          tt
        else
          Break ;;
          tt)
        from
        while ;;
      let bit := bit_and gtb (not ltb) in
      let pow := 1 in
      loop
        (if lt pow 32 then
          assign bit := bit_or bit (shr bit pow) ;;
          assign pow := add pow pow ;;
          tt
        else
          Break ;;
          tt)
        from
        while ;;
      ImplChoice.from (bit_and bit 1);
  |}.
Module Implu32.

Module Impl_ConstantTimeGreater_for_u64.
  Definition Self := u64.
  
  Global Instance I : ConstantTimeGreater.Class Self := {|
    ConstantTimeGreater.ct_gt (self : ref u64) (other : ref u64) :=
      let gtb := bit_and self (not other) in
      let ltb := bit_and (not self) other in
      let pow := 1 in
      loop
        (if lt pow 64 then
          assign ltb := bit_or ltb (shr ltb pow) ;;
          assign pow := add pow pow ;;
          tt
        else
          Break ;;
          tt)
        from
        while ;;
      let bit := bit_and gtb (not ltb) in
      let pow := 1 in
      loop
        (if lt pow 64 then
          assign bit := bit_or bit (shr bit pow) ;;
          assign pow := add pow pow ;;
          tt
        else
          Break ;;
          tt)
        from
        while ;;
      ImplChoice.from (bit_and bit 1);
  |}.
Module Implu64.

Module ConstantTimeLess.
  Class Class (Self : Set) : Set := {
    ct_lt : ref Self -> ref Self -> Choice;
  }.
End ConstantTimeLess.

Module Impl_ConstantTimeLess_for_u8.
  Definition Self := u8.
  
  Global Instance I : ConstantTimeLess.Class Self :=
      ConstantTimeLess.Build_Class _.
Module Implu8.

Module Impl_ConstantTimeLess_for_u16.
  Definition Self := u16.
  
  Global Instance I : ConstantTimeLess.Class Self :=
      ConstantTimeLess.Build_Class _.
Module Implu16.

Module Impl_ConstantTimeLess_for_u32.
  Definition Self := u32.
  
  Global Instance I : ConstantTimeLess.Class Self :=
      ConstantTimeLess.Build_Class _.
Module Implu32.

Module Impl_ConstantTimeLess_for_u64.
  Definition Self := u64.
  
  Global Instance I : ConstantTimeLess.Class Self :=
      ConstantTimeLess.Build_Class _.
Module Implu64.
