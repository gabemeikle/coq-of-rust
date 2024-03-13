(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α1 := M.call_closure α0 [] in
      M.pure (Value.StructTuple "updated_incrementer::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "updated_incrementer::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_updated_incrementer_AccountId.

Module Impl_core_clone_Clone_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
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
      (* Self *) (Ty.path "updated_incrementer::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_updated_incrementer_AccountId.

Module Impl_core_marker_Copy_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "updated_incrementer::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_updated_incrementer_AccountId.

Axiom Hash :
  (Ty.path "updated_incrementer::Hash") =
    (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* Enum Error *)
(* {
  ty_params := [];
  variants := [];
} *)

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "updated_incrementer::AccountId") ];
  } *)

Module Impl_updated_incrementer_Env.
  Definition Self : Ty.t := Ty.path "updated_incrementer::Env".
  
  (*
      fn set_code_hash<E>(&self, code_hash: &E) -> Result<(), Error> {
          unimplemented!()
      }
  *)
  Parameter set_code_hash : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_set_code_hash :
    M.IsAssociatedFunction Self "set_code_hash" set_code_hash.
End Impl_updated_incrementer_Env.

(* StructRecord
  {
    name := "Incrementer";
    ty_params := [];
    fields := [ ("count", Ty.path "u32") ];
  } *)

Module Impl_updated_incrementer_Incrementer.
  Definition Self : Ty.t := Ty.path "updated_incrementer::Incrementer".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_associated_function
          (Ty.path "updated_incrementer::Incrementer")
          "init_env" in
      M.call_closure α0 []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  (*
      pub fn new() -> Self {
          unreachable!("Constructors are not called when upgrading using `set_code_hash`.")
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        M.get_function
          "core::panicking::unreachable_display"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α1 :=
        M.call_closure
          α0
          [
            mk_str
              "Constructors are not called when upgrading using `set_code_hash`."
          ] in
      M.never_to_any α1
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn inc(&mut self) {
          self.count += 4;
          println!(
              "The new count is {}, it was modified using the updated `new_incrementer` code.",
              self.count
          );
      }
  *)
  Definition inc (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* β :=
          let* α0 := M.read self in
          M.pure (M.get_struct_record α0 "count") in
        let* α0 := M.read β in
        let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.U32 4) in
        M.assign β α1 in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "The new count is ") in
          let* α3 :=
            M.read
              (mk_str
                ", it was modified using the updated `new_incrementer` code.
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 := M.read self in
          let* α7 := M.call_closure α5 [ M.get_struct_record α6 "count" ] in
          let* α8 := M.alloc (Value.Array [ α7 ]) in
          let* α9 :=
            M.call_closure
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α8
              ] in
          let* α10 := M.call_closure α0 [ α9 ] in
          M.alloc α10 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_inc : M.IsAssociatedFunction Self "inc" inc.
  
  (*
      pub fn get(&self) -> u32 {
          self.count
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record α0 "count")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
  
  (*
      pub fn set_code(&mut self, code_hash: Hash) {
          self.env().set_code_hash(&code_hash).unwrap_or_else(|err| {
              panic!("Failed to `set_code_hash` to {code_hash:?} due to {err:?}")
          });
          println!("Switched code hash to {:?}.", code_hash);
      }
  *)
  Definition set_code (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; code_hash ] =>
      let* self := M.alloc self in
      let* code_hash := M.alloc code_hash in
      let* _ :=
        let* α0 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.tuple []; Ty.path "updated_incrementer::Error" ])
            "unwrap_or_else" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "updated_incrementer::Env")
            "set_code_hash" in
        let* α2 :=
          M.get_associated_function
            (Ty.path "updated_incrementer::Incrementer")
            "env" in
        let* α3 := M.read self in
        let* α4 := M.call_closure α2 [ α3 ] in
        let* α5 := M.alloc α4 in
        let* α6 := M.call_closure α1 [ α5; code_hash ] in
        let* α7 :=
          M.call_closure
            α0
            [
              α6;
              M.closure
                (fun γ =>
                  match γ with
                  | [ α0 ] =>
                    let* α0 := M.alloc α0 in
                    match_operator
                      α0
                      [
                        fun γ =>
                          let* err := M.copy γ in
                          let* α0 :=
                            M.get_function
                              "std::panicking::begin_panic"
                              [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
                          let* α1 :=
                            M.read
                              (mk_str
                                "Failed to `set_code_hash` to {code_hash:?} due to {err:?}") in
                          let* α2 := M.call_closure α0 [ α1 ] in
                          M.never_to_any α2
                      ]
                  | _ => M.impossible
                  end)
            ] in
        M.alloc α7 in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "Switched code hash to ") in
          let* α3 := M.read (mk_str ".
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_debug" in
          let* α6 := M.call_closure α5 [ code_hash ] in
          let* α7 := M.alloc (Value.Array [ α6 ]) in
          let* α8 :=
            M.call_closure
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α7
              ] in
          let* α9 := M.call_closure α0 [ α8 ] in
          M.alloc α9 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_set_code :
    M.IsAssociatedFunction Self "set_code" set_code.
End Impl_updated_incrementer_Incrementer.
