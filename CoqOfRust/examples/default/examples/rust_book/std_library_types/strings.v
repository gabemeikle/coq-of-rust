(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // (all the type annotations are superfluous)
    // A reference to a string allocated in read only memory
    let pangram: &'static str = "the quick brown fox jumps over the lazy dog";
    println!("Pangram: {}", pangram);

    // Iterate over words in reverse, no new string is allocated
    println!("Words in reverse");
    for word in pangram.split_whitespace().rev() {
        println!("> {}", word);
    }

    // Copy chars into a vector, sort and remove duplicates
    let mut chars: Vec<char> = pangram.chars().collect();
    chars.sort();
    chars.dedup();

    // Create an empty and growable `String`
    let mut string = String::new();
    for c in chars {
        // Insert a char at the end of string
        string.push(c);
        // Insert a string at the end of string
        string.push_str(", ");
    }

    // The trimmed string is a slice to the original string, hence no new
    // allocation is performed
    let chars_to_trim: &[char] = &[' ', ','];
    let trimmed_str: &str = string.trim_matches(chars_to_trim);
    println!("Used characters: {}", trimmed_str);

    // Heap allocate a string
    let alice = String::from("I like dogs");
    // Allocate new memory and store the modified string there
    let bob: String = alice.replace("dog", "cat");

    println!("Alice says: {}", alice);
    println!("Bob says: {}", bob);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* pangram :=
      M.copy (mk_str "the quick brown fox jumps over the lazy dog") in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Pangram: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ pangram ] in
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
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const" in
        let* α2 := M.read (mk_str "Words in reverse
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::iter::adapters::rev::Rev")
                [ Ty.path "core::str::iter::SplitWhitespace" ]
          ] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          "rev"
          [ (* Self *) Ty.path "core::str::iter::SplitWhitespace" ] in
      let* α2 := M.get_associated_function (Ty.path "str") "split_whitespace" in
      let* α3 := M.read pangram in
      let* α4 := M.call α2 [ α3 ] in
      let* α5 := M.call α1 [ α4 ] in
      let* α6 := M.call α0 [ α5 ] in
      let* α7 := M.alloc α6 in
      let* α8 :=
        match_operator
          α7
          (Value.Array
            [
              fun γ =>
                (let* iter := M.copy γ in
                M.loop
                  (let* _ :=
                    let* α0 :=
                      M.get_trait_method
                        "core::iter::traits::iterator::Iterator"
                        "next"
                        [
                          (* Self *)
                            Ty.apply
                              (Ty.path "core::iter::adapters::rev::Rev")
                              [ Ty.path "core::str::iter::SplitWhitespace" ]
                        ] in
                    let* α1 := M.call α0 [ iter ] in
                    let* α2 := M.alloc α1 in
                    match_operator
                      α2
                      (Value.Array
                        [
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            | core.option.Option.None =>
                              let* α0 := M.break in
                              let* α1 := M.read α0 in
                              let* α2 := M.never_to_any α1 in
                              M.alloc α2
                            | _ => M.break_match
                            end);
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            | core.option.Option.Some _ =>
                              let* γ0_0 :=
                                let* α0 :=
                                  M.var "core::option::Option::Get_Some_0" in
                                M.pure (α0 γ) in
                              let* word := M.copy γ0_0 in
                              let* _ :=
                                let* _ :=
                                  let* α0 :=
                                    M.get_function
                                      "std::io::stdio::_print"
                                      [] in
                                  let* α1 :=
                                    M.get_associated_function
                                      (Ty.path "core::fmt::Arguments")
                                      "new_v1" in
                                  let* α2 := M.read (mk_str "> ") in
                                  let* α3 := M.read (mk_str "
") in
                                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                                  let* α5 :=
                                    M.get_associated_function
                                      (Ty.path "core::fmt::rt::Argument")
                                      "new_display" in
                                  let* α6 := M.call α5 [ word ] in
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
                              M.alloc (Value.Tuple [])
                            | _ => M.break_match
                            end)
                        ]) in
                  M.alloc (Value.Tuple [])))
            ]) in
      M.pure (M.use α8) in
    let* chars :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          "collect"
          [
            (* Self *) Ty.path "core::str::iter::Chars";
            (* B *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "char"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α1 := M.get_associated_function (Ty.path "str") "chars" in
      let* α2 := M.read pangram in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      M.alloc α4 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "char" ])
          "sort" in
      let* α1 :=
        M.get_trait_method
          "core::ops::deref::DerefMut"
          "deref_mut"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "char"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α2 := M.call α1 [ chars ] in
      let* α3 := M.call α0 [ α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "char"; Ty.path "alloc::alloc::Global" ])
          "dedup" in
      let* α1 := M.call α0 [ chars ] in
      M.alloc α1 in
    let* string :=
      let* α0 :=
        M.get_associated_function (Ty.path "alloc::string::String") "new" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "char"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α1 := M.read chars in
      let* α2 := M.call α0 [ α1 ] in
      let* α3 := M.alloc α2 in
      let* α4 :=
        match_operator
          α3
          (Value.Array
            [
              fun γ =>
                (let* iter := M.copy γ in
                M.loop
                  (let* _ :=
                    let* α0 :=
                      M.get_trait_method
                        "core::iter::traits::iterator::Iterator"
                        "next"
                        [
                          (* Self *)
                            Ty.apply
                              (Ty.path "alloc::vec::into_iter::IntoIter")
                              [ Ty.path "char"; Ty.path "alloc::alloc::Global" ]
                        ] in
                    let* α1 := M.call α0 [ iter ] in
                    let* α2 := M.alloc α1 in
                    match_operator
                      α2
                      (Value.Array
                        [
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            | core.option.Option.None =>
                              let* α0 := M.break in
                              let* α1 := M.read α0 in
                              let* α2 := M.never_to_any α1 in
                              M.alloc α2
                            | _ => M.break_match
                            end);
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            | core.option.Option.Some _ =>
                              let* γ0_0 :=
                                let* α0 :=
                                  M.var "core::option::Option::Get_Some_0" in
                                M.pure (α0 γ) in
                              let* c := M.copy γ0_0 in
                              let* _ :=
                                let* α0 :=
                                  M.get_associated_function
                                    (Ty.path "alloc::string::String")
                                    "push" in
                                let* α1 := M.read c in
                                let* α2 := M.call α0 [ string; α1 ] in
                                M.alloc α2 in
                              let* _ :=
                                let* α0 :=
                                  M.get_associated_function
                                    (Ty.path "alloc::string::String")
                                    "push_str" in
                                let* α1 := M.read (mk_str ", ") in
                                let* α2 := M.call α0 [ string; α1 ] in
                                M.alloc α2 in
                              M.alloc (Value.Tuple [])
                            | _ => M.break_match
                            end)
                        ]) in
                  M.alloc (Value.Tuple [])))
            ]) in
      M.pure (M.use α4) in
    let* chars_to_trim :=
      let* α0 :=
        M.alloc (Value.Array [ Value.UnicodeChar 32; Value.UnicodeChar 44 ]) in
      M.alloc (M.pointer_coercion (* Unsize *) α0) in
    let* trimmed_str :=
      let* α0 := M.get_associated_function (Ty.path "str") "trim_matches" in
      let* α1 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          "deref"
          [ (* Self *) Ty.path "alloc::string::String" ] in
      let* α2 := M.call α1 [ string ] in
      let* α3 := M.read chars_to_trim in
      let* α4 := M.call α0 [ α2; α3 ] in
      M.alloc α4 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Used characters: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ trimmed_str ] in
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
    let* alice :=
      let* α0 :=
        M.get_trait_method
          "core::convert::From"
          "from"
          [
            (* Self *) Ty.path "alloc::string::String";
            (* T *) Ty.apply (Ty.path "&") [ Ty.path "str" ]
          ] in
      let* α1 := M.read (mk_str "I like dogs") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* bob :=
      let* α0 := M.get_associated_function (Ty.path "str") "replace" in
      let* α1 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          "deref"
          [ (* Self *) Ty.path "alloc::string::String" ] in
      let* α2 := M.call α1 [ alice ] in
      let* α3 := M.read (mk_str "dog") in
      let* α4 := M.read (mk_str "cat") in
      let* α5 := M.call α0 [ α2; α3; α4 ] in
      M.alloc α5 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Alice says: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ alice ] in
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
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Bob says: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ bob ] in
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
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
