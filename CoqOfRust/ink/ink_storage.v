(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - module was ignored by the compiler *)
Module lazy.
  Module mapping.
    Module Mapping.
      Section Mapping.
        Context {K V KeyType : Set}.
        Unset Primitive Projections.
        Record t : Set := {
          _marker : core.marker.PhantomData ((K * V * KeyType));
        }.
        Global Set Primitive Projections.
        
        Global Instance Get__marker : Notation.Dot "_marker" := {
          Notation.dot '(Build_t x0) := x0;
        }.
      End Mapping.
    End Mapping.
    Definition Mapping : Set := @Mapping.t.
    
    Module
      Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Section
      Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Context {K V KeyType : Set}.
      
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Parameter default : forall `{H : State.Trait}, M (H := H) Self.
      
      Global Instance AssociatedFunction_default `{H : State.Trait} :
        Notation.DoubleColon Self "default" := {
        Notation.double_colon := default;
      }.
      
      Global Instance I : core.default.Default.Trait Self := {
        core.default.Default.default `{H : State.Trait} := default;
      }.
    End
      Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    End
      Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    
    Module Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Parameter new : forall `{H : State.Trait}, M (H := H) Self.
      
      Global Instance AssociatedFunction_new `{H : State.Trait} :
        Notation.DoubleColon Self "new" := {
        Notation.double_colon := new;
      }.
    End Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    
    Module Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Section
      Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Context {K V KeyType : Set}.
      
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Parameter fmt : forall `{H : State.Trait},
          ref Self ->
          mut_ref core.fmt.Formatter ->
          M (H := H) core.fmt.Result.
      
      Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
        Notation.dot := fmt;
      }.
      
      Global Instance I : core.fmt.Debug.Trait Self := {
        core.fmt.Debug.fmt `{H : State.Trait} := fmt;
      }.
    End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    
    Module Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_2.
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Parameter insert : forall `{H : State.Trait},
          mut_ref Self ->
          Q ->
          ref R ->
          M (H := H) (core.option.Option u32).
      
      Global Instance Method_insert `{H : State.Trait} :
        Notation.Dot "insert" := {
        Notation.dot := insert;
      }.
      
      Parameter get : forall `{H : State.Trait},
          ref Self ->
          Q ->
          M (H := H) (core.option.Option V).
      
      Global Instance Method_get `{H : State.Trait} : Notation.Dot "get" := {
        Notation.dot := get;
      }.
      
      Parameter take : forall `{H : State.Trait},
          ref Self ->
          Q ->
          M (H := H) (core.option.Option V).
      
      Global Instance Method_take `{H : State.Trait} : Notation.Dot "take" := {
        Notation.dot := take;
      }.
      
      Parameter size : forall `{H : State.Trait},
          ref Self ->
          Q ->
          M (H := H) (core.option.Option u32).
      
      Global Instance Method_size `{H : State.Trait} : Notation.Dot "size" := {
        Notation.dot := size;
      }.
      
      Parameter contains : forall `{H : State.Trait},
          ref Self ->
          Q ->
          M (H := H) bool.
      
      Global Instance Method_contains `{H : State.Trait} :
        Notation.Dot "contains" := {
        Notation.dot := contains;
      }.
      
      Parameter remove : forall `{H : State.Trait},
          ref Self ->
          Q ->
          M (H := H) unit.
      
      Global Instance Method_remove `{H : State.Trait} :
        Notation.Dot "remove" := {
        Notation.dot := remove;
      }.
    End Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_2.
    
    Module
      Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Section
      Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Context {K V KeyType : Set}.
      
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Parameter encode : forall `{H : State.Trait},
          ref Self ->
          mut_ref T ->
          M (H := H) unit.
      
      Global Instance Method_encode `{H : State.Trait} :
        Notation.Dot "encode" := {
        Notation.dot := encode;
      }.
      
      Parameter decode : forall `{H : State.Trait},
          mut_ref I ->
          M (H := H) (core.result.Result Self parity_scale_codec.error.Error).
      
      Global Instance AssociatedFunction_decode `{H : State.Trait} :
        Notation.DoubleColon Self "decode" := {
        Notation.double_colon := decode;
      }.
      
      Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
        ink_storage_traits.storage.Storable.encode `{H : State.Trait} := encode;
        ink_storage_traits.storage.Storable.decode `{H : State.Trait} := decode;
      }.
    End
      Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
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
      
      Global Instance I :
          ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
      }.
    End
      Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
    End
      Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
    
    Module
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Section
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
      Context {K V KeyType : Set}.
      
      Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
      
      Definition KEY := Pure KeyType::["KEY"].
      
      Global Instance AssociatedFunction_KEY `{H : State.Trait} :
        Notation.DoubleColon Self "KEY" := {
        Notation.double_colon := KEY;
      }.
      
      Global Instance I : ink_storage_traits.storage.StorageKey.Trait Self := {
        ink_storage_traits.storage.StorageKey.KEY `{H : State.Trait} := KEY;
      }.
    End
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    End
      Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  End mapping.
  
  Module Lazy.
    Section Lazy.
      Context {V KeyType : Set}.
      Unset Primitive Projections.
      Record t : Set := {
        _marker : core.marker.PhantomData ((V * KeyType));
      }.
      Global Set Primitive Projections.
      
      Global Instance Get__marker : Notation.Dot "_marker" := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End Lazy.
  End Lazy.
  Definition Lazy : Set := @Lazy.t.
  
  Module Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
  Section Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter default : forall `{H : State.Trait}, M (H := H) Self.
    
    Global Instance AssociatedFunction_default `{H : State.Trait} :
      Notation.DoubleColon Self "default" := {
      Notation.double_colon := default;
    }.
    
    Global Instance I : core.default.Default.Trait Self := {
      core.default.Default.default `{H : State.Trait} := default;
    }.
  End Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
  End Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
  
  Module Impl_ink_storage_lazy_Lazy_V_KeyType.
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter new : forall `{H : State.Trait}, M (H := H) Self.
    
    Global Instance AssociatedFunction_new `{H : State.Trait} :
      Notation.DoubleColon Self "new" := {
      Notation.double_colon := new;
    }.
  End Impl_ink_storage_lazy_Lazy_V_KeyType.
  
  Module Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
  Section Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter fmt : forall `{H : State.Trait},
        ref Self ->
        mut_ref core.fmt.Formatter ->
        M (H := H) core.fmt.Result.
    
    Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H : State.Trait} := fmt;
    }.
  End Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
  End Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
  
  Module Impl_ink_storage_lazy_Lazy_V_KeyType_2.
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter get : forall `{H : State.Trait},
        ref Self ->
        M (H := H) (core.option.Option V).
    
    Global Instance Method_get `{H : State.Trait} : Notation.Dot "get" := {
      Notation.dot := get;
    }.
    
    Parameter set : forall `{H : State.Trait},
        mut_ref Self ->
        ref V ->
        M (H := H) unit.
    
    Global Instance Method_set `{H : State.Trait} : Notation.Dot "set" := {
      Notation.dot := set;
    }.
  End Impl_ink_storage_lazy_Lazy_V_KeyType_2.
  
  Module Impl_ink_storage_lazy_Lazy_V_KeyType_3.
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter get_or_default : forall `{H : State.Trait},
        ref Self ->
        M (H := H) V.
    
    Global Instance Method_get_or_default `{H : State.Trait} :
      Notation.Dot "get_or_default" := {
      Notation.dot := get_or_default;
    }.
  End Impl_ink_storage_lazy_Lazy_V_KeyType_3.
  
  Module
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
  Section
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Parameter encode : forall `{H : State.Trait},
        ref Self ->
        mut_ref T ->
        M (H := H) unit.
    
    Global Instance Method_encode `{H : State.Trait} :
      Notation.Dot "encode" := {
      Notation.dot := encode;
    }.
    
    Parameter decode : forall `{H : State.Trait},
        mut_ref I ->
        M (H := H) (core.result.Result Self parity_scale_codec.error.Error).
    
    Global Instance AssociatedFunction_decode `{H : State.Trait} :
      Notation.DoubleColon Self "decode" := {
      Notation.double_colon := decode;
    }.
    
    Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
      ink_storage_traits.storage.Storable.encode `{H : State.Trait} := encode;
      ink_storage_traits.storage.Storable.decode `{H : State.Trait} := decode;
    }.
  End
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
  End
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
  
  Module
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
  Section
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
    Context {V Key InnerKey : Set}.
    
    Definition Self := ink_storage.lazy.Lazy V InnerKey.
    
    Definition Type : Set := ink_storage.lazy.Lazy ImplV.Type Key.
    
    Definition PreferredKey : Set := InnerKey.
    
    Global Instance I :
        ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
    }.
  End
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
  End
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
  
  Module
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
  Section
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
    Context {V KeyType : Set}.
    
    Definition Self := ink_storage.lazy.Lazy V KeyType.
    
    Definition KEY := Pure KeyType::["KEY"].
    
    Global Instance AssociatedFunction_KEY `{H : State.Trait} :
      Notation.DoubleColon Self "KEY" := {
      Notation.double_colon := KEY;
    }.
    
    Global Instance I : ink_storage_traits.storage.StorageKey.Trait Self := {
      ink_storage_traits.storage.StorageKey.KEY `{H : State.Trait} := KEY;
    }.
  End
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
  End
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
End lazy.

Module mapping.
  Module Mapping.
    Section Mapping.
      Context {K V KeyType : Set}.
      Unset Primitive Projections.
      Record t : Set := {
        _marker : core.marker.PhantomData ((K * V * KeyType));
      }.
      Global Set Primitive Projections.
      
      Global Instance Get__marker : Notation.Dot "_marker" := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End Mapping.
  End Mapping.
  Definition Mapping : Set := @Mapping.t.
  
  Module
    Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section
    Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Parameter default : forall `{H : State.Trait}, M (H := H) Self.
    
    Global Instance AssociatedFunction_default `{H : State.Trait} :
      Notation.DoubleColon Self "default" := {
      Notation.double_colon := default;
    }.
    
    Global Instance I : core.default.Default.Trait Self := {
      core.default.Default.default `{H : State.Trait} := default;
    }.
  End
    Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  End
    Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  
  Module Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_3.
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Parameter new : forall `{H : State.Trait}, M (H := H) Self.
    
    Global Instance AssociatedFunction_new `{H : State.Trait} :
      Notation.DoubleColon Self "new" := {
      Notation.double_colon := new;
    }.
  End Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_3.
  
  Module Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Parameter fmt : forall `{H : State.Trait},
        ref Self ->
        mut_ref core.fmt.Formatter ->
        M (H := H) core.fmt.Result.
    
    Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H : State.Trait} := fmt;
    }.
  End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  
  Module Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_4.
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Parameter insert : forall `{H : State.Trait},
        mut_ref Self ->
        Q ->
        ref R ->
        M (H := H) (core.option.Option u32).
    
    Global Instance Method_insert `{H : State.Trait} :
      Notation.Dot "insert" := {
      Notation.dot := insert;
    }.
    
    Parameter get : forall `{H : State.Trait},
        ref Self ->
        Q ->
        M (H := H) (core.option.Option V).
    
    Global Instance Method_get `{H : State.Trait} : Notation.Dot "get" := {
      Notation.dot := get;
    }.
    
    Parameter take : forall `{H : State.Trait},
        ref Self ->
        Q ->
        M (H := H) (core.option.Option V).
    
    Global Instance Method_take `{H : State.Trait} : Notation.Dot "take" := {
      Notation.dot := take;
    }.
    
    Parameter size : forall `{H : State.Trait},
        ref Self ->
        Q ->
        M (H := H) (core.option.Option u32).
    
    Global Instance Method_size `{H : State.Trait} : Notation.Dot "size" := {
      Notation.dot := size;
    }.
    
    Parameter contains : forall `{H : State.Trait},
        ref Self ->
        Q ->
        M (H := H) bool.
    
    Global Instance Method_contains `{H : State.Trait} :
      Notation.Dot "contains" := {
      Notation.dot := contains;
    }.
    
    Parameter remove : forall `{H : State.Trait},
        ref Self ->
        Q ->
        M (H := H) unit.
    
    Global Instance Method_remove `{H : State.Trait} :
      Notation.Dot "remove" := {
      Notation.dot := remove;
    }.
  End Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_4.
  
  Module
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Parameter encode : forall `{H : State.Trait},
        ref Self ->
        mut_ref T ->
        M (H := H) unit.
    
    Global Instance Method_encode `{H : State.Trait} :
      Notation.Dot "encode" := {
      Notation.dot := encode;
    }.
    
    Parameter decode : forall `{H : State.Trait},
        mut_ref I ->
        M (H := H) (core.result.Result Self parity_scale_codec.error.Error).
    
    Global Instance AssociatedFunction_decode `{H : State.Trait} :
      Notation.DoubleColon Self "decode" := {
      Notation.double_colon := decode;
    }.
    
    Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
      ink_storage_traits.storage.Storable.encode `{H : State.Trait} := encode;
      ink_storage_traits.storage.Storable.decode `{H : State.Trait} := decode;
    }.
  End
    Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
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
    
    Global Instance I :
        ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
    }.
  End
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
  End
    Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
  
  Module
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Section
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
    Context {K V KeyType : Set}.
    
    Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
    
    Definition KEY := Pure KeyType::["KEY"].
    
    Global Instance AssociatedFunction_KEY `{H : State.Trait} :
      Notation.DoubleColon Self "KEY" := {
      Notation.double_colon := KEY;
    }.
    
    Global Instance I : ink_storage_traits.storage.StorageKey.Trait Self := {
      ink_storage_traits.storage.StorageKey.KEY `{H : State.Trait} := KEY;
    }.
  End
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  End
    Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
End mapping.

Module Mapping.
  Section Mapping.
    Context {K V KeyType : Set}.
    Unset Primitive Projections.
    Record t : Set := {
      _marker : core.marker.PhantomData ((K * V * KeyType));
    }.
    Global Set Primitive Projections.
    
    Global Instance Get__marker : Notation.Dot "_marker" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End Mapping.
End Mapping.
Definition Mapping : Set := @Mapping.t.

Module
  Impl_scale_info_TypeInfo_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
Section
  Impl_scale_info_TypeInfo_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Context {K V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
  
  Definition Identity : Set := Self.
  
  Parameter type_info : forall `{H : State.Trait},
      M (H := H) scale_info.ty.Type.
  
  Global Instance AssociatedFunction_type_info `{H : State.Trait} :
    Notation.DoubleColon Self "type_info" := {
    Notation.double_colon := type_info;
  }.
  
  Global Instance I : scale_info.TypeInfo.Trait Self := {
    scale_info.TypeInfo.type_info `{H : State.Trait} := type_info;
  }.
End Impl_scale_info_TypeInfo_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
End Impl_scale_info_TypeInfo_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module
  Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
Section
  Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Context {K V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
  
  Parameter default : forall `{H : State.Trait}, M (H := H) Self.
  
  Global Instance AssociatedFunction_default `{H : State.Trait} :
    Notation.DoubleColon Self "default" := {
    Notation.double_colon := default;
  }.
  
  Global Instance I : core.default.Default.Trait Self := {
    core.default.Default.default `{H : State.Trait} := default;
  }.
End Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
End Impl_core_default_Default_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_5.
  Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
  
  Parameter new : forall `{H : State.Trait}, M (H := H) Self.
  
  Global Instance AssociatedFunction_new `{H : State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
End Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_5.

Module Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
Section Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Context {K V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
End Impl_core_fmt_Debug_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_6.
  Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
  
  Parameter insert : forall `{H : State.Trait},
      mut_ref Self ->
      Q ->
      ref R ->
      M (H := H) (core.option.Option u32).
  
  Global Instance Method_insert `{H : State.Trait} : Notation.Dot "insert" := {
    Notation.dot := insert;
  }.
  
  Parameter get : forall `{H : State.Trait},
      ref Self ->
      Q ->
      M (H := H) (core.option.Option V).
  
  Global Instance Method_get `{H : State.Trait} : Notation.Dot "get" := {
    Notation.dot := get;
  }.
  
  Parameter take : forall `{H : State.Trait},
      ref Self ->
      Q ->
      M (H := H) (core.option.Option V).
  
  Global Instance Method_take `{H : State.Trait} : Notation.Dot "take" := {
    Notation.dot := take;
  }.
  
  Parameter size : forall `{H : State.Trait},
      ref Self ->
      Q ->
      M (H := H) (core.option.Option u32).
  
  Global Instance Method_size `{H : State.Trait} : Notation.Dot "size" := {
    Notation.dot := size;
  }.
  
  Parameter contains : forall `{H : State.Trait},
      ref Self ->
      Q ->
      M (H := H) bool.
  
  Global Instance Method_contains `{H : State.Trait} :
    Notation.Dot "contains" := {
    Notation.dot := contains;
  }.
  
  Parameter remove : forall `{H : State.Trait},
      ref Self ->
      Q ->
      M (H := H) unit.
  
  Global Instance Method_remove `{H : State.Trait} : Notation.Dot "remove" := {
    Notation.dot := remove;
  }.
End Impl_ink_storage_lazy_mapping_Mapping_K_V_KeyType_6.

Module
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
Section
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Context {K V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
  
  Parameter encode : forall `{H : State.Trait},
      ref Self ->
      mut_ref T ->
      M (H := H) unit.
  
  Global Instance Method_encode `{H : State.Trait} : Notation.Dot "encode" := {
    Notation.dot := encode;
  }.
  
  Parameter decode : forall `{H : State.Trait},
      mut_ref I ->
      M (H := H) (core.result.Result Self parity_scale_codec.error.Error).
  
  Global Instance AssociatedFunction_decode `{H : State.Trait} :
    Notation.DoubleColon Self "decode" := {
    Notation.double_colon := decode;
  }.
  
  Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
    ink_storage_traits.storage.Storable.encode `{H : State.Trait} := encode;
    ink_storage_traits.storage.Storable.decode `{H : State.Trait} := decode;
  }.
End
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
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
  
  Global Instance I :
      ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
  }.
End
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.
End
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_mapping_Mapping_K_V_InnerKey.

Module
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
Section
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Context {K V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
  
  Definition KEY := Pure KeyType::["KEY"].
  
  Global Instance AssociatedFunction_KEY `{H : State.Trait} :
    Notation.DoubleColon Self "KEY" := {
    Notation.double_colon := KEY;
  }.
  
  Global Instance I : ink_storage_traits.storage.StorageKey.Trait Self := {
    ink_storage_traits.storage.StorageKey.KEY `{H : State.Trait} := KEY;
  }.
End
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
End
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
Section
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
  Context {K V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.mapping.Mapping K V KeyType.
  
  Parameter layout : forall `{H : State.Trait},
      ref ink_primitives.key.Key ->
      M (H := H) ink_metadata.layout.Layout.
  
  Global Instance AssociatedFunction_layout `{H : State.Trait} :
    Notation.DoubleColon Self "layout" := {
    Notation.double_colon := layout;
  }.
  
  Global Instance I : ink_storage_traits.layout.StorageLayout.Trait Self := {
    ink_storage_traits.layout.StorageLayout.layout `{H : State.Trait} := layout;
  }.
End
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.
End
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_mapping_Mapping_K_V_KeyType.

Module Lazy.
  Section Lazy.
    Context {V KeyType : Set}.
    Unset Primitive Projections.
    Record t : Set := {
      _marker : core.marker.PhantomData ((V * KeyType));
    }.
    Global Set Primitive Projections.
    
    Global Instance Get__marker : Notation.Dot "_marker" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End Lazy.
End Lazy.
Definition Lazy : Set := @Lazy.t.

Module Impl_scale_info_TypeInfo_for_ink_storage_lazy_Lazy_V_KeyType.
Section Impl_scale_info_TypeInfo_for_ink_storage_lazy_Lazy_V_KeyType.
  Context {V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.Lazy V KeyType.
  
  Definition Identity : Set := Self.
  
  Parameter type_info : forall `{H : State.Trait},
      M (H := H) scale_info.ty.Type.
  
  Global Instance AssociatedFunction_type_info `{H : State.Trait} :
    Notation.DoubleColon Self "type_info" := {
    Notation.double_colon := type_info;
  }.
  
  Global Instance I : scale_info.TypeInfo.Trait Self := {
    scale_info.TypeInfo.type_info `{H : State.Trait} := type_info;
  }.
End Impl_scale_info_TypeInfo_for_ink_storage_lazy_Lazy_V_KeyType.
End Impl_scale_info_TypeInfo_for_ink_storage_lazy_Lazy_V_KeyType.

Module Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
Section Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
  Context {V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.Lazy V KeyType.
  
  Parameter default : forall `{H : State.Trait}, M (H := H) Self.
  
  Global Instance AssociatedFunction_default `{H : State.Trait} :
    Notation.DoubleColon Self "default" := {
    Notation.double_colon := default;
  }.
  
  Global Instance I : core.default.Default.Trait Self := {
    core.default.Default.default `{H : State.Trait} := default;
  }.
End Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.
End Impl_core_default_Default_for_ink_storage_lazy_Lazy_V_KeyType.

Module Impl_ink_storage_lazy_Lazy_V_KeyType_4.
  Definition Self := ink_storage.lazy.Lazy V KeyType.
  
  Parameter new : forall `{H : State.Trait}, M (H := H) Self.
  
  Global Instance AssociatedFunction_new `{H : State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
End Impl_ink_storage_lazy_Lazy_V_KeyType_4.

Module Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
Section Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
  Context {V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.Lazy V KeyType.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.
End Impl_core_fmt_Debug_for_ink_storage_lazy_Lazy_V_KeyType.

Module Impl_ink_storage_lazy_Lazy_V_KeyType_5.
  Definition Self := ink_storage.lazy.Lazy V KeyType.
  
  Parameter get : forall `{H : State.Trait},
      ref Self ->
      M (H := H) (core.option.Option V).
  
  Global Instance Method_get `{H : State.Trait} : Notation.Dot "get" := {
    Notation.dot := get;
  }.
  
  Parameter set : forall `{H : State.Trait},
      mut_ref Self ->
      ref V ->
      M (H := H) unit.
  
  Global Instance Method_set `{H : State.Trait} : Notation.Dot "set" := {
    Notation.dot := set;
  }.
End Impl_ink_storage_lazy_Lazy_V_KeyType_5.

Module Impl_ink_storage_lazy_Lazy_V_KeyType_6.
  Definition Self := ink_storage.lazy.Lazy V KeyType.
  
  Parameter get_or_default : forall `{H : State.Trait},
      ref Self ->
      M (H := H) V.
  
  Global Instance Method_get_or_default `{H : State.Trait} :
    Notation.Dot "get_or_default" := {
    Notation.dot := get_or_default;
  }.
End Impl_ink_storage_lazy_Lazy_V_KeyType_6.

Module
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
Section
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
  Context {V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.Lazy V KeyType.
  
  Parameter encode : forall `{H : State.Trait},
      ref Self ->
      mut_ref T ->
      M (H := H) unit.
  
  Global Instance Method_encode `{H : State.Trait} : Notation.Dot "encode" := {
    Notation.dot := encode;
  }.
  
  Parameter decode : forall `{H : State.Trait},
      mut_ref I ->
      M (H := H) (core.result.Result Self parity_scale_codec.error.Error).
  
  Global Instance AssociatedFunction_decode `{H : State.Trait} :
    Notation.DoubleColon Self "decode" := {
    Notation.double_colon := decode;
  }.
  
  Global Instance I : ink_storage_traits.storage.Storable.Trait Self := {
    ink_storage_traits.storage.Storable.encode `{H : State.Trait} := encode;
    ink_storage_traits.storage.Storable.decode `{H : State.Trait} := decode;
  }.
End
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.
End
  Impl_ink_storage_traits_storage_Storable_for_ink_storage_lazy_Lazy_V_KeyType.

Module
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
Section
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
  Context {V Key InnerKey : Set}.
  
  Definition Self := ink_storage.lazy.Lazy V InnerKey.
  
  Definition Type : Set := ink_storage.lazy.Lazy ImplV.Type Key.
  
  Definition PreferredKey : Set := InnerKey.
  
  Global Instance I :
      ink_storage_traits.storage.StorableHint.Trait Self (Key := Key) := {
  }.
End
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.
End
  Impl_ink_storage_traits_storage_StorableHint_for_ink_storage_lazy_Lazy_V_InnerKey.

Module
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
Section
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
  Context {V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.Lazy V KeyType.
  
  Definition KEY := Pure KeyType::["KEY"].
  
  Global Instance AssociatedFunction_KEY `{H : State.Trait} :
    Notation.DoubleColon Self "KEY" := {
    Notation.double_colon := KEY;
  }.
  
  Global Instance I : ink_storage_traits.storage.StorageKey.Trait Self := {
    ink_storage_traits.storage.StorageKey.KEY `{H : State.Trait} := KEY;
  }.
End
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.
End
  Impl_ink_storage_traits_storage_StorageKey_for_ink_storage_lazy_Lazy_V_KeyType.

Module
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_Lazy_V_KeyType.
Section
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_Lazy_V_KeyType.
  Context {V KeyType : Set}.
  
  Definition Self := ink_storage.lazy.Lazy V KeyType.
  
  Parameter layout : forall `{H : State.Trait},
      ref ink_primitives.key.Key ->
      M (H := H) ink_metadata.layout.Layout.
  
  Global Instance AssociatedFunction_layout `{H : State.Trait} :
    Notation.DoubleColon Self "layout" := {
    Notation.double_colon := layout;
  }.
  
  Global Instance I : ink_storage_traits.layout.StorageLayout.Trait Self := {
    ink_storage_traits.layout.StorageLayout.layout `{H : State.Trait} := layout;
  }.
End
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_Lazy_V_KeyType.
End
  Impl_ink_storage_traits_layout_StorageLayout_for_ink_storage_lazy_Lazy_V_KeyType.
