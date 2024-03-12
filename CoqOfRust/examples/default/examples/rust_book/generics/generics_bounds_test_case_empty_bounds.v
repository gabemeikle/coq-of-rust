(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Cardinal";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "BlueJay";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "Turkey";
    ty_params := [];
  } *)

(* Trait *)
Module Red.
  
End Red.

(* Trait *)
Module Blue.
  
End Blue.

Module Impl_generics_bounds_test_case_empty_bounds_Red_for_generics_bounds_test_case_empty_bounds_Cardinal.
  Definition Self : Ty.t :=
    Ty.path "generics_bounds_test_case_empty_bounds::Cardinal".
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_bounds_test_case_empty_bounds::Red"
      (* Self *) (Ty.path "generics_bounds_test_case_empty_bounds::Cardinal")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_generics_bounds_test_case_empty_bounds_Red_for_generics_bounds_test_case_empty_bounds_Cardinal.

Module Impl_generics_bounds_test_case_empty_bounds_Blue_for_generics_bounds_test_case_empty_bounds_BlueJay.
  Definition Self : Ty.t :=
    Ty.path "generics_bounds_test_case_empty_bounds::BlueJay".
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_bounds_test_case_empty_bounds::Blue"
      (* Self *) (Ty.path "generics_bounds_test_case_empty_bounds::BlueJay")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_generics_bounds_test_case_empty_bounds_Blue_for_generics_bounds_test_case_empty_bounds_BlueJay.

(*
fn red<T: Red>(_: &T) -> &'static str {
    "red"
}
*)
Definition red (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ T ], [ arg ] =>
    let* arg := M.alloc arg in
    M.read (mk_str "red")
  | _, _ => M.impossible
  end.

(*
fn blue<T: Blue>(_: &T) -> &'static str {
    "blue"
}
*)
Definition blue (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ T ], [ arg ] =>
    let* arg := M.alloc arg in
    M.read (mk_str "blue")
  | _, _ => M.impossible
  end.

(*
fn main() {
    let cardinal = Cardinal;
    let blue_jay = BlueJay;
    let _turkey = Turkey;

    // `red()` won't work on a blue jay nor vice versa
    // because of the bounds.
    println!("A cardinal is {}", red(&cardinal));
    println!("A blue jay is {}", blue(&blue_jay));
    //println!("A turkey is {}", red(&_turkey));
    // ^ TODO: Try uncommenting this line.
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* cardinal :=
      M.alloc
        (Value.StructTuple
          "generics_bounds_test_case_empty_bounds::Cardinal"
          []) in
    let* blue_jay :=
      M.alloc
        (Value.StructTuple
          "generics_bounds_test_case_empty_bounds::BlueJay"
          []) in
    let* _turkey :=
      M.alloc
        (Value.StructTuple
          "generics_bounds_test_case_empty_bounds::Turkey"
          []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "A cardinal is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_function
            "generics_bounds_test_case_empty_bounds::red"
            [ Ty.path "generics_bounds_test_case_empty_bounds::Cardinal" ] in
        let* α7 := M.call α6 [ cardinal ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "A blue jay is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_function
            "generics_bounds_test_case_empty_bounds::blue"
            [ Ty.path "generics_bounds_test_case_empty_bounds::BlueJay" ] in
        let* α7 := M.call α6 [ blue_jay ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
