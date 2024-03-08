(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Fibonacci *)

Module Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.
  (*
      type Item = u32;
  *)
  Definition Item : Set := Ty.path "u32".
  
  (*
      fn next(&mut self) -> Option<Self::Item> {
          let current = self.curr;
  
          self.curr = self.next;
          self.next = current + self.next;
  
          // Since there's no endpoint to a Fibonacci sequence, the `Iterator`
          // will never return `None`, and `Some` is always returned.
          Some(current)
      }
  *)
  Definition next (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* current :=
        let* α0 := M.var "iterators::Fibonacci::Get_curr" in
        let* α1 := M.read self in
        M.copy (α0 α1) in
      let* _ :=
        let* α0 := M.var "iterators::Fibonacci::Get_curr" in
        let* α1 := M.read self in
        let* α2 := M.var "iterators::Fibonacci::Get_next" in
        let* α3 := M.read self in
        let* α4 := M.read (α2 α3) in
        assign (α0 α1) α4 in
      let* _ :=
        let* α0 := M.var "iterators::Fibonacci::Get_next" in
        let* α1 := M.read self in
        let* α2 := M.var "BinOp::Panic::add" in
        let* α3 := M.read current in
        let* α4 := M.var "iterators::Fibonacci::Get_next" in
        let* α5 := M.read self in
        let* α6 := M.read (α4 α5) in
        let* α7 := α2 α3 α6 in
        assign (α0 α1) α7 in
      let* α0 := M.read current in
      let* α0 :=
        M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::iter::traits::iterator::Iterator"
      (* Self *) (Ty.path "iterators::Fibonacci")
      []
      [ ("Item", TODO); ("next", InstanceField.Method next) ]
      [].
End Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.

(*
fn fibonacci() -> Fibonacci {
    Fibonacci { curr: 0, next: 1 }
}
*)
Definition fibonacci (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    M.pure
      (Value.StructRecord
        "iterators::Fibonacci"
        [
          ("curr", (Integer.of_Z 0) : Ty.path "u32");
          ("next", (Integer.of_Z 1) : Ty.path "u32")
        ])
  | _, _ => M.impossible
  end.

(*
fn main() {
    // `0..3` is an `Iterator` that generates: 0, 1, and 2.
    let mut sequence = 0..3;

    println!("Four consecutive `next` calls on 0..3");
    println!("> {:?}", sequence.next());
    println!("> {:?}", sequence.next());
    println!("> {:?}", sequence.next());
    println!("> {:?}", sequence.next());

    // `for` works through an `Iterator` until it returns `None`.
    // Each `Some` value is unwrapped and bound to a variable (here, `i`).
    println!("Iterate through 0..3 using `for`");
    for i in 0..3 {
        println!("> {}", i);
    }

    // The `take(n)` method reduces an `Iterator` to its first `n` terms.
    println!("The first four terms of the Fibonacci sequence are: ");
    for i in fibonacci().take(4) {
        println!("> {}", i);
    }

    // The `skip(n)` method shortens an `Iterator` by dropping its first `n` terms.
    println!("The next four terms of the Fibonacci sequence are: ");
    for i in fibonacci().skip(4).take(4) {
        println!("> {}", i);
    }

    let array = [1u32, 3, 3, 7];

    // The `iter` method produces an `Iterator` over an array/slice.
    println!("Iterate the following array {:?}", &array);
    for i in array.iter() {
        println!("> {}", i);
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* sequence :=
      M.alloc
        (Value.StructRecord
          "core::ops::range::Range"
          [
            ("start", (Integer.of_Z 0) : Ty.path "i32");
            ("end_", (Integer.of_Z 3) : Ty.path "i32")
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Four consecutive `next` calls on 0..3
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
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "> ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_method
            "core::iter::traits::iterator::Iterator"
            "next"
            [
              (* Self *)
                Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ]
            ] in
        let* α5 := M.call α4 [ sequence ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ α6 ] in
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
        let* α1 := M.read (mk_str "> ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_method
            "core::iter::traits::iterator::Iterator"
            "next"
            [
              (* Self *)
                Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ]
            ] in
        let* α5 := M.call α4 [ sequence ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ α6 ] in
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
        let* α1 := M.read (mk_str "> ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_method
            "core::iter::traits::iterator::Iterator"
            "next"
            [
              (* Self *)
                Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ]
            ] in
        let* α5 := M.call α4 [ sequence ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ α6 ] in
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
        let* α1 := M.read (mk_str "> ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_method
            "core::iter::traits::iterator::Iterator"
            "next"
            [
              (* Self *)
                Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ]
            ] in
        let* α5 := M.call α4 [ sequence ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ α6 ] in
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
        let* α1 := M.read (mk_str "Iterate through 0..3 using `for`
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
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ]
          ] in
      let* α1 :=
        M.call
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [
                ("start", (Integer.of_Z 0) : Ty.path "i32");
                ("end_", (Integer.of_Z 3) : Ty.path "i32")
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
                            [ Ty.path "i32" ]
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
                            let* α0 :=
                              M.var "core::option::Option::Get_Some_0" in
                            M.pure (α0 γ) in
                          let* i := M.copy γ0_0 in
                          let* _ :=
                            let* _ :=
                              let* α0 := M.var "std::io::stdio::_print" in
                              let* α1 := M.read (mk_str "> ") in
                              let* α2 := M.read (mk_str "
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
                                  (Ty.path "core::fmt::Arguments")::["new_v1"]
                                  [
                                    pointer_coercion "Unsize" α3;
                                    pointer_coercion "Unsize" α5
                                  ] in
                              let* α7 := M.call α0 [ α6 ] in
                              M.alloc α7 in
                            M.alloc tt in
                          M.alloc tt
                        | _ => M.break_match 
                        end) :
                        Ty.tuple []
                    ] in
                M.alloc tt)) :
              Ty.tuple []
          ] in
      M.pure (use α3) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 :=
          M.read
            (mk_str "The first four terms of the Fibonacci sequence are: 
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
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::iter::adapters::take::Take")
                [ Ty.path "iterators::Fibonacci" ]
          ] in
      let* α1 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "take"
          [ (* Self *) Ty.path "iterators::Fibonacci" ] in
      let* α2 := M.var "iterators::fibonacci" in
      let* α3 := M.call α2 [] in
      let* α4 := M.call α1 [ α3; (Integer.of_Z 4) : Ty.path "usize" ] in
      let* α5 := M.call α0 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 :=
        match_operator
          α6
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
                            (Ty.path "core::iter::adapters::take::Take")
                            [ Ty.path "iterators::Fibonacci" ]
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
                            let* α0 :=
                              M.var "core::option::Option::Get_Some_0" in
                            M.pure (α0 γ) in
                          let* i := M.copy γ0_0 in
                          let* _ :=
                            let* _ :=
                              let* α0 := M.var "std::io::stdio::_print" in
                              let* α1 := M.read (mk_str "> ") in
                              let* α2 := M.read (mk_str "
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
                                  (Ty.path "core::fmt::Arguments")::["new_v1"]
                                  [
                                    pointer_coercion "Unsize" α3;
                                    pointer_coercion "Unsize" α5
                                  ] in
                              let* α7 := M.call α0 [ α6 ] in
                              M.alloc α7 in
                            M.alloc tt in
                          M.alloc tt
                        | _ => M.break_match 
                        end) :
                        Ty.tuple []
                    ] in
                M.alloc tt)) :
              Ty.tuple []
          ] in
      M.pure (use α7) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 :=
          M.read
            (mk_str "The next four terms of the Fibonacci sequence are: 
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
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::iter::adapters::take::Take")
                [
                  Ty.apply
                    (Ty.path "core::iter::adapters::skip::Skip")
                    [ Ty.path "iterators::Fibonacci" ]
                ]
          ] in
      let* α1 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "take"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::iter::adapters::skip::Skip")
                [ Ty.path "iterators::Fibonacci" ]
          ] in
      let* α2 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "skip"
          [ (* Self *) Ty.path "iterators::Fibonacci" ] in
      let* α3 := M.var "iterators::fibonacci" in
      let* α4 := M.call α3 [] in
      let* α5 := M.call α2 [ α4; (Integer.of_Z 4) : Ty.path "usize" ] in
      let* α6 := M.call α1 [ α5; (Integer.of_Z 4) : Ty.path "usize" ] in
      let* α7 := M.call α0 [ α6 ] in
      let* α8 := M.alloc α7 in
      let* α9 :=
        match_operator
          α8
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
                            (Ty.path "core::iter::adapters::take::Take")
                            [
                              Ty.apply
                                (Ty.path "core::iter::adapters::skip::Skip")
                                [ Ty.path "iterators::Fibonacci" ]
                            ]
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
                            let* α0 :=
                              M.var "core::option::Option::Get_Some_0" in
                            M.pure (α0 γ) in
                          let* i := M.copy γ0_0 in
                          let* _ :=
                            let* _ :=
                              let* α0 := M.var "std::io::stdio::_print" in
                              let* α1 := M.read (mk_str "> ") in
                              let* α2 := M.read (mk_str "
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
                                  (Ty.path "core::fmt::Arguments")::["new_v1"]
                                  [
                                    pointer_coercion "Unsize" α3;
                                    pointer_coercion "Unsize" α5
                                  ] in
                              let* α7 := M.call α0 [ α6 ] in
                              M.alloc α7 in
                            M.alloc tt in
                          M.alloc tt
                        | _ => M.break_match 
                        end) :
                        Ty.tuple []
                    ] in
                M.alloc tt)) :
              Ty.tuple []
          ] in
      M.pure (use α9) in
    let* array_ :=
      M.alloc
        [
          (Integer.of_Z 1) : Ty.path "u32";
          (Integer.of_Z 3) : Ty.path "u32";
          (Integer.of_Z 3) : Ty.path "u32";
          (Integer.of_Z 7) : Ty.path "u32"
        ] in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Iterate the following array ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 := M.alloc array_ in
        let* α5 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ α4 ] in
        let* α6 := M.alloc [ α5 ] in
        let* α7 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α6 ] in
        let* α8 := M.call α0 [ α7 ] in
        M.alloc α8 in
      M.alloc tt in
    let* α0 :=
      M.get_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "u32" ]
        ] in
    let* α1 :=
      M.call
        (Ty.apply (Ty.path "slice") [ Ty.path "u32" ])::["iter"]
        [ pointer_coercion "Unsize" array_ ] in
    let* α2 := M.call α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
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
                          (Ty.path "core::slice::iter::Iter")
                          [ Ty.path "u32" ]
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
                        let* _ :=
                          let* _ :=
                            let* α0 := M.var "std::io::stdio::_print" in
                            let* α1 := M.read (mk_str "> ") in
                            let* α2 := M.read (mk_str "
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
                                (Ty.path "core::fmt::Arguments")::["new_v1"]
                                [
                                  pointer_coercion "Unsize" α3;
                                  pointer_coercion "Unsize" α5
                                ] in
                            let* α7 := M.call α0 [ α6 ] in
                            M.alloc α7 in
                          M.alloc tt in
                        M.alloc tt
                      | _ => M.break_match 
                      end) :
                      Ty.tuple []
                  ] in
              M.alloc tt)) :
            Ty.tuple []
        ] in
    M.read (use α4)
  | _, _ => M.impossible
  end.
