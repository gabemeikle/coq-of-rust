(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Sheep";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "Cow";
    ty_params := [];
  } *)

(* Trait *)
Module Animal.
  
End Animal.

Module Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.
  Definition Self : Ty.t := Ty.path "returning_traits_with_dyn::Sheep".
  
  (*
      fn noise(&self) -> &'static str {
          "baaaaah!"
      }
  *)
  Definition noise (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.read (mk_str "baaaaah!")
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "returning_traits_with_dyn::Animal"
      (* Self *) (Ty.path "returning_traits_with_dyn::Sheep")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("noise", InstanceField.Method noise) ].
End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.

Module Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.
  Definition Self : Ty.t := Ty.path "returning_traits_with_dyn::Cow".
  
  (*
      fn noise(&self) -> &'static str {
          "moooooo!"
      }
  *)
  Definition noise (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.read (mk_str "moooooo!")
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "returning_traits_with_dyn::Animal"
      (* Self *) (Ty.path "returning_traits_with_dyn::Cow")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("noise", InstanceField.Method noise) ].
End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.

(*
fn random_animal(random_number: f64) -> Box<dyn Animal> {
    if random_number < 0.5 {
        Box::new(Sheep {})
    } else {
        Box::new(Cow {})
    }
}
*)
Definition random_animal (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ random_number ] =>
    let* random_number := M.alloc random_number in
    let* α0 := M.read random_number in
    let* α1 := M.read UnsupportedLiteral in
    let* α2 := M.alloc (BinOp.Pure.lt α0 α1) in
    let* α3 := M.read (M.use α2) in
    let* α4 :=
      if Value.is_true α3 then
        let* α0 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "alloc::boxed::Box")
              [
                Ty.path "returning_traits_with_dyn::Sheep";
                Ty.path "alloc::alloc::Global"
              ])
            "new"
            [] in
        let* α1 :=
          M.call_closure
            α0
            [ Value.StructTuple "returning_traits_with_dyn::Sheep" [] ] in
        M.alloc
          (M.pointer_coercion (* Unsize *) (M.pointer_coercion (* Unsize *) α1))
      else
        let* α0 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "alloc::boxed::Box")
              [
                Ty.path "returning_traits_with_dyn::Cow";
                Ty.path "alloc::alloc::Global"
              ])
            "new"
            [] in
        let* α1 :=
          M.call_closure
            α0
            [ Value.StructTuple "returning_traits_with_dyn::Cow" [] ] in
        M.alloc (M.pointer_coercion (* Unsize *) α1) in
    let* α5 := M.read α4 in
    M.pure
      (M.pointer_coercion (* Unsize *) (M.pointer_coercion (* Unsize *) α5))
  | _, _ => M.impossible
  end.

(*
fn main() {
    let random_number = 0.234;
    let animal = random_animal(random_number);
    println!(
        "You've randomly chosen an animal, and it says {}",
        animal.noise()
    );
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* random_number := M.copy UnsupportedLiteral in
    let* animal :=
      let* α0 := M.get_function "returning_traits_with_dyn::random_animal" [] in
      let* α1 := M.read random_number in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 :=
          M.read (mk_str "You've randomly chosen an animal, and it says ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α6 :=
          M.get_trait_method
            "returning_traits_with_dyn::Animal"
            (Ty.dyn [ ("returning_traits_with_dyn::Animal::Trait", []) ])
            []
            "noise"
            [] in
        let* α7 := M.read animal in
        let* α8 := M.call_closure α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
