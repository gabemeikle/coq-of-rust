(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.

Parameter read_lines : forall
    {P : Set},
    `{core.convert.AsRef.Trait std.path.Path P}
    P
    ->
      M
        (std.io.error.Result
          (std.io.Lines (std.io.buffered.bufreader.BufReader std.fs.File))).
