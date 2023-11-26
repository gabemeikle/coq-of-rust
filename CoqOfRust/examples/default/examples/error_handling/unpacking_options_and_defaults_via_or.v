(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Fruit.
  Inductive t : Set :=
  | Apple
  | Orange
  | Banana
  | Kiwi
  | Lemon.
End Fruit.

Module  Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit_t.
Section Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit_t.
  Ltac Self := exact unpacking_options_and_defaults_via_or.Fruit.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : ref unpacking_options_and_defaults_via_or.Fruit.t :=
        M.read self in
      let* α2 : M.Val (ref str.t) :=
        match α1 with
        | unpacking_options_and_defaults_via_or.Fruit.Apple  =>
          let* α0 : ref str.t := M.read (mk_str "Apple") in
          M.alloc α0
        | unpacking_options_and_defaults_via_or.Fruit.Orange  =>
          let* α0 : ref str.t := M.read (mk_str "Orange") in
          M.alloc α0
        | unpacking_options_and_defaults_via_or.Fruit.Banana  =>
          let* α0 : ref str.t := M.read (mk_str "Banana") in
          M.alloc α0
        | unpacking_options_and_defaults_via_or.Fruit.Kiwi  =>
          let* α0 : ref str.t := M.read (mk_str "Kiwi") in
          M.alloc α0
        | unpacking_options_and_defaults_via_or.Fruit.Lemon  =>
          let* α0 : ref str.t := M.read (mk_str "Lemon") in
          M.alloc α0
        end in
      let* α3 : ref str.t := M.read α2 in
      core.fmt.Formatter.t::["write_str"] α0 α3).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit_t.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit_t.

(*
fn main() {
    let apple = Some(Fruit::Apple);
    let orange = Some(Fruit::Orange);
    let no_fruit: Option<Fruit> = None;

    let first_available_fruit = no_fruit.or(orange).or(apple);
    println!("first_available_fruit: {:?}", first_available_fruit);
    // first_available_fruit: Some(Orange)

    // `or` moves its argument.
    // In the example above, `or(orange)` returned a `Some`, so `or(apple)` was not invoked.
    // But the variable named `apple` has been moved regardless, and cannot be used anymore.
    // println!("Variable apple was moved, so this line won't compile: {:?}", apple);
    // TODO: uncomment the line above to see the compiler error
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* apple :
        M.Val
          (core.option.Option.t
            unpacking_options_and_defaults_via_or.Fruit.t) :=
      M.alloc
        (core.option.Option.Some
          unpacking_options_and_defaults_via_or.Fruit.Apple) in
    let* orange :
        M.Val
          (core.option.Option.t
            unpacking_options_and_defaults_via_or.Fruit.t) :=
      M.alloc
        (core.option.Option.Some
          unpacking_options_and_defaults_via_or.Fruit.Orange) in
    let* no_fruit :
        M.Val
          (core.option.Option.t
            unpacking_options_and_defaults_via_or.Fruit.t) :=
      M.alloc core.option.Option.None in
    let* first_available_fruit :
        M.Val
          (core.option.Option.t
            unpacking_options_and_defaults_via_or.Fruit.t) :=
      let* α0 :
          core.option.Option.t unpacking_options_and_defaults_via_or.Fruit.t :=
        M.read no_fruit in
      let* α1 :
          core.option.Option.t unpacking_options_and_defaults_via_or.Fruit.t :=
        M.read orange in
      let* α2 :
          core.option.Option.t unpacking_options_and_defaults_via_or.Fruit.t :=
        (core.option.Option.t
              unpacking_options_and_defaults_via_or.Fruit.t)::["or"]
          α0
          α1 in
      let* α3 :
          core.option.Option.t unpacking_options_and_defaults_via_or.Fruit.t :=
        M.read apple in
      let* α4 :
          core.option.Option.t unpacking_options_and_defaults_via_or.Fruit.t :=
        (core.option.Option.t
              unpacking_options_and_defaults_via_or.Fruit.t)::["or"]
          α2
          α3 in
      M.alloc α4 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "first_available_fruit: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 :
            ref
              (core.option.Option.t
                unpacking_options_and_defaults_via_or.Fruit.t) :=
          borrow first_available_fruit in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
        let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
        let* α13 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α12 in
        let* α14 : unit := std.io.stdio._print α13 in
        M.alloc α14 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
