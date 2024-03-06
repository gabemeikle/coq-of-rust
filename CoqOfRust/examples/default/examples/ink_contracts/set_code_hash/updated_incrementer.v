(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "u128")
            (Trait := ℐ))) in
      let* α1 := M.call α0 in
      M.pure (updated_incrementer.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_updated_incrementer_AccountId.

Module Impl_core_clone_Clone_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          (DeclaredButUndefinedVariable
            (A :=
              Ty.apply
                (Ty.path "core::clone::AssertParamIsClone")
                [Ty.path "u128"]))
          [
            fun γ =>
              (let* α0 := M.read self in
              M.pure (deref α0)) :
              Ty.path "updated_incrementer::AccountId"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_updated_incrementer_AccountId.

Module Impl_core_marker_Copy_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_updated_incrementer_AccountId.

Axiom Hash :
    (Ty.path "updated_incrementer::Hash") =
      (Ty.apply (Ty.path "array") [Ty.path "u8"]).

(* Enum Error *)

(* Enum Env *)

Module Impl_updated_incrementer_Env.
  Definition Self : Ty.t := Ty.path "updated_incrementer::Env".
  
  (*
      fn set_code_hash<E>(&self, code_hash: &E) -> Result<(), Error> {
          unimplemented!()
      }
  *)
  Definition set_code_hash (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [E], [self; code_hash] =>
      let* self := M.alloc self in
      let* code_hash := M.alloc code_hash in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
End Impl_updated_incrementer_Env.

(* Enum Incrementer *)

Module Impl_updated_incrementer_Incrementer.
  Definition Self : Ty.t := Ty.path "updated_incrementer::Incrementer".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      M.call (Ty.path "updated_incrementer::Incrementer")::["init_env"]
    | _, _ => M.impossible
    end.
  
  (*
      pub fn new() -> Self {
          unreachable!("Constructors are not called when upgrading using `set_code_hash`.")
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        M.call
          ((M.var "core::panicking::unreachable_display")
            (borrow
              (mk_str
                "Constructors are not called when upgrading using `set_code_hash`."))) in
      never_to_any α0
    | _, _ => M.impossible
    end.
  
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
    | [], [self] =>
      let* self := M.alloc self in
      let* _ :=
        let* β :=
          let* α0 := M.read self in
          M.pure
            ((M.var "updated_incrementer::Incrementer::Get_count")
              (deref α0)) in
        let* α0 := M.read β in
        let* α1 :=
          (M.var "BinOp::Panic::add") α0 ((Integer.of_Z 4) : Ty.path "u32") in
        (M.var "assign") β α1 in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "The new count is ") in
          let* α1 :=
            M.read
              (mk_str
                ", it was modified using the updated `new_incrementer` code.
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 := M.read self in
          let* α4 :=
            M.call
              ((Ty.path "core::fmt::rt::Argument")::["new_display"]
                (borrow
                  ((M.var "updated_incrementer::Incrementer::Get_count")
                    (deref α3)))) in
          let* α5 := M.alloc [ α4 ] in
          let* α6 :=
            M.call
              ((Ty.path "core::fmt::Arguments")::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α5))) in
          let* α7 := M.call ((M.var "std::io::stdio::_print") α6) in
          M.alloc α7 in
        M.alloc tt in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn get(&self) -> u32 {
          self.count
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read ((M.var "updated_incrementer::Incrementer::Get_count") (deref α0))
    | _, _ => M.impossible
    end.
  
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
    | [], [self; code_hash] =>
      let* self := M.alloc self in
      let* code_hash := M.alloc code_hash in
      let* _ :=
        let* α0 := M.read self in
        let* α1 :=
          M.call
            ((Ty.path "updated_incrementer::Incrementer")::["env"]
              (borrow (deref α0))) in
        let* α2 := M.alloc α1 in
        let* α3 :=
          M.call
            ((Ty.path "updated_incrementer::Env")::["set_code_hash"]
              (borrow α2)
              (borrow code_hash)) in
        let* α4 :=
          M.call
            ((Ty.apply
                  (Ty.path "core::result::Result")
                  [Ty.tuple [];
                    Ty.path "updated_incrementer::Error"])::["unwrap_or_else"]
              α3
              (fun (α0 : Ty.path "updated_incrementer::Error") =>
                (let* α0 := M.alloc α0 in
                match_operator
                  α0
                  [
                    fun γ =>
                      (let* err := M.copy γ in
                      let* α0 :=
                        M.read
                          (mk_str
                            "Failed to `set_code_hash` to {code_hash:?} due to {err:?}") in
                      let* α1 :=
                        M.call ((M.var "std::panicking::begin_panic") α0) in
                      never_to_any α1) :
                      Ty.tuple []
                  ]) :
                Ty.tuple [])) in
        M.alloc α4 in
      let* _ :=
        let* _ :=
          let* α0 := M.read (mk_str "Switched code hash to ") in
          let* α1 := M.read (mk_str ".
") in
          let* α2 := M.alloc [ α0; α1 ] in
          let* α3 :=
            M.call
              ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
                (borrow code_hash)) in
          let* α4 := M.alloc [ α3 ] in
          let* α5 :=
            M.call
              ((Ty.path "core::fmt::Arguments")::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α4))) in
          let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
          M.alloc α6 in
        M.alloc tt in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
End Impl_updated_incrementer_Incrementer.
