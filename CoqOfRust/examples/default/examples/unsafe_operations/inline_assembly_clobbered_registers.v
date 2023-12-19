(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // three entries of four bytes each
    let mut name_buf = [0_u8; 12];
    // String is stored as ascii in ebx, edx, ecx in order
    // Because ebx is reserved, the asm needs to preserve the value of it.
    // So we push and pop it around the main asm.
    // (in 64 bit mode for 64 bit processors, 32 bit processors would use ebx)

    unsafe {
        asm!(
            "push rbx",
            "cpuid",
            "mov [rdi], ebx",
            "mov [rdi + 4], edx",
            "mov [rdi + 8], ecx",
            "pop rbx",
            // We use a pointer to an array for storing the values to simplify
            // the Rust code at the cost of a couple more asm instructions
            // This is more explicit with how the asm works however, as opposed
            // to explicit register outputs such as `out("ecx") val`
            // The *pointer itself* is only an input even though it's written behind
            in("rdi") name_buf.as_mut_ptr(),
            // select cpuid 0, also specify eax as clobbered
            inout("eax") 0 => _,
            // cpuid clobbers these registers too
            out("ecx") _,
            out("edx") _,
        );
    }

    let name = core::str::from_utf8(&name_buf).unwrap();
    println!("CPU Manufacturer ID: {}", name);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* name_buf : M.Val (array u8.t) := M.alloc (repeat (Integer.of_Z 0) 12) in
  let* _ : M.Val unit :=
    let _ : M.Val unit := InlineAssembly in
    M.alloc tt in
  let* name : M.Val (ref str.t) :=
    let* α0 : M.Val (ref (array u8.t)) := M.alloc (borrow name_buf) in
    let* α1 : ref (slice u8.t) := M.read (pointer_coercion "Unsize" α0) in
    let* α2 : core.result.Result.t (ref str.t) core.str.error.Utf8Error.t :=
      M.call (core.str.converts.from_utf8 α1) in
    let* α3 : ref str.t :=
      M.call
        ((core.result.Result.t
              (ref str.t)
              core.str.error.Utf8Error.t)::["unwrap"]
          α2) in
    M.alloc α3 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "CPU Manufacturer ID: "; mk_str "
" ] in
      let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
      let* α2 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α1) in
      let* α3 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow name)) in
      let* α4 : M.Val core.fmt.rt.Argument.t := M.alloc α3 in
      let* α5 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α4 ] in
      let* α6 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α5) in
      let* α7 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α6) in
      let* α8 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α2 α7) in
      let* α9 : unit := M.call (std.io.stdio._print α8) in
      M.alloc α9 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
