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

package SAMD21_SVD.I2S is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  I2S_CTRLA_CKEN array
   type I2S_CTRLA_CKEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_CTRLA_CKEN
   type I2S_CTRLA_CKEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CKEN as a value
            Val : HAL.UInt2;
         when True =>
            --  CKEN as an array
            Arr : I2S_CTRLA_CKEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_CTRLA_CKEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_CTRLA_SEREN array
   type I2S_CTRLA_SEREN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_CTRLA_SEREN
   type I2S_CTRLA_SEREN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SEREN as a value
            Val : HAL.UInt2;
         when True =>
            --  SEREN as an array
            Arr : I2S_CTRLA_SEREN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_CTRLA_SEREN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control A
   type I2S_CTRLA_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  Clock Unit 0 Enable
      CKEN         : I2S_CTRLA_CKEN_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Serializer 0 Enable
      SEREN        : I2S_CTRLA_SEREN_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for I2S_CTRLA_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      CKEN         at 0 range 2 .. 3;
      SEREN        at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  Slot Size
   type CLKCTRL_SLOTSIZESelect is
     (--  8-bit Slot for Clock Unit n
      Val_8,
      --  16-bit Slot for Clock Unit n
      Val_16,
      --  24-bit Slot for Clock Unit n
      Val_24,
      --  32-bit Slot for Clock Unit n
      Val_32)
     with Size => 2;
   for CLKCTRL_SLOTSIZESelect use
     (Val_8 => 0,
      Val_16 => 1,
      Val_24 => 2,
      Val_32 => 3);

   subtype I2S_CLKCTRL_NBSLOTS_Field is HAL.UInt3;

   --  Frame Sync Width
   type CLKCTRL_FSWIDTHSelect is
     (--  Frame Sync Pulse is 1 Slot wide (default for I2S protocol)
      SLOT,
      --  Frame Sync Pulse is half a Frame wide
      HALF,
      --  Frame Sync Pulse is 1 Bit wide
      BIT,
      --  Clock Unit n operates in Burst mode, with a 1-bit wide Frame Sync pulse per
--  Data sample, only when Data transfer is requested
      BURST)
     with Size => 2;
   for CLKCTRL_FSWIDTHSelect use
     (SLOT => 0,
      HALF => 1,
      BIT => 2,
      BURST => 3);

   --  Data Delay from Frame Sync
   type CLKCTRL_BITDELAYSelect is
     (--  Left Justified (0 Bit Delay)
      LJ,
      --  I2S (1 Bit Delay)
      I2S)
     with Size => 1;
   for CLKCTRL_BITDELAYSelect use
     (LJ => 0,
      I2S => 1);

   --  Frame Sync Select
   type CLKCTRL_FSSELSelect is
     (--  Divided Serial Clock n is used as Frame Sync n source
      SCKDIV,
      --  FSn input pin is used as Frame Sync n source
      FSPIN)
     with Size => 1;
   for CLKCTRL_FSSELSelect use
     (SCKDIV => 0,
      FSPIN => 1);

   --  Serial Clock Select
   type CLKCTRL_SCKSELSelect is
     (--  Divided Master Clock n is used as Serial Clock n source
      MCKDIV,
      --  SCKn input pin is used as Serial Clock n source
      SCKPIN)
     with Size => 1;
   for CLKCTRL_SCKSELSelect use
     (MCKDIV => 0,
      SCKPIN => 1);

   --  Master Clock Select
   type CLKCTRL_MCKSELSelect is
     (--  GCLK_I2S_n is used as Master Clock n source
      GCLK,
      --  MCKn input pin is used as Master Clock n source
      MCKPIN)
     with Size => 1;
   for CLKCTRL_MCKSELSelect use
     (GCLK => 0,
      MCKPIN => 1);

   subtype I2S_CLKCTRL_MCKDIV_Field is HAL.UInt5;
   subtype I2S_CLKCTRL_MCKOUTDIV_Field is HAL.UInt5;

   --  Clock Unit n Control
   type I2S_CLKCTRL_Register is record
      --  Slot Size
      SLOTSIZE       : CLKCTRL_SLOTSIZESelect := SAMD21_SVD.I2S.Val_8;
      --  Number of Slots in Frame
      NBSLOTS        : I2S_CLKCTRL_NBSLOTS_Field := 16#0#;
      --  Frame Sync Width
      FSWIDTH        : CLKCTRL_FSWIDTHSelect := SAMD21_SVD.I2S.SLOT;
      --  Data Delay from Frame Sync
      BITDELAY       : CLKCTRL_BITDELAYSelect := SAMD21_SVD.I2S.LJ;
      --  Frame Sync Select
      FSSEL          : CLKCTRL_FSSELSelect := SAMD21_SVD.I2S.SCKDIV;
      --  unspecified
      Reserved_9_10  : HAL.UInt2 := 16#0#;
      --  Frame Sync Invert
      FSINV          : Boolean := False;
      --  Serial Clock Select
      SCKSEL         : CLKCTRL_SCKSELSelect := SAMD21_SVD.I2S.MCKDIV;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  Master Clock Select
      MCKSEL         : CLKCTRL_MCKSELSelect := SAMD21_SVD.I2S.GCLK;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      --  Master Clock Enable
      MCKEN          : Boolean := False;
      --  Master Clock Division Factor
      MCKDIV         : I2S_CLKCTRL_MCKDIV_Field := 16#0#;
      --  Master Clock Output Division Factor
      MCKOUTDIV      : I2S_CLKCTRL_MCKOUTDIV_Field := 16#0#;
      --  Frame Sync Output Invert
      FSOUTINV       : Boolean := False;
      --  Serial Clock Output Invert
      SCKOUTINV      : Boolean := False;
      --  Master Clock Output Invert
      MCKOUTINV      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for I2S_CLKCTRL_Register use record
      SLOTSIZE       at 0 range 0 .. 1;
      NBSLOTS        at 0 range 2 .. 4;
      FSWIDTH        at 0 range 5 .. 6;
      BITDELAY       at 0 range 7 .. 7;
      FSSEL          at 0 range 8 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      FSINV          at 0 range 11 .. 11;
      SCKSEL         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      MCKSEL         at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      MCKEN          at 0 range 18 .. 18;
      MCKDIV         at 0 range 19 .. 23;
      MCKOUTDIV      at 0 range 24 .. 28;
      FSOUTINV       at 0 range 29 .. 29;
      SCKOUTINV      at 0 range 30 .. 30;
      MCKOUTINV      at 0 range 31 .. 31;
   end record;

   --  Clock Unit n Control
   type I2S_CLKCTRL_Registers is array (0 .. 1) of I2S_CLKCTRL_Register;

   --  I2S_INTENCLR_RXRDY array
   type I2S_INTENCLR_RXRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTENCLR_RXRDY
   type I2S_INTENCLR_RXRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RXRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  RXRDY as an array
            Arr : I2S_INTENCLR_RXRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTENCLR_RXRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_INTENCLR_RXOR array
   type I2S_INTENCLR_RXOR_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTENCLR_RXOR
   type I2S_INTENCLR_RXOR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RXOR as a value
            Val : HAL.UInt2;
         when True =>
            --  RXOR as an array
            Arr : I2S_INTENCLR_RXOR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTENCLR_RXOR_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_INTENCLR_TXRDY array
   type I2S_INTENCLR_TXRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTENCLR_TXRDY
   type I2S_INTENCLR_TXRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TXRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  TXRDY as an array
            Arr : I2S_INTENCLR_TXRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTENCLR_TXRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_INTENCLR_TXUR array
   type I2S_INTENCLR_TXUR_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTENCLR_TXUR
   type I2S_INTENCLR_TXUR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TXUR as a value
            Val : HAL.UInt2;
         when True =>
            --  TXUR as an array
            Arr : I2S_INTENCLR_TXUR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTENCLR_TXUR_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Clear
   type I2S_INTENCLR_Register is record
      --  Receive Ready 0 Interrupt Enable
      RXRDY          : I2S_INTENCLR_RXRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Receive Overrun 0 Interrupt Enable
      RXOR           : I2S_INTENCLR_RXOR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Transmit Ready 0 Interrupt Enable
      TXRDY          : I2S_INTENCLR_TXRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Transmit Underrun 0 Interrupt Enable
      TXUR           : I2S_INTENCLR_TXUR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for I2S_INTENCLR_Register use record
      RXRDY          at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      RXOR           at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      TXRDY          at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      TXUR           at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  I2S_INTENSET_RXRDY array
   type I2S_INTENSET_RXRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTENSET_RXRDY
   type I2S_INTENSET_RXRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RXRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  RXRDY as an array
            Arr : I2S_INTENSET_RXRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTENSET_RXRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_INTENSET_RXOR array
   type I2S_INTENSET_RXOR_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTENSET_RXOR
   type I2S_INTENSET_RXOR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RXOR as a value
            Val : HAL.UInt2;
         when True =>
            --  RXOR as an array
            Arr : I2S_INTENSET_RXOR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTENSET_RXOR_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_INTENSET_TXRDY array
   type I2S_INTENSET_TXRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTENSET_TXRDY
   type I2S_INTENSET_TXRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TXRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  TXRDY as an array
            Arr : I2S_INTENSET_TXRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTENSET_TXRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_INTENSET_TXUR array
   type I2S_INTENSET_TXUR_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTENSET_TXUR
   type I2S_INTENSET_TXUR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TXUR as a value
            Val : HAL.UInt2;
         when True =>
            --  TXUR as an array
            Arr : I2S_INTENSET_TXUR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTENSET_TXUR_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Set
   type I2S_INTENSET_Register is record
      --  Receive Ready 0 Interrupt Enable
      RXRDY          : I2S_INTENSET_RXRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Receive Overrun 0 Interrupt Enable
      RXOR           : I2S_INTENSET_RXOR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Transmit Ready 0 Interrupt Enable
      TXRDY          : I2S_INTENSET_TXRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Transmit Underrun 0 Interrupt Enable
      TXUR           : I2S_INTENSET_TXUR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for I2S_INTENSET_Register use record
      RXRDY          at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      RXOR           at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      TXRDY          at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      TXUR           at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  I2S_INTFLAG_RXRDY array
   type I2S_INTFLAG_RXRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTFLAG_RXRDY
   type I2S_INTFLAG_RXRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RXRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  RXRDY as an array
            Arr : I2S_INTFLAG_RXRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTFLAG_RXRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_INTFLAG_RXOR array
   type I2S_INTFLAG_RXOR_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTFLAG_RXOR
   type I2S_INTFLAG_RXOR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RXOR as a value
            Val : HAL.UInt2;
         when True =>
            --  RXOR as an array
            Arr : I2S_INTFLAG_RXOR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTFLAG_RXOR_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_INTFLAG_TXRDY array
   type I2S_INTFLAG_TXRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTFLAG_TXRDY
   type I2S_INTFLAG_TXRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TXRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  TXRDY as an array
            Arr : I2S_INTFLAG_TXRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTFLAG_TXRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_INTFLAG_TXUR array
   type I2S_INTFLAG_TXUR_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_INTFLAG_TXUR
   type I2S_INTFLAG_TXUR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TXUR as a value
            Val : HAL.UInt2;
         when True =>
            --  TXUR as an array
            Arr : I2S_INTFLAG_TXUR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_INTFLAG_TXUR_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Flag Status and Clear
   type I2S_INTFLAG_Register is record
      --  Receive Ready 0
      RXRDY          : I2S_INTFLAG_RXRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Receive Overrun 0
      RXOR           : I2S_INTFLAG_RXOR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Transmit Ready 0
      TXRDY          : I2S_INTFLAG_TXRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Transmit Underrun 0
      TXUR           : I2S_INTFLAG_TXUR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for I2S_INTFLAG_Register use record
      RXRDY          at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      RXOR           at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      TXRDY          at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      TXUR           at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  I2S_SYNCBUSY_CKEN array
   type I2S_SYNCBUSY_CKEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_SYNCBUSY_CKEN
   type I2S_SYNCBUSY_CKEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CKEN as a value
            Val : HAL.UInt2;
         when True =>
            --  CKEN as an array
            Arr : I2S_SYNCBUSY_CKEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_SYNCBUSY_CKEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_SYNCBUSY_SEREN array
   type I2S_SYNCBUSY_SEREN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_SYNCBUSY_SEREN
   type I2S_SYNCBUSY_SEREN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SEREN as a value
            Val : HAL.UInt2;
         when True =>
            --  SEREN as an array
            Arr : I2S_SYNCBUSY_SEREN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_SYNCBUSY_SEREN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  I2S_SYNCBUSY_DATA array
   type I2S_SYNCBUSY_DATA_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for I2S_SYNCBUSY_DATA
   type I2S_SYNCBUSY_DATA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DATA as a value
            Val : HAL.UInt2;
         when True =>
            --  DATA as an array
            Arr : I2S_SYNCBUSY_DATA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2S_SYNCBUSY_DATA_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Synchronization Status
   type I2S_SYNCBUSY_Register is record
      --  Read-only. Software Reset Synchronization Status
      SWRST          : Boolean;
      --  Read-only. Enable Synchronization Status
      ENABLE         : Boolean;
      --  Read-only. Clock Unit 0 Enable Synchronization Status
      CKEN           : I2S_SYNCBUSY_CKEN_Field;
      --  Read-only. Serializer 0 Enable Synchronization Status
      SEREN          : I2S_SYNCBUSY_SEREN_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Data 0 Synchronization Status
      DATA           : I2S_SYNCBUSY_DATA_Field;
      --  unspecified
      Reserved_10_15 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for I2S_SYNCBUSY_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      CKEN           at 0 range 2 .. 3;
      SEREN          at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      DATA           at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  Serializer Mode
   type SERCTRL_SERMODESelect is
     (--  Receive
      RX,
      --  Transmit
      TX,
      --  Receive one PDM data on each serial clock edge
      PDM2)
     with Size => 2;
   for SERCTRL_SERMODESelect use
     (RX => 0,
      TX => 1,
      PDM2 => 2);

   --  Line Default Line when Slot Disabled
   type SERCTRL_TXDEFAULTSelect is
     (--  Output Default Value is 0
      ZERO,
      --  Output Default Value is 1
      ONE,
      --  Output Default Value is high impedance
      HIZ)
     with Size => 2;
   for SERCTRL_TXDEFAULTSelect use
     (ZERO => 0,
      ONE => 1,
      HIZ => 3);

   --  Transmit Data when Underrun
   type SERCTRL_TXSAMESelect is
     (--  Zero data transmitted in case of underrun
      ZERO,
      --  Last data transmitted in case of underrun
      SAME)
     with Size => 1;
   for SERCTRL_TXSAMESelect use
     (ZERO => 0,
      SAME => 1);

   --  Clock Unit Selection
   type SERCTRL_CLKSELSelect is
     (--  Use Clock Unit 0
      CLK0,
      --  Use Clock Unit 1
      CLK1)
     with Size => 1;
   for SERCTRL_CLKSELSelect use
     (CLK0 => 0,
      CLK1 => 1);

   --  Data Slot Formatting Adjust
   type SERCTRL_SLOTADJSelect is
     (--  Data is right adjusted in slot
      RIGHT,
      --  Data is left adjusted in slot
      LEFT)
     with Size => 1;
   for SERCTRL_SLOTADJSelect use
     (RIGHT => 0,
      LEFT => 1);

   --  Data Word Size
   type SERCTRL_DATASIZESelect is
     (--  32 bits
      Val_32,
      --  24 bits
      Val_24,
      --  20 bits
      Val_20,
      --  18 bits
      Val_18,
      --  16 bits
      Val_16,
      --  16 bits compact stereo
      Val_16C,
      --  8 bits
      Val_8,
      --  8 bits compact stereo
      Val_8C)
     with Size => 3;
   for SERCTRL_DATASIZESelect use
     (Val_32 => 0,
      Val_24 => 1,
      Val_20 => 2,
      Val_18 => 3,
      Val_16 => 4,
      Val_16C => 5,
      Val_8 => 6,
      Val_8C => 7);

   --  Data Word Formatting Adjust
   type SERCTRL_WORDADJSelect is
     (--  Data is right adjusted in word
      RIGHT,
      --  Data is left adjusted in word
      LEFT)
     with Size => 1;
   for SERCTRL_WORDADJSelect use
     (RIGHT => 0,
      LEFT => 1);

   --  Data Formatting Bit Extension
   type SERCTRL_EXTENDSelect is
     (--  Extend with zeroes
      ZERO,
      --  Extend with ones
      ONE,
      --  Extend with Most Significant Bit
      MSBIT,
      --  Extend with Least Significant Bit
      LSBIT)
     with Size => 2;
   for SERCTRL_EXTENDSelect use
     (ZERO => 0,
      ONE => 1,
      MSBIT => 2,
      LSBIT => 3);

   --  Data Formatting Bit Reverse
   type SERCTRL_BITREVSelect is
     (--  Transfer Data Most Significant Bit (MSB) first (default for I2S protocol)
      MSBIT,
      --  Transfer Data Least Significant Bit (LSB) first
      LSBIT)
     with Size => 1;
   for SERCTRL_BITREVSelect use
     (MSBIT => 0,
      LSBIT => 1);

   --  I2S_SERCTRL_SLOTDIS array
   type I2S_SERCTRL_SLOTDIS_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for I2S_SERCTRL_SLOTDIS
   type I2S_SERCTRL_SLOTDIS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SLOTDIS as a value
            Val : HAL.UInt8;
         when True =>
            --  SLOTDIS as an array
            Arr : I2S_SERCTRL_SLOTDIS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for I2S_SERCTRL_SLOTDIS_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Mono Mode
   type SERCTRL_MONOSelect is
     (--  Normal mode
      STEREO,
      --  Left channel data is duplicated to right channel
      MONO)
     with Size => 1;
   for SERCTRL_MONOSelect use
     (STEREO => 0,
      MONO => 1);

   --  Single or Multiple DMA Channels
   type SERCTRL_DMASelect is
     (--  Single DMA channel
      SINGLE,
      --  One DMA channel per data channel
      MULTIPLE)
     with Size => 1;
   for SERCTRL_DMASelect use
     (SINGLE => 0,
      MULTIPLE => 1);

   --  Serializer n Control
   type I2S_SERCTRL_Register is record
      --  Serializer Mode
      SERMODE        : SERCTRL_SERMODESelect := SAMD21_SVD.I2S.RX;
      --  Line Default Line when Slot Disabled
      TXDEFAULT      : SERCTRL_TXDEFAULTSelect := SAMD21_SVD.I2S.ZERO;
      --  Transmit Data when Underrun
      TXSAME         : SERCTRL_TXSAMESelect := SAMD21_SVD.I2S.ZERO;
      --  Clock Unit Selection
      CLKSEL         : SERCTRL_CLKSELSelect := SAMD21_SVD.I2S.CLK0;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      --  Data Slot Formatting Adjust
      SLOTADJ        : SERCTRL_SLOTADJSelect := SAMD21_SVD.I2S.RIGHT;
      --  Data Word Size
      DATASIZE       : SERCTRL_DATASIZESelect := SAMD21_SVD.I2S.Val_32;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  Data Word Formatting Adjust
      WORDADJ        : SERCTRL_WORDADJSelect := SAMD21_SVD.I2S.RIGHT;
      --  Data Formatting Bit Extension
      EXTEND         : SERCTRL_EXTENDSelect := SAMD21_SVD.I2S.ZERO;
      --  Data Formatting Bit Reverse
      BITREV         : SERCTRL_BITREVSelect := SAMD21_SVD.I2S.MSBIT;
      --  Slot 0 Disabled for this Serializer
      SLOTDIS        : I2S_SERCTRL_SLOTDIS_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Mono Mode
      MONO           : SERCTRL_MONOSelect := SAMD21_SVD.I2S.STEREO;
      --  Single or Multiple DMA Channels
      DMA            : SERCTRL_DMASelect := SAMD21_SVD.I2S.SINGLE;
      --  Loop-back Test Mode
      RXLOOP         : Boolean := False;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for I2S_SERCTRL_Register use record
      SERMODE        at 0 range 0 .. 1;
      TXDEFAULT      at 0 range 2 .. 3;
      TXSAME         at 0 range 4 .. 4;
      CLKSEL         at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      SLOTADJ        at 0 range 7 .. 7;
      DATASIZE       at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      WORDADJ        at 0 range 12 .. 12;
      EXTEND         at 0 range 13 .. 14;
      BITREV         at 0 range 15 .. 15;
      SLOTDIS        at 0 range 16 .. 23;
      MONO           at 0 range 24 .. 24;
      DMA            at 0 range 25 .. 25;
      RXLOOP         at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  Serializer n Control
   type I2S_SERCTRL_Registers is array (0 .. 1) of I2S_SERCTRL_Register;

   --  Data n

   --  Data n
   type I2S_DATA_Registers is array (0 .. 1) of HAL.UInt32;

   -----------------
   -- Peripherals --
   -----------------

   --  Inter-IC Sound Interface
   type I2S_Peripheral is record
      --  Control A
      CTRLA    : aliased I2S_CTRLA_Register;
      --  Clock Unit n Control
      CLKCTRL  : aliased I2S_CLKCTRL_Registers;
      --  Interrupt Enable Clear
      INTENCLR : aliased I2S_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased I2S_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased I2S_INTFLAG_Register;
      --  Synchronization Status
      SYNCBUSY : aliased I2S_SYNCBUSY_Register;
      --  Serializer n Control
      SERCTRL  : aliased I2S_SERCTRL_Registers;
      --  Data n
      DATA     : aliased I2S_DATA_Registers;
   end record
     with Volatile;

   for I2S_Peripheral use record
      CTRLA    at 16#0# range 0 .. 7;
      CLKCTRL  at 16#4# range 0 .. 63;
      INTENCLR at 16#C# range 0 .. 15;
      INTENSET at 16#10# range 0 .. 15;
      INTFLAG  at 16#14# range 0 .. 15;
      SYNCBUSY at 16#18# range 0 .. 15;
      SERCTRL  at 16#20# range 0 .. 63;
      DATA     at 16#30# range 0 .. 63;
   end record;

   --  Inter-IC Sound Interface
   I2S_Periph : aliased I2S_Peripheral
     with Import, Address => I2S_Base;

end SAMD21_SVD.I2S;
