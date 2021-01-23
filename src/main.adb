with Board; use Board;
with HT16K33;

procedure Main is
   Display_1 : access HT16K33.Device := new HT16K33.Device (Address => 16#70#);
   Display_2 : access HT16K33.Device := new HT16K33.Device (Address => 16#71#);
   Display_3 : access HT16K33.Device := new HT16K33.Device (Address => 16#72#);
begin
   Board.Initialize;
   Display_1.Initialize;
   Display_2.Initialize;
   Display_3.Initialize;
   Pin_Mode (LED_1, Output);
   Pin_Mode (LED_2, Output);
   loop
      Digital_Write (LED_1, High);
      Digital_Write (LED_2, Low);
      Wait (100);
      Digital_Write (LED_1, Low);
      Digital_Write (LED_2, High);
      Wait (100);
   end loop;
end Main;
