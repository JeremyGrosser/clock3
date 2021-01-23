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

package SAMD21_SVD.USB is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------------------
   -- UsbDevice cluster's Registers --
   -----------------------------------

   --  Operating Mode
   type CTRLA_MODESelect is
     (--  Device Mode
      DEVICE,
      --  Host Mode
      HOST)
     with Size => 1;
   for CTRLA_MODESelect use
     (DEVICE => 0,
      HOST => 1);

   --  Control A
   type USB_CTRLA_USB_DEVICE_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  Run in Standby Mode
      RUNSTDBY     : Boolean := False;
      --  unspecified
      Reserved_3_6 : HAL.UInt4 := 16#0#;
      --  Operating Mode
      MODE         : CTRLA_MODESelect := SAMD21_SVD.USB.DEVICE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_CTRLA_USB_DEVICE_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      RUNSTDBY     at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      MODE         at 0 range 7 .. 7;
   end record;

   --  Synchronization Busy
   type USB_SYNCBUSY_USB_DEVICE_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST        : Boolean;
      --  Read-only. Enable Synchronization Busy
      ENABLE       : Boolean;
      --  unspecified
      Reserved_2_7 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_SYNCBUSY_USB_DEVICE_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Configuration Quality of Service
   type QOSCTRL_CQOSSelect is
     (--  Background (no sensitive operation)
      DISABLE,
      --  Sensitive Bandwidth
      LOW,
      --  Sensitive Latency
      MEDIUM,
      --  Critical Latency
      HIGH)
     with Size => 2;
   for QOSCTRL_CQOSSelect use
     (DISABLE => 0,
      LOW => 1,
      MEDIUM => 2,
      HIGH => 3);

   --  Data Quality of Service
   type QOSCTRL_DQOSSelect is
     (--  Background (no sensitive operation)
      DISABLE,
      --  Sensitive Bandwidth
      LOW,
      --  Sensitive Latency
      MEDIUM,
      --  Critical Latency
      HIGH)
     with Size => 2;
   for QOSCTRL_DQOSSelect use
     (DISABLE => 0,
      LOW => 1,
      MEDIUM => 2,
      HIGH => 3);

   --  USB Quality Of Service
   type USB_QOSCTRL_USB_DEVICE_Register is record
      --  Configuration Quality of Service
      CQOS         : QOSCTRL_CQOSSelect := SAMD21_SVD.USB.LOW;
      --  Data Quality of Service
      DQOS         : QOSCTRL_DQOSSelect := SAMD21_SVD.USB.LOW;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_QOSCTRL_USB_DEVICE_Register use record
      CQOS         at 0 range 0 .. 1;
      DQOS         at 0 range 2 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Speed Configuration
   type CTRLB_SPDCONFSelect is
     (--  FS : Full Speed
      FS,
      --  LS : Low Speed
      LS,
      --  HS : High Speed capable
      HS,
      --  HSTM: High Speed Test Mode (force high-speed mode for test mode)
      HSTM)
     with Size => 2;
   for CTRLB_SPDCONFSelect use
     (FS => 0,
      LS => 1,
      HS => 2,
      HSTM => 3);

   --  Link Power Management Handshake
   type CTRLB_LPMHDSKSelect is
     (--  No handshake. LPM is not supported
      NO,
      --  ACK
      ACK,
      --  NYET
      NYET,
      --  STALL
      STALL)
     with Size => 2;
   for CTRLB_LPMHDSKSelect use
     (NO => 0,
      ACK => 1,
      NYET => 2,
      STALL => 3);

   --  DEVICE Control B
   type USB_CTRLB_USB_DEVICE_Register is record
      --  Detach
      DETACH         : Boolean := True;
      --  Upstream Resume
      UPRSM          : Boolean := False;
      --  Speed Configuration
      SPDCONF        : CTRLB_SPDCONFSelect := SAMD21_SVD.USB.FS;
      --  No Reply
      NREPLY         : Boolean := False;
      --  Test mode J
      TSTJ           : Boolean := False;
      --  Test mode K
      TSTK           : Boolean := False;
      --  Test packet mode
      TSTPCKT        : Boolean := False;
      --  Specific Operational Mode
      OPMODE2        : Boolean := False;
      --  Global NAK
      GNAK           : Boolean := False;
      --  Link Power Management Handshake
      LPMHDSK        : CTRLB_LPMHDSKSelect := SAMD21_SVD.USB.NO;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_CTRLB_USB_DEVICE_Register use record
      DETACH         at 0 range 0 .. 0;
      UPRSM          at 0 range 1 .. 1;
      SPDCONF        at 0 range 2 .. 3;
      NREPLY         at 0 range 4 .. 4;
      TSTJ           at 0 range 5 .. 5;
      TSTK           at 0 range 6 .. 6;
      TSTPCKT        at 0 range 7 .. 7;
      OPMODE2        at 0 range 8 .. 8;
      GNAK           at 0 range 9 .. 9;
      LPMHDSK        at 0 range 10 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype USB_DADD_USB_DEVICE_DADD_Field is HAL.UInt7;

   --  DEVICE Device Address
   type USB_DADD_USB_DEVICE_Register is record
      --  Device Address
      DADD  : USB_DADD_USB_DEVICE_DADD_Field := 16#0#;
      --  Device Address Enable
      ADDEN : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_DADD_USB_DEVICE_Register use record
      DADD  at 0 range 0 .. 6;
      ADDEN at 0 range 7 .. 7;
   end record;

   --  Speed Status
   type STATUS_SPEEDSelect is
     (--  Full-speed mode
      FS,
      --  High-speed mode
      HS,
      --  Low-speed mode
      LS)
     with Size => 2;
   for STATUS_SPEEDSelect use
     (FS => 0,
      HS => 1,
      LS => 2);

   --  USB Line State Status
   type STATUS_LINESTATESelect is
     (--  SE0/RESET
      Val_0,
      --  FS-J or LS-K State
      Val_1,
      --  FS-K or LS-J State
      Val_2)
     with Size => 2;
   for STATUS_LINESTATESelect use
     (Val_0 => 0,
      Val_1 => 1,
      Val_2 => 2);

   --  DEVICE Status
   type USB_STATUS_USB_DEVICE_Register is record
      --  unspecified
      Reserved_0_1 : HAL.UInt2;
      --  Read-only. Speed Status
      SPEED        : STATUS_SPEEDSelect;
      --  unspecified
      Reserved_4_5 : HAL.UInt2;
      --  Read-only. USB Line State Status
      LINESTATE    : STATUS_LINESTATESelect;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_STATUS_USB_DEVICE_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      SPEED        at 0 range 2 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      LINESTATE    at 0 range 6 .. 7;
   end record;

   --  Fine State Machine Status
   type FSMSTATUS_FSMSTATESelect is
     (--  OFF (L3). It corresponds to the powered-off, disconnected, and disabled
--  state
      OFF,
      --  ON (L0). It corresponds to the Idle and Active states
      ON,
      --  SUSPEND (L2)
      SUSPEND,
      --  SLEEP (L1)
      SLEEP,
      --  DNRESUME. Down Stream Resume.
      DNRESUME,
      --  UPRESUME. Up Stream Resume.
      UPRESUME,
      --  RESET. USB lines Reset.
      RESET)
     with Size => 7;
   for FSMSTATUS_FSMSTATESelect use
     (OFF => 1,
      ON => 2,
      SUSPEND => 4,
      SLEEP => 8,
      DNRESUME => 16,
      UPRESUME => 32,
      RESET => 64);

   --  Finite State Machine Status
   type USB_FSMSTATUS_USB_DEVICE_Register is record
      --  Read-only. Fine State Machine Status
      FSMSTATE     : FSMSTATUS_FSMSTATESelect;
      --  unspecified
      Reserved_7_7 : HAL.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_FSMSTATUS_USB_DEVICE_Register use record
      FSMSTATE     at 0 range 0 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   subtype USB_FNUM_USB_DEVICE_MFNUM_Field is HAL.UInt3;
   subtype USB_FNUM_USB_DEVICE_FNUM_Field is HAL.UInt11;

   --  DEVICE Device Frame Number
   type USB_FNUM_USB_DEVICE_Register is record
      --  Read-only. Micro Frame Number
      MFNUM          : USB_FNUM_USB_DEVICE_MFNUM_Field;
      --  Read-only. Frame Number
      FNUM           : USB_FNUM_USB_DEVICE_FNUM_Field;
      --  unspecified
      Reserved_14_14 : HAL.Bit;
      --  Read-only. Frame Number CRC Error
      FNCERR         : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_FNUM_USB_DEVICE_Register use record
      MFNUM          at 0 range 0 .. 2;
      FNUM           at 0 range 3 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      FNCERR         at 0 range 15 .. 15;
   end record;

   --  DEVICE Device Interrupt Enable Clear
   type USB_INTENCLR_USB_DEVICE_Register is record
      --  Suspend Interrupt Enable
      SUSPEND        : Boolean := False;
      --  Micro Start of Frame Interrupt Enable in High Speed Mode
      MSOF           : Boolean := False;
      --  Start Of Frame Interrupt Enable
      SOF            : Boolean := False;
      --  End of Reset Interrupt Enable
      EORST          : Boolean := False;
      --  Wake Up Interrupt Enable
      WAKEUP         : Boolean := False;
      --  End Of Resume Interrupt Enable
      EORSM          : Boolean := False;
      --  Upstream Resume Interrupt Enable
      UPRSM          : Boolean := False;
      --  Ram Access Interrupt Enable
      RAMACER        : Boolean := False;
      --  Link Power Management Not Yet Interrupt Enable
      LPMNYET        : Boolean := False;
      --  Link Power Management Suspend Interrupt Enable
      LPMSUSP        : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTENCLR_USB_DEVICE_Register use record
      SUSPEND        at 0 range 0 .. 0;
      MSOF           at 0 range 1 .. 1;
      SOF            at 0 range 2 .. 2;
      EORST          at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      EORSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      LPMNYET        at 0 range 8 .. 8;
      LPMSUSP        at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  DEVICE Device Interrupt Enable Set
   type USB_INTENSET_USB_DEVICE_Register is record
      --  Suspend Interrupt Enable
      SUSPEND        : Boolean := False;
      --  Micro Start of Frame Interrupt Enable in High Speed Mode
      MSOF           : Boolean := False;
      --  Start Of Frame Interrupt Enable
      SOF            : Boolean := False;
      --  End of Reset Interrupt Enable
      EORST          : Boolean := False;
      --  Wake Up Interrupt Enable
      WAKEUP         : Boolean := False;
      --  End Of Resume Interrupt Enable
      EORSM          : Boolean := False;
      --  Upstream Resume Interrupt Enable
      UPRSM          : Boolean := False;
      --  Ram Access Interrupt Enable
      RAMACER        : Boolean := False;
      --  Link Power Management Not Yet Interrupt Enable
      LPMNYET        : Boolean := False;
      --  Link Power Management Suspend Interrupt Enable
      LPMSUSP        : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTENSET_USB_DEVICE_Register use record
      SUSPEND        at 0 range 0 .. 0;
      MSOF           at 0 range 1 .. 1;
      SOF            at 0 range 2 .. 2;
      EORST          at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      EORSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      LPMNYET        at 0 range 8 .. 8;
      LPMSUSP        at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  DEVICE Device Interrupt Flag
   type USB_INTFLAG_USB_DEVICE_Register is record
      --  Suspend
      SUSPEND        : Boolean := False;
      --  Micro Start of Frame in High Speed Mode
      MSOF           : Boolean := False;
      --  Start Of Frame
      SOF            : Boolean := False;
      --  End of Reset
      EORST          : Boolean := False;
      --  Wake Up
      WAKEUP         : Boolean := False;
      --  End Of Resume
      EORSM          : Boolean := False;
      --  Upstream Resume
      UPRSM          : Boolean := False;
      --  Ram Access
      RAMACER        : Boolean := False;
      --  Link Power Management Not Yet
      LPMNYET        : Boolean := False;
      --  Link Power Management Suspend
      LPMSUSP        : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTFLAG_USB_DEVICE_Register use record
      SUSPEND        at 0 range 0 .. 0;
      MSOF           at 0 range 1 .. 1;
      SOF            at 0 range 2 .. 2;
      EORST          at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      EORSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      LPMNYET        at 0 range 8 .. 8;
      LPMSUSP        at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  USB_EPINTSMRY_USB_DEVICE_EPINT array
   type USB_EPINTSMRY_USB_DEVICE_EPINT_Field_Array is array (0 .. 7)
     of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for USB_EPINTSMRY_USB_DEVICE_EPINT
   type USB_EPINTSMRY_USB_DEVICE_EPINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EPINT as a value
            Val : HAL.UInt8;
         when True =>
            --  EPINT as an array
            Arr : USB_EPINTSMRY_USB_DEVICE_EPINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for USB_EPINTSMRY_USB_DEVICE_EPINT_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  DEVICE End Point Interrupt Summary
   type USB_EPINTSMRY_USB_DEVICE_Register is record
      --  Read-only. End Point 0 Interrupt
      EPINT         : USB_EPINTSMRY_USB_DEVICE_EPINT_Field;
      --  unspecified
      Reserved_8_15 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_EPINTSMRY_USB_DEVICE_Register use record
      EPINT         at 0 range 0 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   subtype USB_PADCAL_USB_DEVICE_TRANSP_Field is HAL.UInt5;
   subtype USB_PADCAL_USB_DEVICE_TRANSN_Field is HAL.UInt5;
   subtype USB_PADCAL_USB_DEVICE_TRIM_Field is HAL.UInt3;

   --  USB PAD Calibration
   type USB_PADCAL_USB_DEVICE_Register is record
      --  USB Pad Transp calibration
      TRANSP         : USB_PADCAL_USB_DEVICE_TRANSP_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  USB Pad Transn calibration
      TRANSN         : USB_PADCAL_USB_DEVICE_TRANSN_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  USB Pad Trim calibration
      TRIM           : USB_PADCAL_USB_DEVICE_TRIM_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_PADCAL_USB_DEVICE_Register use record
      TRANSP         at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TRANSN         at 0 range 6 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      TRIM           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   subtype EPCFG_EPTYPE0_Field is HAL.UInt3;
   subtype EPCFG_EPTYPE1_Field is HAL.UInt3;

   --  DEVICE End Point Configuration
   type EPCFG_Register is record
      --  End Point Type0
      EPTYPE0      : EPCFG_EPTYPE0_Field := 16#0#;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  End Point Type1
      EPTYPE1      : EPCFG_EPTYPE1_Field := 16#0#;
      --  NYET Token Disable
      NYETDIS      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EPCFG_Register use record
      EPTYPE0      at 0 range 0 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      EPTYPE1      at 0 range 4 .. 6;
      NYETDIS      at 0 range 7 .. 7;
   end record;

   --  EPSTATUSCLR_STALLRQ array
   type EPSTATUSCLR_STALLRQ_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPSTATUSCLR_STALLRQ
   type EPSTATUSCLR_STALLRQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STALLRQ as a value
            Val : HAL.UInt2;
         when True =>
            --  STALLRQ as an array
            Arr : EPSTATUSCLR_STALLRQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPSTATUSCLR_STALLRQ_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DEVICE End Point Pipe Status Clear
   type EPSTATUSCLR_Register is record
      --  Write-only. Data Toggle OUT Clear
      DTGLOUT      : Boolean := False;
      --  Write-only. Data Toggle IN Clear
      DTGLIN       : Boolean := False;
      --  Write-only. Curren Bank Clear
      CURBK        : Boolean := False;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  Write-only. Stall 0 Request Clear
      STALLRQ      : EPSTATUSCLR_STALLRQ_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Write-only. Bank 0 Ready Clear
      BK0RDY       : Boolean := False;
      --  Write-only. Bank 1 Ready Clear
      BK1RDY       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EPSTATUSCLR_Register use record
      DTGLOUT      at 0 range 0 .. 0;
      DTGLIN       at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      STALLRQ      at 0 range 4 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  EPSTATUSSET_STALLRQ array
   type EPSTATUSSET_STALLRQ_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPSTATUSSET_STALLRQ
   type EPSTATUSSET_STALLRQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STALLRQ as a value
            Val : HAL.UInt2;
         when True =>
            --  STALLRQ as an array
            Arr : EPSTATUSSET_STALLRQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPSTATUSSET_STALLRQ_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DEVICE End Point Pipe Status Set
   type EPSTATUSSET_Register is record
      --  Write-only. Data Toggle OUT Set
      DTGLOUT      : Boolean := False;
      --  Write-only. Data Toggle IN Set
      DTGLIN       : Boolean := False;
      --  Write-only. Current Bank Set
      CURBK        : Boolean := False;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  Write-only. Stall 0 Request Set
      STALLRQ      : EPSTATUSSET_STALLRQ_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Write-only. Bank 0 Ready Set
      BK0RDY       : Boolean := False;
      --  Write-only. Bank 1 Ready Set
      BK1RDY       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EPSTATUSSET_Register use record
      DTGLOUT      at 0 range 0 .. 0;
      DTGLIN       at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      STALLRQ      at 0 range 4 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  EPSTATUS_STALLRQ array
   type EPSTATUS_STALLRQ_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPSTATUS_STALLRQ
   type EPSTATUS_STALLRQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STALLRQ as a value
            Val : HAL.UInt2;
         when True =>
            --  STALLRQ as an array
            Arr : EPSTATUS_STALLRQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPSTATUS_STALLRQ_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DEVICE End Point Pipe Status
   type EPSTATUS_Register is record
      --  Read-only. Data Toggle Out
      DTGLOUT      : Boolean;
      --  Read-only. Data Toggle In
      DTGLIN       : Boolean;
      --  Read-only. Current Bank
      CURBK        : Boolean;
      --  unspecified
      Reserved_3_3 : HAL.Bit;
      --  Read-only. Stall 0 Request
      STALLRQ      : EPSTATUS_STALLRQ_Field;
      --  Read-only. Bank 0 ready
      BK0RDY       : Boolean;
      --  Read-only. Bank 1 ready
      BK1RDY       : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EPSTATUS_Register use record
      DTGLOUT      at 0 range 0 .. 0;
      DTGLIN       at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      STALLRQ      at 0 range 4 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  EPINTFLAG_TRCPT array
   type EPINTFLAG_TRCPT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPINTFLAG_TRCPT
   type EPINTFLAG_TRCPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRCPT as a value
            Val : HAL.UInt2;
         when True =>
            --  TRCPT as an array
            Arr : EPINTFLAG_TRCPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPINTFLAG_TRCPT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  EPINTFLAG_TRFAIL array
   type EPINTFLAG_TRFAIL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPINTFLAG_TRFAIL
   type EPINTFLAG_TRFAIL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRFAIL as a value
            Val : HAL.UInt2;
         when True =>
            --  TRFAIL as an array
            Arr : EPINTFLAG_TRFAIL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPINTFLAG_TRFAIL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  EPINTFLAG_STALL array
   type EPINTFLAG_STALL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPINTFLAG_STALL
   type EPINTFLAG_STALL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STALL as a value
            Val : HAL.UInt2;
         when True =>
            --  STALL as an array
            Arr : EPINTFLAG_STALL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPINTFLAG_STALL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DEVICE End Point Interrupt Flag
   type EPINTFLAG_Register is record
      --  Transfer Complete 0
      TRCPT        : EPINTFLAG_TRCPT_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Error Flow 0
      TRFAIL       : EPINTFLAG_TRFAIL_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Received Setup
      RXSTP        : Boolean := False;
      --  Stall 0 In/out
      STALL        : EPINTFLAG_STALL_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EPINTFLAG_Register use record
      TRCPT        at 0 range 0 .. 1;
      TRFAIL       at 0 range 2 .. 3;
      RXSTP        at 0 range 4 .. 4;
      STALL        at 0 range 5 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   --  EPINTENCLR_TRCPT array
   type EPINTENCLR_TRCPT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPINTENCLR_TRCPT
   type EPINTENCLR_TRCPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRCPT as a value
            Val : HAL.UInt2;
         when True =>
            --  TRCPT as an array
            Arr : EPINTENCLR_TRCPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPINTENCLR_TRCPT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  EPINTENCLR_TRFAIL array
   type EPINTENCLR_TRFAIL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPINTENCLR_TRFAIL
   type EPINTENCLR_TRFAIL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRFAIL as a value
            Val : HAL.UInt2;
         when True =>
            --  TRFAIL as an array
            Arr : EPINTENCLR_TRFAIL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPINTENCLR_TRFAIL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  EPINTENCLR_STALL array
   type EPINTENCLR_STALL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPINTENCLR_STALL
   type EPINTENCLR_STALL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STALL as a value
            Val : HAL.UInt2;
         when True =>
            --  STALL as an array
            Arr : EPINTENCLR_STALL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPINTENCLR_STALL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DEVICE End Point Interrupt Clear Flag
   type EPINTENCLR_Register is record
      --  Transfer Complete 0 Interrupt Disable
      TRCPT        : EPINTENCLR_TRCPT_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Error Flow 0 Interrupt Disable
      TRFAIL       : EPINTENCLR_TRFAIL_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Received Setup Interrupt Disable
      RXSTP        : Boolean := False;
      --  Stall 0 In/Out Interrupt Disable
      STALL        : EPINTENCLR_STALL_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EPINTENCLR_Register use record
      TRCPT        at 0 range 0 .. 1;
      TRFAIL       at 0 range 2 .. 3;
      RXSTP        at 0 range 4 .. 4;
      STALL        at 0 range 5 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   --  EPINTENSET_TRCPT array
   type EPINTENSET_TRCPT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPINTENSET_TRCPT
   type EPINTENSET_TRCPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRCPT as a value
            Val : HAL.UInt2;
         when True =>
            --  TRCPT as an array
            Arr : EPINTENSET_TRCPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPINTENSET_TRCPT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  EPINTENSET_TRFAIL array
   type EPINTENSET_TRFAIL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPINTENSET_TRFAIL
   type EPINTENSET_TRFAIL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRFAIL as a value
            Val : HAL.UInt2;
         when True =>
            --  TRFAIL as an array
            Arr : EPINTENSET_TRFAIL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPINTENSET_TRFAIL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  EPINTENSET_STALL array
   type EPINTENSET_STALL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for EPINTENSET_STALL
   type EPINTENSET_STALL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STALL as a value
            Val : HAL.UInt2;
         when True =>
            --  STALL as an array
            Arr : EPINTENSET_STALL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EPINTENSET_STALL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DEVICE End Point Interrupt Set Flag
   type EPINTENSET_Register is record
      --  Transfer Complete 0 Interrupt Enable
      TRCPT        : EPINTENSET_TRCPT_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Error Flow 0 Interrupt Enable
      TRFAIL       : EPINTENSET_TRFAIL_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Received Setup Interrupt Enable
      RXSTP        : Boolean := False;
      --  Stall 0 In/out Interrupt enable
      STALL        : EPINTENSET_STALL_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EPINTENSET_Register use record
      TRCPT        at 0 range 0 .. 1;
      TRFAIL       at 0 range 2 .. 3;
      RXSTP        at 0 range 4 .. 4;
      STALL        at 0 range 5 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   --  USB is Device
   type UsbDevice_Cluster is record
      --  Control A
      CTRLA        : aliased USB_CTRLA_USB_DEVICE_Register;
      --  Synchronization Busy
      SYNCBUSY     : aliased USB_SYNCBUSY_USB_DEVICE_Register;
      --  USB Quality Of Service
      QOSCTRL      : aliased USB_QOSCTRL_USB_DEVICE_Register;
      --  DEVICE Control B
      CTRLB        : aliased USB_CTRLB_USB_DEVICE_Register;
      --  DEVICE Device Address
      DADD         : aliased USB_DADD_USB_DEVICE_Register;
      --  DEVICE Status
      STATUS       : aliased USB_STATUS_USB_DEVICE_Register;
      --  Finite State Machine Status
      FSMSTATUS    : aliased USB_FSMSTATUS_USB_DEVICE_Register;
      --  DEVICE Device Frame Number
      FNUM         : aliased USB_FNUM_USB_DEVICE_Register;
      --  DEVICE Device Interrupt Enable Clear
      INTENCLR     : aliased USB_INTENCLR_USB_DEVICE_Register;
      --  DEVICE Device Interrupt Enable Set
      INTENSET     : aliased USB_INTENSET_USB_DEVICE_Register;
      --  DEVICE Device Interrupt Flag
      INTFLAG      : aliased USB_INTFLAG_USB_DEVICE_Register;
      --  DEVICE End Point Interrupt Summary
      EPINTSMRY    : aliased USB_EPINTSMRY_USB_DEVICE_Register;
      --  Descriptor Address
      DESCADD      : aliased HAL.UInt32;
      --  USB PAD Calibration
      PADCAL       : aliased USB_PADCAL_USB_DEVICE_Register;
      --  DEVICE End Point Configuration
      EPCFG0       : aliased EPCFG_Register;
      --  DEVICE End Point Pipe Status Clear
      EPSTATUSCLR0 : aliased EPSTATUSCLR_Register;
      --  DEVICE End Point Pipe Status Set
      EPSTATUSSET0 : aliased EPSTATUSSET_Register;
      --  DEVICE End Point Pipe Status
      EPSTATUS0    : aliased EPSTATUS_Register;
      --  DEVICE End Point Interrupt Flag
      EPINTFLAG0   : aliased EPINTFLAG_Register;
      --  DEVICE End Point Interrupt Clear Flag
      EPINTENCLR0  : aliased EPINTENCLR_Register;
      --  DEVICE End Point Interrupt Set Flag
      EPINTENSET0  : aliased EPINTENSET_Register;
      --  DEVICE End Point Configuration
      EPCFG1       : aliased EPCFG_Register;
      --  DEVICE End Point Pipe Status Clear
      EPSTATUSCLR1 : aliased EPSTATUSCLR_Register;
      --  DEVICE End Point Pipe Status Set
      EPSTATUSSET1 : aliased EPSTATUSSET_Register;
      --  DEVICE End Point Pipe Status
      EPSTATUS1    : aliased EPSTATUS_Register;
      --  DEVICE End Point Interrupt Flag
      EPINTFLAG1   : aliased EPINTFLAG_Register;
      --  DEVICE End Point Interrupt Clear Flag
      EPINTENCLR1  : aliased EPINTENCLR_Register;
      --  DEVICE End Point Interrupt Set Flag
      EPINTENSET1  : aliased EPINTENSET_Register;
      --  DEVICE End Point Configuration
      EPCFG2       : aliased EPCFG_Register;
      --  DEVICE End Point Pipe Status Clear
      EPSTATUSCLR2 : aliased EPSTATUSCLR_Register;
      --  DEVICE End Point Pipe Status Set
      EPSTATUSSET2 : aliased EPSTATUSSET_Register;
      --  DEVICE End Point Pipe Status
      EPSTATUS2    : aliased EPSTATUS_Register;
      --  DEVICE End Point Interrupt Flag
      EPINTFLAG2   : aliased EPINTFLAG_Register;
      --  DEVICE End Point Interrupt Clear Flag
      EPINTENCLR2  : aliased EPINTENCLR_Register;
      --  DEVICE End Point Interrupt Set Flag
      EPINTENSET2  : aliased EPINTENSET_Register;
      --  DEVICE End Point Configuration
      EPCFG3       : aliased EPCFG_Register;
      --  DEVICE End Point Pipe Status Clear
      EPSTATUSCLR3 : aliased EPSTATUSCLR_Register;
      --  DEVICE End Point Pipe Status Set
      EPSTATUSSET3 : aliased EPSTATUSSET_Register;
      --  DEVICE End Point Pipe Status
      EPSTATUS3    : aliased EPSTATUS_Register;
      --  DEVICE End Point Interrupt Flag
      EPINTFLAG3   : aliased EPINTFLAG_Register;
      --  DEVICE End Point Interrupt Clear Flag
      EPINTENCLR3  : aliased EPINTENCLR_Register;
      --  DEVICE End Point Interrupt Set Flag
      EPINTENSET3  : aliased EPINTENSET_Register;
      --  DEVICE End Point Configuration
      EPCFG4       : aliased EPCFG_Register;
      --  DEVICE End Point Pipe Status Clear
      EPSTATUSCLR4 : aliased EPSTATUSCLR_Register;
      --  DEVICE End Point Pipe Status Set
      EPSTATUSSET4 : aliased EPSTATUSSET_Register;
      --  DEVICE End Point Pipe Status
      EPSTATUS4    : aliased EPSTATUS_Register;
      --  DEVICE End Point Interrupt Flag
      EPINTFLAG4   : aliased EPINTFLAG_Register;
      --  DEVICE End Point Interrupt Clear Flag
      EPINTENCLR4  : aliased EPINTENCLR_Register;
      --  DEVICE End Point Interrupt Set Flag
      EPINTENSET4  : aliased EPINTENSET_Register;
      --  DEVICE End Point Configuration
      EPCFG5       : aliased EPCFG_Register;
      --  DEVICE End Point Pipe Status Clear
      EPSTATUSCLR5 : aliased EPSTATUSCLR_Register;
      --  DEVICE End Point Pipe Status Set
      EPSTATUSSET5 : aliased EPSTATUSSET_Register;
      --  DEVICE End Point Pipe Status
      EPSTATUS5    : aliased EPSTATUS_Register;
      --  DEVICE End Point Interrupt Flag
      EPINTFLAG5   : aliased EPINTFLAG_Register;
      --  DEVICE End Point Interrupt Clear Flag
      EPINTENCLR5  : aliased EPINTENCLR_Register;
      --  DEVICE End Point Interrupt Set Flag
      EPINTENSET5  : aliased EPINTENSET_Register;
      --  DEVICE End Point Configuration
      EPCFG6       : aliased EPCFG_Register;
      --  DEVICE End Point Pipe Status Clear
      EPSTATUSCLR6 : aliased EPSTATUSCLR_Register;
      --  DEVICE End Point Pipe Status Set
      EPSTATUSSET6 : aliased EPSTATUSSET_Register;
      --  DEVICE End Point Pipe Status
      EPSTATUS6    : aliased EPSTATUS_Register;
      --  DEVICE End Point Interrupt Flag
      EPINTFLAG6   : aliased EPINTFLAG_Register;
      --  DEVICE End Point Interrupt Clear Flag
      EPINTENCLR6  : aliased EPINTENCLR_Register;
      --  DEVICE End Point Interrupt Set Flag
      EPINTENSET6  : aliased EPINTENSET_Register;
      --  DEVICE End Point Configuration
      EPCFG7       : aliased EPCFG_Register;
      --  DEVICE End Point Pipe Status Clear
      EPSTATUSCLR7 : aliased EPSTATUSCLR_Register;
      --  DEVICE End Point Pipe Status Set
      EPSTATUSSET7 : aliased EPSTATUSSET_Register;
      --  DEVICE End Point Pipe Status
      EPSTATUS7    : aliased EPSTATUS_Register;
      --  DEVICE End Point Interrupt Flag
      EPINTFLAG7   : aliased EPINTFLAG_Register;
      --  DEVICE End Point Interrupt Clear Flag
      EPINTENCLR7  : aliased EPINTENCLR_Register;
      --  DEVICE End Point Interrupt Set Flag
      EPINTENSET7  : aliased EPINTENSET_Register;
   end record
     with Size => 3936;

   for UsbDevice_Cluster use record
      CTRLA        at 16#0# range 0 .. 7;
      SYNCBUSY     at 16#2# range 0 .. 7;
      QOSCTRL      at 16#3# range 0 .. 7;
      CTRLB        at 16#8# range 0 .. 15;
      DADD         at 16#A# range 0 .. 7;
      STATUS       at 16#C# range 0 .. 7;
      FSMSTATUS    at 16#D# range 0 .. 7;
      FNUM         at 16#10# range 0 .. 15;
      INTENCLR     at 16#14# range 0 .. 15;
      INTENSET     at 16#18# range 0 .. 15;
      INTFLAG      at 16#1C# range 0 .. 15;
      EPINTSMRY    at 16#20# range 0 .. 15;
      DESCADD      at 16#24# range 0 .. 31;
      PADCAL       at 16#28# range 0 .. 15;
      EPCFG0       at 16#100# range 0 .. 7;
      EPSTATUSCLR0 at 16#104# range 0 .. 7;
      EPSTATUSSET0 at 16#105# range 0 .. 7;
      EPSTATUS0    at 16#106# range 0 .. 7;
      EPINTFLAG0   at 16#107# range 0 .. 7;
      EPINTENCLR0  at 16#108# range 0 .. 7;
      EPINTENSET0  at 16#109# range 0 .. 7;
      EPCFG1       at 16#120# range 0 .. 7;
      EPSTATUSCLR1 at 16#124# range 0 .. 7;
      EPSTATUSSET1 at 16#125# range 0 .. 7;
      EPSTATUS1    at 16#126# range 0 .. 7;
      EPINTFLAG1   at 16#127# range 0 .. 7;
      EPINTENCLR1  at 16#128# range 0 .. 7;
      EPINTENSET1  at 16#129# range 0 .. 7;
      EPCFG2       at 16#140# range 0 .. 7;
      EPSTATUSCLR2 at 16#144# range 0 .. 7;
      EPSTATUSSET2 at 16#145# range 0 .. 7;
      EPSTATUS2    at 16#146# range 0 .. 7;
      EPINTFLAG2   at 16#147# range 0 .. 7;
      EPINTENCLR2  at 16#148# range 0 .. 7;
      EPINTENSET2  at 16#149# range 0 .. 7;
      EPCFG3       at 16#160# range 0 .. 7;
      EPSTATUSCLR3 at 16#164# range 0 .. 7;
      EPSTATUSSET3 at 16#165# range 0 .. 7;
      EPSTATUS3    at 16#166# range 0 .. 7;
      EPINTFLAG3   at 16#167# range 0 .. 7;
      EPINTENCLR3  at 16#168# range 0 .. 7;
      EPINTENSET3  at 16#169# range 0 .. 7;
      EPCFG4       at 16#180# range 0 .. 7;
      EPSTATUSCLR4 at 16#184# range 0 .. 7;
      EPSTATUSSET4 at 16#185# range 0 .. 7;
      EPSTATUS4    at 16#186# range 0 .. 7;
      EPINTFLAG4   at 16#187# range 0 .. 7;
      EPINTENCLR4  at 16#188# range 0 .. 7;
      EPINTENSET4  at 16#189# range 0 .. 7;
      EPCFG5       at 16#1A0# range 0 .. 7;
      EPSTATUSCLR5 at 16#1A4# range 0 .. 7;
      EPSTATUSSET5 at 16#1A5# range 0 .. 7;
      EPSTATUS5    at 16#1A6# range 0 .. 7;
      EPINTFLAG5   at 16#1A7# range 0 .. 7;
      EPINTENCLR5  at 16#1A8# range 0 .. 7;
      EPINTENSET5  at 16#1A9# range 0 .. 7;
      EPCFG6       at 16#1C0# range 0 .. 7;
      EPSTATUSCLR6 at 16#1C4# range 0 .. 7;
      EPSTATUSSET6 at 16#1C5# range 0 .. 7;
      EPSTATUS6    at 16#1C6# range 0 .. 7;
      EPINTFLAG6   at 16#1C7# range 0 .. 7;
      EPINTENCLR6  at 16#1C8# range 0 .. 7;
      EPINTENSET6  at 16#1C9# range 0 .. 7;
      EPCFG7       at 16#1E0# range 0 .. 7;
      EPSTATUSCLR7 at 16#1E4# range 0 .. 7;
      EPSTATUSSET7 at 16#1E5# range 0 .. 7;
      EPSTATUS7    at 16#1E6# range 0 .. 7;
      EPINTFLAG7   at 16#1E7# range 0 .. 7;
      EPINTENCLR7  at 16#1E8# range 0 .. 7;
      EPINTENSET7  at 16#1E9# range 0 .. 7;
   end record;

   ---------------------------------
   -- UsbHost cluster's Registers --
   ---------------------------------

   --  Control A
   type USB_CTRLA_USB_HOST_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  Run in Standby Mode
      RUNSTDBY     : Boolean := False;
      --  unspecified
      Reserved_3_6 : HAL.UInt4 := 16#0#;
      --  Operating Mode
      MODE         : CTRLA_MODESelect := SAMD21_SVD.USB.DEVICE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_CTRLA_USB_HOST_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      RUNSTDBY     at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      MODE         at 0 range 7 .. 7;
   end record;

   --  Synchronization Busy
   type USB_SYNCBUSY_USB_HOST_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST        : Boolean;
      --  Read-only. Enable Synchronization Busy
      ENABLE       : Boolean;
      --  unspecified
      Reserved_2_7 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_SYNCBUSY_USB_HOST_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  USB Quality Of Service
   type USB_QOSCTRL_USB_HOST_Register is record
      --  Configuration Quality of Service
      CQOS         : QOSCTRL_CQOSSelect := SAMD21_SVD.USB.LOW;
      --  Data Quality of Service
      DQOS         : QOSCTRL_DQOSSelect := SAMD21_SVD.USB.LOW;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_QOSCTRL_USB_HOST_Register use record
      CQOS         at 0 range 0 .. 1;
      DQOS         at 0 range 2 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Speed Configuration for Host
   type CTRLB_SPDCONFSelect_1 is
     (--  Normal mode:the host starts in full-speed mode and performs a high-speed
--  reset to switch to the high speed mode if the downstream peripheral is
--  high-speed capable.
      NORMAL,
      --  Full-speed:the host remains in full-speed mode whatever is the peripheral
--  speed capability. Relevant in UTMI mode only.
      FS)
     with Size => 2;
   for CTRLB_SPDCONFSelect_1 use
     (NORMAL => 0,
      FS => 3);

   --  HOST Control B
   type USB_CTRLB_USB_HOST_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Send USB Resume
      RESUME         : Boolean := False;
      --  Speed Configuration for Host
      SPDCONF        : CTRLB_SPDCONFSelect_1 := SAMD21_SVD.USB.NORMAL;
      --  unspecified
      Reserved_4_4   : HAL.Bit := 16#0#;
      --  Test mode J
      TSTJ           : Boolean := False;
      --  Test mode K
      TSTK           : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Start of Frame Generation Enable
      SOFE           : Boolean := False;
      --  Send USB Reset
      BUSRESET       : Boolean := False;
      --  VBUS is OK
      VBUSOK         : Boolean := False;
      --  Send L1 Resume
      L1RESUME       : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_CTRLB_USB_HOST_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      RESUME         at 0 range 1 .. 1;
      SPDCONF        at 0 range 2 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      TSTJ           at 0 range 5 .. 5;
      TSTK           at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      SOFE           at 0 range 8 .. 8;
      BUSRESET       at 0 range 9 .. 9;
      VBUSOK         at 0 range 10 .. 10;
      L1RESUME       at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype USB_HSOFC_USB_HOST_FLENC_Field is HAL.UInt4;

   --  HOST Host Start Of Frame Control
   type USB_HSOFC_USB_HOST_Register is record
      --  Frame Length Control
      FLENC        : USB_HSOFC_USB_HOST_FLENC_Field := 16#0#;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Frame Length Control Enable
      FLENCE       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_HSOFC_USB_HOST_Register use record
      FLENC        at 0 range 0 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      FLENCE       at 0 range 7 .. 7;
   end record;

   subtype USB_STATUS_USB_HOST_SPEED_Field is HAL.UInt2;
   subtype USB_STATUS_USB_HOST_LINESTATE_Field is HAL.UInt2;

   --  HOST Status
   type USB_STATUS_USB_HOST_Register is record
      --  unspecified
      Reserved_0_1 : HAL.UInt2 := 16#0#;
      --  Speed Status
      SPEED        : USB_STATUS_USB_HOST_SPEED_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Read-only. USB Line State Status
      LINESTATE    : USB_STATUS_USB_HOST_LINESTATE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_STATUS_USB_HOST_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      SPEED        at 0 range 2 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      LINESTATE    at 0 range 6 .. 7;
   end record;

   --  Finite State Machine Status
   type USB_FSMSTATUS_USB_HOST_Register is record
      --  Read-only. Fine State Machine Status
      FSMSTATE     : FSMSTATUS_FSMSTATESelect;
      --  unspecified
      Reserved_7_7 : HAL.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_FSMSTATUS_USB_HOST_Register use record
      FSMSTATE     at 0 range 0 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   subtype USB_FNUM_USB_HOST_MFNUM_Field is HAL.UInt3;
   subtype USB_FNUM_USB_HOST_FNUM_Field is HAL.UInt11;

   --  HOST Host Frame Number
   type USB_FNUM_USB_HOST_Register is record
      --  Micro Frame Number
      MFNUM          : USB_FNUM_USB_HOST_MFNUM_Field := 16#0#;
      --  Frame Number
      FNUM           : USB_FNUM_USB_HOST_FNUM_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_FNUM_USB_HOST_Register use record
      MFNUM          at 0 range 0 .. 2;
      FNUM           at 0 range 3 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  HOST Host Interrupt Enable Clear
   type USB_INTENCLR_USB_HOST_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Host Start Of Frame Interrupt Disable
      HSOF           : Boolean := False;
      --  BUS Reset Interrupt Disable
      RST            : Boolean := False;
      --  Wake Up Interrupt Disable
      WAKEUP         : Boolean := False;
      --  DownStream to Device Interrupt Disable
      DNRSM          : Boolean := False;
      --  Upstream Resume from Device Interrupt Disable
      UPRSM          : Boolean := False;
      --  Ram Access Interrupt Disable
      RAMACER        : Boolean := False;
      --  Device Connection Interrupt Disable
      DCONN          : Boolean := False;
      --  Device Disconnection Interrupt Disable
      DDISC          : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTENCLR_USB_HOST_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      HSOF           at 0 range 2 .. 2;
      RST            at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      DNRSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      DCONN          at 0 range 8 .. 8;
      DDISC          at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  HOST Host Interrupt Enable Set
   type USB_INTENSET_USB_HOST_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Host Start Of Frame Interrupt Enable
      HSOF           : Boolean := False;
      --  Bus Reset Interrupt Enable
      RST            : Boolean := False;
      --  Wake Up Interrupt Enable
      WAKEUP         : Boolean := False;
      --  DownStream to the Device Interrupt Enable
      DNRSM          : Boolean := False;
      --  Upstream Resume fromthe device Interrupt Enable
      UPRSM          : Boolean := False;
      --  Ram Access Interrupt Enable
      RAMACER        : Boolean := False;
      --  Link Power Management Interrupt Enable
      DCONN          : Boolean := False;
      --  Device Disconnection Interrupt Enable
      DDISC          : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTENSET_USB_HOST_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      HSOF           at 0 range 2 .. 2;
      RST            at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      DNRSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      DCONN          at 0 range 8 .. 8;
      DDISC          at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  HOST Host Interrupt Flag
   type USB_INTFLAG_USB_HOST_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Host Start Of Frame
      HSOF           : Boolean := False;
      --  Bus Reset
      RST            : Boolean := False;
      --  Wake Up
      WAKEUP         : Boolean := False;
      --  Downstream
      DNRSM          : Boolean := False;
      --  Upstream Resume from the Device
      UPRSM          : Boolean := False;
      --  Ram Access
      RAMACER        : Boolean := False;
      --  Device Connection
      DCONN          : Boolean := False;
      --  Device Disconnection
      DDISC          : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTFLAG_USB_HOST_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      HSOF           at 0 range 2 .. 2;
      RST            at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      DNRSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      DCONN          at 0 range 8 .. 8;
      DDISC          at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  USB_PINTSMRY_USB_HOST_EPINT array
   type USB_PINTSMRY_USB_HOST_EPINT_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for USB_PINTSMRY_USB_HOST_EPINT
   type USB_PINTSMRY_USB_HOST_EPINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EPINT as a value
            Val : HAL.UInt8;
         when True =>
            --  EPINT as an array
            Arr : USB_PINTSMRY_USB_HOST_EPINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for USB_PINTSMRY_USB_HOST_EPINT_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  HOST Pipe Interrupt Summary
   type USB_PINTSMRY_USB_HOST_Register is record
      --  Read-only. Pipe 0 Interrupt
      EPINT         : USB_PINTSMRY_USB_HOST_EPINT_Field;
      --  unspecified
      Reserved_8_15 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_PINTSMRY_USB_HOST_Register use record
      EPINT         at 0 range 0 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   subtype USB_PADCAL_USB_HOST_TRANSP_Field is HAL.UInt5;
   subtype USB_PADCAL_USB_HOST_TRANSN_Field is HAL.UInt5;
   subtype USB_PADCAL_USB_HOST_TRIM_Field is HAL.UInt3;

   --  USB PAD Calibration
   type USB_PADCAL_USB_HOST_Register is record
      --  USB Pad Transp calibration
      TRANSP         : USB_PADCAL_USB_HOST_TRANSP_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  USB Pad Transn calibration
      TRANSN         : USB_PADCAL_USB_HOST_TRANSN_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  USB Pad Trim calibration
      TRIM           : USB_PADCAL_USB_HOST_TRIM_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_PADCAL_USB_HOST_Register use record
      TRANSP         at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TRANSN         at 0 range 6 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      TRIM           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   subtype PCFG_PTOKEN_Field is HAL.UInt2;
   subtype PCFG_PTYPE_Field is HAL.UInt3;

   --  HOST End Point Configuration
   type PCFG_Register is record
      --  Pipe Token
      PTOKEN       : PCFG_PTOKEN_Field := 16#0#;
      --  Pipe Bank
      BK           : Boolean := False;
      --  Pipe Type
      PTYPE        : PCFG_PTYPE_Field := 16#0#;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PCFG_Register use record
      PTOKEN       at 0 range 0 .. 1;
      BK           at 0 range 2 .. 2;
      PTYPE        at 0 range 3 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  HOST End Point Pipe Status Clear
   type PSTATUSCLR_Register is record
      --  Read-only. Data Toggle clear
      DTGL         : Boolean := False;
      --  unspecified
      Reserved_1_1 : HAL.Bit := 16#0#;
      --  Write-only. Curren Bank clear
      CURBK        : Boolean := False;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  Write-only. Pipe Freeze Clear
      PFREEZE      : Boolean := False;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Bank 0 Ready Clear
      BK0RDY       : Boolean := False;
      --  Write-only. Bank 1 Ready Clear
      BK1RDY       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PSTATUSCLR_Register use record
      DTGL         at 0 range 0 .. 0;
      Reserved_1_1 at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      PFREEZE      at 0 range 4 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  HOST End Point Pipe Status Set
   type PSTATUSSET_Register is record
      --  Write-only. Data Toggle Set
      DTGL         : Boolean := False;
      --  unspecified
      Reserved_1_1 : HAL.Bit := 16#0#;
      --  Write-only. Current Bank Set
      CURBK        : Boolean := False;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  Write-only. Pipe Freeze Set
      PFREEZE      : Boolean := False;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Bank 0 Ready Set
      BK0RDY       : Boolean := False;
      --  Write-only. Bank 1 Ready Set
      BK1RDY       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PSTATUSSET_Register use record
      DTGL         at 0 range 0 .. 0;
      Reserved_1_1 at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      PFREEZE      at 0 range 4 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  HOST End Point Pipe Status
   type PSTATUS_Register is record
      --  Read-only. Data Toggle
      DTGL         : Boolean;
      --  unspecified
      Reserved_1_1 : HAL.Bit;
      --  Read-only. Current Bank
      CURBK        : Boolean;
      --  unspecified
      Reserved_3_3 : HAL.Bit;
      --  Read-only. Pipe Freeze
      PFREEZE      : Boolean;
      --  unspecified
      Reserved_5_5 : HAL.Bit;
      --  Read-only. Bank 0 ready
      BK0RDY       : Boolean;
      --  Read-only. Bank 1 ready
      BK1RDY       : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PSTATUS_Register use record
      DTGL         at 0 range 0 .. 0;
      Reserved_1_1 at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      PFREEZE      at 0 range 4 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  PINTFLAG_TRCPT array
   type PINTFLAG_TRCPT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PINTFLAG_TRCPT
   type PINTFLAG_TRCPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRCPT as a value
            Val : HAL.UInt2;
         when True =>
            --  TRCPT as an array
            Arr : PINTFLAG_TRCPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PINTFLAG_TRCPT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  HOST Pipe Interrupt Flag
   type PINTFLAG_Register is record
      --  Transfer Complete 0 Interrupt Flag
      TRCPT        : PINTFLAG_TRCPT_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Error Flow Interrupt Flag
      TRFAIL       : Boolean := False;
      --  Pipe Error Interrupt Flag
      PERR         : Boolean := False;
      --  Transmit Setup Interrupt Flag
      TXSTP        : Boolean := False;
      --  Stall Interrupt Flag
      STALL        : Boolean := False;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PINTFLAG_Register use record
      TRCPT        at 0 range 0 .. 1;
      TRFAIL       at 0 range 2 .. 2;
      PERR         at 0 range 3 .. 3;
      TXSTP        at 0 range 4 .. 4;
      STALL        at 0 range 5 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  PINTENCLR_TRCPT array
   type PINTENCLR_TRCPT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PINTENCLR_TRCPT
   type PINTENCLR_TRCPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRCPT as a value
            Val : HAL.UInt2;
         when True =>
            --  TRCPT as an array
            Arr : PINTENCLR_TRCPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PINTENCLR_TRCPT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  HOST Pipe Interrupt Flag Clear
   type PINTENCLR_Register is record
      --  Transfer Complete 0 Disable
      TRCPT        : PINTENCLR_TRCPT_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Error Flow Interrupt Disable
      TRFAIL       : Boolean := False;
      --  Pipe Error Interrupt Disable
      PERR         : Boolean := False;
      --  Transmit Setup Interrupt Disable
      TXSTP        : Boolean := False;
      --  Stall Inetrrupt Disable
      STALL        : Boolean := False;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PINTENCLR_Register use record
      TRCPT        at 0 range 0 .. 1;
      TRFAIL       at 0 range 2 .. 2;
      PERR         at 0 range 3 .. 3;
      TXSTP        at 0 range 4 .. 4;
      STALL        at 0 range 5 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  PINTENSET_TRCPT array
   type PINTENSET_TRCPT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PINTENSET_TRCPT
   type PINTENSET_TRCPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRCPT as a value
            Val : HAL.UInt2;
         when True =>
            --  TRCPT as an array
            Arr : PINTENSET_TRCPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PINTENSET_TRCPT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  HOST Pipe Interrupt Flag Set
   type PINTENSET_Register is record
      --  Transfer Complete 0 Interrupt Enable
      TRCPT        : PINTENSET_TRCPT_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Error Flow Interrupt Enable
      TRFAIL       : Boolean := False;
      --  Pipe Error Interrupt Enable
      PERR         : Boolean := False;
      --  Transmit Setup Interrupt Enable
      TXSTP        : Boolean := False;
      --  Stall Interrupt Enable
      STALL        : Boolean := False;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PINTENSET_Register use record
      TRCPT        at 0 range 0 .. 1;
      TRFAIL       at 0 range 2 .. 2;
      PERR         at 0 range 3 .. 3;
      TXSTP        at 0 range 4 .. 4;
      STALL        at 0 range 5 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  USB is Host
   type UsbHost_Cluster is record
      --  Control A
      CTRLA       : aliased USB_CTRLA_USB_HOST_Register;
      --  Synchronization Busy
      SYNCBUSY    : aliased USB_SYNCBUSY_USB_HOST_Register;
      --  USB Quality Of Service
      QOSCTRL     : aliased USB_QOSCTRL_USB_HOST_Register;
      --  HOST Control B
      CTRLB       : aliased USB_CTRLB_USB_HOST_Register;
      --  HOST Host Start Of Frame Control
      HSOFC       : aliased USB_HSOFC_USB_HOST_Register;
      --  HOST Status
      STATUS      : aliased USB_STATUS_USB_HOST_Register;
      --  Finite State Machine Status
      FSMSTATUS   : aliased USB_FSMSTATUS_USB_HOST_Register;
      --  HOST Host Frame Number
      FNUM        : aliased USB_FNUM_USB_HOST_Register;
      --  HOST Host Frame Length
      FLENHIGH    : aliased HAL.UInt8;
      --  HOST Host Interrupt Enable Clear
      INTENCLR    : aliased USB_INTENCLR_USB_HOST_Register;
      --  HOST Host Interrupt Enable Set
      INTENSET    : aliased USB_INTENSET_USB_HOST_Register;
      --  HOST Host Interrupt Flag
      INTFLAG     : aliased USB_INTFLAG_USB_HOST_Register;
      --  HOST Pipe Interrupt Summary
      PINTSMRY    : aliased USB_PINTSMRY_USB_HOST_Register;
      --  Descriptor Address
      DESCADD     : aliased HAL.UInt32;
      --  USB PAD Calibration
      PADCAL      : aliased USB_PADCAL_USB_HOST_Register;
      --  HOST End Point Configuration
      PCFG0       : aliased PCFG_Register;
      --  HOST Bus Access Period of Pipe
      BINTERVAL0  : aliased HAL.UInt8;
      --  HOST End Point Pipe Status Clear
      PSTATUSCLR0 : aliased PSTATUSCLR_Register;
      --  HOST End Point Pipe Status Set
      PSTATUSSET0 : aliased PSTATUSSET_Register;
      --  HOST End Point Pipe Status
      PSTATUS0    : aliased PSTATUS_Register;
      --  HOST Pipe Interrupt Flag
      PINTFLAG0   : aliased PINTFLAG_Register;
      --  HOST Pipe Interrupt Flag Clear
      PINTENCLR0  : aliased PINTENCLR_Register;
      --  HOST Pipe Interrupt Flag Set
      PINTENSET0  : aliased PINTENSET_Register;
      --  HOST End Point Configuration
      PCFG1       : aliased PCFG_Register;
      --  HOST Bus Access Period of Pipe
      BINTERVAL1  : aliased HAL.UInt8;
      --  HOST End Point Pipe Status Clear
      PSTATUSCLR1 : aliased PSTATUSCLR_Register;
      --  HOST End Point Pipe Status Set
      PSTATUSSET1 : aliased PSTATUSSET_Register;
      --  HOST End Point Pipe Status
      PSTATUS1    : aliased PSTATUS_Register;
      --  HOST Pipe Interrupt Flag
      PINTFLAG1   : aliased PINTFLAG_Register;
      --  HOST Pipe Interrupt Flag Clear
      PINTENCLR1  : aliased PINTENCLR_Register;
      --  HOST Pipe Interrupt Flag Set
      PINTENSET1  : aliased PINTENSET_Register;
      --  HOST End Point Configuration
      PCFG2       : aliased PCFG_Register;
      --  HOST Bus Access Period of Pipe
      BINTERVAL2  : aliased HAL.UInt8;
      --  HOST End Point Pipe Status Clear
      PSTATUSCLR2 : aliased PSTATUSCLR_Register;
      --  HOST End Point Pipe Status Set
      PSTATUSSET2 : aliased PSTATUSSET_Register;
      --  HOST End Point Pipe Status
      PSTATUS2    : aliased PSTATUS_Register;
      --  HOST Pipe Interrupt Flag
      PINTFLAG2   : aliased PINTFLAG_Register;
      --  HOST Pipe Interrupt Flag Clear
      PINTENCLR2  : aliased PINTENCLR_Register;
      --  HOST Pipe Interrupt Flag Set
      PINTENSET2  : aliased PINTENSET_Register;
      --  HOST End Point Configuration
      PCFG3       : aliased PCFG_Register;
      --  HOST Bus Access Period of Pipe
      BINTERVAL3  : aliased HAL.UInt8;
      --  HOST End Point Pipe Status Clear
      PSTATUSCLR3 : aliased PSTATUSCLR_Register;
      --  HOST End Point Pipe Status Set
      PSTATUSSET3 : aliased PSTATUSSET_Register;
      --  HOST End Point Pipe Status
      PSTATUS3    : aliased PSTATUS_Register;
      --  HOST Pipe Interrupt Flag
      PINTFLAG3   : aliased PINTFLAG_Register;
      --  HOST Pipe Interrupt Flag Clear
      PINTENCLR3  : aliased PINTENCLR_Register;
      --  HOST Pipe Interrupt Flag Set
      PINTENSET3  : aliased PINTENSET_Register;
      --  HOST End Point Configuration
      PCFG4       : aliased PCFG_Register;
      --  HOST Bus Access Period of Pipe
      BINTERVAL4  : aliased HAL.UInt8;
      --  HOST End Point Pipe Status Clear
      PSTATUSCLR4 : aliased PSTATUSCLR_Register;
      --  HOST End Point Pipe Status Set
      PSTATUSSET4 : aliased PSTATUSSET_Register;
      --  HOST End Point Pipe Status
      PSTATUS4    : aliased PSTATUS_Register;
      --  HOST Pipe Interrupt Flag
      PINTFLAG4   : aliased PINTFLAG_Register;
      --  HOST Pipe Interrupt Flag Clear
      PINTENCLR4  : aliased PINTENCLR_Register;
      --  HOST Pipe Interrupt Flag Set
      PINTENSET4  : aliased PINTENSET_Register;
      --  HOST End Point Configuration
      PCFG5       : aliased PCFG_Register;
      --  HOST Bus Access Period of Pipe
      BINTERVAL5  : aliased HAL.UInt8;
      --  HOST End Point Pipe Status Clear
      PSTATUSCLR5 : aliased PSTATUSCLR_Register;
      --  HOST End Point Pipe Status Set
      PSTATUSSET5 : aliased PSTATUSSET_Register;
      --  HOST End Point Pipe Status
      PSTATUS5    : aliased PSTATUS_Register;
      --  HOST Pipe Interrupt Flag
      PINTFLAG5   : aliased PINTFLAG_Register;
      --  HOST Pipe Interrupt Flag Clear
      PINTENCLR5  : aliased PINTENCLR_Register;
      --  HOST Pipe Interrupt Flag Set
      PINTENSET5  : aliased PINTENSET_Register;
      --  HOST End Point Configuration
      PCFG6       : aliased PCFG_Register;
      --  HOST Bus Access Period of Pipe
      BINTERVAL6  : aliased HAL.UInt8;
      --  HOST End Point Pipe Status Clear
      PSTATUSCLR6 : aliased PSTATUSCLR_Register;
      --  HOST End Point Pipe Status Set
      PSTATUSSET6 : aliased PSTATUSSET_Register;
      --  HOST End Point Pipe Status
      PSTATUS6    : aliased PSTATUS_Register;
      --  HOST Pipe Interrupt Flag
      PINTFLAG6   : aliased PINTFLAG_Register;
      --  HOST Pipe Interrupt Flag Clear
      PINTENCLR6  : aliased PINTENCLR_Register;
      --  HOST Pipe Interrupt Flag Set
      PINTENSET6  : aliased PINTENSET_Register;
      --  HOST End Point Configuration
      PCFG7       : aliased PCFG_Register;
      --  HOST Bus Access Period of Pipe
      BINTERVAL7  : aliased HAL.UInt8;
      --  HOST End Point Pipe Status Clear
      PSTATUSCLR7 : aliased PSTATUSCLR_Register;
      --  HOST End Point Pipe Status Set
      PSTATUSSET7 : aliased PSTATUSSET_Register;
      --  HOST End Point Pipe Status
      PSTATUS7    : aliased PSTATUS_Register;
      --  HOST Pipe Interrupt Flag
      PINTFLAG7   : aliased PINTFLAG_Register;
      --  HOST Pipe Interrupt Flag Clear
      PINTENCLR7  : aliased PINTENCLR_Register;
      --  HOST Pipe Interrupt Flag Set
      PINTENSET7  : aliased PINTENSET_Register;
   end record
     with Size => 3936;

   for UsbHost_Cluster use record
      CTRLA       at 16#0# range 0 .. 7;
      SYNCBUSY    at 16#2# range 0 .. 7;
      QOSCTRL     at 16#3# range 0 .. 7;
      CTRLB       at 16#8# range 0 .. 15;
      HSOFC       at 16#A# range 0 .. 7;
      STATUS      at 16#C# range 0 .. 7;
      FSMSTATUS   at 16#D# range 0 .. 7;
      FNUM        at 16#10# range 0 .. 15;
      FLENHIGH    at 16#12# range 0 .. 7;
      INTENCLR    at 16#14# range 0 .. 15;
      INTENSET    at 16#18# range 0 .. 15;
      INTFLAG     at 16#1C# range 0 .. 15;
      PINTSMRY    at 16#20# range 0 .. 15;
      DESCADD     at 16#24# range 0 .. 31;
      PADCAL      at 16#28# range 0 .. 15;
      PCFG0       at 16#100# range 0 .. 7;
      BINTERVAL0  at 16#103# range 0 .. 7;
      PSTATUSCLR0 at 16#104# range 0 .. 7;
      PSTATUSSET0 at 16#105# range 0 .. 7;
      PSTATUS0    at 16#106# range 0 .. 7;
      PINTFLAG0   at 16#107# range 0 .. 7;
      PINTENCLR0  at 16#108# range 0 .. 7;
      PINTENSET0  at 16#109# range 0 .. 7;
      PCFG1       at 16#120# range 0 .. 7;
      BINTERVAL1  at 16#123# range 0 .. 7;
      PSTATUSCLR1 at 16#124# range 0 .. 7;
      PSTATUSSET1 at 16#125# range 0 .. 7;
      PSTATUS1    at 16#126# range 0 .. 7;
      PINTFLAG1   at 16#127# range 0 .. 7;
      PINTENCLR1  at 16#128# range 0 .. 7;
      PINTENSET1  at 16#129# range 0 .. 7;
      PCFG2       at 16#140# range 0 .. 7;
      BINTERVAL2  at 16#143# range 0 .. 7;
      PSTATUSCLR2 at 16#144# range 0 .. 7;
      PSTATUSSET2 at 16#145# range 0 .. 7;
      PSTATUS2    at 16#146# range 0 .. 7;
      PINTFLAG2   at 16#147# range 0 .. 7;
      PINTENCLR2  at 16#148# range 0 .. 7;
      PINTENSET2  at 16#149# range 0 .. 7;
      PCFG3       at 16#160# range 0 .. 7;
      BINTERVAL3  at 16#163# range 0 .. 7;
      PSTATUSCLR3 at 16#164# range 0 .. 7;
      PSTATUSSET3 at 16#165# range 0 .. 7;
      PSTATUS3    at 16#166# range 0 .. 7;
      PINTFLAG3   at 16#167# range 0 .. 7;
      PINTENCLR3  at 16#168# range 0 .. 7;
      PINTENSET3  at 16#169# range 0 .. 7;
      PCFG4       at 16#180# range 0 .. 7;
      BINTERVAL4  at 16#183# range 0 .. 7;
      PSTATUSCLR4 at 16#184# range 0 .. 7;
      PSTATUSSET4 at 16#185# range 0 .. 7;
      PSTATUS4    at 16#186# range 0 .. 7;
      PINTFLAG4   at 16#187# range 0 .. 7;
      PINTENCLR4  at 16#188# range 0 .. 7;
      PINTENSET4  at 16#189# range 0 .. 7;
      PCFG5       at 16#1A0# range 0 .. 7;
      BINTERVAL5  at 16#1A3# range 0 .. 7;
      PSTATUSCLR5 at 16#1A4# range 0 .. 7;
      PSTATUSSET5 at 16#1A5# range 0 .. 7;
      PSTATUS5    at 16#1A6# range 0 .. 7;
      PINTFLAG5   at 16#1A7# range 0 .. 7;
      PINTENCLR5  at 16#1A8# range 0 .. 7;
      PINTENSET5  at 16#1A9# range 0 .. 7;
      PCFG6       at 16#1C0# range 0 .. 7;
      BINTERVAL6  at 16#1C3# range 0 .. 7;
      PSTATUSCLR6 at 16#1C4# range 0 .. 7;
      PSTATUSSET6 at 16#1C5# range 0 .. 7;
      PSTATUS6    at 16#1C6# range 0 .. 7;
      PINTFLAG6   at 16#1C7# range 0 .. 7;
      PINTENCLR6  at 16#1C8# range 0 .. 7;
      PINTENSET6  at 16#1C9# range 0 .. 7;
      PCFG7       at 16#1E0# range 0 .. 7;
      BINTERVAL7  at 16#1E3# range 0 .. 7;
      PSTATUSCLR7 at 16#1E4# range 0 .. 7;
      PSTATUSSET7 at 16#1E5# range 0 .. 7;
      PSTATUS7    at 16#1E6# range 0 .. 7;
      PINTFLAG7   at 16#1E7# range 0 .. 7;
      PINTENCLR7  at 16#1E8# range 0 .. 7;
      PINTENSET7  at 16#1E9# range 0 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type USB_Disc is
     (DEVICE,
      HOST);

   --  Universal Serial Bus
   type USB_Peripheral
     (Discriminent : USB_Disc := DEVICE)
   is record
      case Discriminent is
         when DEVICE =>
            --  USB is Device
            USB_DEVICE : aliased UsbDevice_Cluster;
         when HOST =>
            --  USB is Host
            USB_HOST : aliased UsbHost_Cluster;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for USB_Peripheral use record
      USB_DEVICE at 0 range 0 .. 3935;
      USB_HOST   at 0 range 0 .. 3935;
   end record;

   --  Universal Serial Bus
   USB_Periph : aliased USB_Peripheral
     with Import, Address => USB_Base;

end SAMD21_SVD.USB;
