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

package SAMD21_SVD.HMATRIXB is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Special Function

   --  Special Function
   type HMATRIXB_SFR_Registers is array (0 .. 15) of HAL.UInt32;

   -----------------
   -- Peripherals --
   -----------------

   --  HSB Matrix
   type HMATRIX_Peripheral is record
      --  Priority A for Slave
      PRAS0  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS0  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS1  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS1  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS2  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS2  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS3  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS3  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS4  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS4  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS5  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS5  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS6  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS6  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS7  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS7  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS8  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS8  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS9  : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS9  : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS10 : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS10 : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS11 : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS11 : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS12 : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS12 : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS13 : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS13 : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS14 : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS14 : aliased HAL.UInt32;
      --  Priority A for Slave
      PRAS15 : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS15 : aliased HAL.UInt32;
      --  Special Function
      SFR    : aliased HMATRIXB_SFR_Registers;
   end record
     with Volatile;

   for HMATRIX_Peripheral use record
      PRAS0  at 16#80# range 0 .. 31;
      PRBS0  at 16#84# range 0 .. 31;
      PRAS1  at 16#88# range 0 .. 31;
      PRBS1  at 16#8C# range 0 .. 31;
      PRAS2  at 16#90# range 0 .. 31;
      PRBS2  at 16#94# range 0 .. 31;
      PRAS3  at 16#98# range 0 .. 31;
      PRBS3  at 16#9C# range 0 .. 31;
      PRAS4  at 16#A0# range 0 .. 31;
      PRBS4  at 16#A4# range 0 .. 31;
      PRAS5  at 16#A8# range 0 .. 31;
      PRBS5  at 16#AC# range 0 .. 31;
      PRAS6  at 16#B0# range 0 .. 31;
      PRBS6  at 16#B4# range 0 .. 31;
      PRAS7  at 16#B8# range 0 .. 31;
      PRBS7  at 16#BC# range 0 .. 31;
      PRAS8  at 16#C0# range 0 .. 31;
      PRBS8  at 16#C4# range 0 .. 31;
      PRAS9  at 16#C8# range 0 .. 31;
      PRBS9  at 16#CC# range 0 .. 31;
      PRAS10 at 16#D0# range 0 .. 31;
      PRBS10 at 16#D4# range 0 .. 31;
      PRAS11 at 16#D8# range 0 .. 31;
      PRBS11 at 16#DC# range 0 .. 31;
      PRAS12 at 16#E0# range 0 .. 31;
      PRBS12 at 16#E4# range 0 .. 31;
      PRAS13 at 16#E8# range 0 .. 31;
      PRBS13 at 16#EC# range 0 .. 31;
      PRAS14 at 16#F0# range 0 .. 31;
      PRBS14 at 16#F4# range 0 .. 31;
      PRAS15 at 16#F8# range 0 .. 31;
      PRBS15 at 16#FC# range 0 .. 31;
      SFR    at 16#110# range 0 .. 511;
   end record;

   --  HSB Matrix
   HMATRIX_Periph : aliased HMATRIX_Peripheral
     with Import, Address => HMATRIX_Base;

end SAMD21_SVD.HMATRIXB;
