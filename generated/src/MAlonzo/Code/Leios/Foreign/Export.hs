{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
{-# LANGUAGE DuplicateRecordFields #-}

module MAlonzo.Code.Leios.Foreign.Export where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Maybe
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Axiom.Set
import qualified MAlonzo.Code.Axiom.Set.TotalMap
import qualified MAlonzo.Code.Class.Computational
import qualified MAlonzo.Code.Class.Computational22
import qualified MAlonzo.Code.Class.Convertible
import qualified MAlonzo.Code.Class.DecEq.Core
import qualified MAlonzo.Code.Class.DecEq.Instances
import qualified MAlonzo.Code.Class.Functor.Core
import qualified MAlonzo.Code.Class.Functor.Instances
import qualified MAlonzo.Code.Class.HasHsType
import qualified MAlonzo.Code.Data.Char.Base
import qualified MAlonzo.Code.Data.Fin.Base
import qualified MAlonzo.Code.Data.Integer.Base
import qualified MAlonzo.Code.Data.Irrelevant
import qualified MAlonzo.Code.Data.List.Relation.Unary.Any
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.String.Base
import qualified MAlonzo.Code.Data.Sum.Base
import qualified MAlonzo.Code.Data.These.Base
import qualified MAlonzo.Code.Foreign.Haskell.Coerce
import qualified MAlonzo.Code.Foreign.Haskell.Either
import qualified MAlonzo.Code.Foreign.Haskell.Pair
import qualified MAlonzo.Code.Function.Bundles
import qualified MAlonzo.Code.Leios.Base
import qualified MAlonzo.Code.Leios.Blocks
import qualified MAlonzo.Code.Leios.FFD
import qualified MAlonzo.Code.Leios.Foreign.BaseTypes
import qualified MAlonzo.Code.Leios.Foreign.Defaults
import qualified MAlonzo.Code.Leios.Foreign.HSTypes
import qualified MAlonzo.Code.Leios.Protocol
import qualified MAlonzo.Code.Leios.Short
import qualified MAlonzo.Code.Leios.Short.Deterministic
import qualified MAlonzo.Code.QabstractZ45ZsetZ45Ztheory.FiniteSetTheory

import GHC.Generics (Generic)
data IBHeader = IBHeader {slotNumber :: Integer, producerID :: Integer, bodyHash :: Data.Text.Text }
  deriving (Show, Eq, Generic)
data EndorserBlock = EndorserBlock { slotNumber :: Integer, producerID :: Integer, ibRefs :: [Data.Text.Text] }
  deriving (Show, Eq, Generic)
data SlotUpkeep = Base  | IBRole  | EBRole  | VRole 
  deriving (Show, Eq, Generic)
data IBBody = IBBody {txs :: [Integer]}
  deriving (Show, Eq, Generic)
data InputBlock = InputBlock {header :: MAlonzo.Code.Leios.Foreign.Export.IBHeader, body :: MAlonzo.Code.Leios.Foreign.Export.IBBody}
  deriving (Show, Eq, Generic)
data FFDState = FFDState {inIBs :: [MAlonzo.Code.Leios.Foreign.Export.InputBlock], inEBs :: [MAlonzo.Code.Leios.Foreign.Export.EndorserBlock], inVTs :: [[()]], outIBs :: [MAlonzo.Code.Leios.Foreign.Export.InputBlock], outEBs :: [MAlonzo.Code.Leios.Foreign.Export.EndorserBlock], outVTs :: [[()]]}
  deriving (Show, Eq, Generic)
data LeiosState = LeiosState {v :: (), sD :: (MAlonzo.Code.Leios.Foreign.HSTypes.HSMap Integer Integer), fFDState :: MAlonzo.Code.Leios.Foreign.Export.FFDState, ledger :: [Integer], toPropose :: [Integer], iBs :: [MAlonzo.Code.Leios.Foreign.Export.InputBlock], eBs :: [MAlonzo.Code.Leios.Foreign.Export.EndorserBlock], vs :: [[()]], slot :: Integer, iBHeaders :: [MAlonzo.Code.Leios.Foreign.Export.IBHeader], iBBodies :: [MAlonzo.Code.Leios.Foreign.Export.IBBody], upkeep :: (MAlonzo.Code.Leios.Foreign.HSTypes.HSSet MAlonzo.Code.Leios.Foreign.Export.SlotUpkeep), baseState :: (), votingState :: ()}
  deriving (Show, Eq, Generic)
data LeiosInput = I_INIT () | I_SUBMIT (Either MAlonzo.Code.Leios.Foreign.Export.EndorserBlock [Integer]) | I_SLOT  | I_FTCHLDG 
  deriving (Show, Eq, Generic)
data LeiosOutput = O_FTCHLDG [Integer] | O_EMPTY 
  deriving (Show, Eq, Generic)
-- Leios.Foreign.Export.dropDash
d_dropDash_6 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_dropDash_6 v0
  = coe
      MAlonzo.Code.Data.String.Base.d_concat_28
      (coe
         MAlonzo.Code.Data.String.Base.d_wordsBy'7495'_110
         (MAlonzo.Code.Data.Char.Base.d__'8776''7495'__14 (coe '-')) v0)
-- Leios.Foreign.Export.prefix
d_prefix_10 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_prefix_10 v0
  = coe MAlonzo.Code.Data.String.Base.d__'43''43'__20 v0
-- Leios.Foreign.Export.HsTy-SlotUpkeep
d_HsTy'45'SlotUpkeep_16 ::
  MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'SlotUpkeep_16 = erased
-- Leios.Foreign.Export.Conv-SlotUpkeep
d_Conv'45'SlotUpkeep_18 ::
  MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'SlotUpkeep_18
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe
         (\ v0 ->
            case coe v0 of
              MAlonzo.Code.Leios.Short.C_Base_478 -> coe C_Base_103
              MAlonzo.Code.Leios.Short.C_IB'45'Role_480 -> coe C_IBRole_105
              MAlonzo.Code.Leios.Short.C_EB'45'Role_482 -> coe C_EBRole_107
              MAlonzo.Code.Leios.Short.C_V'45'Role_484 -> coe C_VRole_109
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         (\ v0 ->
            case coe v0 of
              C_Base_103 -> coe MAlonzo.Code.Leios.Short.C_Base_478
              C_IBRole_105 -> coe MAlonzo.Code.Leios.Short.C_IB'45'Role_480
              C_EBRole_107 -> coe MAlonzo.Code.Leios.Short.C_EB'45'Role_482
              C_VRole_109 -> coe MAlonzo.Code.Leios.Short.C_V'45'Role_484
              _ -> MAlonzo.RTE.mazUnreachableError))
-- Leios.Foreign.Export.IBHeader
d_IBHeader_20 = ()
type T_IBHeader_20 = IBHeader
pattern C_IBHeader'46'constructor_243 a0 a1 a2 = IBHeader a0 a1 a2
check_IBHeader'46'constructor_243 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 -> T_IBHeader_20
check_IBHeader'46'constructor_243 = IBHeader
cover_IBHeader_20 :: IBHeader -> ()
cover_IBHeader_20 x
  = case x of
      IBHeader _ _ _ -> ()
-- Leios.Foreign.Export.IBHeader.slotNumber
d_slotNumber_28 :: T_IBHeader_20 -> Integer
d_slotNumber_28 v0
  = case coe v0 of
      C_IBHeader'46'constructor_243 v1 v2 v3 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Leios.Foreign.Export.IBHeader.producerID
d_producerID_30 :: T_IBHeader_20 -> Integer
d_producerID_30 v0
  = case coe v0 of
      C_IBHeader'46'constructor_243 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Leios.Foreign.Export.IBHeader.bodyHash
d_bodyHash_32 ::
  T_IBHeader_20 -> MAlonzo.Code.Agda.Builtin.String.T_String_6
d_bodyHash_32 v0
  = case coe v0 of
      C_IBHeader'46'constructor_243 v1 v2 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Leios.Foreign.Export.HsTy-IBHeader
d_HsTy'45'IBHeader_34 ::
  MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'IBHeader_34 = erased
-- Leios.Foreign.Export.Conv-IBHeader
d_Conv'45'IBHeader_36 ::
  MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'IBHeader_36
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe
         (\ v0 ->
            coe
              C_IBHeader'46'constructor_243
              (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_94 (coe v0))
              (coe
                 MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                 (coe MAlonzo.Code.Leios.Blocks.d_producerID_96 (coe v0)))
              (coe MAlonzo.Code.Leios.Blocks.d_bodyHash_100 (coe v0))))
      (coe
         (\ v0 ->
            coe
              MAlonzo.Code.Leios.Blocks.C_IBHeaderOSig'46'constructor_591
              (coe
                 MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                 (coe d_slotNumber_28 (coe v0)))
              (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
              (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
              (coe d_bodyHash_32 (coe v0))
              (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
-- Leios.Foreign.Export.HsTy-IBBody
d_HsTy'45'IBBody_54 :: MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'IBBody_54 = erased
-- Leios.Foreign.Export.Conv-IBBody
d_Conv'45'IBBody_56 ::
  MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'IBBody_56
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe
         (\ v0 ->
            case coe v0 of
              MAlonzo.Code.Leios.Blocks.C_IBBody'46'constructor_795 v1
                -> coe
                     C_IBBody_551
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                        v1)
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         (\ v0 ->
            case coe v0 of
              C_IBBody_551 v1
                -> coe
                     MAlonzo.Code.Leios.Blocks.C_IBBody'46'constructor_795
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                        v1)
              _ -> MAlonzo.RTE.mazUnreachableError))
-- Leios.Foreign.Export.HsTy-InputBlock
d_HsTy'45'InputBlock_58 ::
  MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'InputBlock_58 = erased
-- Leios.Foreign.Export.Conv-InputBlock
d_Conv'45'InputBlock_60 ::
  MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'InputBlock_60
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe
         (\ v0 ->
            case coe v0 of
              MAlonzo.Code.Leios.Blocks.C_InputBlock'46'constructor_823 v1 v2
                -> coe
                     C_InputBlock_875
                     (coe
                        C_IBHeader'46'constructor_243
                        (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_94 (coe v1))
                        (coe
                           MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                           (coe MAlonzo.Code.Leios.Blocks.d_producerID_96 (coe v1)))
                        (coe MAlonzo.Code.Leios.Blocks.d_bodyHash_100 (coe v1)))
                     (coe
                        C_IBBody_551
                        (coe
                           MAlonzo.Code.Class.Functor.Core.du_fmap_22
                           MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                           () erased
                           (MAlonzo.Code.Class.Convertible.d_to_18
                              (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                           (MAlonzo.Code.Leios.Blocks.d_txs_112 (coe v2))))
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         (\ v0 ->
            case coe v0 of
              C_InputBlock_875 v1 v2
                -> coe
                     MAlonzo.Code.Leios.Blocks.C_InputBlock'46'constructor_823
                     (coe
                        MAlonzo.Code.Leios.Blocks.C_IBHeaderOSig'46'constructor_591
                        (coe
                           MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                           (coe d_slotNumber_28 (coe v1)))
                        (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
                        (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                        (coe d_bodyHash_32 (coe v1))
                        (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                     (coe
                        MAlonzo.Code.Class.Convertible.d_from_20
                        (coe
                           MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                           (coe
                              (\ v3 ->
                                 case coe v3 of
                                   MAlonzo.Code.Leios.Blocks.C_IBBody'46'constructor_795 v4
                                     -> coe
                                          C_IBBody_551
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_to_18
                                                (coe
                                                   MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                                             v4)
                                   _ -> MAlonzo.RTE.mazUnreachableError))
                           (coe
                              (\ v3 ->
                                 case coe v3 of
                                   C_IBBody_551 v4
                                     -> coe
                                          MAlonzo.Code.Leios.Blocks.C_IBBody'46'constructor_795
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_from_20
                                                (coe
                                                   MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                                             v4)
                                   _ -> MAlonzo.RTE.mazUnreachableError)))
                        v2)
              _ -> MAlonzo.RTE.mazUnreachableError))
-- Leios.Foreign.Export.HsTy-Fin
d_HsTy'45'Fin_62 :: MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'Fin_62 = erased
-- Leios.Foreign.Export.Conv-Fin
d_Conv'45'Fin_64 :: MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'Fin_64
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe MAlonzo.Code.Data.Fin.Base.du_toℕ_18)
      (coe (\ v0 -> coe MAlonzo.Code.Data.Fin.Base.C_zero_12))
-- Leios.Foreign.Export.Conv-ℕ
d_Conv'45'ℕ_68 :: MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'ℕ_68
  = coe MAlonzo.Code.Class.Convertible.du_Convertible'45'Refl_36
-- Leios.Foreign.Export.EndorserBlock
d_EndorserBlock_70 = ()
type T_EndorserBlock_70 = EndorserBlock
pattern C_EndorserBlock'46'constructor_1469 a0 a1 a2 = EndorserBlock a0 a1 a2
check_EndorserBlock'46'constructor_1469 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10
    () MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  T_EndorserBlock_70
check_EndorserBlock'46'constructor_1469 = EndorserBlock
cover_EndorserBlock_70 :: EndorserBlock -> ()
cover_EndorserBlock_70 x
  = case x of
      EndorserBlock _ _ _ -> ()
-- Leios.Foreign.Export.EndorserBlock.slotNumber
d_slotNumber_78 :: T_EndorserBlock_70 -> Integer
d_slotNumber_78 v0
  = case coe v0 of
      C_EndorserBlock'46'constructor_1469 v1 v2 v3 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Leios.Foreign.Export.EndorserBlock.producerID
d_producerID_80 :: T_EndorserBlock_70 -> Integer
d_producerID_80 v0
  = case coe v0 of
      C_EndorserBlock'46'constructor_1469 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Leios.Foreign.Export.EndorserBlock.ibRefs
d_ibRefs_82 ::
  T_EndorserBlock_70 -> [MAlonzo.Code.Agda.Builtin.String.T_String_6]
d_ibRefs_82 v0
  = case coe v0 of
      C_EndorserBlock'46'constructor_1469 v1 v2 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Leios.Foreign.Export.HsTy-EndorserBlock
d_HsTy'45'EndorserBlock_84 ::
  MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'EndorserBlock_84 = erased
-- Leios.Foreign.Export.Conv-EndorserBlock
d_Conv'45'EndorserBlock_86 ::
  MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'EndorserBlock_86
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe
         (\ v0 ->
            coe
              C_EndorserBlock'46'constructor_1469
              (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_232 (coe v0))
              (coe
                 MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                 (coe MAlonzo.Code.Leios.Blocks.d_producerID_234 (coe v0)))
              (coe MAlonzo.Code.Leios.Blocks.d_ibRefs_238 (coe v0))))
      (coe
         (\ v0 ->
            coe
              MAlonzo.Code.Leios.Blocks.C_EndorserBlockOSig'46'constructor_3013
              (coe
                 MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                 (coe d_slotNumber_78 (coe v0)))
              (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
              (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
              (coe d_ibRefs_82 (coe v0))
              (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
              (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
-- Leios.Foreign.Export.SlotUpkeep
d_SlotUpkeep_101 = ()
type T_SlotUpkeep_101 = SlotUpkeep
pattern C_Base_103 = Base
pattern C_IBRole_105 = IBRole
pattern C_EBRole_107 = EBRole
pattern C_VRole_109 = VRole
check_Base_103 :: T_SlotUpkeep_101
check_Base_103 = Base
check_IBRole_105 :: T_SlotUpkeep_101
check_IBRole_105 = IBRole
check_EBRole_107 :: T_SlotUpkeep_101
check_EBRole_107 = EBRole
check_VRole_109 :: T_SlotUpkeep_101
check_VRole_109 = VRole
cover_SlotUpkeep_101 :: SlotUpkeep -> ()
cover_SlotUpkeep_101 x
  = case x of
      Base -> ()
      IBRole -> ()
      EBRole -> ()
      VRole -> ()
-- Leios.Foreign.Export.Listable-Fin
d_Listable'45'Fin_104 ::
  MAlonzo.Code.Leios.Foreign.BaseTypes.T_Listable_90
d_Listable'45'Fin_104
  = coe
      MAlonzo.Code.Leios.Foreign.BaseTypes.C_Listable'46'constructor_10891
      (coe
         MAlonzo.Code.Axiom.Set.du_singleton_448
         (coe
            MAlonzo.Code.Axiom.Set.d_th_1470
            (coe
               MAlonzo.Code.QabstractZ45ZsetZ45Ztheory.FiniteSetTheory.d_List'45'Model'7496'_8))
         (coe MAlonzo.Code.Data.Fin.Base.C_zero_12))
      (coe
         (\ v0 ->
            coe
              MAlonzo.Code.Function.Bundles.d_to_1724
              (coe
                 MAlonzo.Code.Axiom.Set.du_'8712''45'singleton_458
                 (coe
                    MAlonzo.Code.Axiom.Set.d_th_1470
                    (coe
                       MAlonzo.Code.QabstractZ45ZsetZ45Ztheory.FiniteSetTheory.d_List'45'Model'7496'_8))
                 (coe v0) (coe MAlonzo.Code.Data.Fin.Base.C_zero_12))
              erased))
-- Leios.Foreign.Export._.a≡zero
d_a'8801'zero_112 ::
  MAlonzo.Code.Data.Fin.Base.T_Fin_10 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_a'8801'zero_112 = erased
-- Leios.Foreign.Export.HsTy-FFDState
d_HsTy'45'FFDState_116 ::
  MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'FFDState_116 = erased
-- Leios.Foreign.Export.Conv-FFDState
d_Conv'45'FFDState_118 ::
  MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'FFDState_118
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe
         (\ v0 ->
            case coe v0 of
              MAlonzo.Code.Leios.Foreign.Defaults.C_FFDState'46'constructor_1537 v1 v2 v3 v4 v5 v6
                -> coe
                     C_FFDState_2147
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe d_Conv'45'InputBlock_60))
                        v1)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (\ v7 ->
                           coe
                             C_EndorserBlock'46'constructor_1469
                             (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_232 (coe v7))
                             (coe
                                MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                                (coe MAlonzo.Code.Leios.Blocks.d_producerID_234 (coe v7)))
                             (coe MAlonzo.Code.Leios.Blocks.d_ibRefs_238 (coe v7)))
                        v2)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe
                              MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                              (coe
                                 MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                 (coe (\ v7 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                 (coe (\ v7 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                        v3)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe d_Conv'45'InputBlock_60))
                        v4)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (\ v7 ->
                           coe
                             C_EndorserBlock'46'constructor_1469
                             (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_232 (coe v7))
                             (coe
                                MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                                (coe MAlonzo.Code.Leios.Blocks.d_producerID_234 (coe v7)))
                             (coe MAlonzo.Code.Leios.Blocks.d_ibRefs_238 (coe v7)))
                        v5)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe
                              MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                              (coe
                                 MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                 (coe (\ v7 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                 (coe (\ v7 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                        v6)
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         (\ v0 ->
            case coe v0 of
              C_FFDState_2147 v1 v2 v3 v4 v5 v6
                -> coe
                     MAlonzo.Code.Leios.Foreign.Defaults.C_FFDState'46'constructor_1537
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe d_Conv'45'InputBlock_60))
                        v1)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (\ v7 ->
                           coe
                             MAlonzo.Code.Leios.Blocks.C_EndorserBlockOSig'46'constructor_3013
                             (coe
                                MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                                (coe d_slotNumber_78 (coe v7)))
                             (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                             (coe d_ibRefs_82 (coe v7))
                             (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                        v2)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe
                              MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                              (coe
                                 MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                 (coe (\ v7 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                 (coe (\ v7 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                        v3)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe d_Conv'45'InputBlock_60))
                        v4)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (\ v7 ->
                           coe
                             MAlonzo.Code.Leios.Blocks.C_EndorserBlockOSig'46'constructor_3013
                             (coe
                                MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                                (coe d_slotNumber_78 (coe v7)))
                             (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                             (coe d_ibRefs_82 (coe v7))
                             (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                        v5)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe
                              MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                              (coe
                                 MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                 (coe (\ v7 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                 (coe (\ v7 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                        v6)
              _ -> MAlonzo.RTE.mazUnreachableError))
-- Leios.Foreign.Export.HsTy-LeiosState
d_HsTy'45'LeiosState_120 ::
  MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'LeiosState_120 = erased
-- Leios.Foreign.Export.Conv-LeiosState
d_Conv'45'LeiosState_122 ::
  MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'LeiosState_122
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe
         (\ v0 ->
            case coe v0 of
              MAlonzo.Code.Leios.Protocol.C_LeiosState'46'constructor_2273 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
                -> coe
                     C_LeiosState_7851 (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                     (coe
                        MAlonzo.Code.Leios.Foreign.HSTypes.C_MkHSMap_26
                        (coe
                           MAlonzo.Code.Class.Convertible.d_to_18
                           (coe
                              MAlonzo.Code.Leios.Foreign.BaseTypes.du_Convertible'45'FinSet_50
                              (coe
                                 MAlonzo.Code.Class.Convertible.du_Convertible'45'Pair_96
                                 (coe d_Conv'45'Fin_64)
                                 (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8)))
                           (MAlonzo.Code.Axiom.Set.TotalMap.d_rel_180 (coe v2))))
                     (coe
                        C_FFDState_2147
                        (coe
                           MAlonzo.Code.Class.Functor.Core.du_fmap_22
                           MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                           () erased
                           (MAlonzo.Code.Class.Convertible.d_to_18
                              (coe d_Conv'45'InputBlock_60))
                           (MAlonzo.Code.Leios.Foreign.Defaults.d_inIBs_700 (coe v3)))
                        (coe
                           MAlonzo.Code.Class.Functor.Core.du_fmap_22
                           MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                           () erased
                           (\ v15 ->
                              coe
                                C_EndorserBlock'46'constructor_1469
                                (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_232 (coe v15))
                                (coe
                                   MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                                   (coe MAlonzo.Code.Leios.Blocks.d_producerID_234 (coe v15)))
                                (coe MAlonzo.Code.Leios.Blocks.d_ibRefs_238 (coe v15)))
                           (MAlonzo.Code.Leios.Foreign.Defaults.d_inEBs_702 (coe v3)))
                        (coe
                           MAlonzo.Code.Class.Functor.Core.du_fmap_22
                           MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                           () erased
                           (MAlonzo.Code.Class.Convertible.d_to_18
                              (coe
                                 MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                                 (coe
                                    MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                    (coe (\ v15 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                    (coe (\ v15 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                           (MAlonzo.Code.Leios.Foreign.Defaults.d_inVTs_704 (coe v3)))
                        (coe
                           MAlonzo.Code.Class.Functor.Core.du_fmap_22
                           MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                           () erased
                           (MAlonzo.Code.Class.Convertible.d_to_18
                              (coe d_Conv'45'InputBlock_60))
                           (MAlonzo.Code.Leios.Foreign.Defaults.d_outIBs_706 (coe v3)))
                        (coe
                           MAlonzo.Code.Class.Functor.Core.du_fmap_22
                           MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                           () erased
                           (\ v15 ->
                              coe
                                C_EndorserBlock'46'constructor_1469
                                (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_232 (coe v15))
                                (coe
                                   MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                                   (coe MAlonzo.Code.Leios.Blocks.d_producerID_234 (coe v15)))
                                (coe MAlonzo.Code.Leios.Blocks.d_ibRefs_238 (coe v15)))
                           (MAlonzo.Code.Leios.Foreign.Defaults.d_outEBs_708 (coe v3)))
                        (coe
                           MAlonzo.Code.Class.Functor.Core.du_fmap_22
                           MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                           () erased
                           (MAlonzo.Code.Class.Convertible.d_to_18
                              (coe
                                 MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                                 (coe
                                    MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                    (coe (\ v15 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                    (coe (\ v15 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                           (MAlonzo.Code.Leios.Foreign.Defaults.d_outVTs_710 (coe v3))))
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                        v4)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                        v5)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe d_Conv'45'InputBlock_60))
                        v6)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (\ v15 ->
                           coe
                             C_EndorserBlock'46'constructor_1469
                             (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_232 (coe v15))
                             (coe
                                MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                                (coe MAlonzo.Code.Leios.Blocks.d_producerID_234 (coe v15)))
                             (coe MAlonzo.Code.Leios.Blocks.d_ibRefs_238 (coe v15)))
                        v7)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe
                              MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                              (coe
                                 MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                 (coe (\ v15 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                 (coe (\ v15 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                        v8)
                     (coe v9)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (\ v15 ->
                           coe
                             C_IBHeader'46'constructor_243
                             (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_94 (coe v15))
                             (coe
                                MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                                (coe MAlonzo.Code.Leios.Blocks.d_producerID_96 (coe v15)))
                             (coe MAlonzo.Code.Leios.Blocks.d_bodyHash_100 (coe v15)))
                        v10)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18 (coe d_Conv'45'IBBody_56))
                        v11)
                     (coe
                        MAlonzo.Code.Leios.Foreign.HSTypes.C_MkHSSet_38
                        (coe
                           MAlonzo.Code.Class.Convertible.d_to_18
                           (coe
                              MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                              (coe d_Conv'45'SlotUpkeep_18))
                           v12))
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         (\ v0 ->
            case coe v0 of
              C_LeiosState_7851 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
                -> coe
                     MAlonzo.Code.Leios.Protocol.C_LeiosState'46'constructor_2273
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                     (coe
                        MAlonzo.Code.Class.Convertible.d_from_20
                        (coe
                           MAlonzo.Code.Leios.Foreign.BaseTypes.du_Convertible'45'TotalMap_168
                           (coe MAlonzo.Code.Class.DecEq.Instances.du_DecEq'45'Fin_52)
                           (coe d_Listable'45'Fin_104) (coe d_Conv'45'Fin_64)
                           (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                        (MAlonzo.Code.Leios.Foreign.HSTypes.d_assocList_24 (coe v2)))
                     (coe
                        MAlonzo.Code.Class.Convertible.d_from_20
                        (coe
                           MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                           (coe
                              (\ v15 ->
                                 case coe v15 of
                                   MAlonzo.Code.Leios.Foreign.Defaults.C_FFDState'46'constructor_1537 v16 v17 v18 v19 v20 v21
                                     -> coe
                                          C_FFDState_2147
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_to_18
                                                (coe d_Conv'45'InputBlock_60))
                                             v16)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (\ v22 ->
                                                coe
                                                  C_EndorserBlock'46'constructor_1469
                                                  (coe
                                                     MAlonzo.Code.Leios.Blocks.d_slotNumber_232
                                                     (coe v22))
                                                  (coe
                                                     MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                                                     (coe
                                                        MAlonzo.Code.Leios.Blocks.d_producerID_234
                                                        (coe v22)))
                                                  (coe
                                                     MAlonzo.Code.Leios.Blocks.d_ibRefs_238
                                                     (coe v22)))
                                             v17)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_to_18
                                                (coe
                                                   MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                                                   (coe
                                                      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                                      (coe
                                                         (\ v22 ->
                                                            coe
                                                              MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                                      (coe
                                                         (\ v22 ->
                                                            coe
                                                              MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                                             v18)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_to_18
                                                (coe d_Conv'45'InputBlock_60))
                                             v19)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (\ v22 ->
                                                coe
                                                  C_EndorserBlock'46'constructor_1469
                                                  (coe
                                                     MAlonzo.Code.Leios.Blocks.d_slotNumber_232
                                                     (coe v22))
                                                  (coe
                                                     MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                                                     (coe
                                                        MAlonzo.Code.Leios.Blocks.d_producerID_234
                                                        (coe v22)))
                                                  (coe
                                                     MAlonzo.Code.Leios.Blocks.d_ibRefs_238
                                                     (coe v22)))
                                             v20)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_to_18
                                                (coe
                                                   MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                                                   (coe
                                                      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                                      (coe
                                                         (\ v22 ->
                                                            coe
                                                              MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                                      (coe
                                                         (\ v22 ->
                                                            coe
                                                              MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                                             v21)
                                   _ -> MAlonzo.RTE.mazUnreachableError))
                           (coe
                              (\ v15 ->
                                 case coe v15 of
                                   C_FFDState_2147 v16 v17 v18 v19 v20 v21
                                     -> coe
                                          MAlonzo.Code.Leios.Foreign.Defaults.C_FFDState'46'constructor_1537
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_from_20
                                                (coe d_Conv'45'InputBlock_60))
                                             v16)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (\ v22 ->
                                                coe
                                                  MAlonzo.Code.Leios.Blocks.C_EndorserBlockOSig'46'constructor_3013
                                                  (coe
                                                     MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                                                     (coe d_slotNumber_78 (coe v22)))
                                                  (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
                                                  (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                                                  (coe d_ibRefs_82 (coe v22))
                                                  (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                                                  (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                             v17)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_from_20
                                                (coe
                                                   MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                                                   (coe
                                                      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                                      (coe
                                                         (\ v22 ->
                                                            coe
                                                              MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                                      (coe
                                                         (\ v22 ->
                                                            coe
                                                              MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                                             v18)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_from_20
                                                (coe d_Conv'45'InputBlock_60))
                                             v19)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (\ v22 ->
                                                coe
                                                  MAlonzo.Code.Leios.Blocks.C_EndorserBlockOSig'46'constructor_3013
                                                  (coe
                                                     MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                                                     (coe d_slotNumber_78 (coe v22)))
                                                  (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
                                                  (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                                                  (coe d_ibRefs_82 (coe v22))
                                                  (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                                                  (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                             v20)
                                          (coe
                                             MAlonzo.Code.Class.Functor.Core.du_fmap_22
                                             MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20
                                             () erased () erased
                                             (MAlonzo.Code.Class.Convertible.d_from_20
                                                (coe
                                                   MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                                                   (coe
                                                      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                                      (coe
                                                         (\ v22 ->
                                                            coe
                                                              MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                                      (coe
                                                         (\ v22 ->
                                                            coe
                                                              MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                                             v21)
                                   _ -> MAlonzo.RTE.mazUnreachableError)))
                        v3)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                        v4)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                        v5)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe d_Conv'45'InputBlock_60))
                        v6)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (\ v15 ->
                           coe
                             MAlonzo.Code.Leios.Blocks.C_EndorserBlockOSig'46'constructor_3013
                             (coe
                                MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                                (coe d_slotNumber_78 (coe v15)))
                             (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                             (coe d_ibRefs_82 (coe v15))
                             (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                        v7)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe
                              MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                              (coe
                                 MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
                                 (coe (\ v15 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                 (coe (\ v15 -> coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))))
                        v8)
                     (coe v9)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (\ v15 ->
                           coe
                             MAlonzo.Code.Leios.Blocks.C_IBHeaderOSig'46'constructor_591
                             (coe
                                MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                                (coe d_slotNumber_28 (coe v15)))
                             (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                             (coe d_bodyHash_32 (coe v15))
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                        v10)
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe d_Conv'45'IBBody_56))
                        v11)
                     (coe
                        MAlonzo.Code.Axiom.Set.du_fromList_428
                        (coe
                           MAlonzo.Code.Axiom.Set.d_th_1470
                           (coe
                              MAlonzo.Code.QabstractZ45ZsetZ45Ztheory.FiniteSetTheory.d_List'45'Model'7496'_8))
                        (coe
                           MAlonzo.Code.Class.Convertible.d_from_20
                           (coe
                              MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                              (coe d_Conv'45'SlotUpkeep_18))
                           (MAlonzo.Code.Leios.Foreign.HSTypes.d_elems_36 (coe v12))))
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
              _ -> MAlonzo.RTE.mazUnreachableError))
-- Leios.Foreign.Export.HsTy-LeiosInput
d_HsTy'45'LeiosInput_124 ::
  MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'LeiosInput_124 = erased
-- Leios.Foreign.Export.Conv-LeiosInput
d_Conv'45'LeiosInput_126 ::
  MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'LeiosInput_126
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe
         (\ v0 ->
            case coe v0 of
              MAlonzo.Code.Leios.Protocol.C_INIT_492 v1
                -> coe C_I_INIT_33951 (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
              MAlonzo.Code.Leios.Protocol.C_SUBMIT_494 v1
                -> coe
                     C_I_SUBMIT_33977
                     (coe
                        MAlonzo.Code.Foreign.Haskell.Coerce.d_coerce_44 () erased () erased
                        (coe MAlonzo.Code.Foreign.Haskell.Coerce.du_either'45'toFFI_96)
                        (coe
                           MAlonzo.Code.Data.Sum.Base.du_map_84
                           (\ v2 ->
                              coe
                                C_EndorserBlock'46'constructor_1469
                                (coe MAlonzo.Code.Leios.Blocks.d_slotNumber_232 (coe v2))
                                (coe
                                   MAlonzo.Code.Data.Fin.Base.du_toℕ_18
                                   (coe MAlonzo.Code.Leios.Blocks.d_producerID_234 (coe v2)))
                                (coe MAlonzo.Code.Leios.Blocks.d_ibRefs_238 (coe v2)))
                           (MAlonzo.Code.Class.Convertible.d_to_18
                              (coe
                                 MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                                 (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8)))
                           v1))
              MAlonzo.Code.Leios.Protocol.C_SLOT_496 -> coe C_I_SLOT_34021
              MAlonzo.Code.Leios.Protocol.C_FTCH'45'LDG_498
                -> coe C_I_FTCHLDG_34023
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         (\ v0 ->
            case coe v0 of
              C_I_INIT_33951 v1
                -> coe
                     MAlonzo.Code.Leios.Protocol.C_INIT_492
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
              C_I_SUBMIT_33977 v1
                -> coe
                     MAlonzo.Code.Leios.Protocol.C_SUBMIT_494
                     (coe
                        MAlonzo.Code.Data.Sum.Base.du_map_84
                        (\ v2 ->
                           coe
                             MAlonzo.Code.Leios.Blocks.C_EndorserBlockOSig'46'constructor_3013
                             (coe
                                MAlonzo.Code.Data.Integer.Base.d_'8739'_'8739'_18
                                (coe d_slotNumber_78 (coe v2)))
                             (coe MAlonzo.Code.Data.Fin.Base.C_zero_12)
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                             (coe d_ibRefs_82 (coe v2))
                             (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                             (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe
                              MAlonzo.Code.Class.Convertible.du_Convertible'45'List_106
                              (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8)))
                        (coe
                           MAlonzo.Code.Foreign.Haskell.Coerce.d_coerce_44 () erased () erased
                           (coe MAlonzo.Code.Foreign.Haskell.Coerce.C_TrustMe_40) v1))
              C_I_SLOT_34021 -> coe MAlonzo.Code.Leios.Protocol.C_SLOT_496
              C_I_FTCHLDG_34023
                -> coe MAlonzo.Code.Leios.Protocol.C_FTCH'45'LDG_498
              _ -> MAlonzo.RTE.mazUnreachableError))
-- Leios.Foreign.Export.HsTy-LeiosOutput
d_HsTy'45'LeiosOutput_128 ::
  MAlonzo.Code.Class.HasHsType.T_HasHsType_14
d_HsTy'45'LeiosOutput_128 = erased
-- Leios.Foreign.Export.Conv-LeiosOutput
d_Conv'45'LeiosOutput_130 ::
  MAlonzo.Code.Class.Convertible.T_Convertible_8
d_Conv'45'LeiosOutput_130
  = coe
      MAlonzo.Code.Class.Convertible.C_Convertible'46'constructor_21
      (coe
         (\ v0 ->
            case coe v0 of
              MAlonzo.Code.Leios.Protocol.C_FTCH'45'LDG_502 v1
                -> coe
                     C_O_FTCHLDG_34965
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_to_18
                           (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                        v1)
              MAlonzo.Code.Leios.Protocol.C_EMPTY_504 -> coe C_O_EMPTY_34985
              _ -> MAlonzo.RTE.mazUnreachableError))
      (coe
         (\ v0 ->
            case coe v0 of
              C_O_FTCHLDG_34965 v1
                -> coe
                     MAlonzo.Code.Leios.Protocol.C_FTCH'45'LDG_502
                     (coe
                        MAlonzo.Code.Class.Functor.Core.du_fmap_22
                        MAlonzo.Code.Class.Functor.Instances.d_Functor'45'List_20 () erased
                        () erased
                        (MAlonzo.Code.Class.Convertible.d_from_20
                           (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvNat_8))
                        v1)
              C_O_EMPTY_34985 -> coe MAlonzo.Code.Leios.Protocol.C_EMPTY_504
              _ -> MAlonzo.RTE.mazUnreachableError))
-- Leios.Foreign.Export.Computational-B
d_Computational'45'B_132 ::
  MAlonzo.Code.Class.Computational22.T_Computational22_26
d_Computational'45'B_132
  = coe
      MAlonzo.Code.Class.Computational22.C_MkComputational_86
      (\ v0 v1 ->
         case coe v1 of
           MAlonzo.Code.Leios.Base.C_INIT_114 v2
             -> coe
                  MAlonzo.Code.Class.Computational.C_success_36
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                     (coe
                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                        (coe
                           MAlonzo.Code.Leios.Base.C_STAKE_122
                           (coe MAlonzo.Code.Leios.Foreign.Defaults.d_sd_1012))
                        (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
           MAlonzo.Code.Leios.Base.C_SUBMIT_116 v2
             -> coe
                  MAlonzo.Code.Class.Computational.C_success_36
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                     (coe
                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                        (coe MAlonzo.Code.Leios.Base.C_EMPTY_124)
                        (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
           MAlonzo.Code.Leios.Base.C_FTCH'45'LDG_118
             -> coe
                  MAlonzo.Code.Class.Computational.C_success_36
                  (coe
                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                     (coe
                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                        (coe
                           MAlonzo.Code.Leios.Base.C_BASE'45'LDG_126
                           (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16))
                        (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                     (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
           _ -> MAlonzo.RTE.mazUnreachableError)
-- Leios.Foreign.Export.Computational-FFD
d_Computational'45'FFD_144 ::
  MAlonzo.Code.Class.Computational22.T_Computational22_26
d_Computational'45'FFD_144
  = coe
      MAlonzo.Code.Class.Computational22.C_MkComputational_86
      (\ v0 v1 ->
         let v2
               = coe
                   MAlonzo.Code.Class.Computational.C_failure_38
                   (coe ("FFD error" :: Data.Text.Text)) in
         coe
           (case coe v1 of
              MAlonzo.Code.Leios.FFD.C_Send_28 v3 v4
                -> case coe v3 of
                     MAlonzo.Code.Leios.Blocks.C_ibHeader_336 v5
                       -> case coe v4 of
                            MAlonzo.Code.Agda.Builtin.Maybe.C_just_16 v6
                              -> case coe v6 of
                                   MAlonzo.Code.Leios.Blocks.C_ibBody_344 v7
                                     -> coe
                                          MAlonzo.Code.Class.Computational.C_success_36
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                             (coe
                                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                (coe MAlonzo.Code.Leios.FFD.C_SendRes_34)
                                                (coe
                                                   MAlonzo.Code.Leios.Foreign.Defaults.C_FFDState'46'constructor_1537
                                                   (coe
                                                      MAlonzo.Code.Leios.Foreign.Defaults.d_inIBs_700
                                                      (coe v0))
                                                   (coe
                                                      MAlonzo.Code.Leios.Foreign.Defaults.d_inEBs_702
                                                      (coe v0))
                                                   (coe
                                                      MAlonzo.Code.Leios.Foreign.Defaults.d_inVTs_704
                                                      (coe v0))
                                                   (coe
                                                      MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                                      (coe
                                                         MAlonzo.Code.Leios.Blocks.C_InputBlock'46'constructor_823
                                                         (coe v5) (coe v7))
                                                      (coe
                                                         MAlonzo.Code.Leios.Foreign.Defaults.d_outIBs_706
                                                         (coe v0)))
                                                   (coe
                                                      MAlonzo.Code.Leios.Foreign.Defaults.d_outEBs_708
                                                      (coe v0))
                                                   (coe
                                                      MAlonzo.Code.Leios.Foreign.Defaults.d_outVTs_710
                                                      (coe v0))))
                                             (coe MAlonzo.Code.Leios.Foreign.Defaults.C_SendIB_740))
                                   _ -> MAlonzo.RTE.mazUnreachableError
                            _ -> coe v2
                     MAlonzo.Code.Leios.Blocks.C_ebHeader_338 v5
                       -> case coe v4 of
                            MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18
                              -> coe
                                   MAlonzo.Code.Class.Computational.C_success_36
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                         (coe MAlonzo.Code.Leios.FFD.C_SendRes_34)
                                         (coe
                                            MAlonzo.Code.Leios.Foreign.Defaults.C_FFDState'46'constructor_1537
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_inIBs_700
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_inEBs_702
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_inVTs_704
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_outIBs_706
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v5)
                                               (coe
                                                  MAlonzo.Code.Leios.Foreign.Defaults.d_outEBs_708
                                                  (coe v0)))
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_outVTs_710
                                               (coe v0))))
                                      (coe MAlonzo.Code.Leios.Foreign.Defaults.C_SendEB_746))
                            _ -> coe v2
                     MAlonzo.Code.Leios.Blocks.C_vHeader_340 v5
                       -> case coe v4 of
                            MAlonzo.Code.Agda.Builtin.Maybe.C_nothing_18
                              -> coe
                                   MAlonzo.Code.Class.Computational.C_success_36
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                         (coe MAlonzo.Code.Leios.FFD.C_SendRes_34)
                                         (coe
                                            MAlonzo.Code.Leios.Foreign.Defaults.C_FFDState'46'constructor_1537
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_inIBs_700
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_inEBs_702
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_inVTs_704
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_outIBs_706
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Leios.Foreign.Defaults.d_outEBs_708
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.List.C__'8759'__22 (coe v5)
                                               (coe
                                                  MAlonzo.Code.Leios.Foreign.Defaults.d_outVTs_710
                                                  (coe v0)))))
                                      (coe MAlonzo.Code.Leios.Foreign.Defaults.C_SendVS_752))
                            _ -> coe v2
                     _ -> MAlonzo.RTE.mazUnreachableError
              MAlonzo.Code.Leios.FFD.C_Fetch_30
                -> coe
                     MAlonzo.Code.Class.Computational.C_success_36
                     (coe
                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                        (coe
                           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                           (coe
                              MAlonzo.Code.Leios.FFD.C_FetchRes_36
                              (coe MAlonzo.Code.Leios.Foreign.Defaults.d_flushIns_712 (coe v0)))
                           (coe
                              MAlonzo.Code.Leios.Foreign.Defaults.C_FFDState'46'constructor_1537
                              (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                              (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                              (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
                              (coe MAlonzo.Code.Leios.Foreign.Defaults.d_outIBs_706 (coe v0))
                              (coe MAlonzo.Code.Leios.Foreign.Defaults.d_outEBs_708 (coe v0))
                              (coe MAlonzo.Code.Leios.Foreign.Defaults.d_outVTs_710 (coe v0))))
                        (coe MAlonzo.Code.Leios.Foreign.Defaults.C_Fetch_778))
              _ -> MAlonzo.RTE.mazUnreachableError))
-- Leios.Foreign.Export.D._-⟦_/_⟧ⁿᵈ*⇀_
d__'45''10214'_'47'_'10215''8319''7496''42''8640'__164 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Leios.Protocol.T_LeiosInput_490] ->
  [MAlonzo.Code.Leios.Protocol.T_LeiosOutput_500] ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 -> ()
d__'45''10214'_'47'_'10215''8319''7496''42''8640'__164 = erased
-- Leios.Foreign.Export.D._-⟦_/_⟧ⁿᵈ⇀_
d__'45''10214'_'47'_'10215''8319''7496''8640'__166 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosInput_490 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosOutput_500 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 -> ()
d__'45''10214'_'47'_'10215''8319''7496''8640'__166 = erased
-- Leios.Foreign.Export.D._-⟦_/_⟧⇀_
d__'45''10214'_'47'_'10215''8640'__168 a0 a1 a2 a3 = ()
-- Leios.Foreign.Export.D._-⟦Base⟧⇀_
d__'45''10214'Base'10215''8640'__170 a0 a1 = ()
-- Leios.Foreign.Export.D._-⟦EB-Role⟧⇀_
d__'45''10214'EB'45'Role'10215''8640'__172 a0 a1 = ()
-- Leios.Foreign.Export.D._-⟦IB-Role⟧⇀_
d__'45''10214'IB'45'Role'10215''8640'__174 a0 a1 = ()
-- Leios.Foreign.Export.D._-⟦V-Role⟧⇀_
d__'45''10214'V'45'Role'10215''8640'__176 a0 a1 = ()
-- Leios.Foreign.Export.D._⊢_
d__'8866'__178 a0 a1 = ()
-- Leios.Foreign.Export.D.Base-Upkeep
d_Base'45'Upkeep_180 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.Deterministic.T__'45''10214'Base'10215''8640'__888 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_Base'45'Upkeep_180 v0 v1 v2
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_Base'45'Upkeep_1064 v2
-- Leios.Foreign.Export.D.Base-total
d_Base'45'total_182 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  (MAlonzo.Code.Data.List.Relation.Unary.Any.T_Any_34 ->
   MAlonzo.Code.Data.Irrelevant.T_Irrelevant_20) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_Base'45'total_182 v0 v1
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_Base'45'total_998
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830) v0
-- Leios.Foreign.Export.D.Base⇒ND
d_Base'8658'ND_190 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.Deterministic.T__'45''10214'Base'10215''8640'__888 ->
  MAlonzo.Code.Leios.Short.T__'45''10214'_'47'_'10215''8640'__900
d_Base'8658'ND_190 v0 v1 v2
  = coe MAlonzo.Code.Leios.Short.Deterministic.du_Base'8658'ND_980 v2
-- Leios.Foreign.Export.D.Computational--⟦/⟧⇀
d_Computational'45''45''10214''47''10215''8640'_192 ::
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Class.Computational22.T_Computational22_26
d_Computational'45''45''10214''47''10215''8640'_192
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.d_Computational'45''45''10214''47''10215''8640'_1756
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830)
-- Leios.Foreign.Export.D.EB-Role-Upkeep
d_EB'45'Role'45'Upkeep_196 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.Deterministic.T__'45''10214'EB'45'Role'10215''8640'__1258 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_EB'45'Role'45'Upkeep_196 v0 v1 v2
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_EB'45'Role'45'Upkeep_1420
      v2
-- Leios.Foreign.Export.D.EB-Role-total
d_EB'45'Role'45'total_198 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  (MAlonzo.Code.Data.List.Relation.Unary.Any.T_Any_34 ->
   MAlonzo.Code.Data.Irrelevant.T_Irrelevant_20) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_EB'45'Role'45'total_198 v0 v1
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_EB'45'Role'45'total_1366
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830) v0
-- Leios.Foreign.Export.D.EB-Role⇒ND
d_EB'45'Role'8658'ND_200 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.Deterministic.T__'45''10214'EB'45'Role'10215''8640'__1258 ->
  MAlonzo.Code.Leios.Short.T__'45''10214'_'47'_'10215''8640'__900
d_EB'45'Role'8658'ND_200 v0 v1 v2
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_EB'45'Role'8658'ND_1352
      v2
-- Leios.Foreign.Export.D.IB-Role-Upkeep
d_IB'45'Role'45'Upkeep_206 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.Deterministic.T__'45''10214'IB'45'Role'10215''8640'__1082 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_IB'45'Role'45'Upkeep_206 v0 v1 v2
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_IB'45'Role'45'Upkeep_1242
      v2
-- Leios.Foreign.Export.D.IB-Role-total
d_IB'45'Role'45'total_208 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  (MAlonzo.Code.Data.List.Relation.Unary.Any.T_Any_34 ->
   MAlonzo.Code.Data.Irrelevant.T_Irrelevant_20) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_IB'45'Role'45'total_208 v0 v1
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_IB'45'Role'45'total_1188
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830) v0
-- Leios.Foreign.Export.D.IB-Role⇒ND
d_IB'45'Role'8658'ND_210 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.Deterministic.T__'45''10214'IB'45'Role'10215''8640'__1082 ->
  MAlonzo.Code.Leios.Short.T__'45''10214'_'47'_'10215''8640'__900
d_IB'45'Role'8658'ND_210 v0 v1 v2
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_IB'45'Role'8658'ND_1174
      v2
-- Leios.Foreign.Export.D.V-Role-Upkeep
d_V'45'Role'45'Upkeep_224 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.Deterministic.T__'45''10214'V'45'Role'10215''8640'__1436 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_V'45'Role'45'Upkeep_224 v0 v1 v2
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_V'45'Role'45'Upkeep_1594
      v2
-- Leios.Foreign.Export.D.V-Role-total
d_V'45'Role'45'total_226 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  (MAlonzo.Code.Data.List.Relation.Unary.Any.T_Any_34 ->
   MAlonzo.Code.Data.Irrelevant.T_Irrelevant_20) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_V'45'Role'45'total_226 v0 v1
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_V'45'Role'45'total_1542
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830) v0
-- Leios.Foreign.Export.D.V-Role⇒ND
d_V'45'Role'8658'ND_228 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.Deterministic.T__'45''10214'V'45'Role'10215''8640'__1436 ->
  MAlonzo.Code.Leios.Short.T__'45''10214'_'47'_'10215''8640'__900
d_V'45'Role'8658'ND_228 v0 v1 v2
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.du_V'45'Role'8658'ND_1528 v2
-- Leios.Foreign.Export.D.addUpkeep⇒¬needsUpkeep
d_addUpkeep'8658''172'needsUpkeep_230 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.T_SlotUpkeep_476 ->
  (MAlonzo.Code.Data.List.Relation.Unary.Any.T_Any_34 ->
   MAlonzo.Code.Data.Irrelevant.T_Irrelevant_20) ->
  MAlonzo.Code.Data.Irrelevant.T_Irrelevant_20
d_addUpkeep'8658''172'needsUpkeep_230 = erased
-- Leios.Foreign.Export.D.a≢b→a∉b
d_a'8802'b'8594'a'8713'b_232 ::
  () ->
  AgdaAny ->
  AgdaAny ->
  (MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
   MAlonzo.Code.Data.Irrelevant.T_Irrelevant_20) ->
  MAlonzo.Code.Data.List.Relation.Unary.Any.T_Any_34 ->
  MAlonzo.Code.Data.Irrelevant.T_Irrelevant_20
d_a'8802'b'8594'a'8713'b_232 = erased
-- Leios.Foreign.Export.D.bs
d_bs_234 ::
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_bs_234
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.d_bs_1860
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830)
-- Leios.Foreign.Export.D.lemma
d_lemma_236 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.T_SlotUpkeep_476 ->
  MAlonzo.Code.Data.List.Relation.Unary.Any.T_Any_34
d_lemma_236
  = coe MAlonzo.Code.Leios.Short.Deterministic.du_lemma_870
-- Leios.Foreign.Export.D.sd
d_sd_238 ::
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Axiom.Set.TotalMap.T_TotalMap_168
d_sd_238
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.d_sd_1858
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830)
-- Leios.Foreign.Export.D.test₁
d_test'8321'_240 ::
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_test'8321'_240
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.d_test'8321'_1866
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830)
-- Leios.Foreign.Export.D.test₂
d_test'8322'_242 ::
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_test'8322'_242
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.d_test'8322'_1872
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830)
-- Leios.Foreign.Export.D.trace
d_trace_244 ::
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Class.Computational.T_ComputationResult_28
d_trace_244
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.d_trace_1874
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830)
-- Leios.Foreign.Export.D.upd-Upkeep
d_upd'45'Upkeep_246 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Data.Sum.Base.T__'8846'__30 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_upd'45'Upkeep_246 = erased
-- Leios.Foreign.Export.D.v
d_v_248 ::
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Class.Computational22.T_Computational22_26 ->
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_v_248
  = coe
      MAlonzo.Code.Leios.Short.Deterministic.d_v_1856
      (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830)
-- Leios.Foreign.Export.D.↑-Upkeep
d_'8593''45'Upkeep_250 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Data.Sum.Base.T__'8846'__30] ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8593''45'Upkeep_250 = erased
-- Leios.Foreign.Export.D.ND._-⟦_/_⟧⇀_
d__'45''10214'_'47'_'10215''8640'__290 a0 a1 a2 a3 = ()
-- Leios.Foreign.Export.D.ND._↑_
d__'8593'__292 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Data.Sum.Base.T__'8846'__30] ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506
d__'8593'__292
  = let v0 = MAlonzo.Code.Leios.Foreign.Defaults.d_st_830 in
    coe (coe MAlonzo.Code.Leios.Protocol.du__'8593'__878 (coe v0))
-- Leios.Foreign.Export.D.ND._↝_
d__'8605'__294 a0 a1 = ()
-- Leios.Foreign.Export.D.ND.DecEq-SlotUpkeep
d_DecEq'45'SlotUpkeep_304 ::
  MAlonzo.Code.Class.DecEq.Core.T_DecEq_10
d_DecEq'45'SlotUpkeep_304
  = coe MAlonzo.Code.Leios.Short.du_DecEq'45'SlotUpkeep_486
-- Leios.Foreign.Export.D.ND.LeiosInput
d_LeiosInput_326 = ()
-- Leios.Foreign.Export.D.ND.LeiosOutput
d_LeiosOutput_328 = ()
-- Leios.Foreign.Export.D.ND.LeiosState
d_LeiosState_330 = ()
-- Leios.Foreign.Export.D.ND.SlotUpkeep
d_SlotUpkeep_346 = ()
-- Leios.Foreign.Export.D.ND.addUpkeep
d_addUpkeep_352 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.T_SlotUpkeep_476 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506
d_addUpkeep_352 = coe MAlonzo.Code.Leios.Protocol.du_addUpkeep_594
-- Leios.Foreign.Export.D.ND.allIBRefsKnown
d_allIBRefsKnown_354 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Blocks.T_EndorserBlockOSig_216 -> ()
d_allIBRefsKnown_354 = erased
-- Leios.Foreign.Export.D.ND.allUpkeep
d_allUpkeep_356 :: [MAlonzo.Code.Leios.Short.T_SlotUpkeep_476]
d_allUpkeep_356 = coe MAlonzo.Code.Leios.Short.du_allUpkeep_488
-- Leios.Foreign.Export.D.ND.initLeiosState
d_initLeiosState_358 ::
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6 ->
  MAlonzo.Code.Axiom.Set.TotalMap.T_TotalMap_168 ->
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506
d_initLeiosState_358
  = let v0 = MAlonzo.Code.Leios.Foreign.Defaults.d_st_830 in
    coe
      (coe MAlonzo.Code.Leios.Protocol.du_initLeiosState_640 (coe v0))
-- Leios.Foreign.Export.D.ND.isVoteCertified
d_isVoteCertified_360 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Blocks.T_EndorserBlockOSig_216 -> ()
d_isVoteCertified_360 = erased
-- Leios.Foreign.Export.D.ND.stake
d_stake_362 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 -> Integer
d_stake_362
  = let v0 = MAlonzo.Code.Leios.Foreign.Defaults.d_st_830 in
    coe (coe MAlonzo.Code.Leios.Protocol.du_stake_714 (coe v0))
-- Leios.Foreign.Export.D.ND.upd
d_upd_364 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Data.Sum.Base.T__'8846'__30 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506
d_upd_364
  = let v0 = MAlonzo.Code.Leios.Foreign.Defaults.d_st_830 in
    coe (coe MAlonzo.Code.Leios.Protocol.du_upd_764 (coe v0))
-- Leios.Foreign.Export.D.ND.upd-preserves-Upkeep
d_upd'45'preserves'45'Upkeep_366 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Data.Sum.Base.T__'8846'__30 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_upd'45'preserves'45'Upkeep_366 = erased
-- Leios.Foreign.Export.D.ND.↑-preserves-Upkeep
d_'8593''45'preserves'45'Upkeep_368 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Data.Sum.Base.T__'8846'__30] ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8593''45'preserves'45'Upkeep_368 = erased
-- Leios.Foreign.Export.D.ND.LeiosState.BaseState
d_BaseState_418 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_BaseState_418 v0
  = coe MAlonzo.Code.Leios.Protocol.d_BaseState_560 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.EBs
d_EBs_420 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Leios.Blocks.T_EndorserBlockOSig_216]
d_EBs_420 v0 = coe MAlonzo.Code.Leios.Protocol.d_EBs_548 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.FFDState
d_FFDState_422 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Foreign.Defaults.T_FFDState_686
d_FFDState_422 v0
  = coe MAlonzo.Code.Leios.Protocol.d_FFDState_540 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.IBBodies
d_IBBodies_424 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Leios.Blocks.T_IBBody_108]
d_IBBodies_424 v0
  = coe MAlonzo.Code.Leios.Protocol.d_IBBodies_556 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.IBHeaders
d_IBHeaders_426 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Leios.Blocks.T_IBHeaderOSig_80]
d_IBHeaders_426 v0
  = coe MAlonzo.Code.Leios.Protocol.d_IBHeaders_554 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.IBs
d_IBs_428 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Leios.Blocks.T_InputBlock_114]
d_IBs_428 v0 = coe MAlonzo.Code.Leios.Protocol.d_IBs_546 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.Ledger
d_Ledger_430 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 -> [Integer]
d_Ledger_430 v0
  = coe MAlonzo.Code.Leios.Protocol.d_Ledger_542 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.SD
d_SD_432 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Axiom.Set.TotalMap.T_TotalMap_168
d_SD_432 v0 = coe MAlonzo.Code.Leios.Protocol.d_SD_538 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.ToPropose
d_ToPropose_434 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 -> [Integer]
d_ToPropose_434 v0
  = coe MAlonzo.Code.Leios.Protocol.d_ToPropose_544 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.Upkeep
d_Upkeep_436 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Leios.Short.T_SlotUpkeep_476]
d_Upkeep_436 v0
  = coe MAlonzo.Code.Leios.Protocol.d_Upkeep_558 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.V
d_V_438 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_V_438 v0 = coe MAlonzo.Code.Leios.Protocol.d_V_536 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.Vs
d_Vs_440 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [[MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6]]
d_Vs_440 v0 = coe MAlonzo.Code.Leios.Protocol.d_Vs_550 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.constructLedger
d_constructLedger_442 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  [MAlonzo.Code.Data.These.Base.T_These_38] -> [Integer]
d_constructLedger_442
  = let v0 = MAlonzo.Code.Leios.Foreign.Defaults.d_st_830 in
    coe
      (coe MAlonzo.Code.Leios.Protocol.du_constructLedger_588 (coe v0))
-- Leios.Foreign.Export.D.ND.LeiosState.lookupEB
d_lookupEB_444 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  Maybe MAlonzo.Code.Leios.Blocks.T_EndorserBlockOSig_216
d_lookupEB_444
  = let v0 = MAlonzo.Code.Leios.Foreign.Defaults.d_st_830 in
    coe (coe MAlonzo.Code.Leios.Protocol.du_lookupEB_564 (coe v0))
-- Leios.Foreign.Export.D.ND.LeiosState.lookupIB
d_lookupIB_446 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  Maybe MAlonzo.Code.Leios.Blocks.T_InputBlock_114
d_lookupIB_446
  = let v0 = MAlonzo.Code.Leios.Foreign.Defaults.d_st_830 in
    coe (coe MAlonzo.Code.Leios.Protocol.du_lookupIB_570 (coe v0))
-- Leios.Foreign.Export.D.ND.LeiosState.lookupTxs
d_lookupTxs_448 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Blocks.T_EndorserBlockOSig_216 -> [Integer]
d_lookupTxs_448
  = let v0 = MAlonzo.Code.Leios.Foreign.Defaults.d_st_830 in
    coe (coe MAlonzo.Code.Leios.Protocol.du_lookupTxs_576 (coe v0))
-- Leios.Foreign.Export.D.ND.LeiosState.needsUpkeep
d_needsUpkeep_450 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Leios.Short.T_SlotUpkeep_476 -> ()
d_needsUpkeep_450 = erased
-- Leios.Foreign.Export.D.ND.LeiosState.slot
d_slot_452 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 -> Integer
d_slot_452 v0 = coe MAlonzo.Code.Leios.Protocol.d_slot_552 (coe v0)
-- Leios.Foreign.Export.D.ND.LeiosState.votingState
d_votingState_454 ::
  MAlonzo.Code.Leios.Protocol.T_LeiosState_506 ->
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6
d_votingState_454 v0
  = coe MAlonzo.Code.Leios.Protocol.d_votingState_562 (coe v0)
-- Leios.Foreign.Export.stepHs
step ::
  T_LeiosState_7849 ->
  T_LeiosInput_33949 ->
  MAlonzo.Code.Leios.Foreign.HSTypes.T_ComputationResult_44
    MAlonzo.Code.Agda.Builtin.String.T_String_6
    (MAlonzo.Code.Foreign.Haskell.Pair.T_Pair_22
       () () T_LeiosOutput_34963 T_LeiosState_7849)
step = coe d_stepHs_466
d_stepHs_466 ::
  T_LeiosState_7849 ->
  T_LeiosInput_33949 ->
  MAlonzo.Code.Leios.Foreign.HSTypes.T_ComputationResult_44
    MAlonzo.Code.Agda.Builtin.String.T_String_6
    (MAlonzo.Code.Foreign.Haskell.Pair.T_Pair_22
       AgdaAny AgdaAny T_LeiosOutput_34963 T_LeiosState_7849)
d_stepHs_466 v0
  = coe
      MAlonzo.Code.Class.Convertible.d_to_18
      (coe
         MAlonzo.Code.Class.Convertible.du_Convertible'45'Fun_118
         (coe d_Conv'45'LeiosInput_126)
         (coe
            MAlonzo.Code.Leios.Foreign.BaseTypes.du_Conv'45'ComputationResult_220
            (coe MAlonzo.Code.Leios.Foreign.BaseTypes.d_iConvString_10)
            (coe
               MAlonzo.Code.Class.Convertible.du_Convertible'45'Pair_96
               (coe d_Conv'45'LeiosOutput_130) (coe d_Conv'45'LeiosState_122))))
      (coe
         MAlonzo.Code.Class.Computational22.du_compute_70
         (coe
            MAlonzo.Code.Leios.Short.Deterministic.d_Computational'45''45''10214''47''10215''8640'_1756
            (coe MAlonzo.Code.Leios.Foreign.Defaults.d_st_830)
            (coe d_Computational'45'B_132) (coe d_Computational'45'FFD_144))
         (coe
            MAlonzo.Code.Class.Convertible.d_from_20 d_Conv'45'LeiosState_122
            v0))
-- Leios.Foreign.Export.IBBody
d_IBBody_549 = ()
type T_IBBody_549 = IBBody
pattern C_IBBody_551 a0 = IBBody a0
check_IBBody_551 ::
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () Integer -> T_IBBody_549
check_IBBody_551 = IBBody
cover_IBBody_549 :: IBBody -> ()
cover_IBBody_549 x
  = case x of
      IBBody _ -> ()
-- Leios.Foreign.Export.InputBlock
d_InputBlock_873 = ()
type T_InputBlock_873 = InputBlock
pattern C_InputBlock_875 a0 a1 = InputBlock a0 a1
check_InputBlock_875 ::
  T_IBHeader_20 -> T_IBBody_549 -> T_InputBlock_873
check_InputBlock_875 = InputBlock
cover_InputBlock_873 :: InputBlock -> ()
cover_InputBlock_873 x
  = case x of
      InputBlock _ _ -> ()
-- Leios.Foreign.Export.FFDState
d_FFDState_2145 = ()
type T_FFDState_2145 = FFDState
pattern C_FFDState_2147 a0 a1 a2 a3 a4 a5 = FFDState a0 a1 a2 a3 a4 a5
check_FFDState_2147 ::
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () T_InputBlock_873 ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () T_EndorserBlock_70 ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10
    ()
    (MAlonzo.Code.Agda.Builtin.List.T_List_10
       () MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6) ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () T_InputBlock_873 ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () T_EndorserBlock_70 ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10
    ()
    (MAlonzo.Code.Agda.Builtin.List.T_List_10
       () MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6) ->
  T_FFDState_2145
check_FFDState_2147 = FFDState
cover_FFDState_2145 :: FFDState -> ()
cover_FFDState_2145 x
  = case x of
      FFDState _ _ _ _ _ _ -> ()
-- Leios.Foreign.Export.LeiosState
d_LeiosState_7849 = ()
type T_LeiosState_7849 = LeiosState
pattern C_LeiosState_7851 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 = LeiosState a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13
check_LeiosState_7851 ::
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6 ->
  MAlonzo.Code.Leios.Foreign.HSTypes.T_HSMap_16 Integer Integer ->
  T_FFDState_2145 ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () Integer ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () Integer ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () T_InputBlock_873 ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () T_EndorserBlock_70 ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10
    ()
    (MAlonzo.Code.Agda.Builtin.List.T_List_10
       () MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6) ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () T_IBHeader_20 ->
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () T_IBBody_549 ->
  MAlonzo.Code.Leios.Foreign.HSTypes.T_HSSet_30 T_SlotUpkeep_101 ->
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6 -> T_LeiosState_7849
check_LeiosState_7851 = LeiosState
cover_LeiosState_7849 :: LeiosState -> ()
cover_LeiosState_7849 x
  = case x of
      LeiosState _ _ _ _ _ _ _ _ _ _ _ _ _ _ -> ()
-- Leios.Foreign.Export.LeiosInput
d_LeiosInput_33949 = ()
type T_LeiosInput_33949 = LeiosInput
pattern C_I_INIT_33951 a0 = I_INIT a0
pattern C_I_SUBMIT_33977 a0 = I_SUBMIT a0
pattern C_I_SLOT_34021 = I_SLOT
pattern C_I_FTCHLDG_34023 = I_FTCHLDG
check_I_INIT_33951 ::
  MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6 -> T_LeiosInput_33949
check_I_INIT_33951 = I_INIT
check_I_SUBMIT_33977 ::
  MAlonzo.Code.Foreign.Haskell.Either.T_Either_22
    () () T_EndorserBlock_70
    (MAlonzo.Code.Agda.Builtin.List.T_List_10 () Integer) ->
  T_LeiosInput_33949
check_I_SUBMIT_33977 = I_SUBMIT
check_I_SLOT_34021 :: T_LeiosInput_33949
check_I_SLOT_34021 = I_SLOT
check_I_FTCHLDG_34023 :: T_LeiosInput_33949
check_I_FTCHLDG_34023 = I_FTCHLDG
cover_LeiosInput_33949 :: LeiosInput -> ()
cover_LeiosInput_33949 x
  = case x of
      I_INIT _ -> ()
      I_SUBMIT _ -> ()
      I_SLOT -> ()
      I_FTCHLDG -> ()
-- Leios.Foreign.Export.LeiosOutput
d_LeiosOutput_34963 = ()
type T_LeiosOutput_34963 = LeiosOutput
pattern C_O_FTCHLDG_34965 a0 = O_FTCHLDG a0
pattern C_O_EMPTY_34985 = O_EMPTY
check_O_FTCHLDG_34965 ::
  MAlonzo.Code.Agda.Builtin.List.T_List_10 () Integer ->
  T_LeiosOutput_34963
check_O_FTCHLDG_34965 = O_FTCHLDG
check_O_EMPTY_34985 :: T_LeiosOutput_34963
check_O_EMPTY_34985 = O_EMPTY
cover_LeiosOutput_34963 :: LeiosOutput -> ()
cover_LeiosOutput_34963 x
  = case x of
      O_FTCHLDG _ -> ()
      O_EMPTY -> ()
