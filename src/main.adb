with Board; use Board;
with Clock;

procedure Main is
   Toggle : Boolean := False;
begin
   Pin_Mode (LED_1, Output);
   Pin_Mode (LED_2, Output);
   Digital_Write (LED_1, True);
   Digital_Write (LED_2, True);

   Clock.Initialize;

   loop
      Clock.Update;
      Toggle := not Toggle;
      Digital_Write (LED_1, Toggle);
      Digital_Write (LED_2, not Toggle);
      Wait (1000);
      --Wait_For_Interrupt;
   end loop;
end Main;
