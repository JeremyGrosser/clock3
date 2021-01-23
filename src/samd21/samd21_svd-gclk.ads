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

package SAMD21_SVD.GCLK is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control
   type GCLK_CTRL_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for GCLK_CTRL_Register use record
      SWRST        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Status
   type GCLK_STATUS_Register is record
      --  unspecified
      Reserved_0_6 : HAL.UInt7;
      --  Read-only. Synchronization Busy Status
      SYNCBUSY     : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for GCLK_STATUS_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      SYNCBUSY     at 0 range 7 .. 7;
   end record;

   --  Generic Clock Selection ID
   type CLKCTRL_IDSelect is
     (--  DFLL48
      DFLL48,
      --  FDPLL
      FDPLL,
      --  FDPLL32K
      FDPLL32K,
      --  WDT
      WDT,
      --  RTC
      RTC,
      --  EIC
      EIC,
      --  USB
      USB,
      --  EVSYS_0
      EVSYS_0,
      --  EVSYS_1
      EVSYS_1,
      --  EVSYS_2
      EVSYS_2,
      --  EVSYS_3
      EVSYS_3,
      --  EVSYS_4
      EVSYS_4,
      --  EVSYS_5
      EVSYS_5,
      --  EVSYS_6
      EVSYS_6,
      --  EVSYS_7
      EVSYS_7,
      --  EVSYS_8
      EVSYS_8,
      --  EVSYS_9
      EVSYS_9,
      --  EVSYS_10
      EVSYS_10,
      --  EVSYS_11
      EVSYS_11,
      --  SERCOMX_SLOW
      SERCOMX_SLOW,
      --  SERCOM0_CORE
      SERCOM0_CORE,
      --  SERCOM1_CORE
      SERCOM1_CORE,
      --  SERCOM2_CORE
      SERCOM2_CORE,
      --  SERCOM3_CORE
      SERCOM3_CORE,
      --  SERCOM4_CORE
      SERCOM4_CORE,
      --  SERCOM5_CORE
      SERCOM5_CORE,
      --  TCC0_TCC1
      TCC0_TCC1,
      --  TCC2_TC3
      TCC2_TC3,
      --  TC4_TC5
      TC4_TC5,
      --  TC6_TC7
      TC6_TC7,
      --  ADC
      ADC,
      --  AC_DIG
      AC_DIG,
      --  AC_ANA
      AC_ANA,
      --  DAC
      DAC,
      --  I2S_0
      I2S_0,
      --  I2S_1
      I2S_1)
     with Size => 6;
   for CLKCTRL_IDSelect use
     (DFLL48 => 0,
      FDPLL => 1,
      FDPLL32K => 2,
      WDT => 3,
      RTC => 4,
      EIC => 5,
      USB => 6,
      EVSYS_0 => 7,
      EVSYS_1 => 8,
      EVSYS_2 => 9,
      EVSYS_3 => 10,
      EVSYS_4 => 11,
      EVSYS_5 => 12,
      EVSYS_6 => 13,
      EVSYS_7 => 14,
      EVSYS_8 => 15,
      EVSYS_9 => 16,
      EVSYS_10 => 17,
      EVSYS_11 => 18,
      SERCOMX_SLOW => 19,
      SERCOM0_CORE => 20,
      SERCOM1_CORE => 21,
      SERCOM2_CORE => 22,
      SERCOM3_CORE => 23,
      SERCOM4_CORE => 24,
      SERCOM5_CORE => 25,
      TCC0_TCC1 => 26,
      TCC2_TC3 => 27,
      TC4_TC5 => 28,
      TC6_TC7 => 29,
      ADC => 30,
      AC_DIG => 31,
      AC_ANA => 32,
      DAC => 33,
      I2S_0 => 35,
      I2S_1 => 36);

   --  Generic Clock Generator
   type CLKCTRL_GENSelect is
     (--  Generic clock generator 0
      GCLK0,
      --  Generic clock generator 1
      GCLK1,
      --  Generic clock generator 2
      GCLK2,
      --  Generic clock generator 3
      GCLK3,
      --  Generic clock generator 4
      GCLK4,
      --  Generic clock generator 5
      GCLK5,
      --  Generic clock generator 6
      GCLK6,
      --  Generic clock generator 7
      GCLK7,
      --  Generic clock generator 8
      GCLK8)
     with Size => 4;
   for CLKCTRL_GENSelect use
     (GCLK0 => 0,
      GCLK1 => 1,
      GCLK2 => 2,
      GCLK3 => 3,
      GCLK4 => 4,
      GCLK5 => 5,
      GCLK6 => 6,
      GCLK7 => 7,
      GCLK8 => 8);

   --  Generic Clock Control
   type GCLK_CLKCTRL_Register is record
      --  Generic Clock Selection ID
      ID             : CLKCTRL_IDSelect := SAMD21_SVD.GCLK.DFLL48;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Generic Clock Generator
      GEN            : CLKCTRL_GENSelect := SAMD21_SVD.GCLK.GCLK0;
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      --  Clock Enable
      CLKEN          : Boolean := False;
      --  Write Lock
      WRTLOCK        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for GCLK_CLKCTRL_Register use record
      ID             at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      GEN            at 0 range 8 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      CLKEN          at 0 range 14 .. 14;
      WRTLOCK        at 0 range 15 .. 15;
   end record;

   subtype GCLK_GENCTRL_ID_Field is HAL.UInt4;

   --  Source Select
   type GENCTRL_SRCSelect is
     (--  XOSC oscillator output
      XOSC,
      --  Generator input pad
      GCLKIN,
      --  Generic clock generator 1 output
      GCLKGEN1,
      --  OSCULP32K oscillator output
      OSCULP32K,
      --  OSC32K oscillator output
      OSC32K,
      --  XOSC32K oscillator output
      XOSC32K,
      --  OSC8M oscillator output
      OSC8M,
      --  DFLL48M output
      DFLL48M,
      --  DPLL96M output
      DPLL96M)
     with Size => 5;
   for GENCTRL_SRCSelect use
     (XOSC => 0,
      GCLKIN => 1,
      GCLKGEN1 => 2,
      OSCULP32K => 3,
      OSC32K => 4,
      XOSC32K => 5,
      OSC8M => 6,
      DFLL48M => 7,
      DPLL96M => 8);

   --  Generic Clock Generator Control
   type GCLK_GENCTRL_Register is record
      --  Generic Clock Generator Selection
      ID             : GCLK_GENCTRL_ID_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Source Select
      SRC            : GENCTRL_SRCSelect := SAMD21_SVD.GCLK.XOSC;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  Generic Clock Generator Enable
      GENEN          : Boolean := False;
      --  Improve Duty Cycle
      IDC            : Boolean := False;
      --  Output Off Value
      OOV            : Boolean := False;
      --  Output Enable
      OE             : Boolean := False;
      --  Divide Selection
      DIVSEL         : Boolean := False;
      --  Run in Standby
      RUNSTDBY       : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GCLK_GENCTRL_Register use record
      ID             at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      SRC            at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      GENEN          at 0 range 16 .. 16;
      IDC            at 0 range 17 .. 17;
      OOV            at 0 range 18 .. 18;
      OE             at 0 range 19 .. 19;
      DIVSEL         at 0 range 20 .. 20;
      RUNSTDBY       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype GCLK_GENDIV_ID_Field is HAL.UInt4;
   subtype GCLK_GENDIV_DIV_Field is HAL.UInt16;

   --  Generic Clock Generator Division
   type GCLK_GENDIV_Register is record
      --  Generic Clock Generator Selection
      ID             : GCLK_GENDIV_ID_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Division Factor
      DIV            : GCLK_GENDIV_DIV_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GCLK_GENDIV_Register use record
      ID             at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      DIV            at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Generic Clock Generator
   type GCLK_Peripheral is record
      --  Control
      CTRL    : aliased GCLK_CTRL_Register;
      --  Status
      STATUS  : aliased GCLK_STATUS_Register;
      --  Generic Clock Control
      CLKCTRL : aliased GCLK_CLKCTRL_Register;
      --  Generic Clock Generator Control
      GENCTRL : aliased GCLK_GENCTRL_Register;
      --  Generic Clock Generator Division
      GENDIV  : aliased GCLK_GENDIV_Register;
   end record
     with Volatile;

   for GCLK_Peripheral use record
      CTRL    at 16#0# range 0 .. 7;
      STATUS  at 16#1# range 0 .. 7;
      CLKCTRL at 16#2# range 0 .. 15;
      GENCTRL at 16#4# range 0 .. 31;
      GENDIV  at 16#8# range 0 .. 31;
   end record;

   --  Generic Clock Generator
   GCLK_Periph : aliased GCLK_Peripheral
     with Import, Address => GCLK_Base;

end SAMD21_SVD.GCLK;
