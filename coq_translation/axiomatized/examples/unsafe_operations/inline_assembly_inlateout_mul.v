(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    fn mul(a: u64, b: u64) -> u128 {
        let lo: u64;
        let hi: u64;

        unsafe {
            asm!(
                // The x86 mul instruction takes rax as an implicit input and writes
                // the 128-bit result of the multiplication to rax:rdx.
                "mul {}",
                in(reg) a,
                inlateout("rax") b => lo,
                lateout("rdx") hi
            );
        }

        ((hi as u128) << 64) + lo as u128
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).

(*
    fn mul(a: u64, b: u64) -> u128 {
        let lo: u64;
        let hi: u64;

        unsafe {
            asm!(
                // The x86 mul instruction takes rax as an implicit input and writes
                // the 128-bit result of the multiplication to rax:rdx.
                "mul {}",
                in(reg) a,
                inlateout("rax") b => lo,
                lateout("rdx") hi
            );
        }

        ((hi as u128) << 64) + lo as u128
    }
*)
Parameter mul : (M.Val u64.t) -> (M.Val u64.t) -> M (M.Val u128.t).
