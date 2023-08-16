(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.
Require CoqOfRust.ink.ink_metadata.
Require CoqOfRust.ink.ink_primitives.
Require CoqOfRust.ink.parity_scale_codec.

Module impls.
  Module AutoKey.
    Inductive t : Set := Build.
  End AutoKey.
  Definition AutoKey := @AutoKey.t.
  
  Module ManualKey.
    Section ManualKey.
      Context {ParentKey : Set}.
      Unset Primitive Projections.
      Record t : Set := {
        _ : core.marker.PhantomData (ParentKey);
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_0 : Notation.Dot 0 := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End ManualKey.
  End ManualKey.
  Definition ManualKey := @ManualKey.t.
  
  Module ResolverKey.
    Section ResolverKey.
      Context {L R : Set}.
      Unset Primitive Projections.
      Record t : Set := {
        _ : core.marker.PhantomData ((L * R));
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_0 : Notation.Dot 0 := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End ResolverKey.
  End ResolverKey.
  Definition ResolverKey := @ResolverKey.t.
End impls.

Module AutoKey.
  Inductive t : Set := Build.
End AutoKey.
Definition AutoKey := @AutoKey.t.

Module ManualKey.
  Section ManualKey.
    Context {ParentKey : Set}.
    Unset Primitive Projections.
    Record t : Set := {
      _ : core.marker.PhantomData (ParentKey);
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End ManualKey.
End ManualKey.
Definition ManualKey := @ManualKey.t.

Module ResolverKey.
  Section ResolverKey.
    Context {L R : Set}.
    Unset Primitive Projections.
    Record t : Set := {
      _ : core.marker.PhantomData ((L * R));
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End ResolverKey.
End ResolverKey.
Definition ResolverKey := @ResolverKey.t.

Module storage.
  Module Storable.
    Class Trait (Self : Set) : Set := {
      encode
        `{H : State.Trait}
        {T: Set}
        `{parity_scale_codec.codec.Output.Trait T}
        `{core.marker.Sized.Trait T}
        :
        (ref Self) -> (mut_ref T) -> (M (H := H) unit);
      decode
        `{H : State.Trait}
        {I: Set}
        `{parity_scale_codec.codec.Input.Trait I}
        :
        (mut_ref I) ->
        (M (H := H) (core.result.Result Self parity_scale_codec.error.Error));
    }.
    
    Global Instance Method_encode `{H : State.Trait} `(Trait)
      : Notation.Dot "encode" := {
      Notation.dot := @encode;
    }.
    Global Instance Method_decode `{H : State.Trait} `(Trait)
      : Notation.Dot "decode" := {
      Notation.dot := @decode;
    }.
  End Storable.
  
  Module private.
    Module Sealed.
      Unset Primitive Projections.
      Class Trait (Self : Set) : Set := {
      }.
      Global Set Primitive Projections.
    End Sealed.
  End private.
  
  Module Packed.
    Unset Primitive Projections.
    Class Trait (Self : Set) : Set := {
    }.
    Global Set Primitive Projections.
  End Packed.
  
  Module StorageKey.
    Class Trait (Self : Set) : Set := {
      KEY `{H : State.Trait} : ink_primitives.key.Key;
    }.
    
    Global Instance Method_KEY `{H : State.Trait} `(Trait)
      : Notation.Dot "KEY" := {
      Notation.dot := KEY;
    }.
    (* Global Instance Method_key `{H : State.Trait} `(Trait)
      : Notation.Dot "key" := {
      Notation.dot (self : ref Self) :=
        (axiom : M (H := H) ink_primitives.key.Key);
    }.
  *) End StorageKey.
  
  Module StorableHint.
    Class Trait
        (Self : Set) {Key : Set}
        {Type_ : Set}
        `{ink_storage_traits.storage.Storable.Trait Type_}
        {PreferredKey : Set}
        `{ink_storage_traits.storage.StorageKey.Trait PreferredKey} :
        Set := {
      Type_ := Type_;
      PreferredKey := PreferredKey;
    }.
    
    Global Instance
        Method_Type_
        `{H : State.Trait}
        {Type_}
        `(Trait
        (Type_ := Type_))
      : Notation.DoubleColonType Self "Type_" := {
      Notation.double_colon_type := Type_;
    }.
    Global Instance
        Method_PreferredKey
        `{H : State.Trait}
        {PreferredKey}
        `(Trait
        (PreferredKey := PreferredKey))
      : Notation.DoubleColonType Self "PreferredKey" := {
      Notation.double_colon_type := PreferredKey;
    }.
  End StorableHint.
  
  Module AutoStorableHint.
    Class Trait
        (Self : Set) {Key : Set}
        {Type_ : Set}
        `{ink_storage_traits.storage.Storable.Trait Type_} :
        Set := {
      Type_ := Type_;
    }.
    
    Global Instance
        Method_Type_
        `{H : State.Trait}
        {Type_}
        `(Trait
        (Type_ := Type_))
      : Notation.DoubleColonType Self "Type_" := {
      Notation.double_colon_type := Type_;
    }.
  End AutoStorableHint.
End storage.

Module Storable.
  Class Trait (Self : Set) : Set := {
    encode
      `{H : State.Trait}
      {T: Set}
      `{parity_scale_codec.codec.Output.Trait T}
      `{core.marker.Sized.Trait T}
      :
      (ref Self) -> (mut_ref T) -> (M (H := H) unit);
    decode
      `{H : State.Trait}
      {I: Set}
      `{parity_scale_codec.codec.Input.Trait I}
      :
      (mut_ref I) ->
      (M (H := H) (core.result.Result Self parity_scale_codec.error.Error));
  }.
  
  Global Instance Method_encode `{H : State.Trait} `(Trait)
    : Notation.Dot "encode" := {
    Notation.dot := @encode;
  }.
  Global Instance Method_decode `{H : State.Trait} `(Trait)
    : Notation.Dot "decode" := {
    Notation.dot := @decode;
  }.
End Storable.

Module private.
  Module Sealed.
    Unset Primitive Projections.
    Class Trait (Self : Set) : Set := {
    }.
    Global Set Primitive Projections.
  End Sealed.
End private.

Module Sealed.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Set := {
  }.
  Global Set Primitive Projections.
End Sealed.

Module Packed.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Set := {
  }.
  Global Set Primitive Projections.
End Packed.

Module StorageKey.
  Class Trait (Self : Set) : Set := {
    KEY `{H : State.Trait} : ink_primitives.key.Key;
  }.
  
  Global Instance Method_KEY `{H : State.Trait} `(Trait)
    : Notation.Dot "KEY" := {
    Notation.dot := KEY;
  }.
  (* Global Instance Method_key `{H : State.Trait} `(Trait)
    : Notation.Dot "key" := {
    Notation.dot (self : ref Self) :=
      (axiom : M (H := H) ink_primitives.key.Key);
  }.
*) End StorageKey.

Module StorableHint.
  Class Trait
      (Self : Set) {Key : Set}
      {Type_ : Set}
      `{ink_storage_traits.storage.Storable.Trait Type_}
      {PreferredKey : Set}
      `{ink_storage_traits.storage.StorageKey.Trait PreferredKey} :
      Set := {
    Type_ := Type_;
    PreferredKey := PreferredKey;
  }.
  
  Global Instance
      Method_Type_
      `{H : State.Trait}
      {Type_}
      `(Trait
      (Type_ := Type_))
    : Notation.DoubleColonType Self "Type_" := {
    Notation.double_colon_type := Type_;
  }.
  Global Instance
      Method_PreferredKey
      `{H : State.Trait}
      {PreferredKey}
      `(Trait
      (PreferredKey := PreferredKey))
    : Notation.DoubleColonType Self "PreferredKey" := {
    Notation.double_colon_type := PreferredKey;
  }.
End StorableHint.

Module AutoStorableHint.
  Class Trait
      (Self : Set) {Key : Set}
      {Type_ : Set}
      `{ink_storage_traits.storage.Storable.Trait Type_} :
      Set := {
    Type_ := Type_;
  }.
  
  Global Instance
      Method_Type_
      `{H : State.Trait}
      {Type_}
      `(Trait
      (Type_ := Type_))
    : Notation.DoubleColonType Self "Type_" := {
    Notation.double_colon_type := Type_;
  }.
End AutoStorableHint.

Module layout.
  Module StorageLayout.
    Class Trait (Self : Set) : Set := {
      layout
        `{H : State.Trait}
        :
        (ref ink_primitives.key.Key) -> (M (H := H) ink_metadata.layout.Layout);
    }.
    
    Global Instance Method_layout `{H : State.Trait} `(Trait)
      : Notation.Dot "layout" := {
      Notation.dot := layout;
    }.
  End StorageLayout.
End layout.

Module StorageLayout.
  Class Trait (Self : Set) : Set := {
    layout
      `{H : State.Trait}
      :
      (ref ink_primitives.key.Key) -> (M (H := H) ink_metadata.layout.Layout);
  }.
  
  Global Instance Method_layout `{H : State.Trait} `(Trait)
    : Notation.Dot "layout" := {
    Notation.dot := layout;
  }.
End StorageLayout.
