(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  (* Struct
    {
      name := "OpenBox";
      ty_params := [ ("T", None) ];
      fields := [ ("contents", T) ];
    } *)
  
  (* Struct
    {
      name := "ClosedBox";
      ty_params := [ ("T", None) ];
      fields := [ ("contents", T) ];
    } *)
  
  Module Impl_struct_visibility_my_ClosedBox_T.
    Definition Self (T : Ty.t) : Ty.t :=
      Ty.apply (Ty.path "struct_visibility::my::ClosedBox") [ T ].
    
    (*
            pub fn new(contents: T) -> ClosedBox<T> {
                ClosedBox { contents: contents }
            }
    *)
    Definition new (T : Ty.t) (𝜏 : list Ty.t) (α : list Value.t) : M :=
      let Self : Ty.t := Self T in
      match 𝜏, α with
      | [], [ contents ] =>
        let* contents := M.alloc contents in
        let* α0 := M.read contents in
        M.pure
          (Value.StructRecord
            "struct_visibility::my::ClosedBox"
            [ ("contents", α0) ])
      | _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_new :
      forall (T : Ty.t),
      M.IsAssociatedFunction (Self T) "new" (new T).
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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* open_box :=
      let* α0 := M.read (mk_str "public information") in
      M.alloc
        (Value.StructRecord
          "struct_visibility::my::OpenBox"
          [ ("contents", α0) ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "The open box contains: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ M.get_struct_record open_box "contents" ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _closed_box :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "struct_visibility::my::ClosedBox")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "new" in
      let* α1 := M.read (mk_str "classified information") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
