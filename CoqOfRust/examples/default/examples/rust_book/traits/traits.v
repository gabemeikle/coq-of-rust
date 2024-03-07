(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Sheep *)

(* Trait *)
Module Animal.
  Definition talk (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "") in
          let* α1 := M.read (mk_str " says ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α0; α1; α2 ] in
          let* α4 := M.get_method "traits::Animal" "name" [ (* Self *) Self ] in
          let* α5 := M.read self in
          let* α6 := M.call α4 [ α5 ] in
          let* α7 := M.alloc α6 in
          let* α8 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow α7 ] in
          let* α9 :=
            M.get_method "traits::Animal" "noise" [ (* Self *) Self ] in
          let* α10 := M.read self in
          let* α11 := M.call α9 [ α10 ] in
          let* α12 := M.alloc α11 in
          let* α13 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow α12 ] in
          let* α14 := M.alloc [ α8; α13 ] in
          let* α15 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α14)
              ] in
          let* α16 := M.call (M.var "std::io::stdio::_print") [ α15 ] in
          M.alloc α16 in
        M.alloc tt in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom ProvidedMethod_talk : M.IsProvidedMethod "traits::Animal" talk.
End Animal.

Module Impl_traits_Sheep.
  Definition Self : Ty.t := Ty.path "traits::Sheep".
  
  (*
      fn is_naked(&self) -> bool {
          self.naked
      }
  *)
  Definition is_naked (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read ((M.var "traits::Sheep::Get_naked") (deref α0))
    | _, _ => M.impossible
    end.
End Impl_traits_Sheep.

Module Impl_traits_Animal_for_traits_Sheep.
  Definition Self : Ty.t := Ty.path "traits::Sheep".
  
  (*
      fn new(name: &'static str) -> Sheep {
          Sheep {
              name: name,
              naked: false,
          }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ name ] =>
      let* name := M.alloc name in
      let* α0 := M.read name in
      M.pure
        (Value.StructRecord "traits::Sheep" [ ("name", α0); ("naked", false) ])
    | _, _ => M.impossible
    end.
  
  (*
      fn name(&self) -> &'static str {
          self.name
      }
  *)
  Definition name (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read ((M.var "traits::Sheep::Get_name") (deref α0))
    | _, _ => M.impossible
    end.
  
  (*
      fn noise(&self) -> &'static str {
          if self.is_naked() {
              "baaaaah?"
          } else {
              "baaaaah!"
          }
      }
  *)
  Definition noise (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 := M.call (Ty.path "traits::Sheep")::["is_naked"] [ α0 ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.read (use α2) in
      let* α4 :=
        if α3 then
          M.pure (mk_str "baaaaah?")
        else
          M.pure (mk_str "baaaaah!") in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      fn talk(&self) {
          // For example, we can add some quiet contemplation.
          println!("{} pauses briefly... {}", self.name, self.noise());
      }
  *)
  Definition talk (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "") in
          let* α1 := M.read (mk_str " pauses briefly... ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α0; α1; α2 ] in
          let* α4 := M.read self in
          let* α5 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow ((M.var "traits::Sheep::Get_name") (deref α4)) ] in
          let* α6 :=
            M.get_method
              "traits::Animal"
              "noise"
              [ (* Self *) Ty.path "traits::Sheep" ] in
          let* α7 := M.read self in
          let* α8 := M.call α6 [ α7 ] in
          let* α9 := M.alloc α8 in
          let* α10 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow α9 ] in
          let* α11 := M.alloc [ α5; α10 ] in
          let* α12 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α11)
              ] in
          let* α13 := M.call (M.var "std::io::stdio::_print") [ α12 ] in
          M.alloc α13 in
        M.alloc tt in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t :=
    [
      ("new", InstanceField.Method new);
      ("name", InstanceField.Method name);
      ("noise", InstanceField.Method noise);
      ("talk", InstanceField.Method talk)
    ].
End Impl_traits_Animal_for_traits_Sheep.

Module Impl_traits_Sheep_2.
  Definition Self : Ty.t := Ty.path "traits::Sheep".
  
  (*
      fn shear(&mut self) {
          if self.is_naked() {
              // Implementor methods can use the implementor's trait methods.
              println!("{} is already naked...", self.name());
          } else {
              println!("{} gets a haircut!", self.name);
  
              self.naked = true;
          }
      }
  *)
  Definition shear (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 :=
        M.call (Ty.path "traits::Sheep")::["is_naked"] [ borrow (deref α0) ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.read (use α2) in
      let* α4 :=
        if α3 then
          let* _ :=
            let* _ :=
              let* α0 := M.read (mk_str "") in
              let* α1 := M.read (mk_str " is already naked...
") in
              let* α2 := M.alloc [ α0; α1 ] in
              let* α3 :=
                M.get_method
                  "traits::Animal"
                  "name"
                  [ (* Self *) Ty.path "traits::Sheep" ] in
              let* α4 := M.read self in
              let* α5 := M.call α3 [ borrow (deref α4) ] in
              let* α6 := M.alloc α5 in
              let* α7 :=
                M.call
                  (Ty.path "core::fmt::rt::Argument")::["new_display"]
                  [ borrow α6 ] in
              let* α8 := M.alloc [ α7 ] in
              let* α9 :=
                M.call
                  (Ty.path "core::fmt::Arguments")::["new_v1"]
                  [
                    pointer_coercion "Unsize" (borrow α2);
                    pointer_coercion "Unsize" (borrow α8)
                  ] in
              let* α10 := M.call (M.var "std::io::stdio::_print") [ α9 ] in
              M.alloc α10 in
            M.alloc tt in
          M.alloc tt
        else
          let* _ :=
            let* _ :=
              let* α0 := M.read (mk_str "") in
              let* α1 := M.read (mk_str " gets a haircut!
") in
              let* α2 := M.alloc [ α0; α1 ] in
              let* α3 := M.read self in
              let* α4 :=
                M.call
                  (Ty.path "core::fmt::rt::Argument")::["new_display"]
                  [ borrow ((M.var "traits::Sheep::Get_name") (deref α3)) ] in
              let* α5 := M.alloc [ α4 ] in
              let* α6 :=
                M.call
                  (Ty.path "core::fmt::Arguments")::["new_v1"]
                  [
                    pointer_coercion "Unsize" (borrow α2);
                    pointer_coercion "Unsize" (borrow α5)
                  ] in
              let* α7 := M.call (M.var "std::io::stdio::_print") [ α6 ] in
              M.alloc α7 in
            M.alloc tt in
          let* _ :=
            let* α0 := M.read self in
            assign ((M.var "traits::Sheep::Get_naked") (deref α0)) true in
          M.alloc tt in
      M.read α4
    | _, _ => M.impossible
    end.
End Impl_traits_Sheep_2.

(*
fn main() {
    // Type annotation is necessary in this case.
    let mut dolly: Sheep = Animal::new("Dolly");
    // TODO ^ Try removing the type annotations.

    dolly.talk();
    dolly.shear();
    dolly.talk();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* dolly :=
      let* α0 :=
        M.get_method
          "traits::Animal"
          "new"
          [ (* Self *) Ty.path "traits::Sheep" ] in
      let* α1 := M.read (mk_str "Dolly") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_method
          "traits::Animal"
          "talk"
          [ (* Self *) Ty.path "traits::Sheep" ] in
      let* α1 := M.call α0 [ borrow dolly ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.call (Ty.path "traits::Sheep")::["shear"] [ borrow_mut dolly ] in
      M.alloc α0 in
    let* _ :=
      let* α0 :=
        M.get_method
          "traits::Animal"
          "talk"
          [ (* Self *) Ty.path "traits::Sheep" ] in
      let* α1 := M.call α0 [ borrow dolly ] in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
