(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  
  
  
  
  Module  Impl_struct_visibility_my_ClosedBox_T.
  Section Impl_struct_visibility_my_ClosedBox_T.
    Context {T : Set}.
    
    Definition Self : Set :=
      Ty.apply (Ty.path "struct_visibility::my::ClosedBox") [T].
    
    (*
            pub fn new(contents: T) -> ClosedBox<T> {
                ClosedBox { contents: contents }
            }
    *)
    Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
      match 𝜏, α with
      | [], [contents] =>
        let* contents := M.alloc contents in
        let* α0 : T := M.read contents in
        M.pure {| struct_visibility.my.ClosedBox.contents := α0; |}
      | _, _ => M.impossible
      end.
    
    Definition AssociatedFunction_new : Instance.t := {
      Notations.double_colon := new;
    }.
  End Impl_struct_visibility_my_ClosedBox_T.
  End Impl_struct_visibility_my_ClosedBox_T.
End my.

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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* open_box :
        Ty.apply
          (Ty.path "struct_visibility::my::OpenBox")
          [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "public information") in
      M.alloc {| struct_visibility.my.OpenBox.contents := α0; |} in
    let* _ : Ty.tuple :=
      let* _ : Ty.tuple :=
        let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "The open box contains: ") in
        let* α1 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
          M.read (mk_str "
") in
        let* α2 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
          M.alloc [ α0; α1 ] in
        let* α3 : Ty.apply (Ty.path "core::fmt::rt::Argument") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::rt::Argument") [])::["new_display"]
              (borrow (struct_visibility.my.OpenBox.Get_contents open_box))) in
        let* α4 :
            Ty.apply
              (Ty.path "array")
              [Ty.apply (Ty.path "core::fmt::rt::Argument") []] :=
          M.alloc [ α3 ] in
        let* α5 : Ty.apply (Ty.path "core::fmt::Arguments") [] :=
          M.call
            ((Ty.apply (Ty.path "core::fmt::Arguments") [])::["new_v1"]
              (pointer_coercion "Unsize" (borrow α2))
              (pointer_coercion "Unsize" (borrow α4))) in
        let* α6 : Ty.tuple := M.call (std.io.stdio._print α5) in
        M.alloc α6 in
      M.alloc tt in
    let* _closed_box :
        Ty.apply
          (Ty.path "struct_visibility::my::ClosedBox")
          [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "classified information") in
      let* α1 :
          Ty.apply
            (Ty.path "struct_visibility::my::ClosedBox")
            [Ty.apply (Ty.path "ref") [Ty.path "str"]] :=
        M.call
          ((Ty.apply
                (Ty.path "struct_visibility::my::ClosedBox")
                [Ty.apply (Ty.path "ref") [Ty.path "str"]])::["new"]
            α0) in
      M.alloc α1 in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
