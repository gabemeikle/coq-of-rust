(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn function() {
    println!("called `function()`");
}
*)
Definition function (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "called `function()`
") in
        let* α1 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0 ] in
        let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
              (pointer_coercion "Unsize" (borrow α1))) in
        let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
        M.alloc α3 in
      M.alloc tt in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

Module deeply.
  Module nested.
    (*
            pub fn function() {
                println!("called `deeply::nested::function()`");
            }
    *)
    Definition function (𝜏 : list Ty.t) (α : list Value.t) : M :=
      match 𝜏, α with
      | [], [] =>
        let* _ : Ty.tuple :=
          let* _ : Ty.tuple :=
            let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
              M.read (mk_str "called `deeply::nested::function()`
") in
            let* α1 :
                Ty.apply
                  (Ty.path "array")
                  [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
              M.alloc [ α0 ] in
            let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
              M.call
                ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
                  (pointer_coercion "Unsize" (borrow α1))) in
            let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
            M.alloc α3 in
          M.alloc tt in
        let* α0 : Ty.path "unit" := M.alloc tt in
        M.read α0
      | _, _ => M.impossible
      end.
  End nested.
End deeply.

(*
fn main() {
    // Easier access to `deeply::nested::function`
    other_function();

    println!("Entering block");
    {
        // This is equivalent to `use deeply::nested::function as function`.
        // This `function()` will shadow the outer one.
        use crate::deeply::nested::function;

        // `use` bindings have a local scope. In this case, the
        // shadowing of `function()` is only in this block.
        function();

        println!("Leaving block");
    }

    function();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ : Ty.tuple :=
      let* α0 : Ty.tuple :=
        M.call the_use_as_declaration.deeply.nested.function in
      M.alloc α0 in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "Entering block
") in
        let* α1 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0 ] in
        let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
              (pointer_coercion "Unsize" (borrow α1))) in
        let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
        M.alloc α3 in
      M.alloc tt in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.tuple :=
          M.call the_use_as_declaration.deeply.nested.function in
        M.alloc α0 in
      let* _ : Ty.tuple :=
        let* _ : Ty.tuple :=
          let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
            M.read (mk_str "Leaving block
") in
          let* α1 :
              Ty.apply
                (Ty.path "array")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
            M.alloc [ α0 ] in
          let* α2 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
            M.call
              ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_const"]
                (pointer_coercion "Unsize" (borrow α1))) in
          let* α3 : Ty.tuple := M.call (std.io.stdio._print α2) in
          M.alloc α3 in
        M.alloc tt in
      M.alloc tt in
    let* _ : Ty.tuple :=
      let* α0 : Ty.tuple := M.call the_use_as_declaration.function in
      M.alloc α0 in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
