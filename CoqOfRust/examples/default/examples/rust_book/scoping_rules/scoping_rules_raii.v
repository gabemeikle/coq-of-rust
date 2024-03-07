(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn create_box() {
    // Allocate an integer on the heap
    let _box1 = Box::new(3i32);

    // `_box1` is destroyed here, and memory gets freed
}
*)
Definition create_box (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _box1 :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::boxed::Box")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])::["new"]
          [ (Integer.of_Z 3) : Ty.path "i32" ] in
      M.alloc α0 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Allocate an integer on the heap
    let _box2 = Box::new(5i32);

    // A nested scope:
    {
        // Allocate an integer on the heap
        let _box3 = Box::new(4i32);

        // `_box3` is destroyed here, and memory gets freed
    }

    // Creating lots of boxes just for fun
    // There's no need to manually free memory!
    for _ in 0u32..1_000 {
        create_box();
    }

    // `_box2` is destroyed here, and memory gets freed
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _box2 :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::boxed::Box")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])::["new"]
          [ (Integer.of_Z 5) : Ty.path "i32" ] in
      M.alloc α0 in
    let* _ :=
      let* _box3 :=
        let* α0 :=
          M.call
            (Ty.apply
                (Ty.path "alloc::boxed::Box")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])::["new"]
            [ (Integer.of_Z 4) : Ty.path "i32" ] in
        M.alloc α0 in
      M.alloc tt in
    let* α0 :=
      M.get_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ]
        ] in
    let* α1 :=
      M.call
        α0
        [
          Value.StructRecord
            "core::ops::range::Range"
            [
              ("start", (Integer.of_Z 0) : Ty.path "u32");
              ("end_", (Integer.of_Z 1000) : Ty.path "u32")
            ]
        ] in
    let* α2 := M.alloc α1 in
    let* α3 :=
      match_operator
        α2
        [
          fun γ =>
            (let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_method
                    "core::iter::traits::iterator::Iterator"
                    "next"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "core::ops::range::Range")
                          [ Ty.path "u32" ]
                    ] in
                let* α1 := M.call α0 [ borrow_mut iter ] in
                let* α2 := M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.None =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match 
                      end) :
                      Ty.tuple [];
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.Some _ =>
                        let γ0_0 :=
                          (M.var "core::option::Option::Get_Some_0") γ in
                        let* _ :=
                          let* α0 :=
                            M.call
                              (M.var "scoping_rules_raii::create_box")
                              [] in
                          M.alloc α0 in
                        M.alloc tt
                      | _ => M.break_match 
                      end) :
                      Ty.tuple []
                  ] in
              M.alloc tt)) :
            Ty.tuple []
        ] in
    M.read (use α3)
  | _, _ => M.impossible
  end.
