(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_payment_channel_AccountId_t.
Section Impl_core_default_Default_for_payment_channel_AccountId_t.
  Definition Self : Set := payment_channel.AccountId.t.
  
  Parameter default : M payment_channel.AccountId.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_payment_channel_AccountId_t.
End Impl_core_default_Default_for_payment_channel_AccountId_t.

Module  Impl_core_clone_Clone_for_payment_channel_AccountId_t.
Section Impl_core_clone_Clone_for_payment_channel_AccountId_t.
  Definition Self : Set := payment_channel.AccountId.t.
  
  Parameter clone : (ref Self) -> M payment_channel.AccountId.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_payment_channel_AccountId_t.
End Impl_core_clone_Clone_for_payment_channel_AccountId_t.

Module  Impl_core_marker_Copy_for_payment_channel_AccountId_t.
Section Impl_core_marker_Copy_for_payment_channel_AccountId_t.
  Definition Self : Set := payment_channel.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_payment_channel_AccountId_t.
End Impl_core_marker_Copy_for_payment_channel_AccountId_t.

Module  Impl_core_marker_StructuralPartialEq_for_payment_channel_AccountId_t.
Section Impl_core_marker_StructuralPartialEq_for_payment_channel_AccountId_t.
  Definition Self : Set := payment_channel.AccountId.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_payment_channel_AccountId_t.
End Impl_core_marker_StructuralPartialEq_for_payment_channel_AccountId_t.

Module  Impl_core_cmp_PartialEq_for_payment_channel_AccountId_t.
Section Impl_core_cmp_PartialEq_for_payment_channel_AccountId_t.
  Definition Self : Set := payment_channel.AccountId.t.
  
  Parameter eq : (ref Self) -> (ref payment_channel.AccountId.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_payment_channel_AccountId_t.
End Impl_core_cmp_PartialEq_for_payment_channel_AccountId_t.

Module  Impl_core_marker_StructuralEq_for_payment_channel_AccountId_t.
Section Impl_core_marker_StructuralEq_for_payment_channel_AccountId_t.
  Definition Self : Set := payment_channel.AccountId.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_payment_channel_AccountId_t.
End Impl_core_marker_StructuralEq_for_payment_channel_AccountId_t.

Module  Impl_core_cmp_Eq_for_payment_channel_AccountId_t.
Section Impl_core_cmp_Eq_for_payment_channel_AccountId_t.
  Definition Self : Set := payment_channel.AccountId.t.
  
  Parameter assert_receiver_is_total_eq : (ref Self) -> M unit.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_payment_channel_AccountId_t.
End Impl_core_cmp_Eq_for_payment_channel_AccountId_t.

Module  Impl_core_convert_From_array_u8_t_for_payment_channel_AccountId_t.
Section Impl_core_convert_From_array_u8_t_for_payment_channel_AccountId_t.
  Definition Self : Set := payment_channel.AccountId.t.
  
  Parameter from : (array u8.t) -> M Self.
  
  Global Instance AssociatedFunction_from :
    Notations.DoubleColon Self "from" := {
    Notations.double_colon := from;
  }.
  
  Global Instance ℐ : core.convert.From.Trait Self (T := array u8.t) := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_array_u8_t_for_payment_channel_AccountId_t.
End Impl_core_convert_From_array_u8_t_for_payment_channel_AccountId_t.

Ltac Balance := exact u128.t.

Ltac Timestamp := exact u64.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : payment_channel.AccountId.t;
  }.
  
  Definition Get_caller :=
    Ref.map (fun α => Some α.(caller)) (fun β α => Some (α <| caller := β |>)).
End Env.
End Env.

Module  PaymentChannel.
Section PaymentChannel.
  Record t : Set := {
    sender : payment_channel.AccountId.t;
    recipient : payment_channel.AccountId.t;
    expiration : core.option.Option.t ltac:(payment_channel.Timestamp);
    withdrawn : ltac:(payment_channel.Balance);
    close_duration : ltac:(payment_channel.Timestamp);
  }.
  
  Definition Get_sender :=
    Ref.map (fun α => Some α.(sender)) (fun β α => Some (α <| sender := β |>)).
  Definition Get_recipient :=
    Ref.map
      (fun α => Some α.(recipient))
      (fun β α => Some (α <| recipient := β |>)).
  Definition Get_expiration :=
    Ref.map
      (fun α => Some α.(expiration))
      (fun β α => Some (α <| expiration := β |>)).
  Definition Get_withdrawn :=
    Ref.map
      (fun α => Some α.(withdrawn))
      (fun β α => Some (α <| withdrawn := β |>)).
  Definition Get_close_duration :=
    Ref.map
      (fun α => Some α.(close_duration))
      (fun β α => Some (α <| close_duration := β |>)).
End PaymentChannel.
End PaymentChannel.

Module Error.
  Inductive t : Set :=
  | CallerIsNotSender
  | CallerIsNotRecipient
  | AmountIsLessThanWithdrawn
  | TransferFailed
  | NotYetExpired
  | InvalidSignature.
End Error.

Module  Impl_core_marker_StructuralPartialEq_for_payment_channel_Error_t.
Section Impl_core_marker_StructuralPartialEq_for_payment_channel_Error_t.
  Definition Self : Set := payment_channel.Error.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_payment_channel_Error_t.
End Impl_core_marker_StructuralPartialEq_for_payment_channel_Error_t.

Module  Impl_core_cmp_PartialEq_for_payment_channel_Error_t.
Section Impl_core_cmp_PartialEq_for_payment_channel_Error_t.
  Definition Self : Set := payment_channel.Error.t.
  
  Parameter eq : (ref Self) -> (ref payment_channel.Error.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_payment_channel_Error_t.
End Impl_core_cmp_PartialEq_for_payment_channel_Error_t.

Module  Impl_core_marker_StructuralEq_for_payment_channel_Error_t.
Section Impl_core_marker_StructuralEq_for_payment_channel_Error_t.
  Definition Self : Set := payment_channel.Error.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_payment_channel_Error_t.
End Impl_core_marker_StructuralEq_for_payment_channel_Error_t.

Module  Impl_core_cmp_Eq_for_payment_channel_Error_t.
Section Impl_core_cmp_Eq_for_payment_channel_Error_t.
  Definition Self : Set := payment_channel.Error.t.
  
  Parameter assert_receiver_is_total_eq : (ref Self) -> M unit.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_payment_channel_Error_t.
End Impl_core_cmp_Eq_for_payment_channel_Error_t.

Ltac Result T := exact (core.result.Result.t T payment_channel.Error.t).

Module  SenderCloseStarted.
Section SenderCloseStarted.
  Record t : Set := {
    expiration : ltac:(payment_channel.Timestamp);
    close_duration : ltac:(payment_channel.Timestamp);
  }.
  
  Definition Get_expiration :=
    Ref.map
      (fun α => Some α.(expiration))
      (fun β α => Some (α <| expiration := β |>)).
  Definition Get_close_duration :=
    Ref.map
      (fun α => Some α.(close_duration))
      (fun β α => Some (α <| close_duration := β |>)).
End SenderCloseStarted.
End SenderCloseStarted.

Module Event.
  Inductive t : Set :=
  | SenderCloseStarted (_ : payment_channel.SenderCloseStarted.t).
  
  Definition Get_SenderCloseStarted_0 :=
    Ref.map
      (fun α => match α with | SenderCloseStarted α0 => Some α0 end)
      (fun β α =>
        match α with | SenderCloseStarted _ => Some (SenderCloseStarted β) end).
End Event.

Module  Impl_payment_channel_Env_t.
Section Impl_payment_channel_Env_t.
  Definition Self : Set := payment_channel.Env.t.
  
  Parameter caller : (ref Self) -> M payment_channel.AccountId.t.
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon Self "caller" := {
    Notations.double_colon := caller;
  }.
  
  Parameter emit_event : (ref Self) -> payment_channel.Event.t -> M unit.
  
  Global Instance AssociatedFunction_emit_event :
    Notations.DoubleColon Self "emit_event" := {
    Notations.double_colon := emit_event;
  }.
  
  Parameter terminate_contract :
      (ref Self) -> payment_channel.AccountId.t -> M unit.
  
  Global Instance AssociatedFunction_terminate_contract :
    Notations.DoubleColon Self "terminate_contract" := {
    Notations.double_colon := terminate_contract;
  }.
  
  Parameter transfer :
      (ref Self) ->
        payment_channel.AccountId.t ->
        ltac:(payment_channel.Balance) ->
        M ltac:(payment_channel.Result unit).
  
  Global Instance AssociatedFunction_transfer :
    Notations.DoubleColon Self "transfer" := {
    Notations.double_colon := transfer;
  }.
  
  Parameter block_timestamp : (ref Self) -> M ltac:(payment_channel.Timestamp).
  
  Global Instance AssociatedFunction_block_timestamp :
    Notations.DoubleColon Self "block_timestamp" := {
    Notations.double_colon := block_timestamp;
  }.
  
  Parameter balance : (ref Self) -> M ltac:(payment_channel.Balance).
  
  Global Instance AssociatedFunction_balance :
    Notations.DoubleColon Self "balance" := {
    Notations.double_colon := balance;
  }.
  
  Parameter account_id : (ref Self) -> M payment_channel.AccountId.t.
  
  Global Instance AssociatedFunction_account_id :
    Notations.DoubleColon Self "account_id" := {
    Notations.double_colon := account_id;
  }.
End Impl_payment_channel_Env_t.
End Impl_payment_channel_Env_t.

Module  HashOutput.
Section HashOutput.
  Class Trait (Self : Set) : Type := {
    Type_ : Set;
    ℒ_0 :: core.default.Default.Trait Type_;
  }.
  
  Global Instance Method_Type_ `(Trait) :
    Notations.DoubleColonType Self "Type_" := {
    Notations.double_colon_type := Type_;
  }.
End HashOutput.
End HashOutput.

Module  CryptoHash.
Section CryptoHash.
  Class Trait (Self : Set) : Type := {
    ℒ_0 :: payment_channel.HashOutput.Trait Self;
    hash :
      (ref (slice u8.t)) ->
        (mut_ref
          (payment_channel.HashOutput.Type_
            (Self := Self)
            (Trait := ltac:(refine _))))
        ->
        M unit;
  }.
  
End CryptoHash.
End CryptoHash.

Parameter hash_encoded :
    forall {H T : Set},
    (ref T) ->
      (mut_ref
        (payment_channel.HashOutput.Type_
          (Self := H)
          (Trait := ltac:(refine _))))
      ->
      M unit.

Parameter ecdsa_recover :
    (ref (array u8.t)) ->
      (ref (array u8.t)) ->
      (mut_ref (array u8.t)) ->
      M ltac:(payment_channel.Result unit).

Module Sha2x256.
  Inductive t : Set :=
  .
End Sha2x256.

Module Keccak256.
  Inductive t : Set :=
  .
End Keccak256.

Module Blake2x256.
  Inductive t : Set :=
  .
End Blake2x256.

Module Blake2x128.
  Inductive t : Set :=
  .
End Blake2x128.

Module  Impl_payment_channel_HashOutput_for_payment_channel_Sha2x256_t.
Section Impl_payment_channel_HashOutput_for_payment_channel_Sha2x256_t.
  Definition Self : Set := payment_channel.Sha2x256.t.
  
  Definition Type_ : Set := array u8.t.
  
  Global Instance ℐ : payment_channel.HashOutput.Trait Self := {
    payment_channel.HashOutput.Type_ := Type_;
  }.
End Impl_payment_channel_HashOutput_for_payment_channel_Sha2x256_t.
End Impl_payment_channel_HashOutput_for_payment_channel_Sha2x256_t.

Module  Impl_payment_channel_HashOutput_for_payment_channel_Keccak256_t.
Section Impl_payment_channel_HashOutput_for_payment_channel_Keccak256_t.
  Definition Self : Set := payment_channel.Keccak256.t.
  
  Definition Type_ : Set := array u8.t.
  
  Global Instance ℐ : payment_channel.HashOutput.Trait Self := {
    payment_channel.HashOutput.Type_ := Type_;
  }.
End Impl_payment_channel_HashOutput_for_payment_channel_Keccak256_t.
End Impl_payment_channel_HashOutput_for_payment_channel_Keccak256_t.

Module  Impl_payment_channel_HashOutput_for_payment_channel_Blake2x256_t.
Section Impl_payment_channel_HashOutput_for_payment_channel_Blake2x256_t.
  Definition Self : Set := payment_channel.Blake2x256.t.
  
  Definition Type_ : Set := array u8.t.
  
  Global Instance ℐ : payment_channel.HashOutput.Trait Self := {
    payment_channel.HashOutput.Type_ := Type_;
  }.
End Impl_payment_channel_HashOutput_for_payment_channel_Blake2x256_t.
End Impl_payment_channel_HashOutput_for_payment_channel_Blake2x256_t.

Module  Impl_payment_channel_HashOutput_for_payment_channel_Blake2x128_t.
Section Impl_payment_channel_HashOutput_for_payment_channel_Blake2x128_t.
  Definition Self : Set := payment_channel.Blake2x128.t.
  
  Definition Type_ : Set := array u8.t.
  
  Global Instance ℐ : payment_channel.HashOutput.Trait Self := {
    payment_channel.HashOutput.Type_ := Type_;
  }.
End Impl_payment_channel_HashOutput_for_payment_channel_Blake2x128_t.
End Impl_payment_channel_HashOutput_for_payment_channel_Blake2x128_t.

Module  Impl_payment_channel_CryptoHash_for_payment_channel_Sha2x256_t.
Section Impl_payment_channel_CryptoHash_for_payment_channel_Sha2x256_t.
  Definition Self : Set := payment_channel.Sha2x256.t.
  
  Parameter hash :
      (ref (slice u8.t)) ->
        (mut_ref
          (payment_channel.HashOutput.Type_
            (Self := Self)
            (Trait := ltac:(refine _))))
        ->
        M unit.
  
  Global Instance AssociatedFunction_hash :
    Notations.DoubleColon Self "hash" := {
    Notations.double_colon := hash;
  }.
  
  Global Instance ℐ : payment_channel.CryptoHash.Trait Self := {
    payment_channel.CryptoHash.hash := hash;
  }.
End Impl_payment_channel_CryptoHash_for_payment_channel_Sha2x256_t.
End Impl_payment_channel_CryptoHash_for_payment_channel_Sha2x256_t.

Module  Impl_payment_channel_CryptoHash_for_payment_channel_Keccak256_t.
Section Impl_payment_channel_CryptoHash_for_payment_channel_Keccak256_t.
  Definition Self : Set := payment_channel.Keccak256.t.
  
  Parameter hash :
      (ref (slice u8.t)) ->
        (mut_ref
          (payment_channel.HashOutput.Type_
            (Self := Self)
            (Trait := ltac:(refine _))))
        ->
        M unit.
  
  Global Instance AssociatedFunction_hash :
    Notations.DoubleColon Self "hash" := {
    Notations.double_colon := hash;
  }.
  
  Global Instance ℐ : payment_channel.CryptoHash.Trait Self := {
    payment_channel.CryptoHash.hash := hash;
  }.
End Impl_payment_channel_CryptoHash_for_payment_channel_Keccak256_t.
End Impl_payment_channel_CryptoHash_for_payment_channel_Keccak256_t.

Module  Impl_payment_channel_CryptoHash_for_payment_channel_Blake2x256_t.
Section Impl_payment_channel_CryptoHash_for_payment_channel_Blake2x256_t.
  Definition Self : Set := payment_channel.Blake2x256.t.
  
  Parameter hash :
      (ref (slice u8.t)) ->
        (mut_ref
          (payment_channel.HashOutput.Type_
            (Self := Self)
            (Trait := ltac:(refine _))))
        ->
        M unit.
  
  Global Instance AssociatedFunction_hash :
    Notations.DoubleColon Self "hash" := {
    Notations.double_colon := hash;
  }.
  
  Global Instance ℐ : payment_channel.CryptoHash.Trait Self := {
    payment_channel.CryptoHash.hash := hash;
  }.
End Impl_payment_channel_CryptoHash_for_payment_channel_Blake2x256_t.
End Impl_payment_channel_CryptoHash_for_payment_channel_Blake2x256_t.

Module  Impl_payment_channel_CryptoHash_for_payment_channel_Blake2x128_t.
Section Impl_payment_channel_CryptoHash_for_payment_channel_Blake2x128_t.
  Definition Self : Set := payment_channel.Blake2x128.t.
  
  Parameter hash :
      (ref (slice u8.t)) ->
        (mut_ref
          (payment_channel.HashOutput.Type_
            (Self := Self)
            (Trait := ltac:(refine _))))
        ->
        M unit.
  
  Global Instance AssociatedFunction_hash :
    Notations.DoubleColon Self "hash" := {
    Notations.double_colon := hash;
  }.
  
  Global Instance ℐ : payment_channel.CryptoHash.Trait Self := {
    payment_channel.CryptoHash.hash := hash;
  }.
End Impl_payment_channel_CryptoHash_for_payment_channel_Blake2x128_t.
End Impl_payment_channel_CryptoHash_for_payment_channel_Blake2x128_t.

Module  Impl_payment_channel_PaymentChannel_t.
Section Impl_payment_channel_PaymentChannel_t.
  Definition Self : Set := payment_channel.PaymentChannel.t.
  
  Parameter init_env : M payment_channel.Env.t.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  Parameter env : (ref Self) -> M payment_channel.Env.t.
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  Parameter is_signature_valid :
      (ref Self) -> ltac:(payment_channel.Balance) -> (array u8.t) -> M bool.t.
  
  Global Instance AssociatedFunction_is_signature_valid :
    Notations.DoubleColon Self "is_signature_valid" := {
    Notations.double_colon := is_signature_valid;
  }.
  
  Parameter new :
      payment_channel.AccountId.t -> ltac:(payment_channel.Timestamp) -> M Self.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  Parameter close_inner :
      (mut_ref Self) ->
        ltac:(payment_channel.Balance) ->
        (array u8.t) ->
        M ltac:(payment_channel.Result unit).
  
  Global Instance AssociatedFunction_close_inner :
    Notations.DoubleColon Self "close_inner" := {
    Notations.double_colon := close_inner;
  }.
  
  Parameter close :
      (mut_ref Self) ->
        ltac:(payment_channel.Balance) ->
        (array u8.t) ->
        M ltac:(payment_channel.Result unit).
  
  Global Instance AssociatedFunction_close :
    Notations.DoubleColon Self "close" := {
    Notations.double_colon := close;
  }.
  
  Parameter start_sender_close :
      (mut_ref Self) -> M ltac:(payment_channel.Result unit).
  
  Global Instance AssociatedFunction_start_sender_close :
    Notations.DoubleColon Self "start_sender_close" := {
    Notations.double_colon := start_sender_close;
  }.
  
  Parameter claim_timeout :
      (mut_ref Self) -> M ltac:(payment_channel.Result unit).
  
  Global Instance AssociatedFunction_claim_timeout :
    Notations.DoubleColon Self "claim_timeout" := {
    Notations.double_colon := claim_timeout;
  }.
  
  Parameter withdraw :
      (mut_ref Self) ->
        ltac:(payment_channel.Balance) ->
        (array u8.t) ->
        M ltac:(payment_channel.Result unit).
  
  Global Instance AssociatedFunction_withdraw :
    Notations.DoubleColon Self "withdraw" := {
    Notations.double_colon := withdraw;
  }.
  
  Parameter get_sender : (ref Self) -> M payment_channel.AccountId.t.
  
  Global Instance AssociatedFunction_get_sender :
    Notations.DoubleColon Self "get_sender" := {
    Notations.double_colon := get_sender;
  }.
  
  Parameter get_recipient : (ref Self) -> M payment_channel.AccountId.t.
  
  Global Instance AssociatedFunction_get_recipient :
    Notations.DoubleColon Self "get_recipient" := {
    Notations.double_colon := get_recipient;
  }.
  
  Parameter get_expiration :
      (ref Self) -> M (core.option.Option.t ltac:(payment_channel.Timestamp)).
  
  Global Instance AssociatedFunction_get_expiration :
    Notations.DoubleColon Self "get_expiration" := {
    Notations.double_colon := get_expiration;
  }.
  
  Parameter get_withdrawn : (ref Self) -> M ltac:(payment_channel.Balance).
  
  Global Instance AssociatedFunction_get_withdrawn :
    Notations.DoubleColon Self "get_withdrawn" := {
    Notations.double_colon := get_withdrawn;
  }.
  
  Parameter get_close_duration :
      (ref Self) -> M ltac:(payment_channel.Timestamp).
  
  Global Instance AssociatedFunction_get_close_duration :
    Notations.DoubleColon Self "get_close_duration" := {
    Notations.double_colon := get_close_duration;
  }.
  
  Parameter get_balance : (ref Self) -> M ltac:(payment_channel.Balance).
  
  Global Instance AssociatedFunction_get_balance :
    Notations.DoubleColon Self "get_balance" := {
    Notations.double_colon := get_balance;
  }.
End Impl_payment_channel_PaymentChannel_t.
End Impl_payment_channel_PaymentChannel_t.
