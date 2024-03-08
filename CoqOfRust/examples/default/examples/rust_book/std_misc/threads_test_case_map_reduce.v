(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // This is our data to process.
    // We will calculate the sum of all digits via a threaded  map-reduce algorithm.
    // Each whitespace separated chunk will be handled in a different thread.
    //
    // TODO: see what happens to the output if you insert spaces!
    let data = "86967897737416471853297327050364959
11861322575564723963297542624962850
70856234701860851907960690014725639
38397966707106094172783238747669219
52380795257888236525459303330302837
58495327135744041048897885734297812
69920216438980873548808413720956532
16278424637452589860345374828574668";

    // Make a vector to hold the child-threads which we will spawn.
    let mut children = vec![];

    /*************************************************************************
     * "Map" phase
     *
     * Divide our data into segments, and apply initial processing
     ************************************************************************/

    // split our data into segments for individual calculation
    // each chunk will be a reference (&str) into the actual data
    let chunked_data = data.split_whitespace();

    // Iterate over the data segments.
    // .enumerate() adds the current loop index to whatever is iterated
    // the resulting tuple "(index, element)" is then immediately
    // "destructured" into two variables, "i" and "data_segment" with a
    // "destructuring assignment"
    for (i, data_segment) in chunked_data.enumerate() {
        println!("data segment {} is \"{}\"", i, data_segment);

        // Process each data segment in a separate thread
        //
        // spawn() returns a handle to the new thread,
        // which we MUST keep to access the returned value
        //
        // 'move || -> u32' is syntax for a closure that:
        // * takes no arguments ('||')
        // * takes ownership of its captured variables ('move') and
        // * returns an unsigned 32-bit integer ('-> u32')
        //
        // Rust is smart enough to infer the '-> u32' from
        // the closure itself so we could have left that out.
        //
        // TODO: try removing the 'move' and see what happens
        children.push(thread::spawn(move || -> u32 {
            // Calculate the intermediate sum of this segment:
            let result = data_segment
                // iterate over the characters of our segment..
                .chars()
                // .. convert text-characters to their number value..
                .map(|c| c.to_digit(10).expect("should be a digit"))
                // .. and sum the resulting iterator of numbers
                .sum();

            // println! locks stdout, so no text-interleaving occurs
            println!("processed segment {}, result={}", i, result);

            // "return" not needed, because Rust is an "expression language", the
            // last evaluated expression in each block is automatically its value.
            result
        }));
    }

    /*************************************************************************
     * "Reduce" phase
     *
     * Collect our intermediate results, and combine them into a final result
     ************************************************************************/

    // combine each thread's intermediate results into a single final sum.
    //
    // we use the "turbofish" ::<> to provide sum() with a type hint.
    //
    // TODO: try without the turbofish, by instead explicitly
    // specifying the type of final_result
    let final_result = children.into_iter().map(|c| c.join().unwrap()).sum::<u32>();

    println!("Final sum result: {}", final_result);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* data :=
      M.copy
        (mk_str
          "86967897737416471853297327050364959
11861322575564723963297542624962850
70856234701860851907960690014725639
38397966707106094172783238747669219
52380795257888236525459303330302837
58495327135744041048897885734297812
69920216438980873548808413720956532
16278424637452589860345374828574668") in
    let* children :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply (Ty.path "std::thread::JoinHandle") [ Ty.path "u32" ];
                Ty.path "alloc::alloc::Global"
              ])::["new"]
          [] in
      M.alloc α0 in
    let* chunked_data :=
      let* α0 := M.read data in
      let* α1 := M.call (Ty.path "str")::["split_whitespace"] [ α0 ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::iter::adapters::enumerate::Enumerate")
                [ Ty.path "core::str::iter::SplitWhitespace" ]
          ] in
      let* α1 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "enumerate"
          [ (* Self *) Ty.path "core::str::iter::SplitWhitespace" ] in
      let* α2 := M.read chunked_data in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
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
                            (Ty.path
                              "core::iter::adapters::enumerate::Enumerate")
                            [ Ty.path "core::str::iter::SplitWhitespace" ]
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
                          let* α0 := M.read γ0_0 in
                          match α0 with
                          | (_, _) =>
                            let γ1_0 := Tuple.Access.left γ0_0 in
                            let γ1_1 := Tuple.Access.right γ0_0 in
                            let* i := M.copy γ1_0 in
                            let* data_segment := M.copy γ1_1 in
                            let* _ :=
                              let* _ :=
                                let* α0 := M.var "std::io::stdio::_print" in
                                let* α1 := M.read (mk_str "data segment ") in
                                let* α2 := M.read (mk_str " is """) in
                                let* α3 := M.read (mk_str """
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
                                    [ data_segment ] in
                                let* α7 := M.alloc [ α5; α6 ] in
                                let* α8 :=
                                  M.call
                                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                                    [
                                      pointer_coercion "Unsize" α4;
                                      pointer_coercion "Unsize" α7
                                    ] in
                                let* α9 := M.call α0 [ α8 ] in
                                M.alloc α9 in
                              M.alloc tt in
                            let* _ :=
                              let* α0 := M.var "std::thread::spawn" in
                              let* α1 :=
                                M.call
                                  α0
                                  [
                                    fun (α0 : Ty.path "unit") =>
                                      (let* α0 := M.alloc α0 in
                                      match_operator
                                        α0
                                        [
                                          fun γ =>
                                            (let* result :=
                                              let* α0 :=
                                                M.get_method
                                                  "core::iter::traits::iterator::Iterator"
                                                  "sum"
                                                  [
                                                    (* Self *)
                                                      Ty.apply
                                                        (Ty.path
                                                          "core::iter::adapters::map::Map")
                                                        [
                                                          Ty.path
                                                            "core::str::iter::Chars";
                                                          Ty.function
                                                            [
                                                              Ty.tuple
                                                                [ Ty.path "char"
                                                                ]
                                                            ]
                                                            (Ty.path "u32")
                                                        ];
                                                    (* S *) Ty.path "u32"
                                                  ] in
                                              let* α1 :=
                                                M.get_method
                                                  "core::iter::traits::iterator::Iterator"
                                                  "map"
                                                  [
                                                    (* Self *)
                                                      Ty.path
                                                        "core::str::iter::Chars";
                                                    (* B *) Ty.path "u32";
                                                    (* F *)
                                                      Ty.function
                                                        [
                                                          Ty.tuple
                                                            [ Ty.path "char" ]
                                                        ]
                                                        (Ty.path "u32")
                                                  ] in
                                              let* α2 := M.read data_segment in
                                              let* α3 :=
                                                M.call
                                                  (Ty.path "str")::["chars"]
                                                  [ α2 ] in
                                              let* α4 :=
                                                M.call
                                                  α1
                                                  [
                                                    α3;
                                                    fun (α0 : Ty.path "char") =>
                                                      (let* α0 := M.alloc α0 in
                                                      match_operator
                                                        α0
                                                        [
                                                          fun γ =>
                                                            (let* c :=
                                                              M.copy γ in
                                                            let* α0 :=
                                                              M.read c in
                                                            let* α1 :=
                                                              M.call
                                                                (Ty.path
                                                                    "char")::["to_digit"]
                                                                [
                                                                  α0;
                                                                  (Integer.of_Z
                                                                      10) :
                                                                    Ty.path
                                                                      "u32"
                                                                ] in
                                                            let* α2 :=
                                                              M.read
                                                                (mk_str
                                                                  "should be a digit") in
                                                            M.call
                                                              (Ty.apply
                                                                  (Ty.path
                                                                    "core::option::Option")
                                                                  [
                                                                    Ty.path
                                                                      "u32"
                                                                  ])::["expect"]
                                                              [ α1; α2 ]) :
                                                            _
                                                        ]) :
                                                      _
                                                  ] in
                                              let* α5 := M.call α0 [ α4 ] in
                                              M.alloc α5 in
                                            let* _ :=
                                              let* _ :=
                                                let* α0 :=
                                                  M.var
                                                    "std::io::stdio::_print" in
                                                let* α1 :=
                                                  M.read
                                                    (mk_str
                                                      "processed segment ") in
                                                let* α2 :=
                                                  M.read (mk_str ", result=") in
                                                let* α3 :=
                                                  M.read (mk_str "
") in
                                                let* α4 :=
                                                  M.alloc [ α1; α2; α3 ] in
                                                let* α5 :=
                                                  M.call
                                                    (Ty.path
                                                        "core::fmt::rt::Argument")::["new_display"]
                                                    [ i ] in
                                                let* α6 :=
                                                  M.call
                                                    (Ty.path
                                                        "core::fmt::rt::Argument")::["new_display"]
                                                    [ result ] in
                                                let* α7 := M.alloc [ α5; α6 ] in
                                                let* α8 :=
                                                  M.call
                                                    (Ty.path
                                                        "core::fmt::Arguments")::["new_v1"]
                                                    [
                                                      pointer_coercion
                                                        "Unsize"
                                                        α4;
                                                      pointer_coercion
                                                        "Unsize"
                                                        α7
                                                    ] in
                                                let* α9 := M.call α0 [ α8 ] in
                                                M.alloc α9 in
                                              M.alloc tt in
                                            M.read result) :
                                            _
                                        ]) :
                                      _
                                  ] in
                              let* α2 :=
                                M.call
                                  (Ty.apply
                                      (Ty.path "alloc::vec::Vec")
                                      [
                                        Ty.apply
                                          (Ty.path "std::thread::JoinHandle")
                                          [ Ty.path "u32" ];
                                        Ty.path "alloc::alloc::Global"
                                      ])::["push"]
                                  [ children; α1 ] in
                              M.alloc α2 in
                            M.alloc tt
                          end
                        | _ => M.break_match 
                        end) :
                        Ty.tuple []
                    ] in
                M.alloc tt)) :
              Ty.tuple []
          ] in
      M.pure (use α6) in
    let* final_result :=
      let* α0 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "sum"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::iter::adapters::map::Map")
                [
                  Ty.apply
                    (Ty.path "alloc::vec::into_iter::IntoIter")
                    [
                      Ty.apply
                        (Ty.path "std::thread::JoinHandle")
                        [ Ty.path "u32" ];
                      Ty.path "alloc::alloc::Global"
                    ];
                  Ty.function
                    [
                      Ty.tuple
                        [
                          Ty.apply
                            (Ty.path "std::thread::JoinHandle")
                            [ Ty.path "u32" ]
                        ]
                    ]
                    (Ty.path "u32")
                ];
            (* S *) Ty.path "u32"
          ] in
      let* α1 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "map"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::into_iter::IntoIter")
                [
                  Ty.apply
                    (Ty.path "std::thread::JoinHandle")
                    [ Ty.path "u32" ];
                  Ty.path "alloc::alloc::Global"
                ];
            (* B *) Ty.path "u32";
            (* F *)
              Ty.function
                [
                  Ty.tuple
                    [
                      Ty.apply
                        (Ty.path "std::thread::JoinHandle")
                        [ Ty.path "u32" ]
                    ]
                ]
                (Ty.path "u32")
          ] in
      let* α2 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply
                    (Ty.path "std::thread::JoinHandle")
                    [ Ty.path "u32" ];
                  Ty.path "alloc::alloc::Global"
                ]
          ] in
      let* α3 := M.read children in
      let* α4 := M.call α2 [ α3 ] in
      let* α5 :=
        M.call
          α1
          [
            α4;
            fun
                (α0 :
                  Ty.apply
                    (Ty.path "std::thread::JoinHandle")
                    [ Ty.path "u32" ]) =>
              (let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    (let* c := M.copy γ in
                    let* α0 := M.read c in
                    let* α1 :=
                      M.call
                        (Ty.apply
                            (Ty.path "std::thread::JoinHandle")
                            [ Ty.path "u32" ])::["join"]
                        [ α0 ] in
                    M.call
                      (Ty.apply
                          (Ty.path "core::result::Result")
                          [
                            Ty.path "u32";
                            Ty.apply
                              (Ty.path "alloc::boxed::Box")
                              [
                                Ty.dyn [ ("core::any::Any::Trait", []) ];
                                Ty.path "alloc::alloc::Global"
                              ]
                          ])::["unwrap"]
                      [ α1 ]) :
                    _
                ]) :
              _
          ] in
      let* α6 := M.call α0 [ α5 ] in
      M.alloc α6 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Final sum result: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ final_result ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α5 ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
