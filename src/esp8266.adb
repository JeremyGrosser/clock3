with SAMD21_SVD.Interrupts; use SAMD21_SVD.Interrupts;
with Board; use Board;
with HAL; use HAL;
with Str; use Str;

package body ESP8266 is
   ESP_RST     : Pins := D4;
   ESP_EN      : Pins := D5;
   ESP_GPIO_15 : Pins := D10;
   ESP_GPIO_2  : Pins := D11;
   ESP_GPIO_0  : Pins := D12;

   type Boot_Mode is (Normal, Program, SD_Card);

   procedure Set_Boot_Mode
      (Mode : Boot_Mode)
   is
   begin
      case Mode is
         when Normal =>
            Digital_Write (ESP_GPIO_0, True);
            Digital_Write (ESP_GPIO_2, True);
            Digital_Write (ESP_GPIO_15, False);
         when Program =>
            Digital_Write (ESP_GPIO_0, False);
            Digital_Write (ESP_GPIO_2, True);
            Digital_Write (ESP_GPIO_15, False);
         when SD_Card =>
            Digital_Write (ESP_GPIO_0, False);
            Digital_Write (ESP_GPIO_2, False);
            Digital_Write (ESP_GPIO_15, True);
      end case;
   end Set_Boot_Mode;

   procedure Reset is
   begin
      Digital_Write (ESP_RST, False);
      Wait (10);
      Digital_Write (ESP_RST, True);
      Wait (500);
   end Reset;

   procedure Enable is
   begin
      Digital_Write (ESP_EN, True);
      Reset;
      Byte_Queue.Clear (Serial_Buffer);
      Enable_Interrupt (SERCOM2_Interrupt);
   end Enable;

   procedure Disable is
   begin
      Digital_Write (ESP_EN, False);
      Disable_Interrupt (SERCOM2_Interrupt);
   end Disable;

   function To_String
      (U : UInt8_Array)
      return String
   is
      S : String (1 .. U'Length);
      J : Positive := S'First;
   begin
      for I in U'Range loop
         S (J) := Character'Val (U (I));
         J := J + 1;
      end loop;
      return S;
   end To_String;

   function To_Array
      (S : String)
      return UInt8_Array
   is
      U : UInt8_Array (S'Range);
   begin
      for I in S'Range loop
         U (I) := UInt8 (Character'Pos (S (I)));
      end loop;
      return U;
   end To_Array;

   procedure Initialize is
   begin
      Pin_Mode (ESP_EN, Output);
      Disable;
      Pin_Mode (ESP_RST, Output);
      Pin_Mode (ESP_GPIO_15, Output);
      Pin_Mode (ESP_GPIO_2, Output);
      Pin_Mode (ESP_GPIO_0, Output);
      Set_Boot_Mode (Normal);
      --Set_Boot_Mode (Program);
      --Enable;
   end Initialize;


   procedure Get_Time (Hour, Minute, Second : out Natural)
   is
      procedure Wait_For (Ch : Character) is
      begin
         loop
            exit when Character'Val (Serial_Get) = Ch;
         end loop;
      end Wait_For;

      CRLF : constant String := ASCII.CR & ASCII.LF;
   begin
      Board.Byte_Queue.Clear (Serial_Buffer);
      Wait (1000);
      Serial_Write (To_Array ("wifi.setmode(wifi.STATION)" & CRLF));
      Wait (20);
      Serial_Write (To_Array ("function on_time(sec,usec,server,info) " & CRLF & "tm = rtctime.epoch2cal(sec)" & CRLF & "print(string.format(""!TIME=%04d-%02d-%02dT%02d:%02d:%02d"", tm[""year""], tm[""mon""], tm[""day""], tm[""hour""], tm[""min""], tm[""sec""]))" & CRLF & "end" & CRLF));
      Wait (20);
      Serial_Write (To_Array ("wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function() sntp.sync(nil, on_time) end)" & CRLF));
      Wait (20);
      Serial_Write (To_Array ("wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function() print(""!CONNECTED"") end)" & CRLF));
      Wait (20);
      Serial_Write (To_Array ("wifi.sta.config({ssid=""sierra24"",pwd=""whatevenisapassword""})" & CRLF));
      Wait (20);
      Board.Byte_Queue.Clear (Serial_Buffer);

      loop
         Wait_For ('!');
         declare
            Line : String := Serial_Get_Line;
         begin
            if Starts_With (Line, "TIME=") then
               declare
                  Hour_Str   : String := Line (Find (Line (Line'First + 1 .. Line'Last), 'T') + 1 .. Find (Line, ':') - 1);
                  Minute_Str : String := Line (Hour_Str'Last + 2 .. Hour_Str'Last + 3);
                  Second_Str : String := Line (Minute_Str'Last + 2 .. Minute_Str'Last + 3);
               begin
                  Hour   := To_Natural (Hour_Str);
                  Minute := To_Natural (Minute_Str);
                  Second := To_Natural (Second_Str);
                  return;
               end;
            end if;
         end;
      end loop;
   end Get_Time;
end ESP8266;
