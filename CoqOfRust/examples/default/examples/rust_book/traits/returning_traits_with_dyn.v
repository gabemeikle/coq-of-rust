(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Sheep *)

(* Struct Cow *)

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
    | [], [self] =>
      let* self := M.alloc self in
      M.read (mk_str "baaaaah!")
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("noise", InstanceField.Method noise)].
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
    | [], [self] =>
      let* self := M.alloc self in
      M.read (mk_str "moooooo!")
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("noise", InstanceField.Method noise)].
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
  | [], [random_number] =>
    let* random_number := M.alloc random_number in
    let* α0 := M.read random_number in
    let* α1 := M.read (UnsupportedLiteral : Ty.path "f64") in
    let* α2 := M.alloc ((M.var "BinOp::Pure::lt") α0 α1) in
    let* α3 := M.read (use α2) in
    let* α4 :=
      if α3 then
        let* α0 :=
          M.call
            ((Ty.apply
                  (Ty.path "alloc::boxed::Box")
                  [Ty.path "returning_traits_with_dyn::Sheep";
                    Ty.path "alloc::alloc::Global"])::["new"]
              returning_traits_with_dyn.Sheep.Build) in
        M.alloc (pointer_coercion "Unsize" (pointer_coercion "Unsize" α0))
      else
        let* α0 :=
          M.call
            ((Ty.apply
                  (Ty.path "alloc::boxed::Box")
                  [Ty.path "returning_traits_with_dyn::Cow";
                    Ty.path "alloc::alloc::Global"])::["new"]
              returning_traits_with_dyn.Cow.Build) in
        M.alloc (pointer_coercion "Unsize" α0) in
    let* α5 := M.read α4 in
    M.pure (pointer_coercion "Unsize" (pointer_coercion "Unsize" α5))
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* random_number := M.copy (UnsupportedLiteral : Ty.path "f64") in
    let* animal :=
      let* α0 := M.read random_number in
      let* α1 :=
        M.call ((M.var "returning_traits_with_dyn::random_animal") α0) in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 :=
          M.read (mk_str "You've randomly chosen an animal, and it says ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          ltac:(M.get_method (fun ℐ =>
            returning_traits_with_dyn.Animal.noise
              (Self :=
                Ty.dyn [("returning_traits_with_dyn::Animal::Trait", [])])
              (Trait := ℐ))) in
        let* α4 := M.read animal in
        let* α5 := M.call (α3 (borrow (deref α4))) in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_display"]
              (borrow α6)) in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α8))) in
        let* α10 := M.call ((M.var "std::io::stdio::_print") α9) in
        M.alloc α10 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
