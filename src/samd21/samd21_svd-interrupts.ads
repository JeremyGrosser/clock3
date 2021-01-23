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

--  Definition of the device's interrupts
package SAMD21_SVD.Interrupts is

   ----------------
   -- Interrupts --
   ----------------

   PM_Interrupt       : constant := 0;
   SYSCTRL_Interrupt  : constant := 1;
   WDT_Interrupt      : constant := 2;
   RTC_Interrupt      : constant := 3;
   EIC_Interrupt      : constant := 4;
   NVMCTRL_Interrupt  : constant := 5;
   DMAC_Interrupt     : constant := 6;
   USB_Interrupt      : constant := 7;
   EVSYS_Interrupt    : constant := 8;
   SERCOM0_Interrupt  : constant := 9;
   SERCOM1_Interrupt  : constant := 10;
   SERCOM2_Interrupt  : constant := 11;
   SERCOM3_Interrupt  : constant := 12;
   SERCOM4_Interrupt  : constant := 13;
   SERCOM5_Interrupt  : constant := 14;
   TCC0_Interrupt     : constant := 15;
   TCC1_Interrupt     : constant := 16;
   TCC2_Interrupt     : constant := 17;
   TC3_Interrupt      : constant := 18;
   TC4_Interrupt      : constant := 19;
   TC5_Interrupt      : constant := 20;
   ADC_Interrupt      : constant := 23;
   AC_Interrupt       : constant := 24;
   DAC_Interrupt      : constant := 25;
   I2S_Interrupt      : constant := 27;

end SAMD21_SVD.Interrupts;
