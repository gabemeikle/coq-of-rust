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
Definition main : M unit :=
  M.function_body
    (let* data : M.Val (ref str.t) :=
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
    let* children :
        M.Val
          (alloc.vec.Vec.t
            (std.thread.JoinHandle.t u32.t)
            alloc.alloc.Global.t) :=
      let* α0 :
          alloc.vec.Vec.t
            (std.thread.JoinHandle.t u32.t)
            alloc.alloc.Global.t :=
        (alloc.vec.Vec.t
            (std.thread.JoinHandle.t u32.t)
            alloc.alloc.Global.t)::["new"] in
      M.alloc α0 in
    let* chunked_data : M.Val core.str.iter.SplitWhitespace.t :=
      let* α0 : ref str.t := M.read data in
      let* α1 : M.Val str.t := deref α0 in
      let* α2 : ref str.t := borrow α1 in
      let* α3 : core.str.iter.SplitWhitespace.t :=
        str.t::["split_whitespace"] α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* α0 : core.str.iter.SplitWhitespace.t := M.read chunked_data in
      let* α1 :
          core.iter.adapters.enumerate.Enumerate.t
            core.str.iter.SplitWhitespace.t :=
        (core.iter.traits.iterator.Iterator.enumerate
            (Self := core.str.iter.SplitWhitespace.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 :
          core.iter.adapters.enumerate.Enumerate.t
            core.str.iter.SplitWhitespace.t :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              core.iter.adapters.enumerate.Enumerate.t
                core.str.iter.SplitWhitespace.t)
            (Trait := ltac:(refine _)))
          α1 in
      let* α3 :
          M.Val
            (core.iter.adapters.enumerate.Enumerate.t
              core.str.iter.SplitWhitespace.t) :=
        M.alloc α2 in
      let* α4 := M.read α3 in
      let* α5 : M.Val unit :=
        match α4 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : M.Val unit :=
              let* α0 :
                  mut_ref
                    (core.iter.adapters.enumerate.Enumerate.t
                      core.str.iter.SplitWhitespace.t) :=
                borrow_mut iter in
              let* α1 : core.option.Option.t (usize.t * (ref str.t)) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self :=
                      core.iter.adapters.enumerate.Enumerate.t
                        core.str.iter.SplitWhitespace.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 : M.Val (core.option.Option.t (usize.t * (ref str.t))) :=
                M.alloc α1 in
              let* α3 := M.read α2 in
              match α3 with
              | core.option.Option.None  =>
                let* α0 : M.Val never.t := Break in
                never_to_any α0
              | core.option.Option.Some (i, data_segment) =>
                let* data_segment := M.alloc data_segment in
                let* i := M.alloc i in
                let* _ : M.Val unit :=
                  let* _ : M.Val unit :=
                    let* α0 : M.Val (array (ref str.t)) :=
                      M.alloc
                        [ mk_str "data segment "; mk_str " is ""; mk_str ""
"
                        ] in
                    let* α1 : ref (array (ref str.t)) := borrow α0 in
                    let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
                    let* α3 : M.Val (ref (slice (ref str.t))) :=
                      pointer_coercion "Unsize" α2 in
                    let* α4 : ref (slice (ref str.t)) := M.read α3 in
                    let* α5 : ref usize.t := borrow i in
                    let* α6 : core.fmt.rt.Argument.t :=
                      core.fmt.rt.Argument.t::["new_display"] α5 in
                    let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
                    let* α8 : ref (ref str.t) := borrow data_segment in
                    let* α9 : core.fmt.rt.Argument.t :=
                      core.fmt.rt.Argument.t::["new_display"] α8 in
                    let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
                    let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
                      M.alloc [ α7; α10 ] in
                    let* α12 : ref (array core.fmt.rt.Argument.t) :=
                      borrow α11 in
                    let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                      M.alloc α12 in
                    let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
                      pointer_coercion "Unsize" α13 in
                    let* α15 : ref (slice core.fmt.rt.Argument.t) :=
                      M.read α14 in
                    let* α16 : core.fmt.Arguments.t :=
                      core.fmt.Arguments.t::["new_v1"] α4 α15 in
                    let* α17 : unit := std.io.stdio._print α16 in
                    M.alloc α17 in
                  M.alloc tt in
                let* _ : M.Val unit :=
                  let* α0 :
                      mut_ref
                        (alloc.vec.Vec.t
                          (std.thread.JoinHandle.t u32.t)
                          alloc.alloc.Global.t) :=
                    borrow_mut children in
                  let* α1 : type not implemented :=
                    M.read
                      (let* result : M.Val u32.t :=
                        let* α0 : ref str.t := M.read data_segment in
                        let* α1 : M.Val str.t := deref α0 in
                        let* α2 : ref str.t := borrow α1 in
                        let* α3 : core.str.iter.Chars.t :=
                          str.t::["chars"] α2 in
                        let* α4 : type not implemented :=
                          M.read
                            (let* α0 : char.t := M.read c in
                            let* α1 : M.Val u32.t := M.alloc 10 in
                            let* α2 : u32.t := M.read α1 in
                            let* α3 : core.option.Option.t u32.t :=
                              char.t::["to_digit"] α0 α2 in
                            let* α4 : ref str.t :=
                              M.read (mk_str "should be a digit") in
                            let* α5 : M.Val str.t := deref α4 in
                            let* α6 : ref str.t := borrow α5 in
                            let* α7 : u32.t :=
                              (core.option.Option.t u32.t)::["expect"] α3 α6 in
                            M.alloc α7) in
                        let* α5 :
                            core.iter.adapters.map.Map.t
                              core.str.iter.Chars.t
                              type not implemented :=
                          (core.iter.traits.iterator.Iterator.map
                              (Self := core.str.iter.Chars.t)
                              (Trait := ltac:(refine _)))
                            α3
                            α4 in
                        let* α6 : u32.t :=
                          (core.iter.traits.iterator.Iterator.sum
                              (Self :=
                                core.iter.adapters.map.Map.t
                                  core.str.iter.Chars.t
                                  type not implemented)
                              (Trait := ltac:(refine _)))
                            α5 in
                        M.alloc α6 in
                      let* _ : M.Val unit :=
                        let* _ : M.Val unit :=
                          let* α0 : M.Val (array (ref str.t)) :=
                            M.alloc
                              [
                                mk_str "processed segment ";
                                mk_str ", result=";
                                mk_str "
"
                              ] in
                          let* α1 : ref (array (ref str.t)) := borrow α0 in
                          let* α2 : M.Val (ref (array (ref str.t))) :=
                            M.alloc α1 in
                          let* α3 : M.Val (ref (slice (ref str.t))) :=
                            pointer_coercion "Unsize" α2 in
                          let* α4 : ref (slice (ref str.t)) := M.read α3 in
                          let* α5 : ref usize.t := borrow i in
                          let* α6 : core.fmt.rt.Argument.t :=
                            core.fmt.rt.Argument.t::["new_display"] α5 in
                          let* α7 : M.Val core.fmt.rt.Argument.t :=
                            M.alloc α6 in
                          let* α8 : ref u32.t := borrow result in
                          let* α9 : core.fmt.rt.Argument.t :=
                            core.fmt.rt.Argument.t::["new_display"] α8 in
                          let* α10 : M.Val core.fmt.rt.Argument.t :=
                            M.alloc α9 in
                          let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
                            M.alloc [ α7; α10 ] in
                          let* α12 : ref (array core.fmt.rt.Argument.t) :=
                            borrow α11 in
                          let* α13 :
                              M.Val (ref (array core.fmt.rt.Argument.t)) :=
                            M.alloc α12 in
                          let* α14 :
                              M.Val (ref (slice core.fmt.rt.Argument.t)) :=
                            pointer_coercion "Unsize" α13 in
                          let* α15 : ref (slice core.fmt.rt.Argument.t) :=
                            M.read α14 in
                          let* α16 : core.fmt.Arguments.t :=
                            core.fmt.Arguments.t::["new_v1"] α4 α15 in
                          let* α17 : unit := std.io.stdio._print α16 in
                          M.alloc α17 in
                        M.alloc tt in
                      M.pure result) in
                  let* α2 : std.thread.JoinHandle.t u32.t :=
                    std.thread.spawn α1 in
                  let* α3 : unit :=
                    (alloc.vec.Vec.t
                          (std.thread.JoinHandle.t u32.t)
                          alloc.alloc.Global.t)::["push"]
                      α0
                      α2 in
                  M.alloc α3 in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α5 in
    let* final_result : M.Val u32.t :=
      let* α0 :
          alloc.vec.Vec.t
            (std.thread.JoinHandle.t u32.t)
            alloc.alloc.Global.t :=
        M.read children in
      let* α1 :
          alloc.vec.into_iter.IntoIter.t
            (std.thread.JoinHandle.t u32.t)
            alloc.alloc.Global.t :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              alloc.vec.Vec.t
                (std.thread.JoinHandle.t u32.t)
                alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : type not implemented :=
        M.read
          (let* α0 : std.thread.JoinHandle.t u32.t := M.read c in
          let* α1 :
              core.result.Result.t
                u32.t
                (alloc.boxed.Box.t type not implemented alloc.alloc.Global.t) :=
            (std.thread.JoinHandle.t u32.t)::["join"] α0 in
          let* α2 : u32.t :=
            (core.result.Result.t
                  u32.t
                  (alloc.boxed.Box.t
                    type not implemented
                    alloc.alloc.Global.t))::["unwrap"]
              α1 in
          M.alloc α2) in
      let* α3 :
          core.iter.adapters.map.Map.t
            (alloc.vec.into_iter.IntoIter.t
              (std.thread.JoinHandle.t u32.t)
              alloc.alloc.Global.t)
            type not implemented :=
        (core.iter.traits.iterator.Iterator.map
            (Self :=
              alloc.vec.into_iter.IntoIter.t
                (std.thread.JoinHandle.t u32.t)
                alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α1
          α2 in
      let* α4 : u32.t :=
        (core.iter.traits.iterator.Iterator.sum
            (Self :=
              core.iter.adapters.map.Map.t
                (alloc.vec.into_iter.IntoIter.t
                  (std.thread.JoinHandle.t u32.t)
                  alloc.alloc.Global.t)
                type not implemented)
            (Trait := ltac:(refine _)))
          α3 in
      M.alloc α4 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Final sum result: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref u32.t := borrow final_result in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
        let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
        let* α13 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α12 in
        let* α14 : unit := std.io.stdio._print α13 in
        M.alloc α14 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
