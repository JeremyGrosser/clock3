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

package SAMD21_SVD.WDT is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control
   type WDT_CTRL_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  Enable
      ENABLE       : Boolean := False;
      --  Watchdog Timer Window Mode Enable
      WEN          : Boolean := False;
      --  unspecified
      Reserved_3_6 : HAL.UInt4 := 16#0#;
      --  Always-On
      ALWAYSON     : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_CTRL_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      WEN          at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      ALWAYSON     at 0 range 7 .. 7;
   end record;

   --  Time-Out Period
   type CONFIG_PERSelect is
     (--  8 clock cycles
      Val_8,
      --  16 clock cycles
      Val_16,
      --  32 clock cycles
      Val_32,
      --  64 clock cycles
      Val_64,
      --  128 clock cycles
      Val_128,
      --  256 clock cycles
      Val_256,
      --  512 clock cycles
      Val_512,
      --  1024 clock cycles
      Val_1K,
      --  2048 clock cycles
      Val_2K,
      --  4096 clock cycles
      Val_4K,
      --  8192 clock cycles
      Val_8K,
      --  16384 clock cycles
      Val_16K)
     with Size => 4;
   for CONFIG_PERSelect use
     (Val_8 => 0,
      Val_16 => 1,
      Val_32 => 2,
      Val_64 => 3,
      Val_128 => 4,
      Val_256 => 5,
      Val_512 => 6,
      Val_1K => 7,
      Val_2K => 8,
      Val_4K => 9,
      Val_8K => 10,
      Val_16K => 11);

   --  Window Mode Time-Out Period
   type CONFIG_WINDOWSelect is
     (--  8 clock cycles
      Val_8,
      --  16 clock cycles
      Val_16,
      --  32 clock cycles
      Val_32,
      --  64 clock cycles
      Val_64,
      --  128 clock cycles
      Val_128,
      --  256 clock cycles
      Val_256,
      --  512 clock cycles
      Val_512,
      --  1024 clock cycles
      Val_1K,
      --  2048 clock cycles
      Val_2K,
      --  4096 clock cycles
      Val_4K,
      --  8192 clock cycles
      Val_8K,
      --  16384 clock cycles
      Val_16K)
     with Size => 4;
   for CONFIG_WINDOWSelect use
     (Val_8 => 0,
      Val_16 => 1,
      Val_32 => 2,
      Val_64 => 3,
      Val_128 => 4,
      Val_256 => 5,
      Val_512 => 6,
      Val_1K => 7,
      Val_2K => 8,
      Val_4K => 9,
      Val_8K => 10,
      Val_16K => 11);

   --  Configuration
   type WDT_CONFIG_Register is record
      --  Time-Out Period
      PER    : CONFIG_PERSelect := SAMD21_SVD.WDT.Val_16K;
      --  Window Mode Time-Out Period
      WINDOW : CONFIG_WINDOWSelect := SAMD21_SVD.WDT.Val_16K;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_CONFIG_Register use record
      PER    at 0 range 0 .. 3;
      WINDOW at 0 range 4 .. 7;
   end record;

   --  Early Warning Interrupt Time Offset
   type EWCTRL_EWOFFSETSelect is
     (--  8 clock cycles
      Val_8,
      --  16 clock cycles
      Val_16,
      --  32 clock cycles
      Val_32,
      --  64 clock cycles
      Val_64,
      --  128 clock cycles
      Val_128,
      --  256 clock cycles
      Val_256,
      --  512 clock cycles
      Val_512,
      --  1024 clock cycles
      Val_1K,
      --  2048 clock cycles
      Val_2K,
      --  4096 clock cycles
      Val_4K,
      --  8192 clock cycles
      Val_8K,
      --  16384 clock cycles
      Val_16K)
     with Size => 4;
   for EWCTRL_EWOFFSETSelect use
     (Val_8 => 0,
      Val_16 => 1,
      Val_32 => 2,
      Val_64 => 3,
      Val_128 => 4,
      Val_256 => 5,
      Val_512 => 6,
      Val_1K => 7,
      Val_2K => 8,
      Val_4K => 9,
      Val_8K => 10,
      Val_16K => 11);

   --  Early Warning Interrupt Control
   type WDT_EWCTRL_Register is record
      --  Early Warning Interrupt Time Offset
      EWOFFSET     : EWCTRL_EWOFFSETSelect := SAMD21_SVD.WDT.Val_16K;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_EWCTRL_Register use record
      EWOFFSET     at 0 range 0 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Interrupt Enable Clear
   type WDT_INTENCLR_Register is record
      --  Early Warning Interrupt Enable
      EW           : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_INTENCLR_Register use record
      EW           at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Enable Set
   type WDT_INTENSET_Register is record
      --  Early Warning Interrupt Enable
      EW           : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_INTENSET_Register use record
      EW           at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Flag Status and Clear
   type WDT_INTFLAG_Register is record
      --  Early Warning
      EW           : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_INTFLAG_Register use record
      EW           at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Status
   type WDT_STATUS_Register is record
      --  unspecified
      Reserved_0_6 : HAL.UInt7;
      --  Read-only. Synchronization Busy
      SYNCBUSY     : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_STATUS_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      SYNCBUSY     at 0 range 7 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Watchdog Timer
   type WDT_Peripheral is record
      --  Control
      CTRL     : aliased WDT_CTRL_Register;
      --  Configuration
      CONFIG   : aliased WDT_CONFIG_Register;
      --  Early Warning Interrupt Control
      EWCTRL   : aliased WDT_EWCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased WDT_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased WDT_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased WDT_INTFLAG_Register;
      --  Status
      STATUS   : aliased WDT_STATUS_Register;
      --  Clear
      CLEAR    : aliased HAL.UInt8;
   end record
     with Volatile;

   for WDT_Peripheral use record
      CTRL     at 16#0# range 0 .. 7;
      CONFIG   at 16#1# range 0 .. 7;
      EWCTRL   at 16#2# range 0 .. 7;
      INTENCLR at 16#4# range 0 .. 7;
      INTENSET at 16#5# range 0 .. 7;
      INTFLAG  at 16#6# range 0 .. 7;
      STATUS   at 16#7# range 0 .. 7;
      CLEAR    at 16#8# range 0 .. 7;
   end record;

   --  Watchdog Timer
   WDT_Periph : aliased WDT_Peripheral
     with Import, Address => WDT_Base;

end SAMD21_SVD.WDT;
