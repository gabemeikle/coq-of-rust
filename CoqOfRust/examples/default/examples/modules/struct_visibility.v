(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  Module  OpenBox.
  Section OpenBox.
    Context (T : Set).
    
    Record t : Set := {
      contents : T;
    }.
    
    Definition Get_contents :=
      Ref.map
        (fun α => Some α.(contents))
        (fun β α => Some (α <| contents := β |>)).
  End OpenBox.
  End OpenBox.
  
  Module  ClosedBox.
  Section ClosedBox.
    Context (T : Set).
    
    Record t : Set := {
      contents : T;
    }.
    
    Definition Get_contents :=
      Ref.map
        (fun α => Some α.(contents))
        (fun β α => Some (α <| contents := β |>)).
  End ClosedBox.
  End ClosedBox.
  
  Module  Impl_struct_visibility_my_ClosedBox_t_T.
  Section Impl_struct_visibility_my_ClosedBox_t_T.
    Context {T : Set}.
    
    Definition Self : Set := struct_visibility.my.ClosedBox.t T.
    
    (*
            pub fn new(contents: T) -> ClosedBox<T> {
                ClosedBox { contents: contents }
            }
    *)
    Definition new (contents : T) : M (struct_visibility.my.ClosedBox.t T) :=
      let* contents := M.alloc contents in
      let* α0 : T := M.read contents in
      M.pure {| struct_visibility.my.ClosedBox.contents := α0; |}.
    
    Global Instance AssociatedFunction_new :
      Notations.DoubleColon Self "new" := {
      Notations.double_colon := new;
    }.
  End Impl_struct_visibility_my_ClosedBox_t_T.
  End Impl_struct_visibility_my_ClosedBox_t_T.
End my.

Module  OpenBox.
Section OpenBox.
  Context (T : Set).
  
  Record t : Set := {
    contents : T;
  }.
  
  Definition Get_contents :=
    Ref.map
      (fun α => Some α.(contents))
      (fun β α => Some (α <| contents := β |>)).
End OpenBox.
End OpenBox.

Module  ClosedBox.
Section ClosedBox.
  Context (T : Set).
  
  Record t : Set := {
    contents : T;
  }.
  
  Definition Get_contents :=
    Ref.map
      (fun α => Some α.(contents))
      (fun β α => Some (α <| contents := β |>)).
End ClosedBox.
End ClosedBox.

Module  Impl_struct_visibility_my_ClosedBox_t_T_2.
Section Impl_struct_visibility_my_ClosedBox_t_T_2.
  Context {T : Set}.
  
  Definition Self : Set := struct_visibility.my.ClosedBox.t T.
  
  (*
          pub fn new(contents: T) -> ClosedBox<T> {
              ClosedBox { contents: contents }
          }
  *)
  Definition new (contents : T) : M (struct_visibility.my.ClosedBox.t T) :=
    let* contents := M.alloc contents in
    let* α0 : T := M.read contents in
    M.pure {| struct_visibility.my.ClosedBox.contents := α0; |}.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
End Impl_struct_visibility_my_ClosedBox_t_T_2.
End Impl_struct_visibility_my_ClosedBox_t_T_2.

(*
fn main() {
    // Public structs with public fields can be constructed as usual
    let open_box = my::OpenBox {
        contents: "public information",
    };

    // and their fields can be normally accessed.
    println!("The open box contains: {}", open_box.contents);

    // Public structs with private fields cannot be constructed using field names.
    // Error! `ClosedBox` has private fields
    //let closed_box = my::ClosedBox { contents: "classified information" };
    // TODO ^ Try uncommenting this line

    // However, structs with private fields can be created using
    // public constructors
    let _closed_box = my::ClosedBox::new("classified information");

    // and the private fields of a public struct cannot be accessed.
    // Error! The `contents` field is private
    //println!("The closed box contains: {}", _closed_box.contents);
    // TODO ^ Try uncommenting this line
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* open_box : M.Val (struct_visibility.my.OpenBox.t (ref str.t)) :=
    let* α0 : ref str.t := M.read (mk_str "public information") in
    M.alloc {| struct_visibility.my.OpenBox.contents := α0; |} in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "The open box contains: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow (struct_visibility.my.OpenBox.Get_contents open_box))) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _closed_box : M.Val (struct_visibility.my.ClosedBox.t (ref str.t)) :=
    let* α0 : ref str.t := M.read (mk_str "classified information") in
    let* α1 : struct_visibility.my.ClosedBox.t (ref str.t) :=
      M.call ((struct_visibility.my.ClosedBox.t (ref str.t))::["new"] α0) in
    M.alloc α1 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
