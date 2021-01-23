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

package SAMD21_SVD.DAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control A
   type DAC_CTRLA_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  Run in Standby
      RUNSTDBY     : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DAC_CTRLA_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      RUNSTDBY     at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Reference Selection
   type CTRLB_REFSELSelect is
     (--  Internal 1.0V reference
      INT1V,
      --  AVCC
      AVCC,
      --  External reference
      VREFP)
     with Size => 2;
   for CTRLB_REFSELSelect use
     (INT1V => 0,
      AVCC => 1,
      VREFP => 2);

   --  Control B
   type DAC_CTRLB_Register is record
      --  External Output Enable
      EOEN         : Boolean := False;
      --  Internal Output Enable
      IOEN         : Boolean := False;
      --  Left Adjusted Data
      LEFTADJ      : Boolean := False;
      --  Voltage Pump Disable
      VPD          : Boolean := False;
      --  Bypass DATABUF Write Protection
      BDWP         : Boolean := False;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Reference Selection
      REFSEL       : CTRLB_REFSELSelect := SAMD21_SVD.DAC.INT1V;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DAC_CTRLB_Register use record
      EOEN         at 0 range 0 .. 0;
      IOEN         at 0 range 1 .. 1;
      LEFTADJ      at 0 range 2 .. 2;
      VPD          at 0 range 3 .. 3;
      BDWP         at 0 range 4 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      REFSEL       at 0 range 6 .. 7;
   end record;

   --  Event Control
   type DAC_EVCTRL_Register is record
      --  Start Conversion Event Input
      STARTEI      : Boolean := False;
      --  Data Buffer Empty Event Output
      EMPTYEO      : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DAC_EVCTRL_Register use record
      STARTEI      at 0 range 0 .. 0;
      EMPTYEO      at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Interrupt Enable Clear
   type DAC_INTENCLR_Register is record
      --  Underrun Interrupt Enable
      UNDERRUN     : Boolean := False;
      --  Data Buffer Empty Interrupt Enable
      EMPTY        : Boolean := False;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DAC_INTENCLR_Register use record
      UNDERRUN     at 0 range 0 .. 0;
      EMPTY        at 0 range 1 .. 1;
      SYNCRDY      at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Interrupt Enable Set
   type DAC_INTENSET_Register is record
      --  Underrun Interrupt Enable
      UNDERRUN     : Boolean := False;
      --  Data Buffer Empty Interrupt Enable
      EMPTY        : Boolean := False;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DAC_INTENSET_Register use record
      UNDERRUN     at 0 range 0 .. 0;
      EMPTY        at 0 range 1 .. 1;
      SYNCRDY      at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Interrupt Flag Status and Clear
   type DAC_INTFLAG_Register is record
      --  Underrun
      UNDERRUN     : Boolean := False;
      --  Data Buffer Empty
      EMPTY        : Boolean := False;
      --  Synchronization Ready
      SYNCRDY      : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DAC_INTFLAG_Register use record
      UNDERRUN     at 0 range 0 .. 0;
      EMPTY        at 0 range 1 .. 1;
      SYNCRDY      at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Status
   type DAC_STATUS_Register is record
      --  unspecified
      Reserved_0_6 : HAL.UInt7;
      --  Read-only. Synchronization Busy Status
      SYNCBUSY     : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DAC_STATUS_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      SYNCBUSY     at 0 range 7 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Digital Analog Converter
   type DAC_Peripheral is record
      --  Control A
      CTRLA    : aliased DAC_CTRLA_Register;
      --  Control B
      CTRLB    : aliased DAC_CTRLB_Register;
      --  Event Control
      EVCTRL   : aliased DAC_EVCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased DAC_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased DAC_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased DAC_INTFLAG_Register;
      --  Status
      STATUS   : aliased DAC_STATUS_Register;
      --  Data
      DATA     : aliased HAL.UInt16;
      --  Data Buffer
      DATABUF  : aliased HAL.UInt16;
   end record
     with Volatile;

   for DAC_Peripheral use record
      CTRLA    at 16#0# range 0 .. 7;
      CTRLB    at 16#1# range 0 .. 7;
      EVCTRL   at 16#2# range 0 .. 7;
      INTENCLR at 16#4# range 0 .. 7;
      INTENSET at 16#5# range 0 .. 7;
      INTFLAG  at 16#6# range 0 .. 7;
      STATUS   at 16#7# range 0 .. 7;
      DATA     at 16#8# range 0 .. 15;
      DATABUF  at 16#C# range 0 .. 15;
   end record;

   --  Digital Analog Converter
   DAC_Periph : aliased DAC_Peripheral
     with Import, Address => DAC_Base;

end SAMD21_SVD.DAC;
