(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // In general, the `{}` will be automatically replaced with any
    // arguments. These will be stringified.
    println!("{} days", 31);

    // Positional arguments can be used. Specifying an integer inside `{}`
    // determines which additional argument will be replaced. Arguments start
    // at 0 immediately after the format string
    println!("{0}, this is {1}. {1}, this is {0}", "Alice", "Bob");

    // As can named arguments.
    println!(
        "{subject} {verb} {object}",
        object = "the lazy dog",
        subject = "the quick brown fox",
        verb = "jumps over"
    );

    // Different formatting can be invoked by specifying the format character after a
    // `:`.
    println!("Base 10:               {}", 69420); //69420
    println!("Base 2 (binary):       {:b}", 69420); //10000111100101100
    println!("Base 8 (octal):        {:o}", 69420); //207454
    println!("Base 16 (hexadecimal): {:x}", 69420); //10f2c
    println!("Base 16 (hexadecimal): {:X}", 69420); //10F2C

    // You can right-justify text with a specified width. This will
    // output "    1". (Four white spaces and a "1", for a total width of 5.)
    println!("{number:>5}", number = 1);

    // You can pad numbers with extra zeroes,
    //and left-adjust by flipping the sign. This will output "10000".
    println!("{number:0<5}", number = 1);

    // You can use named arguments in the format specifier by appending a `$`
    println!("{number:0>width$}", number = 1, width = 5);

    // Rust even checks to make sure the correct number of arguments are
    // used.
    println!("My name is {0}, {1} {0}", "Bond", "James");
    // FIXME ^ Add the missing argument: "James"

    // Only types that implement fmt::Display can be formatted with `{}`. User-
    // defined types do not implement fmt::Display by default

    #[allow(dead_code)]
    struct Structure(i32);

    // This will not compile because `Structure` does not implement
    // fmt::Display
    //println!("This struct `{}` won't print...", Structure(3));
    // TODO ^ Try uncommenting this line

    // For Rust 1.58 and above, you can directly capture the argument from a
    // surrounding variable. Just like the above, this will output
    // "    1". 4 white spaces and a "1".
    let number: f64 = 1.0;
    let width: usize = 5;
    println!("{number:>width$}");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "31 days
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ ] in
        let* α4 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α3 in
        let* α5 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α5 in
        std.io.stdio._print α6 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Alice, this is Bob. Bob, this is Alice
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ ] in
        let* α4 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α3 in
        let* α5 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α5 in
        std.io.stdio._print α6 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "the quick brown fox jumps over the lazy dog
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ ] in
        let* α4 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α3 in
        let* α5 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α5 in
        std.io.stdio._print α6 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Base 10:               69420
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ ] in
        let* α4 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α3 in
        let* α5 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α5 in
        std.io.stdio._print α6 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Base 2 (binary):       "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val i32.t)) := M.alloc 69420 in
        let* α4 : ltac:(refine (M.Val (ref i32.t))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_binary"] α4 in
        let* α6 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5 ] in
        let* α7 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α7 in
        let* α9 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α8 in
        std.io.stdio._print α9 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Base 8 (octal):        "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val i32.t)) := M.alloc 69420 in
        let* α4 : ltac:(refine (M.Val (ref i32.t))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_octal"] α4 in
        let* α6 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5 ] in
        let* α7 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α7 in
        let* α9 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α8 in
        std.io.stdio._print α9 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Base 16 (hexadecimal): "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val i32.t)) := M.alloc 69420 in
        let* α4 : ltac:(refine (M.Val (ref i32.t))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_lower_hex"] α4 in
        let* α6 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5 ] in
        let* α7 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α7 in
        let* α9 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α8 in
        std.io.stdio._print α9 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "Base 16 (hexadecimal): "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val i32.t)) := M.alloc 69420 in
        let* α4 : ltac:(refine (M.Val (ref i32.t))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_upper_hex"] α4 in
        let* α6 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5 ] in
        let* α7 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α7 in
        let* α9 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α8 in
        std.io.stdio._print α9 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str ""; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val i32.t)) := M.alloc 1 in
        let* α4 : ltac:(refine (M.Val (ref i32.t))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α4 in
        let* α6 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5 ] in
        let* α7 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α7 in
        let* α9 : ltac:(refine (M.Val usize.t)) := M.alloc 0 in
        let* α10 : ltac:(refine (M.Val char.t)) := M.alloc " "%char in
        let* α11 : ltac:(refine (M.Val core.fmt.rt.Alignment.t)) :=
          M.alloc core.fmt.rt.Alignment.Right in
        let* α12 : ltac:(refine (M.Val u32.t)) := M.alloc 0 in
        let* α13 : ltac:(refine (M.Val core.fmt.rt.Count.t)) :=
          M.alloc core.fmt.rt.Count.Implied in
        let* α14 : ltac:(refine (M.Val usize.t)) := M.alloc 5 in
        let* α15 : ltac:(refine (M.Val core.fmt.rt.Count.t)) :=
          "unimplemented parent_kind" α14 in
        let* α16 : ltac:(refine (M.Val core.fmt.rt.Placeholder.t)) :=
          core.fmt.rt.Placeholder.t::["new"] α9 α10 α11 α12 α13 α15 in
        let* α17 : ltac:(refine (M.Val (array core.fmt.rt.Placeholder.t))) :=
          M.alloc [ α16 ] in
        let* α18 :
            ltac:(refine (M.Val (ref (array core.fmt.rt.Placeholder.t)))) :=
          borrow α17 in
        let* α19 :
            ltac:(refine (M.Val (ref (slice core.fmt.rt.Placeholder.t)))) :=
          pointer_coercion "Unsize" α18 in
        let* α20 : ltac:(refine (M.Val core.fmt.rt.UnsafeArg.t)) :=
          core.fmt.rt.UnsafeArg.t::["new"] in
        let* α21 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1_formatted"] α2 α8 α19 α20 in
        std.io.stdio._print α21 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str ""; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val i32.t)) := M.alloc 1 in
        let* α4 : ltac:(refine (M.Val (ref i32.t))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α4 in
        let* α6 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5 ] in
        let* α7 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α7 in
        let* α9 : ltac:(refine (M.Val usize.t)) := M.alloc 0 in
        let* α10 : ltac:(refine (M.Val char.t)) := M.alloc "0"%char in
        let* α11 : ltac:(refine (M.Val core.fmt.rt.Alignment.t)) :=
          M.alloc core.fmt.rt.Alignment.Left in
        let* α12 : ltac:(refine (M.Val u32.t)) := M.alloc 0 in
        let* α13 : ltac:(refine (M.Val core.fmt.rt.Count.t)) :=
          M.alloc core.fmt.rt.Count.Implied in
        let* α14 : ltac:(refine (M.Val usize.t)) := M.alloc 5 in
        let* α15 : ltac:(refine (M.Val core.fmt.rt.Count.t)) :=
          "unimplemented parent_kind" α14 in
        let* α16 : ltac:(refine (M.Val core.fmt.rt.Placeholder.t)) :=
          core.fmt.rt.Placeholder.t::["new"] α9 α10 α11 α12 α13 α15 in
        let* α17 : ltac:(refine (M.Val (array core.fmt.rt.Placeholder.t))) :=
          M.alloc [ α16 ] in
        let* α18 :
            ltac:(refine (M.Val (ref (array core.fmt.rt.Placeholder.t)))) :=
          borrow α17 in
        let* α19 :
            ltac:(refine (M.Val (ref (slice core.fmt.rt.Placeholder.t)))) :=
          pointer_coercion "Unsize" α18 in
        let* α20 : ltac:(refine (M.Val core.fmt.rt.UnsafeArg.t)) :=
          core.fmt.rt.UnsafeArg.t::["new"] in
        let* α21 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1_formatted"] α2 α8 α19 α20 in
        std.io.stdio._print α21 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str ""; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val i32.t)) := M.alloc 1 in
        let* α4 : ltac:(refine (M.Val (ref i32.t))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α4 in
        let* α6 : ltac:(refine (M.Val usize.t)) := M.alloc 5 in
        let* α7 : ltac:(refine (M.Val (ref usize.t))) := borrow α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["from_usize"] α7 in
        let* α9 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5; α8 ] in
        let* α10 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α9 in
        let* α11 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ltac:(refine (M.Val usize.t)) := M.alloc 0 in
        let* α13 : ltac:(refine (M.Val char.t)) := M.alloc "0"%char in
        let* α14 : ltac:(refine (M.Val core.fmt.rt.Alignment.t)) :=
          M.alloc core.fmt.rt.Alignment.Right in
        let* α15 : ltac:(refine (M.Val u32.t)) := M.alloc 0 in
        let* α16 : ltac:(refine (M.Val core.fmt.rt.Count.t)) :=
          M.alloc core.fmt.rt.Count.Implied in
        let* α17 : ltac:(refine (M.Val usize.t)) := M.alloc 1 in
        let* α18 : ltac:(refine (M.Val core.fmt.rt.Count.t)) :=
          "unimplemented parent_kind" α17 in
        let* α19 : ltac:(refine (M.Val core.fmt.rt.Placeholder.t)) :=
          core.fmt.rt.Placeholder.t::["new"] α12 α13 α14 α15 α16 α18 in
        let* α20 : ltac:(refine (M.Val (array core.fmt.rt.Placeholder.t))) :=
          M.alloc [ α19 ] in
        let* α21 :
            ltac:(refine (M.Val (ref (array core.fmt.rt.Placeholder.t)))) :=
          borrow α20 in
        let* α22 :
            ltac:(refine (M.Val (ref (slice core.fmt.rt.Placeholder.t)))) :=
          pointer_coercion "Unsize" α21 in
        let* α23 : ltac:(refine (M.Val core.fmt.rt.UnsafeArg.t)) :=
          core.fmt.rt.UnsafeArg.t::["new"] in
        let* α24 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1_formatted"] α2 α11 α22 α23 in
        std.io.stdio._print α24 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str "My name is Bond, James Bond
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ ] in
        let* α4 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α3 in
        let* α5 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α5 in
        std.io.stdio._print α6 in
      M.alloc tt in
    let* number : ltac:(refine (M.Val f64.t)) := M.alloc 1 (* 1.0 *) in
    let* width : ltac:(refine (M.Val usize.t)) := M.alloc 5 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str.t)))) :=
          M.alloc [ mk_str ""; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str.t))))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str.t))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref f64.t))) := borrow number in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (ref usize.t))) := borrow width in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["from_usize"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4; α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val usize.t)) := M.alloc 0 in
        let* α11 : ltac:(refine (M.Val char.t)) := M.alloc " "%char in
        let* α12 : ltac:(refine (M.Val core.fmt.rt.Alignment.t)) :=
          M.alloc core.fmt.rt.Alignment.Right in
        let* α13 : ltac:(refine (M.Val u32.t)) := M.alloc 0 in
        let* α14 : ltac:(refine (M.Val core.fmt.rt.Count.t)) :=
          M.alloc core.fmt.rt.Count.Implied in
        let* α15 : ltac:(refine (M.Val usize.t)) := M.alloc 1 in
        let* α16 : ltac:(refine (M.Val core.fmt.rt.Count.t)) :=
          "unimplemented parent_kind" α15 in
        let* α17 : ltac:(refine (M.Val core.fmt.rt.Placeholder.t)) :=
          core.fmt.rt.Placeholder.t::["new"] α10 α11 α12 α13 α14 α16 in
        let* α18 : ltac:(refine (M.Val (array core.fmt.rt.Placeholder.t))) :=
          M.alloc [ α17 ] in
        let* α19 :
            ltac:(refine (M.Val (ref (array core.fmt.rt.Placeholder.t)))) :=
          borrow α18 in
        let* α20 :
            ltac:(refine (M.Val (ref (slice core.fmt.rt.Placeholder.t)))) :=
          pointer_coercion "Unsize" α19 in
        let* α21 : ltac:(refine (M.Val core.fmt.rt.UnsafeArg.t)) :=
          core.fmt.rt.UnsafeArg.t::["new"] in
        let* α22 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1_formatted"] α2 α9 α20 α21 in
        std.io.stdio._print α22 in
      M.alloc tt in
    M.alloc tt).

Module  Structure.
Section Structure.
  Record t : Set := {
    x0 : i32.t;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x0) : M _;
  }.
End Structure.
End Structure.
