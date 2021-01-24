with SAMD21_SVD.SERCOM;
with SAMD21.I2C;

package SAMD21.Device is
   I2C_1 : aliased SAMD21.I2C.I2C_Port (SAMD21_SVD.SERCOM.SERCOM5_Periph'Access);
end SAMD21.Device;
