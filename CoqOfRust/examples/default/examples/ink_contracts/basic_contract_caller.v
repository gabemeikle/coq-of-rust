(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::AccountId".
  
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          (Ty.path "u128")
          []
          "default"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.pure (Value.StructTuple "basic_contract_caller::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "basic_contract_caller::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_basic_contract_caller_AccountId.

Module Impl_core_clone_Clone_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::AccountId".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => M.read self ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "basic_contract_caller::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_basic_contract_caller_AccountId.

Module Impl_core_marker_Copy_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "basic_contract_caller::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_basic_contract_caller_AccountId.

Axiom Hash :
  (Ty.path "basic_contract_caller::Hash") =
    (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* Enum Error *)
(* {
  ty_params := [];
  variants := [];
} *)

(* StructRecord
  {
    name := "OtherContract";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

Module Impl_basic_contract_caller_OtherContract.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::OtherContract".
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ init_value ] =>
      let* init_value := M.alloc init_value in
      let* α0 := M.read init_value in
      M.pure
        (Value.StructRecord
          "basic_contract_caller::OtherContract"
          [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 :=
          M.read
            (M.get_struct_record_field
              α1
              "basic_contract_caller::OtherContract"
              "value") in
        M.assign
          (M.get_struct_record_field
            α0
            "basic_contract_caller::OtherContract"
            "value")
          (UnOp.Pure.not α2) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read
        (M.get_struct_record_field
          α0
          "basic_contract_caller::OtherContract"
          "value")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_basic_contract_caller_OtherContract.

(* StructRecord
  {
    name := "BasicContractCaller";
    ty_params := [];
    fields :=
      [ ("other_contract", Ty.path "basic_contract_caller::OtherContract") ];
  } *)

Module Impl_basic_contract_caller_BasicContractCaller.
  Definition Self : Ty.t :=
    Ty.path "basic_contract_caller::BasicContractCaller".
  
  (*
      pub fn new(other_contract_code_hash: Hash) -> Self {
          // let other_contract = OtherContract::new(true)
          //     .code_hash(other_contract_code_hash)
          //     .endowment(0)
          //     .salt_bytes([0xDE, 0xAD, 0xBE, 0xEF])
          //     .instantiate();
          let other_contract = todo!();
  
          Self { other_contract }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ other_contract_code_hash ] =>
      let* other_contract_code_hash := M.alloc other_contract_code_hash in
      let* other_contract :=
        let* α0 := M.get_function "core::panicking::panic" [] in
        let* α1 := M.read (mk_str "not yet implemented") in
        let* α2 := M.call_closure α0 [ α1 ] in
        let* α3 := M.never_to_any α2 in
        M.alloc α3 in
      let* α0 := M.read other_contract in
      let* α0 :=
        M.alloc
          (Value.StructRecord
            "basic_contract_caller::BasicContractCaller"
            [ ("other_contract", α0) ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn flip_and_get(&mut self) -> bool {
          self.other_contract.flip();
          self.other_contract.get()
      }
  *)
  Definition flip_and_get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 :=
          M.get_associated_function
            (Ty.path "basic_contract_caller::OtherContract")
            "flip"
            [] in
        let* α1 := M.read self in
        let* α2 :=
          M.call_closure
            α0
            [
              M.get_struct_record_field
                α1
                "basic_contract_caller::BasicContractCaller"
                "other_contract"
            ] in
        M.alloc α2 in
      let* α0 :=
        M.get_associated_function
          (Ty.path "basic_contract_caller::OtherContract")
          "get"
          [] in
      let* α1 := M.read self in
      let* α2 :=
        M.call_closure
          α0
          [
            M.get_struct_record_field
              α1
              "basic_contract_caller::BasicContractCaller"
              "other_contract"
          ] in
      let* α0 := M.alloc α2 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip_and_get :
    M.IsAssociatedFunction Self "flip_and_get" flip_and_get.
End Impl_basic_contract_caller_BasicContractCaller.
