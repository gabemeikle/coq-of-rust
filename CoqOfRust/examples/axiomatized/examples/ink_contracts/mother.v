(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct
  {
    name := "Mapping";
    ty_params := [ ("K", None); ("V", None) ];
    fields :=
      [
        ("_key", Ty.apply (Ty.path "core::marker::PhantomData") [ K ]);
        ("_value", Ty.apply (Ty.path "core::marker::PhantomData") [ V ])
      ];
  } *)

Module Impl_core_default_Default_for_mother_Mapping_K_V.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (K V : Ty.t),
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.apply (Ty.path "mother::Mapping") [ K; V ])
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [ K; V ].
End Impl_core_default_Default_for_mother_Mapping_K_V.

Module Impl_mother_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "mother::Mapping") [ K; V ].
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "get" get [ K; V ].
  
  Parameter insert : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_insert :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "insert" insert [ K; V ].
End Impl_mother_Mapping_K_V.

(* Struct
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_mother_AccountId.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "mother::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_mother_AccountId.

Module Impl_core_clone_Clone_for_mother_AccountId.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "mother::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_mother_AccountId.

Module Impl_core_marker_Copy_for_mother_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "mother::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_mother_AccountId.

Module Impl_core_marker_StructuralPartialEq_for_mother_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "mother::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_AccountId.

Module Impl_core_cmp_PartialEq_for_mother_AccountId.
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "mother::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_mother_AccountId.

Module Impl_core_marker_StructuralEq_for_mother_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "mother::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralEq_for_mother_AccountId.

Module Impl_core_cmp_Eq_for_mother_AccountId.
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "mother::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_Eq_for_mother_AccountId.

Axiom Balance : (Ty.path "mother::Balance") = (Ty.path "u128").

Axiom BlockNumber : (Ty.path "mother::BlockNumber") = (Ty.path "u32").

Axiom Hash :
  (Ty.path "mother::Hash") = (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* Struct
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "mother::AccountId") ];
  } *)

(* Struct
  {
    name := "Bids";
    ty_params := [];
    fields :=
      [
        Ty.apply
          (Ty.path "alloc::vec::Vec")
          [
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply
                  (Ty.path "core::option::Option")
                  [ Ty.tuple [ Ty.path "mother::AccountId"; Ty.path "u128" ] ];
                Ty.path "alloc::alloc::Global"
              ];
            Ty.path "alloc::alloc::Global"
          ]
      ];
  } *)

Module Impl_core_default_Default_for_mother_Bids.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "mother::Bids")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_mother_Bids.

Module Impl_core_marker_StructuralPartialEq_for_mother_Bids.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "mother::Bids")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Bids.

Module Impl_core_cmp_PartialEq_for_mother_Bids.
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "mother::Bids")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_mother_Bids.

Module Impl_core_marker_StructuralEq_for_mother_Bids.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "mother::Bids")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralEq_for_mother_Bids.

Module Impl_core_cmp_Eq_for_mother_Bids.
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "mother::Bids")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_Eq_for_mother_Bids.

Module Impl_core_clone_Clone_for_mother_Bids.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "mother::Bids")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_mother_Bids.

(* Enum Outline *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "NoWinner";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "WinnerDetected";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "PayoutCompleted";
        item := Tuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_marker_StructuralPartialEq_for_mother_Outline.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "mother::Outline")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Outline.

Module Impl_core_cmp_PartialEq_for_mother_Outline.
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "mother::Outline")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_mother_Outline.

Module Impl_core_marker_StructuralEq_for_mother_Outline.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "mother::Outline")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralEq_for_mother_Outline.

Module Impl_core_cmp_Eq_for_mother_Outline.
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "mother::Outline")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_Eq_for_mother_Outline.

Module Impl_core_clone_Clone_for_mother_Outline.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "mother::Outline")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_mother_Outline.

(* Enum Status *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "NotStarted";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "OpeningPeriod";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "EndingPeriod";
        item := Tuple [ Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "Ended";
        item := Tuple [ Ty.path "mother::Outline" ];
        discriminant := None;
      };
      {
        name := "RfDelay";
        item := Tuple [ Ty.path "u32" ];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_marker_StructuralPartialEq_for_mother_Status.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "mother::Status")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Status.

Module Impl_core_cmp_PartialEq_for_mother_Status.
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "mother::Status")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_mother_Status.

Module Impl_core_marker_StructuralEq_for_mother_Status.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "mother::Status")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralEq_for_mother_Status.

Module Impl_core_cmp_Eq_for_mother_Status.
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "mother::Status")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_Eq_for_mother_Status.

Module Impl_core_clone_Clone_for_mother_Status.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "mother::Status")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_mother_Status.

(* Struct
  {
    name := "Auction";
    ty_params := [];
    fields :=
      [
        ("name", Ty.path "alloc::string::String");
        ("subject", Ty.apply (Ty.path "array") [ Ty.path "u8" ]);
        ("bids", Ty.path "mother::Bids");
        ("terms", Ty.apply (Ty.path "array") [ Ty.path "u32" ]);
        ("status", Ty.path "mother::Status");
        ("finalized", Ty.path "bool");
        ("vector",
          Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ])
      ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_mother_Auction.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "mother::Auction")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Auction.

Module Impl_core_cmp_PartialEq_for_mother_Auction.
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "mother::Auction")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_mother_Auction.

Module Impl_core_marker_StructuralEq_for_mother_Auction.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "mother::Auction")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralEq_for_mother_Auction.

Module Impl_core_cmp_Eq_for_mother_Auction.
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "mother::Auction")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_Eq_for_mother_Auction.

Module Impl_core_clone_Clone_for_mother_Auction.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "mother::Auction")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_mother_Auction.

Module Impl_core_default_Default_for_mother_Auction.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "mother::Auction")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_mother_Auction.

(* Enum Failure *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Revert";
        item := Tuple [ Ty.path "alloc::string::String" ];
        discriminant := None;
      };
      {
        name := "Panic";
        item := Tuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_marker_StructuralPartialEq_for_mother_Failure.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "mother::Failure")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Failure.

Module Impl_core_cmp_PartialEq_for_mother_Failure.
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "mother::Failure")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_mother_Failure.

Module Impl_core_marker_StructuralEq_for_mother_Failure.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "mother::Failure")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralEq_for_mother_Failure.

Module Impl_core_cmp_Eq_for_mother_Failure.
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "mother::Failure")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_Eq_for_mother_Failure.

(* Struct
  {
    name := "AuctionEchoed";
    ty_params := [];
    fields := [ ("auction", Ty.path "mother::Auction") ];
  } *)

(* Enum Event *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "AuctionEchoed";
        item := Tuple [ Ty.path "mother::AuctionEchoed" ];
        discriminant := None;
      }
    ];
} *)

Module Impl_mother_Env.
  Definition Self : Ty.t := Ty.path "mother::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_caller :
    M.IsAssociatedFunction Self "caller" caller [].
  
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_emit_event :
    M.IsAssociatedFunction Self "emit_event" emit_event [].
End Impl_mother_Env.

(* Struct
  {
    name := "Mother";
    ty_params := [];
    fields :=
      [
        ("auction", Ty.path "mother::Auction");
        ("balances",
          Ty.apply
            (Ty.path "mother::Mapping")
            [ Ty.path "mother::AccountId"; Ty.path "u128" ])
      ];
  } *)

Module Impl_core_default_Default_for_mother_Mother.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "mother::Mother")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_mother_Mother.

Module Impl_mother_Mother.
  Definition Self : Ty.t := Ty.path "mother::Mother".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env [].
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  Parameter new_default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_default :
    M.IsAssociatedFunction Self "new_default" new_default [].
  
  Parameter failed_new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_failed_new :
    M.IsAssociatedFunction Self "failed_new" failed_new [].
  
  Parameter echo_auction : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_echo_auction :
    M.IsAssociatedFunction Self "echo_auction" echo_auction [].
  
  Parameter revert_or_trap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_revert_or_trap :
    M.IsAssociatedFunction Self "revert_or_trap" revert_or_trap [].
  
  Parameter debug_log : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_debug_log :
    M.IsAssociatedFunction Self "debug_log" debug_log [].
End Impl_mother_Mother.
