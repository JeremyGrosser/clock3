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

package SAMD21_SVD.ADC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control A
   type ADC_CTRLA_Register is record
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

   for ADC_CTRLA_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      RUNSTDBY     at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Reference Selection
   type REFCTRL_REFSELSelect is
     (--  1.0V voltage reference
      INT1V,
      --  1/1.48 VDDANA
      INTVCC0,
      --  1/2 VDDANA (only for VDDANA > 2.0V)
      INTVCC1,
      --  External reference
      AREFA,
      --  External reference
      AREFB)
     with Size => 4;
   for REFCTRL_REFSELSelect use
     (INT1V => 0,
      INTVCC0 => 1,
      INTVCC1 => 2,
      AREFA => 3,
      AREFB => 4);

   --  Reference Control
   type ADC_REFCTRL_Register is record
      --  Reference Selection
      REFSEL       : REFCTRL_REFSELSelect := SAMD21_SVD.ADC.INT1V;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Reference Buffer Offset Compensation Enable
      REFCOMP      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_REFCTRL_Register use record
      REFSEL       at 0 range 0 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      REFCOMP      at 0 range 7 .. 7;
   end record;

   --  Number of Samples to be Collected
   type AVGCTRL_SAMPLENUMSelect is
     (--  1 sample
      Val_1,
      --  2 samples
      Val_2,
      --  4 samples
      Val_4,
      --  8 samples
      Val_8,
      --  16 samples
      Val_16,
      --  32 samples
      Val_32,
      --  64 samples
      Val_64,
      --  128 samples
      Val_128,
      --  256 samples
      Val_256,
      --  512 samples
      Val_512,
      --  1024 samples
      Val_1024)
     with Size => 4;
   for AVGCTRL_SAMPLENUMSelect use
     (Val_1 => 0,
      Val_2 => 1,
      Val_4 => 2,
      Val_8 => 3,
      Val_16 => 4,
      Val_32 => 5,
      Val_64 => 6,
      Val_128 => 7,
      Val_256 => 8,
      Val_512 => 9,
      Val_1024 => 10);

   subtype ADC_AVGCTRL_ADJRES_Field is HAL.UInt3;

   --  Average Control
   type ADC_AVGCTRL_Register is record
      --  Number of Samples to be Collected
      SAMPLENUM    : AVGCTRL_SAMPLENUMSelect := SAMD21_SVD.ADC.Val_1;
      --  Adjusting Result / Division Coefficient
      ADJRES       : ADC_AVGCTRL_ADJRES_Field := 16#0#;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_AVGCTRL_Register use record
      SAMPLENUM    at 0 range 0 .. 3;
      ADJRES       at 0 range 4 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   subtype ADC_SAMPCTRL_SAMPLEN_Field is HAL.UInt6;

   --  Sampling Time Control
   type ADC_SAMPCTRL_Register is record
      --  Sampling Time Length
      SAMPLEN      : ADC_SAMPCTRL_SAMPLEN_Field := 16#0#;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_SAMPCTRL_Register use record
      SAMPLEN      at 0 range 0 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  Conversion Result Resolution
   type CTRLB_RESSELSelect is
     (--  12-bit result
      Val_12BIT,
      --  For averaging mode output
      Val_16BIT,
      --  10-bit result
      Val_10BIT,
      --  8-bit result
      Val_8BIT)
     with Size => 2;
   for CTRLB_RESSELSelect use
     (Val_12BIT => 0,
      Val_16BIT => 1,
      Val_10BIT => 2,
      Val_8BIT => 3);

   --  Prescaler Configuration
   type CTRLB_PRESCALERSelect is
     (--  Peripheral clock divided by 4
      DIV4,
      --  Peripheral clock divided by 8
      DIV8,
      --  Peripheral clock divided by 16
      DIV16,
      --  Peripheral clock divided by 32
      DIV32,
      --  Peripheral clock divided by 64
      DIV64,
      --  Peripheral clock divided by 128
      DIV128,
      --  Peripheral clock divided by 256
      DIV256,
      --  Peripheral clock divided by 512
      DIV512)
     with Size => 3;
   for CTRLB_PRESCALERSelect use
     (DIV4 => 0,
      DIV8 => 1,
      DIV16 => 2,
      DIV32 => 3,
      DIV64 => 4,
      DIV128 => 5,
      DIV256 => 6,
      DIV512 => 7);

   --  Control B
   type ADC_CTRLB_Register is record
      --  Differential Mode
      DIFFMODE       : Boolean := False;
      --  Left-Adjusted Result
      LEFTADJ        : Boolean := False;
      --  Free Running Mode
      FREERUN        : Boolean := False;
      --  Digital Correction Logic Enabled
      CORREN         : Boolean := False;
      --  Conversion Result Resolution
      RESSEL         : CTRLB_RESSELSelect := SAMD21_SVD.ADC.Val_12BIT;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Prescaler Configuration
      PRESCALER      : CTRLB_PRESCALERSelect := SAMD21_SVD.ADC.DIV4;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for ADC_CTRLB_Register use record
      DIFFMODE       at 0 range 0 .. 0;
      LEFTADJ        at 0 range 1 .. 1;
      FREERUN        at 0 range 2 .. 2;
      CORREN         at 0 range 3 .. 3;
      RESSEL         at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      PRESCALER      at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  Window Monitor Mode
   type WINCTRL_WINMODESelect is
     (--  No window mode (default)
      DISABLE,
      --  Mode 1: RESULT > WINLT
      MODE1,
      --  Mode 2: RESULT < WINUT
      MODE2,
      --  Mode 3: WINLT < RESULT < WINUT
      MODE3,
      --  Mode 4: !(WINLT < RESULT < WINUT)
      MODE4)
     with Size => 3;
   for WINCTRL_WINMODESelect use
     (DISABLE => 0,
      MODE1 => 1,
      MODE2 => 2,
      MODE3 => 3,
      MODE4 => 4);

   --  Window Monitor Control
   type ADC_WINCTRL_Register is record
      --  Window Monitor Mode
      WINMODE      : WINCTRL_WINMODESelect := SAMD21_SVD.ADC.DISABLE;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_WINCTRL_Register use record
      WINMODE      at 0 range 0 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Software Trigger
   type ADC_SWTRIG_Register is record
      --  ADC Conversion Flush
      FLUSH        : Boolean := False;
      --  ADC Start Conversion
      START        : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_SWTRIG_Register use record
      FLUSH        at 0 range 0 .. 0;
      START        at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Positive Mux Input Selection
   type INPUTCTRL_MUXPOSSelect is
     (--  ADC AIN0 Pin
      PIN0,
      --  ADC AIN1 Pin
      PIN1,
      --  ADC AIN2 Pin
      PIN2,
      --  ADC AIN3 Pin
      PIN3,
      --  ADC AIN4 Pin
      PIN4,
      --  ADC AIN5 Pin
      PIN5,
      --  ADC AIN6 Pin
      PIN6,
      --  ADC AIN7 Pin
      PIN7,
      --  ADC AIN8 Pin
      PIN8,
      --  ADC AIN9 Pin
      PIN9,
      --  ADC AIN10 Pin
      PIN10,
      --  ADC AIN11 Pin
      PIN11,
      --  ADC AIN12 Pin
      PIN12,
      --  ADC AIN13 Pin
      PIN13,
      --  ADC AIN14 Pin
      PIN14,
      --  ADC AIN15 Pin
      PIN15,
      --  ADC AIN16 Pin
      PIN16,
      --  ADC AIN17 Pin
      PIN17,
      --  ADC AIN18 Pin
      PIN18,
      --  ADC AIN19 Pin
      PIN19,
      --  Temperature Reference
      TEMP,
      --  Bandgap Voltage
      BANDGAP,
      --  1/4 Scaled Core Supply
      SCALEDCOREVCC,
      --  1/4 Scaled I/O Supply
      SCALEDIOVCC,
      --  DAC Output
      DAC)
     with Size => 5;
   for INPUTCTRL_MUXPOSSelect use
     (PIN0 => 0,
      PIN1 => 1,
      PIN2 => 2,
      PIN3 => 3,
      PIN4 => 4,
      PIN5 => 5,
      PIN6 => 6,
      PIN7 => 7,
      PIN8 => 8,
      PIN9 => 9,
      PIN10 => 10,
      PIN11 => 11,
      PIN12 => 12,
      PIN13 => 13,
      PIN14 => 14,
      PIN15 => 15,
      PIN16 => 16,
      PIN17 => 17,
      PIN18 => 18,
      PIN19 => 19,
      TEMP => 24,
      BANDGAP => 25,
      SCALEDCOREVCC => 26,
      SCALEDIOVCC => 27,
      DAC => 28);

   --  Negative Mux Input Selection
   type INPUTCTRL_MUXNEGSelect is
     (--  ADC AIN0 Pin
      PIN0,
      --  ADC AIN1 Pin
      PIN1,
      --  ADC AIN2 Pin
      PIN2,
      --  ADC AIN3 Pin
      PIN3,
      --  ADC AIN4 Pin
      PIN4,
      --  ADC AIN5 Pin
      PIN5,
      --  ADC AIN6 Pin
      PIN6,
      --  ADC AIN7 Pin
      PIN7,
      --  Internal Ground
      GND,
      --  I/O Ground
      IOGND)
     with Size => 5;
   for INPUTCTRL_MUXNEGSelect use
     (PIN0 => 0,
      PIN1 => 1,
      PIN2 => 2,
      PIN3 => 3,
      PIN4 => 4,
      PIN5 => 5,
      PIN6 => 6,
      PIN7 => 7,
      GND => 24,
      IOGND => 25);

   subtype ADC_INPUTCTRL_INPUTSCAN_Field is HAL.UInt4;
   subtype ADC_INPUTCTRL_INPUTOFFSET_Field is HAL.UInt4;

   --  Gain Factor Selection
   type INPUTCTRL_GAINSelect is
     (--  1x
      Val_1X,
      --  2x
      Val_2X,
      --  4x
      Val_4X,
      --  8x
      Val_8X,
      --  16x
      Val_16X,
      --  1/2x
      DIV2)
     with Size => 4;
   for INPUTCTRL_GAINSelect use
     (Val_1X => 0,
      Val_2X => 1,
      Val_4X => 2,
      Val_8X => 3,
      Val_16X => 4,
      DIV2 => 15);

   --  Input Control
   type ADC_INPUTCTRL_Register is record
      --  Positive Mux Input Selection
      MUXPOS         : INPUTCTRL_MUXPOSSelect := SAMD21_SVD.ADC.PIN0;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Negative Mux Input Selection
      MUXNEG         : INPUTCTRL_MUXNEGSelect := SAMD21_SVD.ADC.PIN0;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  Number of Input Channels Included in Scan
      INPUTSCAN      : ADC_INPUTCTRL_INPUTSCAN_Field := 16#0#;
      --  Positive Mux Setting Offset
      INPUTOFFSET    : ADC_INPUTCTRL_INPUTOFFSET_Field := 16#0#;
      --  Gain Factor Selection
      GAIN           : INPUTCTRL_GAINSelect := SAMD21_SVD.ADC.Val_1X;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ADC_INPUTCTRL_Register use record
      MUXPOS         at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      MUXNEG         at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      INPUTSCAN      at 0 range 16 .. 19;
      INPUTOFFSET    at 0 range 20 .. 23;
      GAIN           at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  Event Control
   type ADC_EVCTRL_Register is record
      --  Start Conversion Event In
      STARTEI      : Boolean := False;
      --  Synchronization Event In
      SYNCEI       : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  Result Ready Event Out
      RESRDYEO     : Boolean := False;
      --  Window Monitor Event Out
      WINMONEO     : Boolean := False;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_EVCTRL_Register use record
      STARTEI      at 0 range 0 .. 0;
      SYNCEI       at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      RESRDYEO     at 0 range 4 .. 4;
      WINMONEO     at 0 range 5 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  Interrupt Enable Clear
   type ADC_INTENCLR_Register is record
      --  Result Ready Interrupt Enable
      RESRDY       : Boolean := False;
      --  Overrun Interrupt Enable
      OVERRUN      : Boolean := False;
      --  Window Monitor Interrupt Enable
      WINMON       : Boolean := False;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_INTENCLR_Register use record
      RESRDY       at 0 range 0 .. 0;
      OVERRUN      at 0 range 1 .. 1;
      WINMON       at 0 range 2 .. 2;
      SYNCRDY      at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Interrupt Enable Set
   type ADC_INTENSET_Register is record
      --  Result Ready Interrupt Enable
      RESRDY       : Boolean := False;
      --  Overrun Interrupt Enable
      OVERRUN      : Boolean := False;
      --  Window Monitor Interrupt Enable
      WINMON       : Boolean := False;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_INTENSET_Register use record
      RESRDY       at 0 range 0 .. 0;
      OVERRUN      at 0 range 1 .. 1;
      WINMON       at 0 range 2 .. 2;
      SYNCRDY      at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Interrupt Flag Status and Clear
   type ADC_INTFLAG_Register is record
      --  Result Ready
      RESRDY       : Boolean := False;
      --  Overrun
      OVERRUN      : Boolean := False;
      --  Window Monitor
      WINMON       : Boolean := False;
      --  Synchronization Ready
      SYNCRDY      : Boolean := False;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_INTFLAG_Register use record
      RESRDY       at 0 range 0 .. 0;
      OVERRUN      at 0 range 1 .. 1;
      WINMON       at 0 range 2 .. 2;
      SYNCRDY      at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Status
   type ADC_STATUS_Register is record
      --  unspecified
      Reserved_0_6 : HAL.UInt7;
      --  Read-only. Synchronization Busy
      SYNCBUSY     : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_STATUS_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      SYNCBUSY     at 0 range 7 .. 7;
   end record;

   subtype ADC_GAINCORR_GAINCORR_Field is HAL.UInt12;

   --  Gain Correction
   type ADC_GAINCORR_Register is record
      --  Gain Correction Value
      GAINCORR       : ADC_GAINCORR_GAINCORR_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for ADC_GAINCORR_Register use record
      GAINCORR       at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype ADC_OFFSETCORR_OFFSETCORR_Field is HAL.UInt12;

   --  Offset Correction
   type ADC_OFFSETCORR_Register is record
      --  Offset Correction Value
      OFFSETCORR     : ADC_OFFSETCORR_OFFSETCORR_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for ADC_OFFSETCORR_Register use record
      OFFSETCORR     at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype ADC_CALIB_LINEARITY_CAL_Field is HAL.UInt8;
   subtype ADC_CALIB_BIAS_CAL_Field is HAL.UInt3;

   --  Calibration
   type ADC_CALIB_Register is record
      --  Linearity Calibration Value
      LINEARITY_CAL  : ADC_CALIB_LINEARITY_CAL_Field := 16#0#;
      --  Bias Calibration Value
      BIAS_CAL       : ADC_CALIB_BIAS_CAL_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for ADC_CALIB_Register use record
      LINEARITY_CAL  at 0 range 0 .. 7;
      BIAS_CAL       at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  Debug Control
   type ADC_DBGCTRL_Register is record
      --  Debug Run
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC_DBGCTRL_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Analog Digital Converter
   type ADC_Peripheral is record
      --  Control A
      CTRLA      : aliased ADC_CTRLA_Register;
      --  Reference Control
      REFCTRL    : aliased ADC_REFCTRL_Register;
      --  Average Control
      AVGCTRL    : aliased ADC_AVGCTRL_Register;
      --  Sampling Time Control
      SAMPCTRL   : aliased ADC_SAMPCTRL_Register;
      --  Control B
      CTRLB      : aliased ADC_CTRLB_Register;
      --  Window Monitor Control
      WINCTRL    : aliased ADC_WINCTRL_Register;
      --  Software Trigger
      SWTRIG     : aliased ADC_SWTRIG_Register;
      --  Input Control
      INPUTCTRL  : aliased ADC_INPUTCTRL_Register;
      --  Event Control
      EVCTRL     : aliased ADC_EVCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR   : aliased ADC_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET   : aliased ADC_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG    : aliased ADC_INTFLAG_Register;
      --  Status
      STATUS     : aliased ADC_STATUS_Register;
      --  Result
      RESULT     : aliased HAL.UInt16;
      --  Window Monitor Lower Threshold
      WINLT      : aliased HAL.UInt16;
      --  Window Monitor Upper Threshold
      WINUT      : aliased HAL.UInt16;
      --  Gain Correction
      GAINCORR   : aliased ADC_GAINCORR_Register;
      --  Offset Correction
      OFFSETCORR : aliased ADC_OFFSETCORR_Register;
      --  Calibration
      CALIB      : aliased ADC_CALIB_Register;
      --  Debug Control
      DBGCTRL    : aliased ADC_DBGCTRL_Register;
   end record
     with Volatile;

   for ADC_Peripheral use record
      CTRLA      at 16#0# range 0 .. 7;
      REFCTRL    at 16#1# range 0 .. 7;
      AVGCTRL    at 16#2# range 0 .. 7;
      SAMPCTRL   at 16#3# range 0 .. 7;
      CTRLB      at 16#4# range 0 .. 15;
      WINCTRL    at 16#8# range 0 .. 7;
      SWTRIG     at 16#C# range 0 .. 7;
      INPUTCTRL  at 16#10# range 0 .. 31;
      EVCTRL     at 16#14# range 0 .. 7;
      INTENCLR   at 16#16# range 0 .. 7;
      INTENSET   at 16#17# range 0 .. 7;
      INTFLAG    at 16#18# range 0 .. 7;
      STATUS     at 16#19# range 0 .. 7;
      RESULT     at 16#1A# range 0 .. 15;
      WINLT      at 16#1C# range 0 .. 15;
      WINUT      at 16#20# range 0 .. 15;
      GAINCORR   at 16#24# range 0 .. 15;
      OFFSETCORR at 16#26# range 0 .. 15;
      CALIB      at 16#28# range 0 .. 15;
      DBGCTRL    at 16#2A# range 0 .. 7;
   end record;

   --  Analog Digital Converter
   ADC_Periph : aliased ADC_Peripheral
     with Import, Address => ADC_Base;

end SAMD21_SVD.ADC;
