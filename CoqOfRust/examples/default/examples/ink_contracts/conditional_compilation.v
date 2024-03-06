(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_conditional_compilation_AccountId.
  Definition Self : Ty.t := Ty.path "conditional_compilation::AccountId".
  
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
      M.pure (conditional_compilation.AccountId.Build_t α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("default", InstanceField.Method default)].
End Impl_core_default_Default_for_conditional_compilation_AccountId.

Module Impl_core_clone_Clone_for_conditional_compilation_AccountId.
  Definition Self : Ty.t := Ty.path "conditional_compilation::AccountId".
  
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
              Ty.path "conditional_compilation::AccountId"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_conditional_compilation_AccountId.

Module Impl_core_marker_Copy_for_conditional_compilation_AccountId.
  Definition Self : Ty.t := Ty.path "conditional_compilation::AccountId".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_conditional_compilation_AccountId.

Axiom Balance : (Ty.path "conditional_compilation::Balance") = (Ty.path "u128").

Axiom BlockNumber :
    (Ty.path "conditional_compilation::BlockNumber") = (Ty.path "u32").

(* Enum Env *)

Module Flip.
  Class Trait (Self : Set) : Type := {
    flip : Ty.function [Ty.apply (Ty.path "mut_ref") [Self]] (Ty.path "unit");
    get : Ty.function [Ty.apply (Ty.path "ref") [Self]] (Ty.path "bool");
    push_foo :
      Ty.function
        [Ty.apply (Ty.path "mut_ref") [Self]; Ty.path "bool"]
        (Ty.path "unit");
  }.
  
End Flip.

(* Enum Changes *)

(* Enum ChangesDated *)

(* Enum Event *)

Module Impl_conditional_compilation_Env.
  Definition Self : Ty.t := Ty.path "conditional_compilation::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read ((M.var "conditional_compilation::Env::Get_caller") (deref α0))
    | _, _ => M.impossible
    end.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Definition emit_event (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; _event] =>
      let* self := M.alloc self in
      let* _event := M.alloc _event in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
  
  (*
      fn block_number(&self) -> BlockNumber {
          unimplemented!()
      }
  *)
  Definition block_number (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read (mk_str "not implemented") in
      let* α1 := M.call ((M.var "core::panicking::panic") α0) in
      never_to_any α1
    | _, _ => M.impossible
    end.
End Impl_conditional_compilation_Env.

(* Enum ConditionalCompilation *)

Module Impl_conditional_compilation_ConditionalCompilation.
  Definition Self : Ty.t :=
    Ty.path "conditional_compilation::ConditionalCompilation".
  
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
      M.call
        (Ty.path
            "conditional_compilation::ConditionalCompilation")::["init_env"]
    | _, _ => M.impossible
    end.
  
  (*
      pub fn new() -> Self {
          Self {
              value: Default::default(),
          }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "bool")
            (Trait := ℐ))) in
      let* α1 := M.call α0 in
      M.pure {| conditional_compilation.ConditionalCompilation.value := α1; |}
    | _, _ => M.impossible
    end.
  
  (*
      pub fn new_foo(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [value] =>
      let* value := M.alloc value in
      let* α0 := M.read value in
      M.pure {| conditional_compilation.ConditionalCompilation.value := α0; |}
    | _, _ => M.impossible
    end.
  
  (*
      pub fn new_bar(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [value] =>
      let* value := M.alloc value in
      let* α0 := M.read value in
      M.pure {| conditional_compilation.ConditionalCompilation.value := α0; |}
    | _, _ => M.impossible
    end.
  
  (*
      pub fn new_foo_bar(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_foo_bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [value] =>
      let* value := M.alloc value in
      let* α0 := M.read value in
      M.pure {| conditional_compilation.ConditionalCompilation.value := α0; |}
    | _, _ => M.impossible
    end.
  
  (*
      pub fn inherent_flip_foo(&mut self) {
          self.value = !self.value;
          let caller = Self::init_env().caller();
          Self::init_env().emit_event(Event::Changes(Changes {
              new_value: self.value,
              by: caller,
          }));
      }
  *)
  Definition inherent_flip_foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 :=
          M.read
            ((M.var
                "conditional_compilation::ConditionalCompilation::Get_value")
              (deref α1)) in
        assign
          ((M.var "conditional_compilation::ConditionalCompilation::Get_value")
            (deref α0))
          ((M.var "UnOp::not") α2) in
      let* caller :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "conditional_compilation::Env")::["caller"]
              (borrow α1)) in
        M.alloc α2 in
      let* _ :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"] in
        let* α1 := M.alloc α0 in
        let* α2 := M.read self in
        let* α3 :=
          M.read
            ((M.var
                "conditional_compilation::ConditionalCompilation::Get_value")
              (deref α2)) in
        let* α4 := M.read caller in
        let* α5 :=
          M.call
            ((Ty.path "conditional_compilation::Env")::["emit_event"]
              (borrow α1)
              (conditional_compilation.Event.Changes
                {|
                  conditional_compilation.Changes.new_value := α3;
                  conditional_compilation.Changes.by_ := α4;
                |})) in
        M.alloc α5 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn inherent_flip_bar(&mut self) {
          let caller = Self::init_env().caller();
          let block_number = Self::init_env().block_number();
          self.value = !self.value;
          Self::init_env().emit_event(Event::ChangesDated(ChangesDated {
              new_value: self.value,
              by: caller,
              when: block_number,
          }));
      }
  *)
  Definition inherent_flip_bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "conditional_compilation::Env")::["caller"]
              (borrow α1)) in
        M.alloc α2 in
      let* block_number :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "conditional_compilation::Env")::["block_number"]
              (borrow α1)) in
        M.alloc α2 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 :=
          M.read
            ((M.var
                "conditional_compilation::ConditionalCompilation::Get_value")
              (deref α1)) in
        assign
          ((M.var "conditional_compilation::ConditionalCompilation::Get_value")
            (deref α0))
          ((M.var "UnOp::not") α2) in
      let* _ :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"] in
        let* α1 := M.alloc α0 in
        let* α2 := M.read self in
        let* α3 :=
          M.read
            ((M.var
                "conditional_compilation::ConditionalCompilation::Get_value")
              (deref α2)) in
        let* α4 := M.read caller in
        let* α5 := M.read block_number in
        let* α6 :=
          M.call
            ((Ty.path "conditional_compilation::Env")::["emit_event"]
              (borrow α1)
              (conditional_compilation.Event.ChangesDated
                {|
                  conditional_compilation.ChangesDated.new_value := α3;
                  conditional_compilation.ChangesDated.by_ := α4;
                  conditional_compilation.ChangesDated.when := α5;
                |})) in
        M.alloc α6 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
End Impl_conditional_compilation_ConditionalCompilation.

Module Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
  Definition Self : Ty.t :=
    Ty.path "conditional_compilation::ConditionalCompilation".
  
  (*
      fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 :=
          M.read
            ((M.var
                "conditional_compilation::ConditionalCompilation::Get_value")
              (deref α1)) in
        assign
          ((M.var "conditional_compilation::ConditionalCompilation::Get_value")
            (deref α0))
          ((M.var "UnOp::not") α2) in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read
        ((M.var "conditional_compilation::ConditionalCompilation::Get_value")
          (deref α0))
    | _, _ => M.impossible
    end.
  
  (*
      fn push_foo(&mut self, value: bool) {
          let caller = Self::init_env().caller();
          Self::init_env().emit_event(Event::Changes(Changes {
              new_value: value,
              by: caller,
          }));
          self.value = value;
      }
  *)
  Definition push_foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; value] =>
      let* self := M.alloc self in
      let* value := M.alloc value in
      let* caller :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            ((Ty.path "conditional_compilation::Env")::["caller"]
              (borrow α1)) in
        M.alloc α2 in
      let* _ :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"] in
        let* α1 := M.alloc α0 in
        let* α2 := M.read value in
        let* α3 := M.read caller in
        let* α4 :=
          M.call
            ((Ty.path "conditional_compilation::Env")::["emit_event"]
              (borrow α1)
              (conditional_compilation.Event.Changes
                {|
                  conditional_compilation.Changes.new_value := α2;
                  conditional_compilation.Changes.by_ := α3;
                |})) in
        M.alloc α4 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read value in
        assign
          ((M.var "conditional_compilation::ConditionalCompilation::Get_value")
            (deref α0))
          α1 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("flip", InstanceField.Method flip);
    ("get", InstanceField.Method get);
    ("push_foo", InstanceField.Method push_foo)].
End Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
