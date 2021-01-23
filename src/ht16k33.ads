with Board; use Board;
with HAL; use HAL;

package HT16K33 is
   type Device is record
      Address : I2C_Address := 2#1110000#;
   end record;

   subtype Display_Data is UInt8_Array (0 .. 15);
   subtype Duty_Cycle is UInt8 range 0 .. 15;

   procedure Enable
      (This : in out Device);
   procedure Disable
      (This : in out Device);
   procedure Write_Display
      (This : in out Device;
       Data : Display_Data);
   procedure Set_PWM
      (This : in out Device;
       DC   : Duty_Cycle);
end HT16K33;
