with Board; use Board;
with SAMD21.Device;
with HAL.I2C;
with HT16K33;
with Seven;
with ESP8266;

with HAL; use HAL;

package body Clock is
   function Hour_Offset
      (UTC    : Integer;
       Offset : Integer)
       return Integer
   is
   begin
      if (UTC + Offset) < 0 then
         return UTC + 24 + Offset;
      elsif (UTC + Offset) > 24 then
         return UTC - 24 + Offset;
      else
         return UTC + Offset;
      end if;
   end Hour_Offset;

   procedure Initialize is
      UTC_Hour, Minute, Second : Natural;
   begin
      Board.Initialize;

      SAMD21.Device.I2C_1.Enable;
      Display_1.Initialize;
      Display_2.Initialize;
      Display_3.Initialize;

      Display_1.Set_Brightness (HT16K33.Brightness_Level'First);
      Display_2.Set_Brightness (HT16K33.Brightness_Level'First);
      Display_3.Set_Brightness (HT16K33.Brightness_Level'First);

      ESP8266.Initialize;
      ESP8266.Enable;
      ESP8266.Get_Time (UTC_Hour, Minute, Second);
      ESP8266.Disable;
      Set_RTC (UTC_Hour, Minute, Second);

      Display_1.Clear_All;
      Display_2.Clear_All;
      Display_3.Clear_All;

      Display_1.Update;
      Display_2.Update;
      Display_3.Update;

      --Disable_Interrupt (15); -- No SysTick after startup
   end Initialize;

   procedure Update is
      UTC_Hour, EST_Hour, PST_Hour, Minute, Second : Natural;
   begin
      Get_RTC (UTC_Hour, Minute, Second);
      EST_Hour := Natural (Hour_Offset (UTC_Hour, -5));
      PST_Hour := Natural (Hour_Offset (UTC_Hour, -8));

      Display_1.Set_Digit (1, (PST_Hour / 10) mod 10);
      Display_1.Set_Digit (2, PST_Hour mod 10);
      Display_1.Set_Digit (3, (Minute / 10) mod 10);
      Display_1.Set_Digit (4, Minute mod 10);

      Display_2.Set_Digit (1, (EST_Hour / 10) mod 10);
      Display_2.Set_Digit (2, EST_Hour mod 10);
      Display_2.Set_Digit (3, (Minute / 10) mod 10);
      Display_2.Set_Digit (4, Minute mod 10);

      Display_3.Set_Digit (1, (UTC_Hour / 10) mod 10);
      Display_3.Set_Digit (2, UTC_Hour mod 10);
      Display_3.Set_Digit (3, (Minute / 10) mod 10);
      Display_3.Set_Digit (4, Minute mod 10);

      Display_1.Update;
      Display_2.Update;
      Display_3.Update;
   end Update;
end Clock;
