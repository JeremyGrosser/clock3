with SAMD21.Device;
with Seven;

package Clock is
   Display_1 : access Seven.Device := new Seven.Device
      (Port => SAMD21.Device.I2C_1'Access, Address => 2#01110000#);
   Display_2 : access Seven.Device := new Seven.Device
      (Port => SAMD21.Device.I2C_1'Access, Address => 2#01110001#);
   Display_3 : access Seven.Device := new Seven.Device
      (Port => SAMD21.Device.I2C_1'Access, Address => 2#01110011#);
   UTC_Hour, EST_Hour, PST_Hour : Natural;
   Minute, Second : Natural;

   function Hour_Offset
      (UTC    : Integer;
       Offset : Integer)
       return Integer;

   procedure Initialize;
   procedure Update;
end Clock;
