(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : unit :=
  let counter := 0 in
  let result :=
    loop
      counter.["add_assign"] 1 ;;
      if (counter.["eq"] 10 : bool) then
        Break ;;
        tt
      else
        tt
      from
      loop in
  match (result, 20) with
  | (left_val, right_val) =>
    if ((left_val.["deref"].["eq"] right_val.["deref"]).["not"] : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        left_val.["deref"]
        right_val.["deref"]
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  tt.
