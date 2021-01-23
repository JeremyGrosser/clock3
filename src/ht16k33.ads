with Board; use Board;
with HAL; use HAL;

package HT16K33 is
   type Device (Address : I2C_Address) is tagged private;

   Default_Address : constant I2C_Address := 16#70#;

   subtype Brightness_Level is UInt8 range 0 .. 15;
   type Output_State is (High, Low);

   procedure Initialize
      (This : in out Device);

   procedure Fill
      (This  : in out Device;
       State : Output_State);

   procedure Set_Brightness
      (This  : in out Device;
       Level : Brightness_Level);

private

   type Device (Address : I2C_Address) is tagged record
      Buffer     : UInt8_Array (0 .. 16) := (others => 0); -- byte zero is the address set command, the remaining 16 bytes are output values
      Brightness : Brightness_Level := Brightness_Level'Last;
   end record;
end HT16K33;
