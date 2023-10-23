(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition foo {A : Set} (o : core.option.Option A) : M unit :=
  match o with
  | core.option.Option _a =>
    let* _ :=
      let* α0 := borrow [ mk_str "some
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt
  | core.option.Option  =>
    let* _ :=
      let* α0 := borrow [ mk_str "nothing
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt
  end.

Module tests.
  Definition test_file : M unit :=
    let* file :=
      let* α0 := std.fs.OpenOptions::["new"] in
      let* α1 := borrow_mut α0 std.fs.OpenOptions in
      let* α2 := true in
      let* α3 := std.fs.OpenOptions::["append"] α1 α2 in
      let* α4 := deref α3 std.fs.OpenOptions in
      let* α5 := borrow_mut α4 std.fs.OpenOptions in
      let* α6 := true in
      let* α7 := std.fs.OpenOptions::["create"] α5 α6 in
      let* α8 := deref α7 std.fs.OpenOptions in
      let* α9 := borrow α8 std.fs.OpenOptions in
      let* α10 := std.fs.OpenOptions::["open"] α9 (mk_str "ferris.txt") in
      let* α11 := deref (mk_str "Failed to open ferris.txt") str in
      let* α12 := borrow α11 str in
      (core.result.Result _ _)::["expect"] α10 α12 in
    let* α0 := M.alloc 0 in
    let* α1 := M.alloc 5 in
    let* α2 :=
      M.alloc
        {| core.ops.range.Range.start := α0; core.ops.range.Range.end := α1;
        |} in
    let* α3 := core.iter.traits.collect.IntoIterator.into_iter α2 in
    let* α4 :=
      match α3 with
      | iter =>
        loop
          (let* _ :=
            let* α0 := borrow_mut iter (core.ops.range.Range i32) in
            let* α1 := deref α0 (core.ops.range.Range i32) in
            let* α2 := borrow_mut α1 (core.ops.range.Range i32) in
            let* α3 := core.iter.traits.iterator.Iterator.next α2 in
            match α3 with
            | core.option.Option  =>
              let* α0 := Break in
              never_to_any α0
            | core.option.Option _ =>
              let* _ :=
                let* α0 := borrow_mut file std.fs.File in
                let* α1 := deref (mk_str "Ferris
") str in
                let* α2 := borrow α1 str in
                let* α3 := str::["as_bytes"] α2 in
                let* α4 := deref α3 (Slice u8) in
                let* α5 := borrow α4 (Slice u8) in
                let* α6 := std.io.Write.write_all α0 α5 in
                let* α7 := deref (mk_str "Could not write to ferris.txt") str in
                let* α8 := borrow α7 str in
                (core.result.Result _ _)::["expect"] α6 α8 in
              Pure tt
            end in
          Pure tt)
      end in
    use α4.
  
  Definition test_file_also : M unit :=
    let* file :=
      let* α0 := std.fs.OpenOptions::["new"] in
      let* α1 := borrow_mut α0 std.fs.OpenOptions in
      let* α2 := true in
      let* α3 := std.fs.OpenOptions::["append"] α1 α2 in
      let* α4 := deref α3 std.fs.OpenOptions in
      let* α5 := borrow_mut α4 std.fs.OpenOptions in
      let* α6 := true in
      let* α7 := std.fs.OpenOptions::["create"] α5 α6 in
      let* α8 := deref α7 std.fs.OpenOptions in
      let* α9 := borrow α8 std.fs.OpenOptions in
      let* α10 := std.fs.OpenOptions::["open"] α9 (mk_str "ferris.txt") in
      let* α11 := deref (mk_str "Failed to open ferris.txt") str in
      let* α12 := borrow α11 str in
      (core.result.Result _ _)::["expect"] α10 α12 in
    let* α0 := M.alloc 0 in
    let* α1 := M.alloc 5 in
    let* α2 :=
      M.alloc
        {| core.ops.range.Range.start := α0; core.ops.range.Range.end := α1;
        |} in
    let* α3 := core.iter.traits.collect.IntoIterator.into_iter α2 in
    let* α4 :=
      match α3 with
      | iter =>
        loop
          (let* _ :=
            let* α0 := borrow_mut iter (core.ops.range.Range i32) in
            let* α1 := deref α0 (core.ops.range.Range i32) in
            let* α2 := borrow_mut α1 (core.ops.range.Range i32) in
            let* α3 := core.iter.traits.iterator.Iterator.next α2 in
            match α3 with
            | core.option.Option  =>
              let* α0 := Break in
              never_to_any α0
            | core.option.Option _ =>
              let* _ :=
                let* α0 := borrow_mut file std.fs.File in
                let* α1 := deref (mk_str "Corro
") str in
                let* α2 := borrow α1 str in
                let* α3 := str::["as_bytes"] α2 in
                let* α4 := deref α3 (Slice u8) in
                let* α5 := borrow α4 (Slice u8) in
                let* α6 := std.io.Write.write_all α0 α5 in
                let* α7 := deref (mk_str "Could not write to ferris.txt") str in
                let* α8 := borrow α7 str in
                (core.result.Result _ _)::["expect"] α6 α8 in
              Pure tt
            end in
          Pure tt)
      end in
    use α4.
End tests.

Definition test_file : M unit :=
  let* file :=
    let* α0 := std.fs.OpenOptions::["new"] in
    let* α1 := borrow_mut α0 std.fs.OpenOptions in
    let* α2 := true in
    let* α3 := std.fs.OpenOptions::["append"] α1 α2 in
    let* α4 := deref α3 std.fs.OpenOptions in
    let* α5 := borrow_mut α4 std.fs.OpenOptions in
    let* α6 := true in
    let* α7 := std.fs.OpenOptions::["create"] α5 α6 in
    let* α8 := deref α7 std.fs.OpenOptions in
    let* α9 := borrow α8 std.fs.OpenOptions in
    let* α10 := std.fs.OpenOptions::["open"] α9 (mk_str "ferris.txt") in
    let* α11 := deref (mk_str "Failed to open ferris.txt") str in
    let* α12 := borrow α11 str in
    (core.result.Result _ _)::["expect"] α10 α12 in
  let* α0 := M.alloc 0 in
  let* α1 := M.alloc 5 in
  let* α2 :=
    M.alloc
      {| core.ops.range.Range.start := α0; core.ops.range.Range.end := α1; |} in
  let* α3 := core.iter.traits.collect.IntoIterator.into_iter α2 in
  let* α4 :=
    match α3 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := borrow_mut iter (core.ops.range.Range i32) in
          let* α1 := deref α0 (core.ops.range.Range i32) in
          let* α2 := borrow_mut α1 (core.ops.range.Range i32) in
          let* α3 := core.iter.traits.iterator.Iterator.next α2 in
          match α3 with
          | core.option.Option  =>
            let* α0 := Break in
            never_to_any α0
          | core.option.Option _ =>
            let* _ :=
              let* α0 := borrow_mut file std.fs.File in
              let* α1 := deref (mk_str "Ferris
") str in
              let* α2 := borrow α1 str in
              let* α3 := str::["as_bytes"] α2 in
              let* α4 := deref α3 (Slice u8) in
              let* α5 := borrow α4 (Slice u8) in
              let* α6 := std.io.Write.write_all α0 α5 in
              let* α7 := deref (mk_str "Could not write to ferris.txt") str in
              let* α8 := borrow α7 str in
              (core.result.Result _ _)::["expect"] α6 α8 in
            Pure tt
          end in
        Pure tt)
    end in
  use α4.

Definition test_file_also : M unit :=
  let* file :=
    let* α0 := std.fs.OpenOptions::["new"] in
    let* α1 := borrow_mut α0 std.fs.OpenOptions in
    let* α2 := true in
    let* α3 := std.fs.OpenOptions::["append"] α1 α2 in
    let* α4 := deref α3 std.fs.OpenOptions in
    let* α5 := borrow_mut α4 std.fs.OpenOptions in
    let* α6 := true in
    let* α7 := std.fs.OpenOptions::["create"] α5 α6 in
    let* α8 := deref α7 std.fs.OpenOptions in
    let* α9 := borrow α8 std.fs.OpenOptions in
    let* α10 := std.fs.OpenOptions::["open"] α9 (mk_str "ferris.txt") in
    let* α11 := deref (mk_str "Failed to open ferris.txt") str in
    let* α12 := borrow α11 str in
    (core.result.Result _ _)::["expect"] α10 α12 in
  let* α0 := M.alloc 0 in
  let* α1 := M.alloc 5 in
  let* α2 :=
    M.alloc
      {| core.ops.range.Range.start := α0; core.ops.range.Range.end := α1; |} in
  let* α3 := core.iter.traits.collect.IntoIterator.into_iter α2 in
  let* α4 :=
    match α3 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := borrow_mut iter (core.ops.range.Range i32) in
          let* α1 := deref α0 (core.ops.range.Range i32) in
          let* α2 := borrow_mut α1 (core.ops.range.Range i32) in
          let* α3 := core.iter.traits.iterator.Iterator.next α2 in
          match α3 with
          | core.option.Option  =>
            let* α0 := Break in
            never_to_any α0
          | core.option.Option _ =>
            let* _ :=
              let* α0 := borrow_mut file std.fs.File in
              let* α1 := deref (mk_str "Corro
") str in
              let* α2 := borrow α1 str in
              let* α3 := str::["as_bytes"] α2 in
              let* α4 := deref α3 (Slice u8) in
              let* α5 := borrow α4 (Slice u8) in
              let* α6 := std.io.Write.write_all α0 α5 in
              let* α7 := deref (mk_str "Could not write to ferris.txt") str in
              let* α8 := borrow α7 str in
              (core.result.Result _ _)::["expect"] α6 α8 in
            Pure tt
          end in
        Pure tt)
    end in
  use α4.
