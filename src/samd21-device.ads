with SAMD21_SVD.ADC;     use SAMD21_SVD.ADC;
with SAMD21_SVD.USB;     use SAMD21_SVD.USB;
with SAMD21_SVD.SYSCTRL; use SAMD21_SVD.SYSCTRL;
with SAMD21_SVD.SERCOM;
with SAMD21.I2C;
with System;

package SAMD21.Device is
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

   I2C_1 : aliased SAMD21.I2C.I2C_Port (SAMD21_SVD.SERCOM.SERCOM5_Periph'Access);
end SAMD21.Device;
