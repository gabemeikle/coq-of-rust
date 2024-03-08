(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn analyze_slice(slice: &[i32]) {
    println!("first element of the slice: {}", slice[0]);
    println!("the slice has {} elements", slice.len());
}
*)
Definition analyze_slice (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ slice ] =>
    let* slice := M.alloc slice in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "first element of the slice: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 := M.read slice in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ α4[M.alloc ((Integer.of_Z 0) : Ty.path "usize")] ] in
        let* α6 := M.alloc [ α5 ] in
        let* α7 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α6 ] in
        let* α8 := M.call α0 [ α7 ] in
        M.alloc α8 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "the slice has ") in
        let* α2 := M.read (mk_str " elements
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 := M.read slice in
        let* α5 :=
          M.call
            (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["len"]
            [ α4 ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α6 ] in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α8 ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Fixed-size array (type signature is superfluous)
    let xs: [i32; 5] = [1, 2, 3, 4, 5];

    // All elements can be initialized to the same value
    let ys: [i32; 500] = [0; 500];

    // Indexing starts at 0
    println!("first element of the array: {}", xs[0]);
    println!("second element of the array: {}", xs[1]);

    // `len` returns the count of elements in the array
    println!("number of elements in array: {}", xs.len());

    // Arrays are stack allocated
    println!("array occupies {} bytes", mem::size_of_val(&xs));

    // Arrays can be automatically borrowed as slices
    println!("borrow the whole array as a slice");
    analyze_slice(&xs);

    // Slices can point to a section of an array
    // They are of the form [starting_index..ending_index]
    // starting_index is the first position in the slice
    // ending_index is one more than the last position in the slice
    println!("borrow a section of the array as a slice");
    analyze_slice(&ys[1 .. 4]);

    // Example of empty slice `&[]`
    let empty_array: [u32; 0] = [];
    assert_eq!(&empty_array, &[]);
    assert_eq!(&empty_array, &[][..]); // same but more verbose

    // Arrays can be safely accessed using `.get`, which returns an
    // `Option`. This can be matched as shown below, or used with
    // `.expect()` if you would like the program to exit with a nice
    // message instead of happily continue.
    for i in 0..xs.len() + 1 { // OOPS, one element too far
        match xs.get(i) {
            Some(xval) => println!("{}: {}", i, xval),
            None => println!("Slow down! {} is too far!", i),
        }
    }

    // Out of bound indexing causes runtime error
    //println!("{}", xs[5]);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* xs :=
      M.alloc
        [
          (Integer.of_Z 1) : Ty.path "i32";
          (Integer.of_Z 2) : Ty.path "i32";
          (Integer.of_Z 3) : Ty.path "i32";
          (Integer.of_Z 4) : Ty.path "i32";
          (Integer.of_Z 5) : Ty.path "i32"
        ] in
    let* ys := M.alloc (repeat ((Integer.of_Z 0) : Ty.path "i32") 500) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "first element of the array: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ xs[M.alloc ((Integer.of_Z 0) : Ty.path "usize")] ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α5 ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "second element of the array: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ xs[M.alloc ((Integer.of_Z 1) : Ty.path "usize")] ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α5 ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "number of elements in array: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["len"]
            [ pointer_coercion "Unsize" xs ] in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α7 ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "array occupies ") in
        let* α2 := M.read (mk_str " bytes
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 := M.var "core::mem::size_of_val" in
        let* α5 := M.call α4 [ xs ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α6 ] in
        let* α8 := M.alloc [ α7 ] in
        let* α9 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α8 ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "borrow the whole array as a slice
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" α2 ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* _ :=
      let* α0 := M.var "arrays_and_slices::analyze_slice" in
      let* α1 := M.call α0 [ pointer_coercion "Unsize" xs ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 :=
          M.read (mk_str "borrow a section of the array as a slice
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" α2 ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* _ :=
      let* α0 := M.var "arrays_and_slices::analyze_slice" in
      let* α1 :=
        M.get_method
          "core::ops::index::Index"
          "index"
          [
            (* Self *) Ty.apply (Ty.path "array") [ Ty.path "i32" ];
            (* Idx *)
              Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ]
          ] in
      let* α2 :=
        M.call
          α1
          [
            ys;
            Value.StructRecord
              "core::ops::range::Range"
              [
                ("start", (Integer.of_Z 1) : Ty.path "usize");
                ("end_", (Integer.of_Z 4) : Ty.path "usize")
              ]
          ] in
      let* α3 := M.call α0 [ α2 ] in
      M.alloc α3 in
    let* empty_array := M.alloc [] in
    let* _ :=
      let* α0 := M.alloc empty_array in
      let* α1 := M.alloc [] in
      let* α2 := M.alloc α1 in
      let* α3 := M.alloc (α0, α2) in
      match_operator
        α3
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 := M.var "UnOp::not" in
              let* α1 :=
                M.get_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "ref")
                        [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "ref")
                        [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ]
                  ] in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 := M.call α1 [ α2; α3 ] in
              let* α5 := M.alloc (α0 α4) in
              let* α6 := M.read (use α5) in
              if α6 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.var "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            Ty.tuple []
        ] in
    let* _ :=
      let* α0 := M.alloc empty_array in
      let* α1 :=
        M.get_method
          "core::ops::index::Index"
          "index"
          [
            (* Self *) Ty.apply (Ty.path "array") [ Ty.path "u32" ];
            (* Idx *) Ty.path "core::ops::range::RangeFull"
          ] in
      let* α2 := M.alloc [] in
      let* α3 := M.call α1 [ α2; core.ops.range.RangeFull.Build ] in
      let* α4 := M.alloc α3 in
      let* α5 := M.alloc (α0, α4) in
      match_operator
        α5
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 := M.var "UnOp::not" in
              let* α1 :=
                M.get_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "ref")
                        [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "ref")
                        [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ]
                  ] in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 := M.call α1 [ α2; α3 ] in
              let* α5 := M.alloc (α0 α4) in
              let* α6 := M.read (use α5) in
              if α6 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.var "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            Ty.tuple []
        ] in
    let* α0 :=
      M.get_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ]
        ] in
    let* α1 := M.var "BinOp::Panic::add" in
    let* α2 :=
      M.call
        (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["len"]
        [ pointer_coercion "Unsize" xs ] in
    let* α3 := α1 α2 ((Integer.of_Z 1) : Ty.path "usize") in
    let* α4 :=
      M.call
        α0
        [
          Value.StructRecord
            "core::ops::range::Range"
            [ ("start", (Integer.of_Z 0) : Ty.path "usize"); ("end_", α3) ]
        ] in
    let* α5 := M.alloc α4 in
    let* α6 :=
      match_operator
        α5
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
                          [ Ty.path "usize" ]
                    ] in
                let* α1 := M.call α0 [ iter ] in
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
                        let* γ0_0 :=
                          let* α0 := M.var "core::option::Option::Get_Some_0" in
                          M.pure (α0 γ) in
                        let* i := M.copy γ0_0 in
                        let* α0 := M.read i in
                        let* α1 :=
                          M.call
                            (Ty.apply
                                (Ty.path "slice")
                                [ Ty.path "i32" ])::["get"]
                            [ pointer_coercion "Unsize" xs; α0 ] in
                        let* α2 := M.alloc α1 in
                        match_operator
                          α2
                          [
                            fun γ =>
                              (let* α0 := M.read γ in
                              match α0 with
                              | core.option.Option.Some _ =>
                                let* γ0_0 :=
                                  let* α0 :=
                                    M.var "core::option::Option::Get_Some_0" in
                                  M.pure (α0 γ) in
                                let* xval := M.copy γ0_0 in
                                let* _ :=
                                  let* α0 := M.var "std::io::stdio::_print" in
                                  let* α1 := M.read (mk_str "") in
                                  let* α2 := M.read (mk_str ": ") in
                                  let* α3 := M.read (mk_str "
") in
                                  let* α4 := M.alloc [ α1; α2; α3 ] in
                                  let* α5 :=
                                    M.call
                                      (Ty.path
                                          "core::fmt::rt::Argument")::["new_display"]
                                      [ i ] in
                                  let* α6 :=
                                    M.call
                                      (Ty.path
                                          "core::fmt::rt::Argument")::["new_display"]
                                      [ xval ] in
                                  let* α7 := M.alloc [ α5; α6 ] in
                                  let* α8 :=
                                    M.call
                                      (Ty.path
                                          "core::fmt::Arguments")::["new_v1"]
                                      [
                                        pointer_coercion "Unsize" α4;
                                        pointer_coercion "Unsize" α7
                                      ] in
                                  let* α9 := M.call α0 [ α8 ] in
                                  M.alloc α9 in
                                M.alloc tt
                              | _ => M.break_match 
                              end) :
                              Ty.tuple [];
                            fun γ =>
                              (let* α0 := M.read γ in
                              match α0 with
                              | core.option.Option.None =>
                                let* _ :=
                                  let* α0 := M.var "std::io::stdio::_print" in
                                  let* α1 := M.read (mk_str "Slow down! ") in
                                  let* α2 := M.read (mk_str " is too far!
") in
                                  let* α3 := M.alloc [ α1; α2 ] in
                                  let* α4 :=
                                    M.call
                                      (Ty.path
                                          "core::fmt::rt::Argument")::["new_display"]
                                      [ i ] in
                                  let* α5 := M.alloc [ α4 ] in
                                  let* α6 :=
                                    M.call
                                      (Ty.path
                                          "core::fmt::Arguments")::["new_v1"]
                                      [
                                        pointer_coercion "Unsize" α3;
                                        pointer_coercion "Unsize" α5
                                      ] in
                                  let* α7 := M.call α0 [ α6 ] in
                                  M.alloc α7 in
                                M.alloc tt
                              | _ => M.break_match 
                              end) :
                              Ty.tuple []
                          ]
                      | _ => M.break_match 
                      end) :
                      Ty.tuple []
                  ] in
              M.alloc tt)) :
            Ty.tuple []
        ] in
    M.read (use α6)
  | _, _ => M.impossible
  end.
