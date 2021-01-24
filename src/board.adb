with System.Machine_Code;
with System;
with Cortex_M_SVD.SysTick; use Cortex_M_SVD.SysTick;
with Cortex_M_SVD.NVIC;    use Cortex_M_SVD.NVIC;
with SAMD21_SVD.Interrupts; use SAMD21_SVD.Interrupts;
with SAMD21_SVD.GCLK;       use SAMD21_SVD.GCLK;
with SAMD21_SVD.NVMCTRL;    use SAMD21_SVD.NVMCTRL;
with SAMD21_SVD.SYSCTRL;    use SAMD21_SVD.SYSCTRL;
with SAMD21_SVD.SERCOM;     use SAMD21_SVD.SERCOM;
with SAMD21_SVD.PM;         use SAMD21_SVD.PM;
with SAMD21_SVD.WDT;        use SAMD21_SVD.WDT;
with SAMD21_SVD.PORT;       use SAMD21_SVD.PORT;
with SAMD21_SVD.EIC;        use SAMD21_SVD.EIC;
with SAMD21_SVD.ADC;        use SAMD21_SVD.ADC;
with SAMD21_SVD.USB;        use SAMD21_SVD.USB;
with HAL;                   use HAL;

package body Board is
   subtype GPIO_Pin is Natural range 0 .. 31;
   type GPIO_Port is access all PORT_Peripheral;
   type GPIO_Point is record
      Port : GPIO_Port;
      Num  : GPIO_Pin;
      PMUX : PMUX_PMUXSelect;
   end record;

   PA : GPIO_Port := PORTA_Periph'Access;
   PB : GPIO_Port := PORTB_Periph'Access;

   Pin_Map : constant array (Pins) of GPIO_Point :=
      (LED_1 => (PB, 03, A),
       LED_2 => (PA, 27, A),
       MISO  => (PA, 12, D), -- SERCOM4.0
       MOSI  => (PB, 10, D), -- SERCOM4.2
       SCK   => (PB, 11, D), -- SERCOM4.3
       TX    => (PA, 10, D), -- SERCOM2.2
       RX    => (PA, 11, D), -- SERCOM2.3
       SDA   => (PA, 22, D), -- SERCOM5.0
       SCL   => (PA, 23, D), -- SERCOM5.1
       D0    => (PA, 11, A),
       D1    => (PA, 10, A),
       D2    => (PA, 14, A),
       D3    => (PA, 09, A),
       D4    => (PA, 08, A),
       D5    => (PA, 15, A),
       D6    => (PA, 20, A),
       D7    => (PA, 21, A),
       D8    => (PA, 06, A),
       D9    => (PA, 07, A),
       D10   => (PA, 18, A),
       D11   => (PA, 16, A),
       D12   => (PA, 19, A),
       D13   => (PA, 17, A),
       A0    => (PA, 02, B),
       A1    => (PB, 08, B),
       A2    => (PB, 09, B),
       A3    => (PA, 04, B),
       A4    => (PA, 05, B),
       A5    => (PB, 02, B));

   Triggers : constant array (Interrupt_Triggers) of CONFIG_SENSESelect :=
      (Rising_Edge  => RISE,
       Falling_Edge => FALL,
       Both_Edges   => BOTH,
       High_Level   => HIGH,
       Low_Level    => LOW);

   --  10.3.2 NVM Software Calibration Area Mapping
   type NVM_Calibration is record
      ADC_LINEARITY      : ADC_CALIB_LINEARITY_CAL_Field;
      ADC_BIASCAL        : ADC_CALIB_BIAS_CAL_Field;
      OSC32K_CAL         : SYSCTRL_OSC32K_CALIB_Field;
      USB_TRANSN         : USB_PADCAL_USB_DEVICE_TRANSN_Field;
      USB_TRANSP         : USB_PADCAL_USB_DEVICE_TRANSP_Field;
      USB_TRIM           : USB_PADCAL_USB_DEVICE_TRIM_Field;
      DFLL48M_COARSE_CAL : SYSCTRL_DFLLVAL_COARSE_Field;
   end record;
   for NVM_Calibration use record
      ADC_LINEARITY      at 0 range 27 .. 34;
      ADC_BIASCAL        at 0 range 35 .. 37;
      OSC32K_CAL         at 0 range 38 .. 44;
      USB_TRANSN         at 0 range 45 .. 49;
      USB_TRANSP         at 0 range 50 .. 54;
      USB_TRIM           at 0 range 55 .. 57;
      DFLL48M_COARSE_CAL at 0 range 58 .. 63;
   end record;
   NVMCTRL_OTP4 : aliased NVM_Calibration
      with Import, Address => System'To_Address (16#00806020#);

   procedure Watchdog_Enable is
   begin
      NVIC_Periph.NVIC_ISER := Shift_Left (1, WDT_Interrupt);
      WDT_Periph.CTRL.ENABLE := False;
      WDT_Periph.CONFIG.PER := Val_16K;
      WDT_Periph.EWCTRL.EWOFFSET := Val_8K;
      WDT_Periph.INTENSET.EW := True;
      WDT_Periph.CTRL.ENABLE := True;
      Watchdog_Reload;
   end Watchdog_Enable;

   procedure Watchdog_Disable is
   begin
      WDT_Periph.CTRL.ENABLE := False;
   end Watchdog_Disable;

   procedure Watchdog_Reload is
   begin
      WDT_Periph.CLEAR := 16#A5#;
   end Watchdog_Reload;

   procedure Initialize is
      Coarse : SYSCTRL_DFLLVAL_COARSE_Field;
   begin
      -- 1 flash wait state for 48 MHz
      NVMCTRL_Periph.CTRLB.RWS := HALF;

      PM_Periph.APBAMASK.GCLK := True;
      SYSCTRL_Periph.DFLLCTRL.ONDEMAND := False;

      GCLK_Periph.CTRL.SWRST := True;
      while GCLK_Periph.CTRL.SWRST and GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;

      GCLK_Periph.GENDIV :=
         (ID     => 2,
          DIV    => 0,
          others => <>);
      while GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;

      GCLK_Periph.GENCTRL :=
         (ID     => 2,
          SRC    => OSC8M,
          GENEN  => True,
          others => <>);
      while GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;

      SYSCTRL_Periph.DFLLCTRL.ENABLE := True;
      while not SYSCTRL_Periph.PCLKSR.DFLLRDY loop
         null;
      end loop;

      Coarse := NVMCTRL_OTP4.DFLL48M_COARSE_CAL;
      if Coarse = 16#3f# then
         Coarse := 16#1f#;
      end if;

      SYSCTRL_Periph.DFLLMUL :=
         (CSTEP => 7,
          FSTEP => 10,
          MUL   => 48000);
      SYSCTRL_Periph.DFLLVAL :=
         (COARSE => Coarse,
          FINE   => 16#1ff#,
          others => <>);
      SYSCTRL_Periph.DFLLCTRL :=
         (ENABLE   => False,
          ONDEMAND => False,
          MODE     => True,
          CCDIS    => True,
          USBCRM   => False,
          BPLCKC   => True,
          others   => <>);
      while not SYSCTRL_Periph.PCLKSR.DFLLRDY loop
         null;
      end loop;
      SYSCTRL_Periph.DFLLCTRL.ENABLE := True;
      while not SYSCTRL_Periph.PCLKSR.DFLLRDY loop
         null;
      end loop;

      GCLK_Periph.CLKCTRL :=
         (ID      => DFLL48,
          GEN     => GCLK0, -- 1MHz from OSC8M
          CLKEN   => True,
          others  => <>);
      GCLK_Periph.GENDIV :=
         (ID     => 0,
          DIV    => 0,
          others => <>);
      while GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;
      GCLK_Periph.GENCTRL :=
         (ID     => 0,
          SRC    => DFLL48M,
          IDC    => True,
          GENEN  => True,
          others => <>);
      while GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;

      System_Clock_Frequency := 48000000;

      Pin_Mode (MOSI, Alternate);
      Pin_Mode (MISO, Alternate);
      Pin_Mode (SCK, Alternate);

      Pin_Mode (SCL, Alternate);
      Pin_Mode (SDA, Alternate);

      Pin_Mode (RX, Alternate);
      Pin_Mode (TX, Alternate);

      -- SERCOM4 SPI
      GCLK_Periph.CLKCTRL :=
         (ID     => SERCOM4_CORE,
          GEN    => GCLK0,
          CLKEN  => True,
          others => <>);
      while GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;

      PM_Periph.APBCMASK.SERCOM4 := True;

      SERCOM4_Periph.SERCOM_SPI.CTRLA.SWRST := True;
      while SERCOM4_Periph.SERCOM_SPI.SYNCBUSY.SWRST loop
         null;
      end loop;

      SERCOM4_Periph.SERCOM_SPI.CTRLA :=
         (MODE   => SPI_MASTER,
          DORD   => False, -- MSB first
          CPOL   => False,
          CPHA   => False,
          FORM   => 0,
          DIPO   => 0,
          DOPO   => 1,
          others => <>);

      SERCOM4_Periph.SERCOM_SPI.CTRLB :=
         (RXEN   => True,
          MSSEN  => False,
          CHSIZE => 0,
          others => <>);
      -- Fref := 48 MHz; Fbaud := 1 MHz; (Fref / (2 * Fbaud)) - 1
      SERCOM4_Periph.SERCOM_SPI.BAUD := 1;
      while SERCOM4_Periph.SERCOM_SPI.SYNCBUSY.CTRLB loop
         null;
      end loop;

      SERCOM4_Periph.SERCOM_SPI.CTRLA.ENABLE := True;
      while SERCOM4_Periph.SERCOM_SPI.SYNCBUSY.ENABLE loop
         null;
      end loop;

      -- SERCOM2 UART
      GCLK_Periph.CLKCTRL :=
         (ID     => SERCOM2_CORE,
          GEN    => GCLK0,
          CLKEN  => True,
          others => <>);
      while GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;

      PM_Periph.APBCMASK.SERCOM2 := True;

      SERCOM2_Periph.SERCOM_USART.CTRLA.SWRST := True;
      while SERCOM2_Periph.SERCOM_USART.SYNCBUSY.SWRST loop
         null;
      end loop;

      SERCOM2_Periph.SERCOM_USART.CTRLA :=
         (MODE   => USART_INT_CLK,
          CMODE  => False,
          DORD   => True,
          CPOL   => True,
          FORM   => 0,
          RXPO   => 3,
          TXPO   => 1,
          SAMPR  => 0,
          others => <>);
      SERCOM2_Periph.SERCOM_USART.CTRLB :=
         (CHSIZE => 0,
          SBMODE => False,
          others => <>);
      -- BAUD = 65536 * (1 - S * fBAUD / fREF);
      -- 63019 = 65536 * (1 - 16 * 115200 / 48_000_000)
      SERCOM2_Periph.SERCOM_USART.BAUD := 63018;

      SERCOM2_Periph.SERCOM_USART.CTRLB.RXEN := True;
      SERCOM2_Periph.SERCOM_USART.CTRLB.TXEN := True;
      SERCOM2_Periph.SERCOM_USART.CTRLA.ENABLE := True;
      while SERCOM2_Periph.SERCOM_USART.SYNCBUSY.ENABLE loop
         null;
      end loop;

      -- SERCOM5 I2C
      GCLK_Periph.CLKCTRL :=
         (ID     => SERCOM5_CORE,
          GEN    => GCLK0,
          CLKEN  => True,
          others => <>);
      while GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;
      PM_Periph.APBCMASK.SERCOM5 := True;

      -- Enable external interrupts
      GCLK_Periph.CLKCTRL :=
         (ID     => EIC,
          GEN    => GCLK0,
          CLKEN  => True,
          others => <>);
      while GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;

      EIC_Periph.CTRL.ENABLE := True;
      while EIC_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;

      SysTick_Periph.CSR.CLKSOURCE := CPU_Clk;
      SysTick_Periph.RVR.RELOAD := SYST_RVR_RELOAD_Field (System_Clock_Frequency / 1000); -- Reload every 1ms
      SysTick_Periph.CSR.TICKINT := Enable;
      SysTick_Periph.CSR.ENABLE := Enable;

      NVIC_Periph.NVIC_ISER := Shift_Left (1, EIC_Interrupt);
      NVIC_Periph.NVIC_ISER := Shift_Left (1, 15); -- SysTick
   end Initialize;

   procedure Pin_Mode
      (Pin  : Pins;
       Mode : Pin_Modes)
   is
      Point : constant GPIO_Point := Pin_Map (Pin);
      Mask  : constant UInt32 := Shift_Left (1, Point.Num);
   begin
      case Mode is
         when Input =>
            Point.Port.DIRCLR := Mask;
         when Output =>
            Point.Port.DIRSET := Mask;
            Point.Port.PINCFG (Point.Num).INEN := True;
            Point.Port.PINCFG (Point.Num).PULLEN := True;
         when Alternate =>
            Point.Port.PINCFG (Point.Num).PMUXEN := True;
            if Point.Num mod 2 = 0 then
               Point.Port.PMUX (Point.Num / 2).PMUXE := Point.PMUX;
            else
               Point.Port.PMUX (Point.Num / 2).PMUXO := Point.PMUX;
            end if;
      end case;
   end Pin_Mode;

   procedure Digital_Write
      (Pin   : Pins;
       State : Pin_States)
   is
      Point : constant GPIO_Point := Pin_Map (Pin);
      Mask  : constant UInt32 := Shift_Left (1, Point.Num);
   begin
      if State = High then
         Point.Port.OUTSET := Mask;
      else
         Point.Port.OUTCLR := Mask;
      end if;
   end Digital_Write;

   procedure Digital_Read
      (Pin   : Pins;
       State : out Pin_States)
   is
      Point : constant GPIO_Point := Pin_Map (Pin);
   begin
      if (Shift_Right (Point.Port.DIN, Point.Num) and 1) = 1 then
         State := High;
      else
         State := Low;
      end if;
   end Digital_Read;

   procedure SPI_Begin is
   begin
      --Digital_Write (NSS, Low);
      null;
   end SPI_Begin;

   procedure SPI_Transfer
      (Data : in out UInt8)
   is
   begin
      SERCOM4_Periph.SERCOM_SPI.DATA.DATA := UInt9 (Data);

      while not SERCOM4_Periph.SERCOM_SPI.INTFLAG.RXC loop
         null;
      end loop;
      Data := UInt8 (SERCOM4_Periph.SERCOM_SPI.DATA.DATA);

      while not SERCOM4_Periph.SERCOM_SPI.INTFLAG.DRE loop
         null;
      end loop;
   end SPI_Transfer;

   procedure SPI_End is
   begin
      --Digital_Write (NSS, High);
      null;
   end SPI_End;

   function Unique_Id
      return Unique_Id_Type
   is
      Serial_1 : aliased UInt32
         with Import, Address => System'To_Address (16#0080A00C#);
      Serial_2 : aliased UInt32
         with Import, Address => System'To_Address (16#0080A040#);
      Serial_3 : aliased UInt32
         with Import, Address => System'To_Address (16#0080A044#);
      Serial_4 : aliased UInt32
         with Import, Address => System'To_Address (16#0080A048#);
      Serial : constant Unique_Id_Type := (Serial_1, Serial_2, Serial_3, Serial_4);
   begin
      return Serial;
   end Unique_Id;

   procedure Serial_Write
      (Data : String)
   is
   begin
      for Ch of Data loop
         while not SERCOM2_Periph.SERCOM_USART.INTFLAG.DRE loop
            null;
         end loop;
         SERCOM2_Periph.SERCOM_USART.DATA.DATA := UInt9 (Character'Pos (Ch));
      end loop;
   end Serial_Write;

   procedure Serial_Read
      (Data : out String)
   is
   begin
      Data := "";
   end Serial_Read;

   procedure Wait_For_Interrupt is
   begin
      System.Machine_Code.Asm ("wfi", Volatile => True);
   end Wait_For_Interrupt;

   procedure Wait (Milliseconds : Time) is
      T : Time with Volatile => True;
   begin
      T := Clock + Milliseconds;
      while Clock < T loop
         Wait_For_Interrupt;
      end loop;
   end Wait;

   procedure Attach_Interrupt
       (Interrupt : Interrupt_Numbers;
        Handler   : Interrupt_Procedure;
        Trigger   : Interrupt_Triggers)
   is
   begin
      Interrupt_Handlers (Interrupt) := Handler;
      --EIC_Periph.EVCTRL.EXTINTEO.Arr (Interrupt) := True;
      EIC_Periph.CONFIG (Interrupt / 8).SENSE (Interrupt mod 8).SENSE := Triggers (Trigger);
      EIC_Periph.INTENSET.EXTINT.Arr (Interrupt) := True;
   end Attach_Interrupt;

	procedure Detach_Interrupt
       (Interrupt : Interrupt_Numbers)
   is
   begin
      --EIC_Periph.EVCTRL.EXTINTEO.Arr (Interrupt) := False;
      EIC_Periph.INTENSET.EXTINT.Arr (Interrupt) := False;
      Interrupt_Handlers (Interrupt) := null;
   end Detach_Interrupt;

   procedure SysTick_Handler is
   begin
      Clock := Clock + 1;
      if Clock = Time'Last then
         Clock := Time'First;
      end if;
   end SysTick_Handler;

   procedure WDT_Handler is
   begin
      null;
   end WDT_Handler;

   procedure EIC_Handler is
   begin
      for Interrupt in Interrupt_Numbers'Range loop
         if EIC_Periph.INTFLAG.EXTINT.Arr (Interrupt) then
            EIC_Periph.INTFLAG.EXTINT.Arr (Interrupt) := True;
            if Interrupt_Handlers (Interrupt) /= null then
               Interrupt_Handlers (Interrupt).all;
            end if;
         end if;
      end loop;
   end EIC_Handler;
end Board;
