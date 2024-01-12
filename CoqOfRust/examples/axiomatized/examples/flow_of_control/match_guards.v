(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Temperature.
  Inductive t : Set :=
  | Celsius (_ : i32.t)
  | Fahrenheit (_ : i32.t).
  
  Definition Get_Celsius_0 :=
    Ref.map
      (fun α => match α with | Celsius α0 => Some α0 | _ => None end)
      (fun β α => match α with | Celsius _ => Some (Celsius β) | _ => None end).
  
  Definition Get_Fahrenheit_0 :=
    Ref.map
      (fun α => match α with | Fahrenheit α0 => Some α0 | _ => None end)
      (fun β α =>
        match α with | Fahrenheit _ => Some (Fahrenheit β) | _ => None end).
End Temperature.

(*
fn main() {
    let temperature = Temperature::Celsius(35);
    // ^ TODO try different values for `temperature`

    match temperature {
        Temperature::Celsius(t) if t > 30 => println!("{}C is above 30 Celsius", t),
        // The `if condition` part ^ is a guard
        Temperature::Celsius(t) => println!("{}C is below 30 Celsius", t),

        Temperature::Fahrenheit(t) if t > 86 => println!("{}F is above 86 Fahrenheit", t),
        Temperature::Fahrenheit(t) => println!("{}F is below 86 Fahrenheit", t),
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M unit.
