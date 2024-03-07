(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Status *)

(* Enum Work *)

(*
fn main() {
    // Equivalent to `Status::Poor`.
    let status = Poor;
    // Equivalent to `Work::Civilian`.
    let work = Civilian;

    match status {
        // Note the lack of scoping because of the explicit `use` above.
        Rich => println!("The rich have lots of money!"),
        Poor => println!("The poor have no money..."),
    }

    match work {
        // Note again the lack of scoping.
        Civilian => println!("Civilians work!"),
        Soldier => println!("Soldiers fight!"),
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* status := M.alloc enums_use.Status.Poor in
    let* work := M.alloc enums_use.Work.Civilian in
    let* _ :=
      match_operator
        status
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | enums_use.Status.Rich =>
              let* _ :=
                let* α0 := M.read (mk_str "The rich have lots of money!
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ pointer_coercion "Unsize" (borrow α1) ] in
                let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | enums_use.Status.Poor =>
              let* _ :=
                let* α0 := M.read (mk_str "The poor have no money...
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ pointer_coercion "Unsize" (borrow α1) ] in
                let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple []
        ] in
    let* α0 :=
      match_operator
        work
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | enums_use.Work.Civilian =>
              let* _ :=
                let* α0 := M.read (mk_str "Civilians work!
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ pointer_coercion "Unsize" (borrow α1) ] in
                let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | enums_use.Work.Soldier =>
              let* _ :=
                let* α0 := M.read (mk_str "Soldiers fight!
") in
                let* α1 := M.alloc [ α0 ] in
                let* α2 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ pointer_coercion "Unsize" (borrow α1) ] in
                let* α3 := M.call (M.var "std::io::stdio::_print") [ α2 ] in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple []
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
