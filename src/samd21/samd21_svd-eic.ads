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

package SAMD21_SVD.EIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control
   type EIC_CTRL_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EIC_CTRL_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Status
   type EIC_STATUS_Register is record
      --  unspecified
      Reserved_0_6 : HAL.UInt7;
      --  Read-only. Synchronization Busy
      SYNCBUSY     : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EIC_STATUS_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      SYNCBUSY     at 0 range 7 .. 7;
   end record;

   --  Non-Maskable Interrupt Sense
   type NMICTRL_NMISENSESelect is
     (--  No detection
      NONE,
      --  Rising-edge detection
      RISE,
      --  Falling-edge detection
      FALL,
      --  Both-edges detection
      BOTH,
      --  High-level detection
      HIGH,
      --  Low-level detection
      LOW)
     with Size => 3;
   for NMICTRL_NMISENSESelect use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Non-Maskable Interrupt Control
   type EIC_NMICTRL_Register is record
      --  Non-Maskable Interrupt Sense
      NMISENSE     : NMICTRL_NMISENSESelect := SAMD21_SVD.EIC.NONE;
      --  Non-Maskable Interrupt Filter Enable
      NMIFILTEN    : Boolean := False;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EIC_NMICTRL_Register use record
      NMISENSE     at 0 range 0 .. 2;
      NMIFILTEN    at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Non-Maskable Interrupt Flag Status and Clear
   type EIC_NMIFLAG_Register is record
      --  Non-Maskable Interrupt
      NMI          : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EIC_NMIFLAG_Register use record
      NMI          at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  EIC_EVCTRL_EXTINTEO array
   type EIC_EVCTRL_EXTINTEO_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for EIC_EVCTRL_EXTINTEO
   type EIC_EVCTRL_EXTINTEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTINTEO as a value
            Val : HAL.UInt16;
         when True =>
            --  EXTINTEO as an array
            Arr : EIC_EVCTRL_EXTINTEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EIC_EVCTRL_EXTINTEO_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Event Control
   type EIC_EVCTRL_Register is record
      --  External Interrupt 0 Event Output Enable
      EXTINTEO       : EIC_EVCTRL_EXTINTEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_EVCTRL_Register use record
      EXTINTEO       at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EIC_INTENCLR_EXTINT array
   type EIC_INTENCLR_EXTINT_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for EIC_INTENCLR_EXTINT
   type EIC_INTENCLR_EXTINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTINT as a value
            Val : HAL.UInt16;
         when True =>
            --  EXTINT as an array
            Arr : EIC_INTENCLR_EXTINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EIC_INTENCLR_EXTINT_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Interrupt Enable Clear
   type EIC_INTENCLR_Register is record
      --  External Interrupt 0 Enable
      EXTINT         : EIC_INTENCLR_EXTINT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_INTENCLR_Register use record
      EXTINT         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EIC_INTENSET_EXTINT array
   type EIC_INTENSET_EXTINT_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for EIC_INTENSET_EXTINT
   type EIC_INTENSET_EXTINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTINT as a value
            Val : HAL.UInt16;
         when True =>
            --  EXTINT as an array
            Arr : EIC_INTENSET_EXTINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EIC_INTENSET_EXTINT_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Interrupt Enable Set
   type EIC_INTENSET_Register is record
      --  External Interrupt 0 Enable
      EXTINT         : EIC_INTENSET_EXTINT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_INTENSET_Register use record
      EXTINT         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EIC_INTFLAG_EXTINT array
   type EIC_INTFLAG_EXTINT_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for EIC_INTFLAG_EXTINT
   type EIC_INTFLAG_EXTINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTINT as a value
            Val : HAL.UInt16;
         when True =>
            --  EXTINT as an array
            Arr : EIC_INTFLAG_EXTINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EIC_INTFLAG_EXTINT_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Interrupt Flag Status and Clear
   type EIC_INTFLAG_Register is record
      --  External Interrupt 0
      EXTINT         : EIC_INTFLAG_EXTINT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_INTFLAG_Register use record
      EXTINT         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EIC_WAKEUP_WAKEUPEN array
   type EIC_WAKEUP_WAKEUPEN_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for EIC_WAKEUP_WAKEUPEN
   type EIC_WAKEUP_WAKEUPEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WAKEUPEN as a value
            Val : HAL.UInt16;
         when True =>
            --  WAKEUPEN as an array
            Arr : EIC_WAKEUP_WAKEUPEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EIC_WAKEUP_WAKEUPEN_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Wake-Up Enable
   type EIC_WAKEUP_Register is record
      --  External Interrupt 0 Wake-up Enable
      WAKEUPEN       : EIC_WAKEUP_WAKEUPEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_WAKEUP_Register use record
      WAKEUPEN       at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Input Sense 0 Configuration
   type CONFIG_SENSE0Select is
     (--  No detection
      NONE,
      --  Rising-edge detection
      RISE,
      --  Falling-edge detection
      FALL,
      --  Both-edges detection
      BOTH,
      --  High-level detection
      HIGH,
      --  Low-level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE0Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense 1 Configuration
   type CONFIG_SENSE1Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE1Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense 2 Configuration
   type CONFIG_SENSE2Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE2Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense 3 Configuration
   type CONFIG_SENSE3Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE3Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense 4 Configuration
   type CONFIG_SENSE4Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE4Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense 5 Configuration
   type CONFIG_SENSE5Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE5Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense 6 Configuration
   type CONFIG_SENSE6Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE6Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense Configuration
   type CONFIG_SENSESelect is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSESelect use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   type EIC_CONFIG_SENSE_Field is record
      SENSE  : CONFIG_SENSESelect := NONE;
      FILTEN : Boolean := False;
   end record
      with Size => 4;
   for EIC_CONFIG_SENSE_Field use record
      SENSE  at 0 range 1 .. 3;
      FILTEN at 0 range 0 .. 0;
   end record;

   type EIC_CONFIG_SENSE_Array is array (0 .. 7) of EIC_CONFIG_SENSE_Field
     with Component_Size => 4, Size => 32;

   --  Configuration n
   type EIC_CONFIG_Register is record
      SENSE : EIC_CONFIG_SENSE_Array;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_CONFIG_Register use record
      SENSE at 0 range 0 .. 31;
   end record;

   --  Configuration n
   type EIC_CONFIG_Registers is array (0 .. 1) of EIC_CONFIG_Register;

   -----------------
   -- Peripherals --
   -----------------

   --  External Interrupt Controller
   type EIC_Peripheral is record
      --  Control
      CTRL     : aliased EIC_CTRL_Register;
      --  Status
      STATUS   : aliased EIC_STATUS_Register;
      --  Non-Maskable Interrupt Control
      NMICTRL  : aliased EIC_NMICTRL_Register;
      --  Non-Maskable Interrupt Flag Status and Clear
      NMIFLAG  : aliased EIC_NMIFLAG_Register;
      --  Event Control
      EVCTRL   : aliased EIC_EVCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased EIC_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased EIC_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased EIC_INTFLAG_Register;
      --  Wake-Up Enable
      WAKEUP   : aliased EIC_WAKEUP_Register;
      --  Configuration n
      CONFIG   : aliased EIC_CONFIG_Registers;
   end record
     with Volatile;

   for EIC_Peripheral use record
      CTRL     at 16#0# range 0 .. 7;
      STATUS   at 16#1# range 0 .. 7;
      NMICTRL  at 16#2# range 0 .. 7;
      NMIFLAG  at 16#3# range 0 .. 7;
      EVCTRL   at 16#4# range 0 .. 31;
      INTENCLR at 16#8# range 0 .. 31;
      INTENSET at 16#C# range 0 .. 31;
      INTFLAG  at 16#10# range 0 .. 31;
      WAKEUP   at 16#14# range 0 .. 31;
      CONFIG   at 16#18# range 0 .. 63;
   end record;

   --  External Interrupt Controller
   EIC_Periph : aliased EIC_Peripheral
     with Import, Address => EIC_Base;

end SAMD21_SVD.EIC;
