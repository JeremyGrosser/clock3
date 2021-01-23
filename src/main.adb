with Board; use Board;

procedure Main is
begin
   Board.Initialize;
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
