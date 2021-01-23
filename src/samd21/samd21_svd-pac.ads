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

package SAMD21_SVD.PAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype PAC_WPCLR_WP_Field is HAL.UInt31;

   --  Write Protection Clear
   type PAC_WPCLR_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  Write Protection Clear
      WP           : PAC_WPCLR_WP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_WPCLR_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      WP           at 0 range 1 .. 31;
   end record;

   subtype PAC_WPSET_WP_Field is HAL.UInt31;

   --  Write Protection Set
   type PAC_WPSET_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  Write Protection Set
      WP           : PAC_WPSET_WP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_WPSET_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      WP           at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Peripheral Access Controller 0
   type PAC_Peripheral is record
      --  Write Protection Clear
      WPCLR : aliased PAC_WPCLR_Register;
      --  Write Protection Set
      WPSET : aliased PAC_WPSET_Register;
   end record
     with Volatile;

   for PAC_Peripheral use record
      WPCLR at 16#0# range 0 .. 31;
      WPSET at 16#4# range 0 .. 31;
   end record;

   --  Peripheral Access Controller 0
   PAC0_Periph : aliased PAC_Peripheral
     with Import, Address => PAC0_Base;

   --  Peripheral Access Controller 1
   PAC1_Periph : aliased PAC_Peripheral
     with Import, Address => PAC1_Base;

   --  Peripheral Access Controller 2
   PAC2_Periph : aliased PAC_Peripheral
     with Import, Address => PAC2_Base;

end SAMD21_SVD.PAC;
