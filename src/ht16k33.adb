package body HT16K33 is
   procedure Enable
      (This : in out Device)
   is
      Oscillator_On : constant UInt8_Array (1 .. 1) := (1 => 2#0010_0001#);
      Display_On    : constant UInt8_Array (1 .. 1) := (1 => 2#1000_0001#);
   begin
      I2C_Write (This.Address, Oscillator_On);
      I2C_Write (This.Address, Display_On);
   end Enable;

   procedure Disable
      (This : in out Device)
   is
      Display_Off : constant UInt8_Array (1 .. 1) := (1 => 2#10000000#);
   begin
      I2C_Write (This.Address, Display_Off);
   end Disable;

   procedure Write_Display
      (This : in out Device;
       Data : Display_Data)
   is
      Set_Address : constant UInt8 := 0; -- display pointer := 0
      D           : constant UInt8_Array := Set_Address & Data;
   begin
      I2C_Write (This.Address, D);
   end Write_Display;

   procedure Set_PWM
      (This : in out Device;
       DC   : Duty_Cycle)
   is
      D : constant UInt8_Array (1 .. 1) := (1 => 2#1110_0000# or DC);
   begin
      I2C_Write (This.Address, D);
   end Set_PWM;
end HT16K33;
