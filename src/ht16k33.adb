package body HT16K33 is
   procedure Initialize
      (This : in out Device)
   is
      Oscillator_On : constant UInt8 := 16#21#;
   begin
      I2C_Write (This.Address, Oscillator_On);
      Fill (This, High);
   end Initialize;

   procedure Set_Brightness
      (This  : in out Device;
       Level : Brightness_Level)
   is
   begin
      I2C_Write (This.Address, 16#E0# or Level);
   end Set_Brightness;

   procedure Fill
      (This  : in out Device;
       State : Output_State)
   is
   begin
      for I in 1 .. This.Buffer'Last loop
         if State = High then
            This.Buffer (I) := 16#FF#;
         else
            This.Buffer (I) := 16#00#;
         end if;
      end loop;
      I2C_Write (This.Address, This.Buffer);
   end Fill;
end HT16K33;
