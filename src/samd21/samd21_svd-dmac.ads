pragma Style_Checks (Off);

--  Copyright (c) 2018 Microchip Technology Inc.
--
--  SPDX-License-Identifier: Apache-2.0
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--  http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.

--  This spec has been automatically generated from ATSAMD21G18A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAMD21_SVD.DMAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  DMAC_CTRL_LVLEN array
   type DMAC_CTRL_LVLEN_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for DMAC_CTRL_LVLEN
   type DMAC_CTRL_LVLEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  LVLEN as a value
            Val : HAL.UInt4;
         when True =>
            --  LVLEN as an array
            Arr : DMAC_CTRL_LVLEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for DMAC_CTRL_LVLEN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Control
   type DMAC_CTRL_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  DMA Enable
      DMAENABLE      : Boolean := False;
      --  CRC Enable
      CRCENABLE      : Boolean := False;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  Priority Level 0 Enable
      LVLEN          : DMAC_CTRL_LVLEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DMAC_CTRL_Register use record
      SWRST          at 0 range 0 .. 0;
      DMAENABLE      at 0 range 1 .. 1;
      CRCENABLE      at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      LVLEN          at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   --  CRC Beat Size
   type CRCCTRL_CRCBEATSIZESelect is
     (--  8-bit bus transfer
      BYTE,
      --  16-bit bus transfer
      HWORD,
      --  32-bit bus transfer
      WORD)
     with Size => 2;
   for CRCCTRL_CRCBEATSIZESelect use
     (BYTE => 0,
      HWORD => 1,
      WORD => 2);

   --  CRC Polynomial Type
   type CRCCTRL_CRCPOLYSelect is
     (--  CRC-16 (CRC-CCITT)
      CRC16,
      --  CRC32 (IEEE 802.3)
      CRC32)
     with Size => 2;
   for CRCCTRL_CRCPOLYSelect use
     (CRC16 => 0,
      CRC32 => 1);

   --  CRC Input Source
   type CRCCTRL_CRCSRCSelect is
     (--  No action
      NOACT,
      --  I/O interface
      IO)
     with Size => 6;
   for CRCCTRL_CRCSRCSelect use
     (NOACT => 0,
      IO => 1);

   --  CRC Control
   type DMAC_CRCCTRL_Register is record
      --  CRC Beat Size
      CRCBEATSIZE    : CRCCTRL_CRCBEATSIZESelect := SAMD21_SVD.DMAC.BYTE;
      --  CRC Polynomial Type
      CRCPOLY        : CRCCTRL_CRCPOLYSelect := SAMD21_SVD.DMAC.CRC16;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  CRC Input Source
      CRCSRC         : CRCCTRL_CRCSRCSelect := SAMD21_SVD.DMAC.NOACT;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DMAC_CRCCTRL_Register use record
      CRCBEATSIZE    at 0 range 0 .. 1;
      CRCPOLY        at 0 range 2 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CRCSRC         at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  CRC Status
   type DMAC_CRCSTATUS_Register is record
      --  CRC Module Busy
      CRCBUSY      : Boolean := False;
      --  Read-only. CRC Zero
      CRCZERO      : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CRCSTATUS_Register use record
      CRCBUSY      at 0 range 0 .. 0;
      CRCZERO      at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Debug Control
   type DMAC_DBGCTRL_Register is record
      --  Debug Run
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_DBGCTRL_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Write-Back Quality of Service
   type QOSCTRL_WRBQOSSelect is
     (--  Background (no sensitive operation)
      DISABLE,
      --  Sensitive Bandwidth
      LOW,
      --  Sensitive Latency
      MEDIUM,
      --  Critical Latency
      HIGH)
     with Size => 2;
   for QOSCTRL_WRBQOSSelect use
     (DISABLE => 0,
      LOW => 1,
      MEDIUM => 2,
      HIGH => 3);

   --  Fetch Quality of Service
   type QOSCTRL_FQOSSelect is
     (--  Background (no sensitive operation)
      DISABLE,
      --  Sensitive Bandwidth
      LOW,
      --  Sensitive Latency
      MEDIUM,
      --  Critical Latency
      HIGH)
     with Size => 2;
   for QOSCTRL_FQOSSelect use
     (DISABLE => 0,
      LOW => 1,
      MEDIUM => 2,
      HIGH => 3);

   --  Data Transfer Quality of Service
   type QOSCTRL_DQOSSelect is
     (--  Background (no sensitive operation)
      DISABLE,
      --  Sensitive Bandwidth
      LOW,
      --  Sensitive Latency
      MEDIUM,
      --  Critical Latency
      HIGH)
     with Size => 2;
   for QOSCTRL_DQOSSelect use
     (DISABLE => 0,
      LOW => 1,
      MEDIUM => 2,
      HIGH => 3);

   --  QOS Control
   type DMAC_QOSCTRL_Register is record
      --  Write-Back Quality of Service
      WRBQOS       : QOSCTRL_WRBQOSSelect := SAMD21_SVD.DMAC.LOW;
      --  Fetch Quality of Service
      FQOS         : QOSCTRL_FQOSSelect := SAMD21_SVD.DMAC.LOW;
      --  Data Transfer Quality of Service
      DQOS         : QOSCTRL_DQOSSelect := SAMD21_SVD.DMAC.LOW;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_QOSCTRL_Register use record
      WRBQOS       at 0 range 0 .. 1;
      FQOS         at 0 range 2 .. 3;
      DQOS         at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  DMAC_SWTRIGCTRL_SWTRIG array
   type DMAC_SWTRIGCTRL_SWTRIG_Field_Array is array (0 .. 11) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for DMAC_SWTRIGCTRL_SWTRIG
   type DMAC_SWTRIGCTRL_SWTRIG_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWTRIG as a value
            Val : HAL.UInt12;
         when True =>
            --  SWTRIG as an array
            Arr : DMAC_SWTRIGCTRL_SWTRIG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for DMAC_SWTRIGCTRL_SWTRIG_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Software Trigger Control
   type DMAC_SWTRIGCTRL_Register is record
      --  Channel 0 Software Trigger
      SWTRIG         : DMAC_SWTRIGCTRL_SWTRIG_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_SWTRIGCTRL_Register use record
      SWTRIG         at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype DMAC_PRICTRL0_LVLPRI0_Field is HAL.UInt4;
   subtype DMAC_PRICTRL0_LVLPRI1_Field is HAL.UInt4;
   subtype DMAC_PRICTRL0_LVLPRI2_Field is HAL.UInt4;
   subtype DMAC_PRICTRL0_LVLPRI3_Field is HAL.UInt4;

   --  Priority Control 0
   type DMAC_PRICTRL0_Register is record
      --  Level 0 Channel Priority Number
      LVLPRI0        : DMAC_PRICTRL0_LVLPRI0_Field := 16#0#;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
      --  Level 0 Round-Robin Scheduling Enable
      RRLVLEN0       : Boolean := False;
      --  Level 1 Channel Priority Number
      LVLPRI1        : DMAC_PRICTRL0_LVLPRI1_Field := 16#0#;
      --  unspecified
      Reserved_12_14 : HAL.UInt3 := 16#0#;
      --  Level 1 Round-Robin Scheduling Enable
      RRLVLEN1       : Boolean := False;
      --  Level 2 Channel Priority Number
      LVLPRI2        : DMAC_PRICTRL0_LVLPRI2_Field := 16#0#;
      --  unspecified
      Reserved_20_22 : HAL.UInt3 := 16#0#;
      --  Level 2 Round-Robin Scheduling Enable
      RRLVLEN2       : Boolean := False;
      --  Level 3 Channel Priority Number
      LVLPRI3        : DMAC_PRICTRL0_LVLPRI3_Field := 16#0#;
      --  unspecified
      Reserved_28_30 : HAL.UInt3 := 16#0#;
      --  Level 3 Round-Robin Scheduling Enable
      RRLVLEN3       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_PRICTRL0_Register use record
      LVLPRI0        at 0 range 0 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      RRLVLEN0       at 0 range 7 .. 7;
      LVLPRI1        at 0 range 8 .. 11;
      Reserved_12_14 at 0 range 12 .. 14;
      RRLVLEN1       at 0 range 15 .. 15;
      LVLPRI2        at 0 range 16 .. 19;
      Reserved_20_22 at 0 range 20 .. 22;
      RRLVLEN2       at 0 range 23 .. 23;
      LVLPRI3        at 0 range 24 .. 27;
      Reserved_28_30 at 0 range 28 .. 30;
      RRLVLEN3       at 0 range 31 .. 31;
   end record;

   subtype DMAC_INTPEND_ID_Field is HAL.UInt4;

   --  Interrupt Pending
   type DMAC_INTPEND_Register is record
      --  Channel ID
      ID             : DMAC_INTPEND_ID_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Transfer Error
      TERR           : Boolean := False;
      --  Transfer Complete
      TCMPL          : Boolean := False;
      --  Channel Suspend
      SUSP           : Boolean := False;
      --  unspecified
      Reserved_11_12 : HAL.UInt2 := 16#0#;
      --  Read-only. Fetch Error
      FERR           : Boolean := False;
      --  Read-only. Busy
      BUSY           : Boolean := False;
      --  Read-only. Pending
      PEND           : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DMAC_INTPEND_Register use record
      ID             at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      TERR           at 0 range 8 .. 8;
      TCMPL          at 0 range 9 .. 9;
      SUSP           at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      FERR           at 0 range 13 .. 13;
      BUSY           at 0 range 14 .. 14;
      PEND           at 0 range 15 .. 15;
   end record;

   --  DMAC_INTSTATUS_CHINT array
   type DMAC_INTSTATUS_CHINT_Field_Array is array (0 .. 11) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for DMAC_INTSTATUS_CHINT
   type DMAC_INTSTATUS_CHINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHINT as a value
            Val : HAL.UInt12;
         when True =>
            --  CHINT as an array
            Arr : DMAC_INTSTATUS_CHINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for DMAC_INTSTATUS_CHINT_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Interrupt Status
   type DMAC_INTSTATUS_Register is record
      --  Read-only. Channel 0 Pending Interrupt
      CHINT          : DMAC_INTSTATUS_CHINT_Field;
      --  unspecified
      Reserved_12_31 : HAL.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_INTSTATUS_Register use record
      CHINT          at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  DMAC_BUSYCH_BUSYCH array
   type DMAC_BUSYCH_BUSYCH_Field_Array is array (0 .. 11) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for DMAC_BUSYCH_BUSYCH
   type DMAC_BUSYCH_BUSYCH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BUSYCH as a value
            Val : HAL.UInt12;
         when True =>
            --  BUSYCH as an array
            Arr : DMAC_BUSYCH_BUSYCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for DMAC_BUSYCH_BUSYCH_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Busy Channels
   type DMAC_BUSYCH_Register is record
      --  Read-only. Busy Channel 0
      BUSYCH         : DMAC_BUSYCH_BUSYCH_Field;
      --  unspecified
      Reserved_12_31 : HAL.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_BUSYCH_Register use record
      BUSYCH         at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  DMAC_PENDCH_PENDCH array
   type DMAC_PENDCH_PENDCH_Field_Array is array (0 .. 11) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for DMAC_PENDCH_PENDCH
   type DMAC_PENDCH_PENDCH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PENDCH as a value
            Val : HAL.UInt12;
         when True =>
            --  PENDCH as an array
            Arr : DMAC_PENDCH_PENDCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for DMAC_PENDCH_PENDCH_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Pending Channels
   type DMAC_PENDCH_Register is record
      --  Read-only. Pending Channel 0
      PENDCH         : DMAC_PENDCH_PENDCH_Field;
      --  unspecified
      Reserved_12_31 : HAL.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_PENDCH_Register use record
      PENDCH         at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  DMAC_ACTIVE_LVLEX array
   type DMAC_ACTIVE_LVLEX_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for DMAC_ACTIVE_LVLEX
   type DMAC_ACTIVE_LVLEX_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  LVLEX as a value
            Val : HAL.UInt4;
         when True =>
            --  LVLEX as an array
            Arr : DMAC_ACTIVE_LVLEX_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for DMAC_ACTIVE_LVLEX_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   subtype DMAC_ACTIVE_ID_Field is HAL.UInt5;
   subtype DMAC_ACTIVE_BTCNT_Field is HAL.UInt16;

   --  Active Channel and Levels
   type DMAC_ACTIVE_Register is record
      --  Read-only. Level 0 Channel Trigger Request Executing
      LVLEX          : DMAC_ACTIVE_LVLEX_Field;
      --  unspecified
      Reserved_4_7   : HAL.UInt4;
      --  Read-only. Active Channel ID
      ID             : DMAC_ACTIVE_ID_Field;
      --  unspecified
      Reserved_13_14 : HAL.UInt2;
      --  Read-only. Active Channel Busy
      ABUSY          : Boolean;
      --  Read-only. Active Channel Block Transfer Count
      BTCNT          : DMAC_ACTIVE_BTCNT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_ACTIVE_Register use record
      LVLEX          at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      ID             at 0 range 8 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      ABUSY          at 0 range 15 .. 15;
      BTCNT          at 0 range 16 .. 31;
   end record;

   subtype DMAC_CHID_ID_Field is HAL.UInt4;

   --  Channel ID
   type DMAC_CHID_Register is record
      --  Channel ID
      ID           : DMAC_CHID_ID_Field := 16#0#;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHID_Register use record
      ID           at 0 range 0 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Channel Control A
   type DMAC_CHCTRLA_Register is record
      --  Channel Software Reset
      SWRST        : Boolean := False;
      --  Channel Enable
      ENABLE       : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHCTRLA_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Event Input Action
   type CHCTRLB_EVACTSelect is
     (--  No action
      NOACT,
      --  Transfer and periodic transfer trigger
      TRIG,
      --  Conditional transfer trigger
      CTRIG,
      --  Conditional block transfer
      CBLOCK,
      --  Channel suspend operation
      SUSPEND,
      --  Channel resume operation
      RESUME,
      --  Skip next block suspend action
      SSKIP)
     with Size => 3;
   for CHCTRLB_EVACTSelect use
     (NOACT => 0,
      TRIG => 1,
      CTRIG => 2,
      CBLOCK => 3,
      SUSPEND => 4,
      RESUME => 5,
      SSKIP => 6);

   --  Channel Arbitration Level
   type CHCTRLB_LVLSelect is
     (--  Channel Priority Level 0
      LVL0,
      --  Channel Priority Level 1
      LVL1,
      --  Channel Priority Level 2
      LVL2,
      --  Channel Priority Level 3
      LVL3)
     with Size => 2;
   for CHCTRLB_LVLSelect use
     (LVL0 => 0,
      LVL1 => 1,
      LVL2 => 2,
      LVL3 => 3);

   --  Trigger Source
   type CHCTRLB_TRIGSRCSelect is
     (--  Only software/event triggers
      DISABLE)
     with Size => 6;
   for CHCTRLB_TRIGSRCSelect use
     (DISABLE => 0);

   --  Trigger Action
   type CHCTRLB_TRIGACTSelect is
     (--  One trigger required for each block transfer
      BLOCK,
      --  One trigger required for each beat transfer
      BEAT,
      --  One trigger required for each transaction
      TRANSACTION)
     with Size => 2;
   for CHCTRLB_TRIGACTSelect use
     (BLOCK => 0,
      BEAT => 2,
      TRANSACTION => 3);

   --  Software Command
   type CHCTRLB_CMDSelect is
     (--  No action
      NOACT,
      --  Channel suspend operation
      SUSPEND,
      --  Channel resume operation
      RESUME)
     with Size => 2;
   for CHCTRLB_CMDSelect use
     (NOACT => 0,
      SUSPEND => 1,
      RESUME => 2);

   --  Channel Control B
   type DMAC_CHCTRLB_Register is record
      --  Event Input Action
      EVACT          : CHCTRLB_EVACTSelect := SAMD21_SVD.DMAC.NOACT;
      --  Channel Event Input Enable
      EVIE           : Boolean := False;
      --  Channel Event Output Enable
      EVOE           : Boolean := False;
      --  Channel Arbitration Level
      LVL            : CHCTRLB_LVLSelect := SAMD21_SVD.DMAC.LVL0;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Trigger Source
      TRIGSRC        : CHCTRLB_TRIGSRCSelect := SAMD21_SVD.DMAC.DISABLE;
      --  unspecified
      Reserved_14_21 : HAL.UInt8 := 16#0#;
      --  Trigger Action
      TRIGACT        : CHCTRLB_TRIGACTSelect := SAMD21_SVD.DMAC.BLOCK;
      --  Software Command
      CMD            : CHCTRLB_CMDSelect := SAMD21_SVD.DMAC.NOACT;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHCTRLB_Register use record
      EVACT          at 0 range 0 .. 2;
      EVIE           at 0 range 3 .. 3;
      EVOE           at 0 range 4 .. 4;
      LVL            at 0 range 5 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      TRIGSRC        at 0 range 8 .. 13;
      Reserved_14_21 at 0 range 14 .. 21;
      TRIGACT        at 0 range 22 .. 23;
      CMD            at 0 range 24 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   --  Channel Interrupt Enable Clear
   type DMAC_CHINTENCLR_Register is record
      --  Channel Transfer Error Interrupt Enable
      TERR         : Boolean := False;
      --  Channel Transfer Complete Interrupt Enable
      TCMPL        : Boolean := False;
      --  Channel Suspend Interrupt Enable
      SUSP         : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHINTENCLR_Register use record
      TERR         at 0 range 0 .. 0;
      TCMPL        at 0 range 1 .. 1;
      SUSP         at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Channel Interrupt Enable Set
   type DMAC_CHINTENSET_Register is record
      --  Channel Transfer Error Interrupt Enable
      TERR         : Boolean := False;
      --  Channel Transfer Complete Interrupt Enable
      TCMPL        : Boolean := False;
      --  Channel Suspend Interrupt Enable
      SUSP         : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHINTENSET_Register use record
      TERR         at 0 range 0 .. 0;
      TCMPL        at 0 range 1 .. 1;
      SUSP         at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Channel Interrupt Flag Status and Clear
   type DMAC_CHINTFLAG_Register is record
      --  Channel Transfer Error
      TERR         : Boolean := False;
      --  Channel Transfer Complete
      TCMPL        : Boolean := False;
      --  Channel Suspend
      SUSP         : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHINTFLAG_Register use record
      TERR         at 0 range 0 .. 0;
      TCMPL        at 0 range 1 .. 1;
      SUSP         at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Channel Status
   type DMAC_CHSTATUS_Register is record
      --  Read-only. Channel Pending
      PEND         : Boolean;
      --  Read-only. Channel Busy
      BUSY         : Boolean;
      --  Read-only. Channel Fetch Error
      FERR         : Boolean;
      --  unspecified
      Reserved_3_7 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHSTATUS_Register use record
      PEND         at 0 range 0 .. 0;
      BUSY         at 0 range 1 .. 1;
      FERR         at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Direct Memory Access Controller
   type DMAC_Peripheral is record
      --  Control
      CTRL       : aliased DMAC_CTRL_Register;
      --  CRC Control
      CRCCTRL    : aliased DMAC_CRCCTRL_Register;
      --  CRC Data Input
      CRCDATAIN  : aliased HAL.UInt32;
      --  CRC Checksum
      CRCCHKSUM  : aliased HAL.UInt32;
      --  CRC Status
      CRCSTATUS  : aliased DMAC_CRCSTATUS_Register;
      --  Debug Control
      DBGCTRL    : aliased DMAC_DBGCTRL_Register;
      --  QOS Control
      QOSCTRL    : aliased DMAC_QOSCTRL_Register;
      --  Software Trigger Control
      SWTRIGCTRL : aliased DMAC_SWTRIGCTRL_Register;
      --  Priority Control 0
      PRICTRL0   : aliased DMAC_PRICTRL0_Register;
      --  Interrupt Pending
      INTPEND    : aliased DMAC_INTPEND_Register;
      --  Interrupt Status
      INTSTATUS  : aliased DMAC_INTSTATUS_Register;
      --  Busy Channels
      BUSYCH     : aliased DMAC_BUSYCH_Register;
      --  Pending Channels
      PENDCH     : aliased DMAC_PENDCH_Register;
      --  Active Channel and Levels
      ACTIVE     : aliased DMAC_ACTIVE_Register;
      --  Descriptor Memory Section Base Address
      BASEADDR   : aliased HAL.UInt32;
      --  Write-Back Memory Section Base Address
      WRBADDR    : aliased HAL.UInt32;
      --  Channel ID
      CHID       : aliased DMAC_CHID_Register;
      --  Channel Control A
      CHCTRLA    : aliased DMAC_CHCTRLA_Register;
      --  Channel Control B
      CHCTRLB    : aliased DMAC_CHCTRLB_Register;
      --  Channel Interrupt Enable Clear
      CHINTENCLR : aliased DMAC_CHINTENCLR_Register;
      --  Channel Interrupt Enable Set
      CHINTENSET : aliased DMAC_CHINTENSET_Register;
      --  Channel Interrupt Flag Status and Clear
      CHINTFLAG  : aliased DMAC_CHINTFLAG_Register;
      --  Channel Status
      CHSTATUS   : aliased DMAC_CHSTATUS_Register;
   end record
     with Volatile;

   for DMAC_Peripheral use record
      CTRL       at 16#0# range 0 .. 15;
      CRCCTRL    at 16#2# range 0 .. 15;
      CRCDATAIN  at 16#4# range 0 .. 31;
      CRCCHKSUM  at 16#8# range 0 .. 31;
      CRCSTATUS  at 16#C# range 0 .. 7;
      DBGCTRL    at 16#D# range 0 .. 7;
      QOSCTRL    at 16#E# range 0 .. 7;
      SWTRIGCTRL at 16#10# range 0 .. 31;
      PRICTRL0   at 16#14# range 0 .. 31;
      INTPEND    at 16#20# range 0 .. 15;
      INTSTATUS  at 16#24# range 0 .. 31;
      BUSYCH     at 16#28# range 0 .. 31;
      PENDCH     at 16#2C# range 0 .. 31;
      ACTIVE     at 16#30# range 0 .. 31;
      BASEADDR   at 16#34# range 0 .. 31;
      WRBADDR    at 16#38# range 0 .. 31;
      CHID       at 16#3F# range 0 .. 7;
      CHCTRLA    at 16#40# range 0 .. 7;
      CHCTRLB    at 16#44# range 0 .. 31;
      CHINTENCLR at 16#4C# range 0 .. 7;
      CHINTENSET at 16#4D# range 0 .. 7;
      CHINTFLAG  at 16#4E# range 0 .. 7;
      CHSTATUS   at 16#4F# range 0 .. 7;
   end record;

   --  Direct Memory Access Controller
   DMAC_Periph : aliased DMAC_Peripheral
     with Import, Address => DMAC_Base;

end SAMD21_SVD.DMAC;
