(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition create_box `{H : State.Trait} : M (H := H) unit :=
  let* _box1 := alloc.boxed.Box::["new"] 3 in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* _box2 := alloc.boxed.Box::["new"] 5 in
  let* _ :=
    let* _box3 := alloc.boxed.Box::["new"] 4 in
    Pure tt in
  let* α0 :=
    {| std.ops.Range.start := 0; std.ops.Range._end := 1000; |}.["into_iter"] in
  match α0 with
  | iter =>
    loop
      (let* _ :=
        let* α0 := (addr_of iter).["next"] in
        match α0 with
        | core.option.Option.None  => Break
        | core.option.Option.Some _ =>
          let* _ := scoping_rules_raii.create_box in
          Pure tt
        end in
      Pure tt)
  end.
