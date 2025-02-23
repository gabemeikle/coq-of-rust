(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Variables can be type annotated.
    let logical: bool = true;

    let a_float: f64 = 1.0;  // Regular annotation
    let an_integer   = 5i32; // Suffix annotation

    // Or a default will be used.
    let default_float   = 3.0; // `f64`
    let default_integer = 7;   // `i32`
    
    // A type can also be inferred from context 
    let mut inferred_type = 12; // Type i64 is inferred from another line
    inferred_type = 4294967296i64;
    
    // A mutable variable's value can be changed.
    let mut mutable = 12; // Mutable `i32`
    mutable = 21;
    
    // Error! The type of a variable can't be changed.
    // mutable = true;
    
    // Variables can be overwritten with shadowing.
    let mutable = true;
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* logical := M.alloc (Value.Bool true) in
    let* a_float := M.copy UnsupportedLiteral in
    let* an_integer := M.alloc (Value.Integer Integer.I32 5) in
    let* default_float := M.copy UnsupportedLiteral in
    let* default_integer := M.alloc (Value.Integer Integer.I32 7) in
    let* inferred_type := M.alloc (Value.Integer Integer.I64 12) in
    let* _ := M.assign inferred_type (Value.Integer Integer.I64 4294967296) in
    let* mutable := M.alloc (Value.Integer Integer.I32 12) in
    let* _ := M.assign mutable (Value.Integer Integer.I32 21) in
    let* mutable := M.alloc (Value.Bool true) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
