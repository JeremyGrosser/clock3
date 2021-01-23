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

package SAMD21_SVD.EVSYS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control
   type EVSYS_CTRL_Register is record
      --  Write-only. Software Reset
      SWRST        : Boolean := False;
      --  unspecified
      Reserved_1_3 : HAL.UInt3 := 16#0#;
      --  Write-only. Generic Clock Requests
      GCLKREQ      : Boolean := False;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EVSYS_CTRL_Register use record
      SWRST        at 0 range 0 .. 0;
      Reserved_1_3 at 0 range 1 .. 3;
      GCLKREQ      at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   subtype EVSYS_CHANNEL_CHANNEL_Field is HAL.UInt4;
   subtype EVSYS_CHANNEL_EVGEN_Field is HAL.UInt7;

   --  Path Selection
   type CHANNEL_PATHSelect is
     (--  Synchronous path
      SYNCHRONOUS,
      --  Resynchronized path
      RESYNCHRONIZED,
      --  Asynchronous path
      ASYNCHRONOUS)
     with Size => 2;
   for CHANNEL_PATHSelect use
     (SYNCHRONOUS => 0,
      RESYNCHRONIZED => 1,
      ASYNCHRONOUS => 2);

   --  Edge Detection Selection
   type CHANNEL_EDGSELSelect is
     (--  No event output when using the resynchronized or synchronous path
      NO_EVT_OUTPUT,
      --  Event detection only on the rising edge of the signal from the event
--  generator when using the resynchronized or synchronous path
      RISING_EDGE,
      --  Event detection only on the falling edge of the signal from the event
--  generator when using the resynchronized or synchronous path
      FALLING_EDGE,
      --  Event detection on rising and falling edges of the signal from the event
--  generator when using the resynchronized or synchronous path
      BOTH_EDGES)
     with Size => 2;
   for CHANNEL_EDGSELSelect use
     (NO_EVT_OUTPUT => 0,
      RISING_EDGE => 1,
      FALLING_EDGE => 2,
      BOTH_EDGES => 3);

   --  Channel
   type EVSYS_CHANNEL_Register is record
      --  Channel Selection
      CHANNEL        : EVSYS_CHANNEL_CHANNEL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Software Event
      SWEVT          : Boolean := False;
      --  unspecified
      Reserved_9_15  : HAL.UInt7 := 16#0#;
      --  Event Generator Selection
      EVGEN          : EVSYS_CHANNEL_EVGEN_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Path Selection
      PATH           : CHANNEL_PATHSelect := SAMD21_SVD.EVSYS.SYNCHRONOUS;
      --  Edge Detection Selection
      EDGSEL         : CHANNEL_EDGSELSelect := SAMD21_SVD.EVSYS.NO_EVT_OUTPUT;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_CHANNEL_Register use record
      CHANNEL        at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      SWEVT          at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      EVGEN          at 0 range 16 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      PATH           at 0 range 24 .. 25;
      EDGSEL         at 0 range 26 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype EVSYS_USER_USER_Field is HAL.UInt5;

   --  Channel Event Selection
   type USER_CHANNELSelect is
     (--  No Channel Output Selected
      Val_0)
     with Size => 5;
   for USER_CHANNELSelect use
     (Val_0 => 0);

   --  User Multiplexer
   type EVSYS_USER_Register is record
      --  User Multiplexer Selection
      USER           : EVSYS_USER_USER_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Channel Event Selection
      CHANNEL        : USER_CHANNELSelect := SAMD21_SVD.EVSYS.Val_0;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for EVSYS_USER_Register use record
      USER           at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      CHANNEL        at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
   end record;

   --  EVSYS_CHSTATUS_USRRDY array
   type EVSYS_CHSTATUS_USRRDY_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for EVSYS_CHSTATUS_USRRDY
   type EVSYS_CHSTATUS_USRRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  USRRDY as a value
            Val : HAL.UInt8;
         when True =>
            --  USRRDY as an array
            Arr : EVSYS_CHSTATUS_USRRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EVSYS_CHSTATUS_USRRDY_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  EVSYS_CHSTATUS_CHBUSY array
   type EVSYS_CHSTATUS_CHBUSY_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for EVSYS_CHSTATUS_CHBUSY
   type EVSYS_CHSTATUS_CHBUSY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHBUSY as a value
            Val : HAL.UInt8;
         when True =>
            --  CHBUSY as an array
            Arr : EVSYS_CHSTATUS_CHBUSY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EVSYS_CHSTATUS_CHBUSY_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  EVSYS_CHSTATUS_USRRDY array
   type EVSYS_CHSTATUS_USRRDY_Field_Array_1 is array (8 .. 11) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for EVSYS_CHSTATUS_USRRDY
   type EVSYS_CHSTATUS_USRRDY_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  USRRDY as a value
            Val : HAL.UInt4;
         when True =>
            --  USRRDY as an array
            Arr : EVSYS_CHSTATUS_USRRDY_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVSYS_CHSTATUS_USRRDY_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  EVSYS_CHSTATUS_CHBUSY array
   type EVSYS_CHSTATUS_CHBUSY_Field_Array_1 is array (8 .. 11) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for EVSYS_CHSTATUS_CHBUSY
   type EVSYS_CHSTATUS_CHBUSY_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHBUSY as a value
            Val : HAL.UInt4;
         when True =>
            --  CHBUSY as an array
            Arr : EVSYS_CHSTATUS_CHBUSY_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVSYS_CHSTATUS_CHBUSY_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Channel Status
   type EVSYS_CHSTATUS_Register is record
      --  Read-only. Channel 0 User Ready
      USRRDY         : EVSYS_CHSTATUS_USRRDY_Field;
      --  Read-only. Channel 0 Busy
      CHBUSY         : EVSYS_CHSTATUS_CHBUSY_Field;
      --  Read-only. Channel 8 User Ready
      USRRDY_1       : EVSYS_CHSTATUS_USRRDY_Field_1;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. Channel 8 Busy
      CHBUSY_1       : EVSYS_CHSTATUS_CHBUSY_Field_1;
      --  unspecified
      Reserved_28_31 : HAL.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_CHSTATUS_Register use record
      USRRDY         at 0 range 0 .. 7;
      CHBUSY         at 0 range 8 .. 15;
      USRRDY_1       at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      CHBUSY_1       at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  EVSYS_INTENCLR_OVR array
   type EVSYS_INTENCLR_OVR_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for EVSYS_INTENCLR_OVR
   type EVSYS_INTENCLR_OVR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OVR as a value
            Val : HAL.UInt8;
         when True =>
            --  OVR as an array
            Arr : EVSYS_INTENCLR_OVR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EVSYS_INTENCLR_OVR_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  EVSYS_INTENCLR_EVD array
   type EVSYS_INTENCLR_EVD_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for EVSYS_INTENCLR_EVD
   type EVSYS_INTENCLR_EVD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EVD as a value
            Val : HAL.UInt8;
         when True =>
            --  EVD as an array
            Arr : EVSYS_INTENCLR_EVD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EVSYS_INTENCLR_EVD_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  EVSYS_INTENCLR_OVR array
   type EVSYS_INTENCLR_OVR_Field_Array_1 is array (8 .. 11) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for EVSYS_INTENCLR_OVR
   type EVSYS_INTENCLR_OVR_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OVR as a value
            Val : HAL.UInt4;
         when True =>
            --  OVR as an array
            Arr : EVSYS_INTENCLR_OVR_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVSYS_INTENCLR_OVR_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  EVSYS_INTENCLR_EVD array
   type EVSYS_INTENCLR_EVD_Field_Array_1 is array (8 .. 11) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for EVSYS_INTENCLR_EVD
   type EVSYS_INTENCLR_EVD_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EVD as a value
            Val : HAL.UInt4;
         when True =>
            --  EVD as an array
            Arr : EVSYS_INTENCLR_EVD_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVSYS_INTENCLR_EVD_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Interrupt Enable Clear
   type EVSYS_INTENCLR_Register is record
      --  Channel 0 Overrun Interrupt Enable
      OVR            : EVSYS_INTENCLR_OVR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Channel 0 Event Detection Interrupt Enable
      EVD            : EVSYS_INTENCLR_EVD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Channel 8 Overrun Interrupt Enable
      OVR_1          : EVSYS_INTENCLR_OVR_Field_1 :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  Channel 8 Event Detection Interrupt Enable
      EVD_1          : EVSYS_INTENCLR_EVD_Field_1 :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_INTENCLR_Register use record
      OVR            at 0 range 0 .. 7;
      EVD            at 0 range 8 .. 15;
      OVR_1          at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      EVD_1          at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  EVSYS_INTENSET_OVR array
   type EVSYS_INTENSET_OVR_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for EVSYS_INTENSET_OVR
   type EVSYS_INTENSET_OVR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OVR as a value
            Val : HAL.UInt8;
         when True =>
            --  OVR as an array
            Arr : EVSYS_INTENSET_OVR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EVSYS_INTENSET_OVR_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  EVSYS_INTENSET_EVD array
   type EVSYS_INTENSET_EVD_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for EVSYS_INTENSET_EVD
   type EVSYS_INTENSET_EVD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EVD as a value
            Val : HAL.UInt8;
         when True =>
            --  EVD as an array
            Arr : EVSYS_INTENSET_EVD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EVSYS_INTENSET_EVD_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  EVSYS_INTENSET_OVR array
   type EVSYS_INTENSET_OVR_Field_Array_1 is array (8 .. 11) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for EVSYS_INTENSET_OVR
   type EVSYS_INTENSET_OVR_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OVR as a value
            Val : HAL.UInt4;
         when True =>
            --  OVR as an array
            Arr : EVSYS_INTENSET_OVR_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVSYS_INTENSET_OVR_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  EVSYS_INTENSET_EVD array
   type EVSYS_INTENSET_EVD_Field_Array_1 is array (8 .. 11) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for EVSYS_INTENSET_EVD
   type EVSYS_INTENSET_EVD_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EVD as a value
            Val : HAL.UInt4;
         when True =>
            --  EVD as an array
            Arr : EVSYS_INTENSET_EVD_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVSYS_INTENSET_EVD_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Interrupt Enable Set
   type EVSYS_INTENSET_Register is record
      --  Channel 0 Overrun Interrupt Enable
      OVR            : EVSYS_INTENSET_OVR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Channel 0 Event Detection Interrupt Enable
      EVD            : EVSYS_INTENSET_EVD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Channel 8 Overrun Interrupt Enable
      OVR_1          : EVSYS_INTENSET_OVR_Field_1 :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  Channel 8 Event Detection Interrupt Enable
      EVD_1          : EVSYS_INTENSET_EVD_Field_1 :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_INTENSET_Register use record
      OVR            at 0 range 0 .. 7;
      EVD            at 0 range 8 .. 15;
      OVR_1          at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      EVD_1          at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  EVSYS_INTFLAG_OVR array
   type EVSYS_INTFLAG_OVR_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for EVSYS_INTFLAG_OVR
   type EVSYS_INTFLAG_OVR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OVR as a value
            Val : HAL.UInt8;
         when True =>
            --  OVR as an array
            Arr : EVSYS_INTFLAG_OVR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EVSYS_INTFLAG_OVR_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  EVSYS_INTFLAG_EVD array
   type EVSYS_INTFLAG_EVD_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for EVSYS_INTFLAG_EVD
   type EVSYS_INTFLAG_EVD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EVD as a value
            Val : HAL.UInt8;
         when True =>
            --  EVD as an array
            Arr : EVSYS_INTFLAG_EVD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EVSYS_INTFLAG_EVD_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  EVSYS_INTFLAG_OVR array
   type EVSYS_INTFLAG_OVR_Field_Array_1 is array (8 .. 11) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for EVSYS_INTFLAG_OVR
   type EVSYS_INTFLAG_OVR_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OVR as a value
            Val : HAL.UInt4;
         when True =>
            --  OVR as an array
            Arr : EVSYS_INTFLAG_OVR_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVSYS_INTFLAG_OVR_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  EVSYS_INTFLAG_EVD array
   type EVSYS_INTFLAG_EVD_Field_Array_1 is array (8 .. 11) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for EVSYS_INTFLAG_EVD
   type EVSYS_INTFLAG_EVD_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EVD as a value
            Val : HAL.UInt4;
         when True =>
            --  EVD as an array
            Arr : EVSYS_INTFLAG_EVD_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVSYS_INTFLAG_EVD_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Interrupt Flag Status and Clear
   type EVSYS_INTFLAG_Register is record
      --  Channel 0 Overrun
      OVR            : EVSYS_INTFLAG_OVR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Channel 0 Event Detection
      EVD            : EVSYS_INTFLAG_EVD_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Channel 8 Overrun
      OVR_1          : EVSYS_INTFLAG_OVR_Field_1 :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  Channel 8 Event Detection
      EVD_1          : EVSYS_INTFLAG_EVD_Field_1 :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_INTFLAG_Register use record
      OVR            at 0 range 0 .. 7;
      EVD            at 0 range 8 .. 15;
      OVR_1          at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      EVD_1          at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Event System Interface
   type EVSYS_Peripheral is record
      --  Control
      CTRL     : aliased EVSYS_CTRL_Register;
      --  Channel
      CHANNEL  : aliased EVSYS_CHANNEL_Register;
      --  User Multiplexer
      USER     : aliased EVSYS_USER_Register;
      --  Channel Status
      CHSTATUS : aliased EVSYS_CHSTATUS_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased EVSYS_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased EVSYS_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased EVSYS_INTFLAG_Register;
   end record
     with Volatile;

   for EVSYS_Peripheral use record
      CTRL     at 16#0# range 0 .. 7;
      CHANNEL  at 16#4# range 0 .. 31;
      USER     at 16#8# range 0 .. 15;
      CHSTATUS at 16#C# range 0 .. 31;
      INTENCLR at 16#10# range 0 .. 31;
      INTENSET at 16#14# range 0 .. 31;
      INTFLAG  at 16#18# range 0 .. 31;
   end record;

   --  Event System Interface
   EVSYS_Periph : aliased EVSYS_Peripheral
     with Import, Address => EVSYS_Base;

end SAMD21_SVD.EVSYS;
