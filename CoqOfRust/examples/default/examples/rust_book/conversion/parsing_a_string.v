(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    "12".parse::<i32>();
    "true".parse::<bool>();
    "unparsable".parse::<u32>();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :
        Ty.apply
          (Ty.path "core::result::Result")
          [Ty.path "i32";
            Ty.apply (Ty.path "core::num::error::ParseIntError") []] :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "12") in
      let* α1 :
          Ty.apply
            (Ty.path "core::result::Result")
            [Ty.path "i32";
              Ty.apply (Ty.path "core::num::error::ParseIntError") []] :=
        M.call ((Ty.path "str")::["parse"] α0) in
      M.alloc α1 in
    let* _ :
        Ty.apply
          (Ty.path "core::result::Result")
          [Ty.path "bool";
            Ty.apply (Ty.path "core::str::error::ParseBoolError") []] :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "true") in
      let* α1 :
          Ty.apply
            (Ty.path "core::result::Result")
            [Ty.path "bool";
              Ty.apply (Ty.path "core::str::error::ParseBoolError") []] :=
        M.call ((Ty.path "str")::["parse"] α0) in
      M.alloc α1 in
    let* _ :
        Ty.apply
          (Ty.path "core::result::Result")
          [Ty.path "u32";
            Ty.apply (Ty.path "core::num::error::ParseIntError") []] :=
      let* α0 : Ty.apply (Ty.path "ref") [Ty.path "str"] :=
        M.read (mk_str "unparsable") in
      let* α1 :
          Ty.apply
            (Ty.path "core::result::Result")
            [Ty.path "u32";
              Ty.apply (Ty.path "core::num::error::ParseIntError") []] :=
        M.call ((Ty.path "str")::["parse"] α0) in
      M.alloc α1 in
    let* α0 : Ty.path "unit" := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
