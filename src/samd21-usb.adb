with SAMD21_SVD.USB; use SAMD21_SVD.USB;
with SAMD21_SVD.PM; use SAMD21_SVD.PM;
with SAMD21_SVD.GCLK; use SAMD21_SVD.GCLK;
with SAMD21.Device; use SAMD21.Device;
with HAL; use HAL;
with Board; use Board;

package body SAMD21.USB is
   procedure Initialize is
      Pad_Trans_N : USB_PADCAL_USB_DEVICE_TRANSN_Field := NVMCTRL_OTP4.USB_TRANSN;
      Pad_Trans_P : USB_PADCAL_USB_DEVICE_TRANSP_Field := NVMCTRL_OTP4.USB_TRANSP;
      Pad_Trim    : USB_PADCAL_USB_DEVICE_TRIM_Field := NVMCTRL_OTP4.USB_TRIM;
   begin
      PM_Periph.APBBMASK.USB := True;
      Pin_Mode (USB_DM, Alternate);
      Pin_Mode (USB_DP, Alternate);
      GCLK_Periph.CLKCTRL :=
         (ID     => SAMD21_SVD.GCLK.USB,
          GEN    => GCLK0,
          CLKEN  => True,
          others => <>);
      while GCLK_Periph.STATUS.SYNCBUSY loop
         null;
      end loop;
      USB_Periph.USB_DEVICE.CTRLA.SWRST := True;
      while USB_Periph.USB_DEVICE.SYNCBUSY.SWRST loop
         null;
      end loop;

      if Pad_Trans_N = 16#1F# then
         Pad_Trans_N := 5;
      end if;

      if Pad_Trans_P = 16#1F# then
         Pad_Trans_P := 29;
      end if;

      if Pad_Trim = 7 then
         Pad_Trim := 3;
      end if;

      USB_Periph.USB_DEVICE.PADCAL.TRANSN := Pad_Trans_N;
      USB_Periph.USB_DEVICE.PADCAL.TRANSP := Pad_Trans_P;
      USB_Periph.USB_DEVICE.PADCAL.TRIM := Pad_Trim;

      USB_Periph.USB_DEVICE.CTRLA :=
         (MODE     => SAMD21_SVD.USB.DEVICE,
          RUNSTDBY => True,
          others   => <>);
      -- DESCADD
      USB_Periph.USB_DEVICE.CTRLB :=
         (SPDCONF => FS,
          DETACH  => False,
          others  => <>);
   end Initialize;
end SAMD21.USB;
