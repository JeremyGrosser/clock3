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

package SAMD21_SVD.NVMCTRL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Command
   type CTRLA_CMDSelect is
     (--  Reset value for the field
      CTRLA_CMDSelect_Reset,
      --  Erase Row - Erases the row addressed by the ADDR register.
      ER,
      --  Write Page - Writes the contents of the page buffer to the page addressed
--  by the ADDR register.
      WP,
      --  Erase Auxiliary Row - Erases the auxiliary row addressed by the ADDR
--  register. This command can be given only when the security bit is not set
--  and only to the user configuration row.
      EAR,
      --  Write Auxiliary Page - Writes the contents of the page buffer to the page
--  addressed by the ADDR register. This command can be given only when the
--  security bit is not set and only to the user configuration row.
      WAP,
      --  Security Flow Command
      SF,
      --  Write lockbits
      WL,
      --  Lock Region - Locks the region containing the address location in the ADDR
--  register.
      LR,
      --  Unlock Region - Unlocks the region containing the address location in the
--  ADDR register.
      UR,
      --  Sets the power reduction mode.
      SPRM,
      --  Clears the power reduction mode.
      CPRM,
      --  Page Buffer Clear - Clears the page buffer.
      PBC,
      --  Set Security Bit - Sets the security bit by writing 0x00 to the first byte
--  in the lockbit row.
      SSB,
      --  Invalidates all cache lines.
      INVALL)
     with Size => 7;
   for CTRLA_CMDSelect use
     (CTRLA_CMDSelect_Reset => 0,
      ER => 2,
      WP => 4,
      EAR => 5,
      WAP => 6,
      SF => 10,
      WL => 15,
      LR => 64,
      UR => 65,
      SPRM => 66,
      CPRM => 67,
      PBC => 68,
      SSB => 69,
      INVALL => 70);

   --  Command Execution
   type CTRLA_CMDEXSelect is
     (--  Reset value for the field
      CTRLA_CMDEXSelect_Reset,
      --  Execution Key
      KEY)
     with Size => 8;
   for CTRLA_CMDEXSelect use
     (CTRLA_CMDEXSelect_Reset => 0,
      KEY => 165);

   --  Control A
   type NVMCTRL_CTRLA_Register is record
      --  Command
      CMD          : CTRLA_CMDSelect := CTRLA_CMDSelect_Reset;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
      --  Command Execution
      CMDEX        : CTRLA_CMDEXSelect := CTRLA_CMDEXSelect_Reset;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_CTRLA_Register use record
      CMD          at 0 range 0 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
      CMDEX        at 0 range 8 .. 15;
   end record;

   --  NVM Read Wait States
   type CTRLB_RWSSelect is
     (--  Single Auto Wait State
      SINGLE,
      --  Half Auto Wait State
      HALF,
      --  Dual Auto Wait State
      DUAL)
     with Size => 4;
   for CTRLB_RWSSelect use
     (SINGLE => 0,
      HALF => 1,
      DUAL => 2);

   --  Power Reduction Mode during Sleep
   type CTRLB_SLEEPPRMSelect is
     (--  NVM block enters low-power mode when entering sleep.NVM block exits
--  low-power mode upon first access.
      WAKEONACCESS,
      --  NVM block enters low-power mode when entering sleep.NVM block exits
--  low-power mode when exiting sleep.
      WAKEUPINSTANT,
      --  Auto power reduction disabled.
      DISABLED)
     with Size => 2;
   for CTRLB_SLEEPPRMSelect use
     (WAKEONACCESS => 0,
      WAKEUPINSTANT => 1,
      DISABLED => 3);

   --  NVMCTRL Read Mode
   type CTRLB_READMODESelect is
     (--  The NVM Controller (cache system) does not insert wait states on a cache
--  miss. Gives the best system performance.
      NO_MISS_PENALTY,
      --  Reduces power consumption of the cache system, but inserts a wait state
--  each time there is a cache miss. This mode may not be relevant if CPU
--  performance is required, as the application will be stalled and may lead to
--  increase run time.
      LOW_POWER,
      --  The cache system ensures that a cache hit or miss takes the same amount of
--  time, determined by the number of programmed flash wait states. This mode
--  can be used for real-time applications that require deterministic execution
--  timings.
      DETERMINISTIC)
     with Size => 2;
   for CTRLB_READMODESelect use
     (NO_MISS_PENALTY => 0,
      LOW_POWER => 1,
      DETERMINISTIC => 2);

   --  Control B
   type NVMCTRL_CTRLB_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  NVM Read Wait States
      RWS            : CTRLB_RWSSelect := SAMD21_SVD.NVMCTRL.SINGLE;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      --  Manual Write
      MANW           : Boolean := False;
      --  Power Reduction Mode during Sleep
      SLEEPPRM       : CTRLB_SLEEPPRMSelect :=
                        SAMD21_SVD.NVMCTRL.WAKEONACCESS;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  NVMCTRL Read Mode
      READMODE       : CTRLB_READMODESelect :=
                        SAMD21_SVD.NVMCTRL.NO_MISS_PENALTY;
      --  Cache Disable
      CACHEDIS       : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_CTRLB_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      RWS            at 0 range 1 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      MANW           at 0 range 7 .. 7;
      SLEEPPRM       at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      READMODE       at 0 range 16 .. 17;
      CACHEDIS       at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype NVMCTRL_PARAM_NVMP_Field is HAL.UInt16;

   --  Page Size
   type PARAM_PSZSelect is
     (--  8 bytes
      Val_8,
      --  16 bytes
      Val_16,
      --  32 bytes
      Val_32,
      --  64 bytes
      Val_64,
      --  128 bytes
      Val_128,
      --  256 bytes
      Val_256,
      --  512 bytes
      Val_512,
      --  1024 bytes
      Val_1024)
     with Size => 3;
   for PARAM_PSZSelect use
     (Val_8 => 0,
      Val_16 => 1,
      Val_32 => 2,
      Val_64 => 3,
      Val_128 => 4,
      Val_256 => 5,
      Val_512 => 6,
      Val_1024 => 7);

   --  NVM Parameter
   type NVMCTRL_PARAM_Register is record
      --  Read-only. NVM Pages
      NVMP           : NVMCTRL_PARAM_NVMP_Field;
      --  Read-only. Page Size
      PSZ            : PARAM_PSZSelect;
      --  unspecified
      Reserved_19_31 : HAL.UInt13;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_PARAM_Register use record
      NVMP           at 0 range 0 .. 15;
      PSZ            at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  Interrupt Enable Clear
   type NVMCTRL_INTENCLR_Register is record
      --  NVM Ready Interrupt Enable
      READY        : Boolean := False;
      --  Error Interrupt Enable
      ERROR        : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_INTENCLR_Register use record
      READY        at 0 range 0 .. 0;
      ERROR        at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Interrupt Enable Set
   type NVMCTRL_INTENSET_Register is record
      --  NVM Ready Interrupt Enable
      READY        : Boolean := False;
      --  Error Interrupt Enable
      ERROR        : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_INTENSET_Register use record
      READY        at 0 range 0 .. 0;
      ERROR        at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Interrupt Flag Status and Clear
   type NVMCTRL_INTFLAG_Register is record
      --  Read-only. NVM Ready
      READY        : Boolean := False;
      --  Error
      ERROR        : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_INTFLAG_Register use record
      READY        at 0 range 0 .. 0;
      ERROR        at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Status
   type NVMCTRL_STATUS_Register is record
      --  Read-only. Power Reduction Mode
      PRM           : Boolean := False;
      --  NVM Page Buffer Active Loading
      LOAD          : Boolean := False;
      --  Programming Error Status
      PROGE         : Boolean := False;
      --  Lock Error Status
      LOCKE         : Boolean := False;
      --  NVM Error
      NVME          : Boolean := False;
      --  unspecified
      Reserved_5_7  : HAL.UInt3 := 16#0#;
      --  Read-only. Security Bit Status
      SB            : Boolean := False;
      --  unspecified
      Reserved_9_15 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_STATUS_Register use record
      PRM           at 0 range 0 .. 0;
      LOAD          at 0 range 1 .. 1;
      PROGE         at 0 range 2 .. 2;
      LOCKE         at 0 range 3 .. 3;
      NVME          at 0 range 4 .. 4;
      Reserved_5_7  at 0 range 5 .. 7;
      SB            at 0 range 8 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   subtype NVMCTRL_ADDR_ADDR_Field is HAL.UInt22;

   --  Address
   type NVMCTRL_ADDR_Register is record
      --  NVM Address
      ADDR           : NVMCTRL_ADDR_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_ADDR_Register use record
      ADDR           at 0 range 0 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Non-Volatile Memory Controller
   type NVMCTRL_Peripheral is record
      --  Control A
      CTRLA    : aliased NVMCTRL_CTRLA_Register;
      --  Control B
      CTRLB    : aliased NVMCTRL_CTRLB_Register;
      --  NVM Parameter
      PARAM    : aliased NVMCTRL_PARAM_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased NVMCTRL_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased NVMCTRL_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased NVMCTRL_INTFLAG_Register;
      --  Status
      STATUS   : aliased NVMCTRL_STATUS_Register;
      --  Address
      ADDR     : aliased NVMCTRL_ADDR_Register;
      --  Lock Section
      LOCK     : aliased HAL.UInt16;
   end record
     with Volatile;

   for NVMCTRL_Peripheral use record
      CTRLA    at 16#0# range 0 .. 15;
      CTRLB    at 16#4# range 0 .. 31;
      PARAM    at 16#8# range 0 .. 31;
      INTENCLR at 16#C# range 0 .. 7;
      INTENSET at 16#10# range 0 .. 7;
      INTFLAG  at 16#14# range 0 .. 7;
      STATUS   at 16#18# range 0 .. 15;
      ADDR     at 16#1C# range 0 .. 31;
      LOCK     at 16#20# range 0 .. 15;
   end record;

   --  Non-Volatile Memory Controller
   NVMCTRL_Periph : aliased NVMCTRL_Peripheral
     with Import, Address => NVMCTRL_Base;

end SAMD21_SVD.NVMCTRL;
