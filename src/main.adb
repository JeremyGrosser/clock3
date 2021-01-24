with Board; use Board;
with SAMD21.Device;
with HAL.I2C;
with HT16K33;
with Seven;

procedure Main is
   Display_1 : access Seven.Device := new Seven.Device
      (Port => SAMD21.Device.I2C_1'Access, Address => 2#01110000#);
   Display_2 : access Seven.Device := new Seven.Device
      (Port => SAMD21.Device.I2C_1'Access, Address => 2#01110001#);
   Display_3 : access Seven.Device := new Seven.Device
      (Port => SAMD21.Device.I2C_1'Access, Address => 2#01110011#);
   Toggle    : Boolean := False;
begin
   Board.Initialize;
   SAMD21.Device.I2C_1.Enable;
   Display_1.Initialize;
   Display_2.Initialize;
   Display_3.Initialize;
   Pin_Mode (LED_1, Output);
   Pin_Mode (LED_2, Output);
   Digital_Write (LED_1, High);
   Digital_Write (LED_2, High);
   Wait (100);

   Display_1.Clear_All;
   Display_2.Clear_All;
   Display_3.Clear_All;

   Display_1.Update;
   Display_2.Update;
   Display_3.Update;

   loop
      for I in 0 .. 9999 loop
         Display_2.Clear_All;
         Display_2.Set_Digit (4, I mod 10);
         Display_2.Set_Digit (3, (I / 10) mod 10);
         Display_2.Set_Digit (2, (I / 100) mod 10);
         Display_2.Set_Digit (1, (I / 1000) mod 10);

         for J in 1 .. 4 loop
            Display_2.Update;
            Wait (25);
            Display_2.Set_Point (J, True);
         end loop;
      end loop;
   end loop;
end Main;
