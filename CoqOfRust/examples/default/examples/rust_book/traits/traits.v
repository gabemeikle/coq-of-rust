(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Sheep *)

(* Trait *)
Module Animal.
  Definition talk (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "") in
          let* α3 := M.read (mk_str " says ") in
          let* α4 := M.read (mk_str "
") in
          let* α5 := M.alloc [ α2; α3; α4 ] in
          let* α6 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α7 :=
            M.get_trait_method "traits::Animal" "name" [ (* Self *) Self ] in
          let* α8 := M.read self in
          let* α9 := M.call α7 [ α8 ] in
          let* α10 := M.alloc α9 in
          let* α11 := M.call α6 [ α10 ] in
          let* α12 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α13 :=
            M.get_trait_method "traits::Animal" "noise" [ (* Self *) Self ] in
          let* α14 := M.read self in
          let* α15 := M.call α13 [ α14 ] in
          let* α16 := M.alloc α15 in
          let* α17 := M.call α12 [ α16 ] in
          let* α18 := M.alloc [ α11; α17 ] in
          let* α19 :=
            M.call
              α1
              [ M.pointer_coercion "Unsize" α5; M.pointer_coercion "Unsize" α18
              ] in
          let* α20 := M.call α0 [ α19 ] in
          M.alloc α20 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in
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
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record α0 "naked")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_is_naked :
    M.IsAssociatedFunction Self "is_naked" is_naked [].
End Impl_traits_Sheep.

Module Impl_traits_Animal_for_traits_Sheep.
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
    | [ Self ], [ name ] =>
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
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record α0 "name")
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
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_associated_function (Ty.path "traits::Sheep") "is_naked" in
      let* α1 := M.read self in
      let* α2 := M.call α0 [ α1 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.read (M.use α3) in
      let* α5 :=
        if α4 then
          M.pure (mk_str "baaaaah?")
        else
          M.pure (mk_str "baaaaah!") in
      M.read α5
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
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "") in
          let* α3 := M.read (mk_str " pauses briefly... ") in
          let* α4 := M.read (mk_str "
") in
          let* α5 := M.alloc [ α2; α3; α4 ] in
          let* α6 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α7 := M.read self in
          let* α8 := M.call α6 [ M.get_struct_record α7 "name" ] in
          let* α9 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α10 :=
            M.get_trait_method
              "traits::Animal"
              "noise"
              [ (* Self *) Ty.path "traits::Sheep" ] in
          let* α11 := M.read self in
          let* α12 := M.call α10 [ α11 ] in
          let* α13 := M.alloc α12 in
          let* α14 := M.call α9 [ α13 ] in
          let* α15 := M.alloc [ α8; α14 ] in
          let* α16 :=
            M.call
              α1
              [ M.pointer_coercion "Unsize" α5; M.pointer_coercion "Unsize" α15
              ] in
          let* α17 := M.call α0 [ α16 ] in
          M.alloc α17 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "traits::Animal"
      (* Self *) (Ty.path "traits::Sheep")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("new", InstanceField.Method new);
          ("name", InstanceField.Method name);
          ("noise", InstanceField.Method noise);
          ("talk", InstanceField.Method talk)
        ]
      (* Instance polymorphic types *) [].
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
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_associated_function (Ty.path "traits::Sheep") "is_naked" in
      let* α1 := M.read self in
      let* α2 := M.call α0 [ α1 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.read (M.use α3) in
      let* α5 :=
        if α4 then
          let* _ :=
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "") in
              let* α3 := M.read (mk_str " is already naked...
") in
              let* α4 := M.alloc [ α2; α3 ] in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α6 :=
                M.get_trait_method
                  "traits::Animal"
                  "name"
                  [ (* Self *) Ty.path "traits::Sheep" ] in
              let* α7 := M.read self in
              let* α8 := M.call α6 [ α7 ] in
              let* α9 := M.alloc α8 in
              let* α10 := M.call α5 [ α9 ] in
              let* α11 := M.alloc [ α10 ] in
              let* α12 :=
                M.call
                  α1
                  [
                    M.pointer_coercion "Unsize" α4;
                    M.pointer_coercion "Unsize" α11
                  ] in
              let* α13 := M.call α0 [ α12 ] in
              M.alloc α13 in
            M.alloc (Value.Tuple []) in
          M.alloc (Value.Tuple [])
        else
          let* _ :=
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "") in
              let* α3 := M.read (mk_str " gets a haircut!
") in
              let* α4 := M.alloc [ α2; α3 ] in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α6 := M.read self in
              let* α7 := M.call α5 [ M.get_struct_record α6 "name" ] in
              let* α8 := M.alloc [ α7 ] in
              let* α9 :=
                M.call
                  α1
                  [
                    M.pointer_coercion "Unsize" α4;
                    M.pointer_coercion "Unsize" α8
                  ] in
              let* α10 := M.call α0 [ α9 ] in
              M.alloc α10 in
            M.alloc (Value.Tuple []) in
          let* _ :=
            let* α0 := M.read self in
            M.assign (M.get_struct_record α0 "naked") true in
          M.alloc (Value.Tuple []) in
      M.read α5
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_shear : M.IsAssociatedFunction Self "shear" shear [].
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
        M.get_trait_method
          "traits::Animal"
          "new"
          [ (* Self *) Ty.path "traits::Sheep" ] in
      let* α1 := M.read (mk_str "Dolly") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "traits::Animal"
          "talk"
          [ (* Self *) Ty.path "traits::Sheep" ] in
      let* α1 := M.call α0 [ dolly ] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.get_associated_function (Ty.path "traits::Sheep") "shear" in
      let* α1 := M.call α0 [ dolly ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "traits::Animal"
          "talk"
          [ (* Self *) Ty.path "traits::Sheep" ] in
      let* α1 := M.call α0 [ dolly ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
