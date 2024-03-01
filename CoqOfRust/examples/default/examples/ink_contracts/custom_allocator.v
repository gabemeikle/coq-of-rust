(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.



Module  Impl_custom_allocator_CustomAllocator.
Section Impl_custom_allocator_CustomAllocator.
  Definition Self : Set :=
    Ty.apply (Ty.path "custom_allocator::CustomAllocator") [].
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self {
              value: vec![init_value],
          }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [init_value] =>
      let* init_value := M.alloc init_value in
      let* α0 : Ty.path "bool" := M.read init_value in
      let* α1 : Ty.apply (Ty.path "array") [Ty.path "bool"] := M.alloc [ α0 ] in
      let* α2 :
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [Ty.apply (Ty.path "array") [Ty.path "bool"];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.call ((alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"] α1) in
      let* α3 :
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [Ty.apply (Ty.path "array") [Ty.path "bool"];
              Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.read α2 in
      let* α4 :
          Ty.apply
            (Ty.path "alloc::vec::Vec")
            [Ty.path "bool"; Ty.apply (Ty.path "alloc::alloc::Global") []] :=
        M.call
          ((Ty.apply (Ty.path "slice") [Ty.path "bool"])::["into_vec"]
            (pointer_coercion "Unsize" α3)) in
      M.pure {| custom_allocator.CustomAllocator.value := α4; |}
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_new : Instance.t := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* α0 : Ty.function [] (Ty.path "bool") :=
        ltac:(M.get_method (fun ℐ =>
          core.default.Default.default
            (Self := Ty.path "bool")
            (Trait := ℐ))) in
      let* α1 : Ty.path "bool" := M.call α0 in
      M.call
        ((Ty.apply (Ty.path "custom_allocator::CustomAllocator") [])::["new"]
          α1)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_default : Instance.t := {
    Notations.double_colon := default;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value[0] = !self.value[0];
      }
  *)
  Definition flip (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* _ : Ty.tuple :=
        let* α0 :
            Ty.function
              [Ty.apply
                  (Ty.path "mut_ref")
                  [Ty.apply
                      (Ty.path "alloc::vec::Vec")
                      [Ty.path "bool";
                        Ty.apply (Ty.path "alloc::alloc::Global") []]];
                Ty.path "usize"]
              (Ty.apply (Ty.path "mut_ref") [_]) :=
          ltac:(M.get_method (fun ℐ =>
            core.ops.index.IndexMut.index_mut
              (Self :=
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [Ty.path "bool";
                    Ty.apply (Ty.path "alloc::alloc::Global") []])
              (Idx := Ty.path "usize")
              (Trait := ℐ))) in
        let* α1 :
            Ty.apply
              (Ty.path "mut_ref")
              [Ty.apply (Ty.path "custom_allocator::CustomAllocator") []] :=
          M.read self in
        let* α2 : Ty.apply (Ty.path "mut_ref") [Ty.path "bool"] :=
          M.call
            (α0
              (borrow_mut
                (custom_allocator.CustomAllocator.Get_value (deref α1)))
              ((Integer.of_Z 0) : Ty.path "usize")) in
        let* α3 :
            Ty.function
              [Ty.apply
                  (Ty.path "ref")
                  [Ty.apply
                      (Ty.path "alloc::vec::Vec")
                      [Ty.path "bool";
                        Ty.apply (Ty.path "alloc::alloc::Global") []]];
                Ty.path "usize"]
              (Ty.apply (Ty.path "ref") [_]) :=
          ltac:(M.get_method (fun ℐ =>
            core.ops.index.Index.index
              (Self :=
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [Ty.path "bool";
                    Ty.apply (Ty.path "alloc::alloc::Global") []])
              (Idx := Ty.path "usize")
              (Trait := ℐ))) in
        let* α4 :
            Ty.apply
              (Ty.path "mut_ref")
              [Ty.apply (Ty.path "custom_allocator::CustomAllocator") []] :=
          M.read self in
        let* α5 : Ty.apply (Ty.path "ref") [Ty.path "bool"] :=
          M.call
            (α3
              (borrow (custom_allocator.CustomAllocator.Get_value (deref α4)))
              ((Integer.of_Z 0) : Ty.path "usize")) in
        let* α6 : Ty.path "bool" := M.read (deref α5) in
        assign (deref α2) (UnOp.not α6) in
      let* α0 : Ty.path "unit" := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_flip : Instance.t := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value[0]
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 :
          Ty.function
            [Ty.apply
                (Ty.path "ref")
                [Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [Ty.path "bool";
                      Ty.apply (Ty.path "alloc::alloc::Global") []]];
              Ty.path "usize"]
            (Ty.apply (Ty.path "ref") [_]) :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.index.Index.index
            (Self :=
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [Ty.path "bool"; Ty.apply (Ty.path "alloc::alloc::Global") []])
            (Idx := Ty.path "usize")
            (Trait := ℐ))) in
      let* α1 :
          Ty.apply
            (Ty.path "ref")
            [Ty.apply (Ty.path "custom_allocator::CustomAllocator") []] :=
        M.read self in
      let* α2 : Ty.apply (Ty.path "ref") [Ty.path "bool"] :=
        M.call
          (α0
            (borrow (custom_allocator.CustomAllocator.Get_value (deref α1)))
            ((Integer.of_Z 0) : Ty.path "usize")) in
      M.read (deref α2)
    | _, _ => M.impossible
    end.
  
  Definition AssociatedFunction_get : Instance.t := {
    Notations.double_colon := get;
  }.
End Impl_custom_allocator_CustomAllocator.
End Impl_custom_allocator_CustomAllocator.
