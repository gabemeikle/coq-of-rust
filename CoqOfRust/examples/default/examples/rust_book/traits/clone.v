(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Unit *)

Module Impl_core_fmt_Debug_for_clone_Unit.
  Definition Self : Ty.t := Ty.path "clone::Unit".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Unit") in
      M.call ((Ty.path "core::fmt::Formatter")::["write_str"] α0 α1)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_clone_Unit.

Module Impl_core_clone_Clone_for_clone_Unit.
  Definition Self : Ty.t := Ty.path "clone::Unit".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (deref α0)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_clone_Unit.

Module Impl_core_marker_Copy_for_clone_Unit.
  Definition Self : Ty.t := Ty.path "clone::Unit".
  
  Definition ℐ : Instance.t := [].
End Impl_core_marker_Copy_for_clone_Unit.

(* Struct Pair *)

Module Impl_core_clone_Clone_for_clone_Pair.
  Definition Self : Ty.t := Ty.path "clone::Pair".
  
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self] =>
      let* self := M.alloc self in
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.clone.Clone.clone
            (Self :=
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [Ty.path "i32"; Ty.path "alloc::alloc::Global"])
            (Trait := ℐ))) in
      let* α1 := M.read self in
      let* α2 :=
        M.call (α0 (borrow ((M.var "clone::Pair::Get_0") (deref α1)))) in
      let* α3 :=
        ltac:(M.get_method (fun ℐ =>
          core.clone.Clone.clone
            (Self :=
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [Ty.path "i32"; Ty.path "alloc::alloc::Global"])
            (Trait := ℐ))) in
      let* α4 := M.read self in
      let* α5 :=
        M.call (α3 (borrow ((M.var "clone::Pair::Get_1") (deref α4)))) in
      M.pure (clone.Pair.Build_t α2 α5)
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("clone", InstanceField.Method clone)].
End Impl_core_clone_Clone_for_clone_Pair.

Module Impl_core_fmt_Debug_for_clone_Pair.
  Definition Self : Ty.t := Ty.path "clone::Pair".
  
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [self; f] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Pair") in
      let* α2 := M.read self in
      let* α3 := M.read self in
      let* α4 := M.alloc (borrow ((M.var "clone::Pair::Get_1") (deref α3))) in
      M.call
        ((Ty.path "core::fmt::Formatter")::["debug_tuple_field2_finish"]
          α0
          α1
          (pointer_coercion
            "Unsize"
            (borrow ((M.var "clone::Pair::Get_0") (deref α2))))
          (pointer_coercion "Unsize" (borrow α4)))
    | _, _ => M.impossible
    end.
  
  Definition ℐ : Instance.t := [("fmt", InstanceField.Method fmt)].
End Impl_core_fmt_Debug_for_clone_Pair.

(*
fn main() {
    // Instantiate `Unit`
    let unit = Unit;
    // Copy `Unit`, there are no resources to move
    let copied_unit = unit;

    // Both `Unit`s can be used independently
    println!("original: {:?}", unit);
    println!("copy: {:?}", copied_unit);

    // Instantiate `Pair`
    let pair = Pair(Box::new(1), Box::new(2));
    println!("original: {:?}", pair);

    // Move `pair` into `moved_pair`, moves resources
    let moved_pair = pair;
    println!("moved: {:?}", moved_pair);

    // Error! `pair` has lost its resources
    //println!("original: {:?}", pair);
    // TODO ^ Try uncommenting this line

    // Clone `moved_pair` into `cloned_pair` (resources are included)
    let cloned_pair = moved_pair.clone();
    // Drop the original pair using std::mem::drop
    drop(moved_pair);

    // Error! `moved_pair` has been dropped
    //println!("copy: {:?}", moved_pair);
    // TODO ^ Try uncommenting this line

    // The result from .clone() can still be used!
    println!("clone: {:?}", cloned_pair);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* unit_ := M.alloc clone.Unit.Build in
    let* copied_unit := M.copy unit_ in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "original: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
              (borrow unit_)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "copy: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
              (borrow copied_unit)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* pair :=
      let* α0 :=
        M.call
          ((Ty.apply
                (Ty.path "alloc::boxed::Box")
                [Ty.path "i32"; Ty.path "alloc::alloc::Global"])::["new"]
            ((Integer.of_Z 1) : Ty.path "i32")) in
      let* α1 :=
        M.call
          ((Ty.apply
                (Ty.path "alloc::boxed::Box")
                [Ty.path "i32"; Ty.path "alloc::alloc::Global"])::["new"]
            ((Integer.of_Z 2) : Ty.path "i32")) in
      M.alloc (clone.Pair.Build_t α0 α1) in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "original: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
              (borrow pair)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* moved_pair := M.copy pair in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "moved: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
              (borrow moved_pair)) in
        let* α4 := M.alloc [ α3 ] in
        let* α5 :=
          M.call
            ((Ty.path "core::fmt::Arguments")::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 := M.call ((M.var "std::io::stdio::_print") α5) in
        M.alloc α6 in
      M.alloc tt in
    let* cloned_pair :=
      let* α0 :=
        ltac:(M.get_method (fun ℐ =>
          core.clone.Clone.clone
            (Self := Ty.path "clone::Pair")
            (Trait := ℐ))) in
      let* α1 := M.call (α0 (borrow moved_pair)) in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.read moved_pair in
      let* α1 := M.call ((M.var "core::mem::drop") α0) in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.read (mk_str "clone: ") in
        let* α1 := M.read (mk_str "
") in
        let* α2 := M.alloc [ α0; α1 ] in
        let* α3 :=
          M.call
            ((Ty.path "core::fmt::rt::Argument")::["new_debug"]
              (borrow cloned_pair)) in
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
