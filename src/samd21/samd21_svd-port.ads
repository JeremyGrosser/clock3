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
--  and modified to fix dumb peripheral layout

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAMD21_SVD.PORT is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype WRCONFIG_PINMASK_Field is HAL.UInt16;
   subtype WRCONFIG_PMUX_Field is HAL.UInt4;

   --  Write Configuration
   type WRCONFIG_Register is record
      --  Write-only. Pin Mask for Multiple Pin Configuration
      PINMASK        : WRCONFIG_PINMASK_Field := 16#0#;
      --  Write-only. Peripheral Multiplexer Enable
      PMUXEN         : Boolean := False;
      --  Write-only. Input Enable
      INEN           : Boolean := False;
      --  Write-only. Pull Enable
      PULLEN         : Boolean := False;
      --  unspecified
      Reserved_19_21 : HAL.UInt3 := 16#0#;
      --  Write-only. Output Driver Strength Selection
      DRVSTR         : Boolean := False;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Write-only. Peripheral Multiplexing
      PMUX           : WRCONFIG_PMUX_Field := 16#0#;
      --  Write-only. Write PMUX
      WRPMUX         : Boolean := False;
      --  unspecified
      Reserved_29_29 : HAL.Bit := 16#0#;
      --  Write-only. Write PINCFG
      WRPINCFG       : Boolean := False;
      --  Write-only. Half-Word Select
      HWSEL          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WRCONFIG_Register use record
      PINMASK        at 0 range 0 .. 15;
      PMUXEN         at 0 range 16 .. 16;
      INEN           at 0 range 17 .. 17;
      PULLEN         at 0 range 18 .. 18;
      Reserved_19_21 at 0 range 19 .. 21;
      DRVSTR         at 0 range 22 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      PMUX           at 0 range 24 .. 27;
      WRPMUX         at 0 range 28 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      WRPINCFG       at 0 range 30 .. 30;
      HWSEL          at 0 range 31 .. 31;
   end record;

   --  Peripheral Multiplexing Even
   type PMUX_PMUXSelect is
     (--  Peripheral function A selected
      A,
      --  Peripheral function B selected
      B,
      --  Peripheral function C selected
      C,
      --  Peripheral function D selected
      D,
      --  Peripheral function E selected
      E,
      --  Peripheral function F selected
      F,
      --  Peripheral function G selected
      G,
      --  Peripheral function H selected
      H)
     with Size => 4;
   for PMUX_PMUXSelect use
     (A => 0,
      B => 1,
      C => 2,
      D => 3,
      E => 4,
      F => 5,
      G => 6,
      H => 7);

   --  Peripheral Multiplexing n - Group 0
   type PMUX_Register is record
      --  Peripheral Multiplexing Even
      PMUXE : PMUX_PMUXSelect := SAMD21_SVD.PORT.A;
      --  Peripheral Multiplexing Odd
      PMUXO : PMUX_PMUXSelect := SAMD21_SVD.PORT.A;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PMUX_Register use record
      PMUXE at 0 range 0 .. 3;
      PMUXO at 0 range 4 .. 7;
   end record;

   --  Peripheral Multiplexing n - Group 0
   type PMUX_Registers is array (0 .. 15) of PMUX_Register;

   --  Pin Configuration n - Group 0
   type PINCFG_Register is record
      --  Peripheral Multiplexer Enable
      PMUXEN       : Boolean := False;
      --  Input Enable
      INEN         : Boolean := False;
      --  Pull Enable
      PULLEN       : Boolean := False;
      --  unspecified
      Reserved_3_5 : HAL.UInt3 := 16#0#;
      --  Write-only. Output Driver Strength Selection
      DRVSTR       : Boolean := False;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PINCFG_Register use record
      PMUXEN       at 0 range 0 .. 0;
      INEN         at 0 range 1 .. 1;
      PULLEN       at 0 range 2 .. 2;
      Reserved_3_5 at 0 range 3 .. 5;
      DRVSTR       at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   --  Pin Configuration n - Group 0
   type PINCFG_Registers is array (0 .. 31) of PINCFG_Register;

   -----------------
   -- Peripherals --
   -----------------

   --  Port Module
   type PORT_Peripheral is record
      --  Data Direction
      DIR      : aliased HAL.UInt32;
      --  Data Direction Clear
      DIRCLR   : aliased HAL.UInt32;
      --  Data Direction Set
      DIRSET   : aliased HAL.UInt32;
      --  Data Direction Toggle
      DIRTGL   : aliased HAL.UInt32;
      --  Data Output Value
      DOUT     : aliased HAL.UInt32;
      --  Data Output Value Clear
      OUTCLR   : aliased HAL.UInt32;
      --  Data Output Value Set
      OUTSET   : aliased HAL.UInt32;
      --  Data Output Value Toggle
      OUTTGL   : aliased HAL.UInt32;
      --  Data Input Value
      DIN      : aliased HAL.UInt32;
      --  Control
      CTRL     : aliased HAL.UInt32;
      --  Write Configuration
      WRCONFIG : aliased WRCONFIG_Register;
      --  Peripheral Multiplexing n - Group 0
      PMUX     : aliased PMUX_Registers;
      --  Pin Configuration n - Group 0
      PINCFG   : aliased PINCFG_Registers;
   end record
     with Volatile;

   for PORT_Peripheral use record
      DIR      at 16#0# range 0 .. 31;
      DIRCLR   at 16#4# range 0 .. 31;
      DIRSET   at 16#8# range 0 .. 31;
      DIRTGL   at 16#C# range 0 .. 31;
      DOUT     at 16#10# range 0 .. 31;
      OUTCLR   at 16#14# range 0 .. 31;
      OUTSET   at 16#18# range 0 .. 31;
      OUTTGL   at 16#1C# range 0 .. 31;
      DIN      at 16#20# range 0 .. 31;
      CTRL     at 16#24# range 0 .. 31;
      WRCONFIG at 16#28# range 0 .. 31;
      PMUX     at 16#30# range 0 .. 127;
      PINCFG   at 16#40# range 0 .. 255;
   end record;

   --  Port Module
   PORTA_Periph : aliased PORT_Peripheral
     with Import, Address => PORTA_Base;

   PORTB_Periph : aliased PORT_Peripheral
     with Import, Address => PORTB_Base;

end SAMD21_SVD.PORT;
