with Board; use Board;
with SAMD21.Device;
with HAL.I2C;
with HT16K33;
with Seven;
with ESP8266;

with HAL; use HAL;

procedure Main is
   Display_1 : access Seven.Device := new Seven.Device
      (Port => SAMD21.Device.I2C_1'Access, Address => 2#01110000#);
   Display_2 : access Seven.Device := new Seven.Device
      (Port => SAMD21.Device.I2C_1'Access, Address => 2#01110001#);
   Display_3 : access Seven.Device := new Seven.Device
      (Port => SAMD21.Device.I2C_1'Access, Address => 2#01110011#);
   Toggle    : Boolean := False;
   Hour, Minute, Second : Natural;
begin
   Board.Initialize;

   SAMD21.Device.I2C_1.Enable;
   Display_1.Initialize;
   Display_2.Initialize;
   Display_3.Initialize;

   Display_1.Set_Brightness (2);
   Display_2.Set_Brightness (2);
   Display_3.Set_Brightness (2);

   ESP8266.Initialize;
   ESP8266.Get_Time (Hour, Minute, Second);

   Pin_Mode (LED_1, Output);
   Pin_Mode (LED_2, Output);
   Digital_Write (LED_1, True);
   Digital_Write (LED_2, True);

   Wait (500);

   Display_1.Clear_All;
   Display_2.Clear_All;
   Display_3.Clear_All;

   Display_1.Update;
   Display_2.Update;
   Display_3.Update;

   --Display_1.Set_Brightness (1);
   --Display_2.Set_Brightness (1);
   --Display_3.Set_Brightness (1);

   loop
      for I in 0 .. 9999 loop
         Display_1.Clear_All;
         Display_1.Set_Digit (1, (I / 1000) mod 10);
         Display_1.Set_Digit (2, (I / 100) mod 10);
         Display_1.Set_Digit (3, (I / 10) mod 10);
         Display_1.Set_Digit (4, I mod 10);
         Display_1.Update;
         Wait (10);
         Toggle := not Toggle;
         Digital_Write (LED_1, Toggle);
         Digital_Write (LED_1, not Toggle);
      end loop;
   end loop;
end Main;
