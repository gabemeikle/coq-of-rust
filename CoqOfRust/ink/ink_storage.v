(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.
Require CoqOfRust.ink.ink_storage_traits.

(* #[allow(dead_code)] - module was ignored by the compiler *)
Module lazy.
  Module mapping.
    Module Mapping.
      Section Mapping.
        Context {K V KeyType : Set}.
        Context
          `{ink_storage_traits.storage.Packed.Trait V}
          `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
        Unset Primitive Projections.
        Record t : Set := {
          _marker : core.marker.PhantomData ((K * V) * KeyType);
        }.
        Global Set Primitive Projections.
        
        Global Instance Get__marker : Notation.Dot "_marker" := {
          Notation.dot '(Build_t x0) := x0;
        }.
        Global Instance Get_AF__marker : Notation.DoubleColon t "_marker" := {
          Notation.double_colon '(Build_t x0) := x0;
        }.
      End Mapping.
    End Mapping.
    Definition Mapping
        (K V KeyType : Set)
        `{ink_storage_traits.storage.Packed.Trait V}
        `{ink_storage_traits.storage.StorageKey.Trait KeyType}
        : Set :=
      Mapping.t (K := K) (V := V) (KeyType := KeyType).
    
    Module
      Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Section
        Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
        Context {K V KeyType : Set}.
        Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
        
        Parameter default : forall `{H' : State.Trait}, M (H := H') Self.
        
        Global Instance AssociatedFunction_default `{H' : State.Trait} :
          Notation.DoubleColon Self "default" := {
          Notation.double_colon := default;
        }.
        
        Global Instance I : core.default.Default.Trait Self := {
          core.default.Default.default `{H' : State.Trait} := default;
        }.
      End
        Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Global Hint Resolve I : core.
    End
      Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    
    Module Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Section
        Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
        Context {K V KeyType : Set}.
        Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
        
        Parameter fmt :
            forall `{H' : State.Trait},
            (ref Self) ->
              (mut_ref core.fmt.Formatter) ->
              M (H := H') core.fmt.Result.
        
        Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
          Notation.dot := fmt;
        }.
        
        Global Instance I : core.fmt.Debug.Trait Self := {
          core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
        }.
      End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Global Hint Resolve I : core.
    End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    
    Module
      Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Section
        Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
        Context {K V KeyType : Set}.
        Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
        
        Parameter encode :
            forall
              `{H' : State.Trait}
              {T : Set}
              `{parity_scale_codec.codec.Output.Trait T}
              `{core.marker.Sized.Trait T},
            (ref Self) -> (mut_ref T) -> M (H := H') unit.
        
        Global Instance Method_encode `{H' : State.Trait} :
          Notation.Dot "encode" := {
          Notation.dot := encode;
        }.
        
        Parameter decode :
            forall
              `{H' : State.Trait}
              {I : Set}
              `{parity_scale_codec.codec.Input.Trait I},
            (mut_ref I) ->
              M (H := H')
                (core.result.Result Self parity_scale_codec.error.Error).
        
        Global Instance AssociatedFunction_decode `{H' : State.Trait} :
          Notation.DoubleColon Self "decode" := {
          Notation.double_colon := decode;
        }.
        
        Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
          ink_storage_traits.storage.Storable.encode `{H' : State.Trait}
            :=
            encode;
          ink_storage_traits.storage.Storable.decode `{H' : State.Trait}
            :=
            decode;
        }.
      End
        Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Global Hint Resolve I : core.
    End
      Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    
    Module
      Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
      Section
        Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
        Context {K V Key InnerKey : Set}.
        Definition Self := ink_storage.lazy.mapping.Mapping K V InnerKey.
        
        Definition Type : Set := ink_storage.lazy.mapping.Mapping K V Key.
        
        Definition PreferredKey : Set := InnerKey.
        
        Global Instance I
          : ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
          ink_storage_traits.storage.StorableHint.Type := Type;
          ink_storage_traits.storage.StorableHint.PreferredKey := PreferredKey;
        }.
      End
        Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
      Global Hint Resolve I : core.
    End
      Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
    
    Module
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Section
        Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
        Context {K V KeyType : Set}.
        Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
        
        Definition KEY `{H' : State.Trait} := Pure KeyType::["KEY"].
        
        Global Instance AssociatedFunction_KEY `{H' : State.Trait} :
          Notation.DoubleColon Self "KEY" := {
          Notation.double_colon := KEY;
        }.
        
        Global Instance I
          : ink_storage_traits.storage.StorageKey.Trait Self := {
          ink_storage_traits.storage.StorageKey.KEY `{H' : State.Trait} := KEY;
        }.
      End
        Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Global Hint Resolve I : core.
    End
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  End mapping.
  
  Module Lazy.
    Section Lazy.
      Context {V KeyType : Set}.
      Context `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
      Unset Primitive Projections.
      Record t : Set := {
        _marker : core.marker.PhantomData (V * KeyType);
      }.
      Global Set Primitive Projections.
      
      Global Instance Get__marker : Notation.Dot "_marker" := {
        Notation.dot '(Build_t x0) := x0;
      }.
      Global Instance Get_AF__marker : Notation.DoubleColon t "_marker" := {
        Notation.double_colon '(Build_t x0) := x0;
      }.
    End Lazy.
  End Lazy.
  Definition Lazy
      (V KeyType : Set)
      `{ink_storage_traits.storage.StorageKey.Trait KeyType}
      : Set :=
    Lazy.t (V := V) (KeyType := KeyType).
  
  Module Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
    Section Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
      Context {V KeyType : Set}.
      Definition Self := ink_storage.lazy.Lazy V KeyType.
      
      Parameter default : forall `{H' : State.Trait}, M (H := H') Self.
      
      Global Instance AssociatedFunction_default `{H' : State.Trait} :
        Notation.DoubleColon Self "default" := {
        Notation.double_colon := default;
      }.
      
      Global Instance I : core.default.Default.Trait Self := {
        core.default.Default.default `{H' : State.Trait} := default;
      }.
    End Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
    Global Hint Resolve I : core.
  End Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
  
  Module Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
    Section Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
      Context {V KeyType : Set}.
      Definition Self := ink_storage.lazy.Lazy V KeyType.
      
      Parameter fmt :
          forall `{H' : State.Trait},
          (ref Self) ->
            (mut_ref core.fmt.Formatter) ->
            M (H := H') core.fmt.Result.
      
      Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
        Notation.dot := fmt;
      }.
      
      Global Instance I : core.fmt.Debug.Trait Self := {
        core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
      }.
    End Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
    Global Hint Resolve I : core.
  End Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
  
  Module
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
    Section
      Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
      Context {V KeyType : Set}.
      Definition Self := ink_storage.lazy.Lazy V KeyType.
      
      Parameter encode :
          forall
            `{H' : State.Trait}
            {T : Set}
            `{parity_scale_codec.codec.Output.Trait T}
            `{core.marker.Sized.Trait T},
          (ref Self) -> (mut_ref T) -> M (H := H') unit.
      
      Global Instance Method_encode `{H' : State.Trait} :
        Notation.Dot "encode" := {
        Notation.dot := encode;
      }.
      
      Parameter decode :
          forall
            `{H' : State.Trait}
            {I : Set}
            `{parity_scale_codec.codec.Input.Trait I},
          (mut_ref I) ->
            M (H := H')
              (core.result.Result Self parity_scale_codec.error.Error).
      
      Global Instance AssociatedFunction_decode `{H' : State.Trait} :
        Notation.DoubleColon Self "decode" := {
        Notation.double_colon := decode;
      }.
      
      Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
        ink_storage_traits.storage.Storable.encode `{H' : State.Trait}
          :=
          encode;
        ink_storage_traits.storage.Storable.decode `{H' : State.Trait}
          :=
          decode;
      }.
    End
      Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
    Global Hint Resolve I : core.
  End
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
  
  Module
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
    Section
      Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
      Context {V Key InnerKey : Set}.
      Definition Self := ink_storage.lazy.Lazy V InnerKey.
      
      Definition Type : Set := ink_storage.lazy.Lazy V::type["Type_"] Key.
      
      Definition PreferredKey : Set := InnerKey.
      
      Global Instance I
        : ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
        ink_storage_traits.storage.StorableHint.Type := Type;
        ink_storage_traits.storage.StorableHint.PreferredKey := PreferredKey;
      }.
    End
      Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
    Global Hint Resolve I : core.
  End
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
  
  Module
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
    Section
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
      Context {V KeyType : Set}.
      Definition Self := ink_storage.lazy.Lazy V KeyType.
      
      Definition KEY `{H' : State.Trait} := Pure KeyType::["KEY"].
      
      Global Instance AssociatedFunction_KEY `{H' : State.Trait} :
        Notation.DoubleColon Self "KEY" := {
        Notation.double_colon := KEY;
      }.
      
      Global Instance I : ink_storage_traits.storage.StorageKey.Trait Self := {
        ink_storage_traits.storage.StorageKey.KEY `{H' : State.Trait} := KEY;
      }.
    End
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
    Global Hint Resolve I : core.
  End
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
End lazy.

Module mapping.
  Module Mapping.
    Section Mapping.
      Context {K V KeyType : Set}.
      Context
        `{ink_storage_traits.storage.Packed.Trait V}
        `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
      Unset Primitive Projections.
      Record t : Set := {
        _marker : core.marker.PhantomData ((K * V) * KeyType);
      }.
      Global Set Primitive Projections.
      
      Global Instance Get__marker : Notation.Dot "_marker" := {
        Notation.dot '(Build_t x0) := x0;
      }.
      Global Instance Get_AF__marker : Notation.DoubleColon t "_marker" := {
        Notation.double_colon '(Build_t x0) := x0;
      }.
    End Mapping.
  End Mapping.
  Definition Mapping
      (K V KeyType : Set)
      `{ink_storage_traits.storage.Packed.Trait V}
      `{ink_storage_traits.storage.StorageKey.Trait KeyType}
      : Set :=
    Mapping.t (K := K) (V := V) (KeyType := KeyType).
  
  Module
    Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Section
      Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Context {K V KeyType : Set}.
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Parameter default : forall `{H' : State.Trait}, M (H := H') Self.
      
      Global Instance AssociatedFunction_default `{H' : State.Trait} :
        Notation.DoubleColon Self "default" := {
        Notation.double_colon := default;
      }.
      
      Global Instance I : core.default.Default.Trait Self := {
        core.default.Default.default `{H' : State.Trait} := default;
      }.
    End
      Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Global Hint Resolve I : core.
  End
    Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  
  Module Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Section
      Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Context {K V KeyType : Set}.
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Parameter fmt :
          forall `{H' : State.Trait},
          (ref Self) ->
            (mut_ref core.fmt.Formatter) ->
            M (H := H') core.fmt.Result.
      
      Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
        Notation.dot := fmt;
      }.
      
      Global Instance I : core.fmt.Debug.Trait Self := {
        core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
      }.
    End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Global Hint Resolve I : core.
  End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  
  Module
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Section
      Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Context {K V KeyType : Set}.
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Parameter encode :
          forall
            `{H' : State.Trait}
            {T : Set}
            `{parity_scale_codec.codec.Output.Trait T}
            `{core.marker.Sized.Trait T},
          (ref Self) -> (mut_ref T) -> M (H := H') unit.
      
      Global Instance Method_encode `{H' : State.Trait} :
        Notation.Dot "encode" := {
        Notation.dot := encode;
      }.
      
      Parameter decode :
          forall
            `{H' : State.Trait}
            {I : Set}
            `{parity_scale_codec.codec.Input.Trait I},
          (mut_ref I) ->
            M (H := H')
              (core.result.Result Self parity_scale_codec.error.Error).
      
      Global Instance AssociatedFunction_decode `{H' : State.Trait} :
        Notation.DoubleColon Self "decode" := {
        Notation.double_colon := decode;
      }.
      
      Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
        ink_storage_traits.storage.Storable.encode `{H' : State.Trait}
          :=
          encode;
        ink_storage_traits.storage.Storable.decode `{H' : State.Trait}
          :=
          decode;
      }.
    End
      Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Global Hint Resolve I : core.
  End
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  
  Module
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
    Section
      Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
      Context {K V Key InnerKey : Set}.
      Definition Self := ink_storage.lazy.mapping.Mapping K V InnerKey.
      
      Definition Type : Set := ink_storage.lazy.mapping.Mapping K V Key.
      
      Definition PreferredKey : Set := InnerKey.
      
      Global Instance I
        : ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
        ink_storage_traits.storage.StorableHint.Type := Type;
        ink_storage_traits.storage.StorableHint.PreferredKey := PreferredKey;
      }.
    End
      Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
    Global Hint Resolve I : core.
  End
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
  
  Module
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Section
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Context {K V KeyType : Set}.
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Definition KEY `{H' : State.Trait} := Pure KeyType::["KEY"].
      
      Global Instance AssociatedFunction_KEY `{H' : State.Trait} :
        Notation.DoubleColon Self "KEY" := {
        Notation.double_colon := KEY;
      }.
      
      Global Instance I : ink_storage_traits.storage.StorageKey.Trait Self := {
        ink_storage_traits.storage.StorageKey.KEY `{H' : State.Trait} := KEY;
      }.
    End
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Global Hint Resolve I : core.
  End
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
End mapping.

Module Mapping.
  Section Mapping.
    Context {K V KeyType : Set}.
    Context
      `{ink_storage_traits.storage.Packed.Trait V}
      `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
    Unset Primitive Projections.
    Record t : Set := {
      _marker : core.marker.PhantomData ((K * V) * KeyType);
    }.
    Global Set Primitive Projections.
    
    Global Instance Get__marker : Notation.Dot "_marker" := {
      Notation.dot '(Build_t x0) := x0;
    }.
    Global Instance Get_AF__marker : Notation.DoubleColon t "_marker" := {
      Notation.double_colon '(Build_t x0) := x0;
    }.
  End Mapping.
End Mapping.
Definition Mapping
    (K V KeyType : Set)
    `{ink_storage_traits.storage.Packed.Trait V}
    `{ink_storage_traits.storage.StorageKey.Trait KeyType}
    : Set :=
  Mapping.t (K := K) (V := V) (KeyType := KeyType).

Module
  Impl_scale_info_TypeInfo_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section
    Impl_scale_info_TypeInfo_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Definition Identity : Set := Self.
    
    Parameter type_info :
        forall `{H' : State.Trait},
        M (H := H') scale_info.ty.Type_.
    
    Global Instance AssociatedFunction_type_info `{H' : State.Trait} :
      Notation.DoubleColon Self "type_info" := {
      Notation.double_colon := type_info;
    }.
    
    Global Instance I : scale_info.TypeInfo.Trait Self := {
      scale_info.TypeInfo.Identity := Identity;
      scale_info.TypeInfo.type_info `{H' : State.Trait} := type_info;
    }.
  End Impl_scale_info_TypeInfo_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Global Hint Resolve I : core.
End Impl_scale_info_TypeInfo_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module
  Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section
    Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Parameter default : forall `{H' : State.Trait}, M (H := H') Self.
    
    Global Instance AssociatedFunction_default `{H' : State.Trait} :
      Notation.DoubleColon Self "default" := {
      Notation.double_colon := default;
    }.
    
    Global Instance I : core.default.Default.Trait Self := {
      core.default.Default.default `{H' : State.Trait} := default;
    }.
  End
    Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Global Hint Resolve I : core.
End Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Parameter fmt :
        forall `{H' : State.Trait},
        (ref Self) ->
          (mut_ref core.fmt.Formatter) ->
          M (H := H') core.fmt.Result.
    
    Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
    }.
  End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Parameter encode :
        forall
          `{H' : State.Trait}
          {T : Set}
          `{parity_scale_codec.codec.Output.Trait T}
          `{core.marker.Sized.Trait T},
        (ref Self) -> (mut_ref T) -> M (H := H') unit.
    
    Global Instance Method_encode `{H' : State.Trait} :
      Notation.Dot "encode" := {
      Notation.dot := encode;
    }.
    
    Parameter decode :
        forall
          `{H' : State.Trait}
          {I : Set}
          `{parity_scale_codec.codec.Input.Trait I},
        (mut_ref I) ->
          M (H := H') (core.result.Result Self parity_scale_codec.error.Error).
    
    Global Instance AssociatedFunction_decode `{H' : State.Trait} :
      Notation.DoubleColon Self "decode" := {
      Notation.double_colon := decode;
    }.
    
    Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
      ink_storage_traits.storage.Storable.encode `{H' : State.Trait} := encode;
      ink_storage_traits.storage.Storable.decode `{H' : State.Trait} := decode;
    }.
  End
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Global Hint Resolve I : core.
End
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
  Section
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
    Context {K V Key InnerKey : Set}.
    Definition Self := ink_storage.lazy.mapping.Mapping K V InnerKey.
    
    Definition Type : Set := ink_storage.lazy.mapping.Mapping K V Key.
    
    Definition PreferredKey : Set := InnerKey.
    
    Global Instance I
      : ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
      ink_storage_traits.storage.StorableHint.Type := Type;
      ink_storage_traits.storage.StorableHint.PreferredKey := PreferredKey;
    }.
  End
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
  Global Hint Resolve I : core.
End
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.

Module
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Definition KEY `{H' : State.Trait} := Pure KeyType::["KEY"].
    
    Global Instance AssociatedFunction_KEY `{H' : State.Trait} :
      Notation.DoubleColon Self "KEY" := {
      Notation.double_colon := KEY;
    }.
    
    Global Instance I : ink_storage_traits.storage.StorageKey.Trait Self := {
      ink_storage_traits.storage.StorageKey.KEY `{H' : State.Trait} := KEY;
    }.
  End
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Global Hint Resolve I : core.
End
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section
    Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Parameter layout :
        forall `{H' : State.Trait},
        (ref ink_primitives.key.Key) -> M (H := H') ink_metadata.layout.Layout.
    
    Global Instance AssociatedFunction_layout `{H' : State.Trait} :
      Notation.DoubleColon Self "layout" := {
      Notation.double_colon := layout;
    }.
    
    Global Instance I : ink_storage_traits.layout.StorageLayout.Trait Self := {
      ink_storage_traits.layout.StorageLayout.layout `{H' : State.Trait}
        :=
        layout;
    }.
  End
    Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Global Hint Resolve I : core.
End
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module Lazy.
  Section Lazy.
    Context {V KeyType : Set}.
    Context `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
    Unset Primitive Projections.
    Record t : Set := {
      _marker : core.marker.PhantomData (V * KeyType);
    }.
    Global Set Primitive Projections.
    
    Global Instance Get__marker : Notation.Dot "_marker" := {
      Notation.dot '(Build_t x0) := x0;
    }.
    Global Instance Get_AF__marker : Notation.DoubleColon t "_marker" := {
      Notation.double_colon '(Build_t x0) := x0;
    }.
  End Lazy.
End Lazy.
Definition Lazy
    (V KeyType : Set)
    `{ink_storage_traits.storage.StorageKey.Trait KeyType}
    : Set :=
  Lazy.t (V := V) (KeyType := KeyType).

Module Impl_scale_info_TypeInfo_for_ink_storage_lazy_Lazy_V_KeyType.
  Section Impl_scale_info_TypeInfo_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Definition Identity : Set := Self.
    
    Parameter type_info :
        forall `{H' : State.Trait},
        M (H := H') scale_info.ty.Type_.
    
    Global Instance AssociatedFunction_type_info `{H' : State.Trait} :
      Notation.DoubleColon Self "type_info" := {
      Notation.double_colon := type_info;
    }.
    
    Global Instance I : scale_info.TypeInfo.Trait Self := {
      scale_info.TypeInfo.Identity := Identity;
      scale_info.TypeInfo.type_info `{H' : State.Trait} := type_info;
    }.
  End Impl_scale_info_TypeInfo_for_ink_storage_lazy_Lazy_V_KeyType.
  Global Hint Resolve I : core.
End Impl_scale_info_TypeInfo_for_ink_storage_lazy_Lazy_V_KeyType.

Module Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
  Section Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter default : forall `{H' : State.Trait}, M (H := H') Self.
    
    Global Instance AssociatedFunction_default `{H' : State.Trait} :
      Notation.DoubleColon Self "default" := {
      Notation.double_colon := default;
    }.
    
    Global Instance I : core.default.Default.Trait Self := {
      core.default.Default.default `{H' : State.Trait} := default;
    }.
  End Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
  Global Hint Resolve I : core.
End Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.

Module Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
  Section Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter fmt :
        forall `{H' : State.Trait},
        (ref Self) ->
          (mut_ref core.fmt.Formatter) ->
          M (H := H') core.fmt.Result.
    
    Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
    }.
  End Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.

Module
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
  Section
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter encode :
        forall
          `{H' : State.Trait}
          {T : Set}
          `{parity_scale_codec.codec.Output.Trait T}
          `{core.marker.Sized.Trait T},
        (ref Self) -> (mut_ref T) -> M (H := H') unit.
    
    Global Instance Method_encode `{H' : State.Trait} :
      Notation.Dot "encode" := {
      Notation.dot := encode;
    }.
    
    Parameter decode :
        forall
          `{H' : State.Trait}
          {I : Set}
          `{parity_scale_codec.codec.Input.Trait I},
        (mut_ref I) ->
          M (H := H') (core.result.Result Self parity_scale_codec.error.Error).
    
    Global Instance AssociatedFunction_decode `{H' : State.Trait} :
      Notation.DoubleColon Self "decode" := {
      Notation.double_colon := decode;
    }.
    
    Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
      ink_storage_traits.storage.Storable.encode `{H' : State.Trait} := encode;
      ink_storage_traits.storage.Storable.decode `{H' : State.Trait} := decode;
    }.
  End
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
  Global Hint Resolve I : core.
End
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.

Module
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
  Section
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
    Context {V Key InnerKey : Set}.
    Definition Self := ink_storage.lazy.Lazy V InnerKey.
    
    Definition Type : Set := ink_storage.lazy.Lazy V::type["Type_"] Key.
    
    Definition PreferredKey : Set := InnerKey.
    
    Global Instance I
      : ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
      ink_storage_traits.storage.StorableHint.Type := Type;
      ink_storage_traits.storage.StorableHint.PreferredKey := PreferredKey;
    }.
  End
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
  Global Hint Resolve I : core.
End
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.

Module
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
  Section
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Definition KEY `{H' : State.Trait} := Pure KeyType::["KEY"].
    
    Global Instance AssociatedFunction_KEY `{H' : State.Trait} :
      Notation.DoubleColon Self "KEY" := {
      Notation.double_colon := KEY;
    }.
    
    Global Instance I : ink_storage_traits.storage.StorageKey.Trait Self := {
      ink_storage_traits.storage.StorageKey.KEY `{H' : State.Trait} := KEY;
    }.
  End
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
  Global Hint Resolve I : core.
End
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.

Module
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_Lazy_V_KeyType.
  Section
    Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter layout :
        forall `{H' : State.Trait},
        (ref ink_primitives.key.Key) -> M (H := H') ink_metadata.layout.Layout.
    
    Global Instance AssociatedFunction_layout `{H' : State.Trait} :
      Notation.DoubleColon Self "layout" := {
      Notation.double_colon := layout;
    }.
    
    Global Instance I : ink_storage_traits.layout.StorageLayout.Trait Self := {
      ink_storage_traits.layout.StorageLayout.layout `{H' : State.Trait}
        :=
        layout;
    }.
  End
    Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_Lazy_V_KeyType.
  Global Hint Resolve I : core.
End
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_Lazy_V_KeyType.
