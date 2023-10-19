(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Point.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    x : f64;
    y : f64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_x `{State.Trait} : Notation.Dot "x" := {
    Notation.dot x := let* x' := M.read x' in Pure x'.(x) : M _;
  }.
  Global Instance Get_AF_x `{State.Trait} : Notation.DoubleColon t "x" := {
    Notation.double_colon x := let* x' := M.read x' in Pure x'.(x) : M _;
  }.
  Global Instance Get_y `{State.Trait} : Notation.Dot "y" := {
    Notation.dot x := let* x := M.read x in Pure x.(y) : M _;
  }.
  Global Instance Get_AF_y `{State.Trait} : Notation.DoubleColon t "y" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(y) : M _;
  }.
End Point.
Definition Point `{State.Trait} : Set := M.val (Point.t).

Module Impl_associated_functions_and_methods_Point.
  Definition Self `{State.Trait} : Set :=
    associated_functions_and_methods.Point.
  
  Parameter origin :
      forall `{State.Trait},
      M associated_functions_and_methods.Point.
  
  Global Instance AssociatedFunction_origin `{State.Trait} :
    Notation.DoubleColon Self "origin" := {
    Notation.double_colon := origin;
  }.
  
  Parameter new :
      forall `{State.Trait},
      f64 -> f64 -> M associated_functions_and_methods.Point.
  
  Global Instance AssociatedFunction_new `{State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
End Impl_associated_functions_and_methods_Point.

Module Rectangle.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    p1 : associated_functions_and_methods.Point;
    p2 : associated_functions_and_methods.Point;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_p1 `{State.Trait} : Notation.Dot "p1" := {
    Notation.dot x := let* x := M.read x in Pure x.(p1) : M _;
  }.
  Global Instance Get_AF_p1 `{State.Trait} : Notation.DoubleColon t "p1" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(p1) : M _;
  }.
  Global Instance Get_p2 `{State.Trait} : Notation.Dot "p2" := {
    Notation.dot x := let* x := M.read x in Pure x.(p2) : M _;
  }.
  Global Instance Get_AF_p2 `{State.Trait} : Notation.DoubleColon t "p2" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(p2) : M _;
  }.
End Rectangle.
Definition Rectangle `{State.Trait} : Set := M.val (Rectangle.t).

Module Impl_associated_functions_and_methods_Rectangle.
  Definition Self `{State.Trait} : Set :=
    associated_functions_and_methods.Rectangle.
  
  Parameter get_p1 :
      forall `{State.Trait},
      (ref Self) -> M associated_functions_and_methods.Point.
  
  Global Instance Method_get_p1 `{State.Trait} : Notation.Dot "get_p1" := {
    Notation.dot := get_p1;
  }.
  
  Parameter area : forall `{State.Trait}, (ref Self) -> M f64.
  
  Global Instance Method_area `{State.Trait} : Notation.Dot "area" := {
    Notation.dot := area;
  }.
  
  Parameter perimeter : forall `{State.Trait}, (ref Self) -> M f64.
  
  Global Instance Method_perimeter `{State.Trait} :
    Notation.Dot "perimeter" := {
    Notation.dot := perimeter;
  }.
  
  Parameter translate :
      forall `{State.Trait},
      (mut_ref Self) -> f64 -> f64 -> M unit.
  
  Global Instance Method_translate `{State.Trait} :
    Notation.Dot "translate" := {
    Notation.dot := translate;
  }.
End Impl_associated_functions_and_methods_Rectangle.

Module Pair.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    x0 : alloc.boxed.Box i32 alloc.boxed.Box.Default.A;
    x1 : alloc.boxed.Box i32 alloc.boxed.Box.Default.A;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 `{State.Trait} : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
  }.
  Global Instance Get_1 `{State.Trait} : Notation.Dot "1" := {
    Notation.dot x := let* x := M.read x in Pure x.(x1) : M _;
  }.
End Pair.
Definition Pair `{State.Trait} : Set := M.val Pair.t.

Module Impl_associated_functions_and_methods_Pair.
  Definition Self `{State.Trait} : Set := associated_functions_and_methods.Pair.
  
  Parameter destroy : forall `{State.Trait}, Self -> M unit.
  
  Global Instance Method_destroy `{State.Trait} : Notation.Dot "destroy" := {
    Notation.dot := destroy;
  }.
End Impl_associated_functions_and_methods_Pair.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
