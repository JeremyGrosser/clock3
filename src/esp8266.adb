with Board; use Board;
with HAL; use HAL;
with Ada.Text_IO; use Ada.Text_IO;
with Hex; use Hex;

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
   end Enable;

   procedure Disable is
   begin
      Digital_Write (ESP_EN, False);
   end Disable;

   procedure Wait_Ok
   is
      CH1, CH2 : UInt8 := 0;
   begin
      loop
         CH2 := Serial_Get;
         if CH1 = 79 and CH2 = 75 then
            return;
         else
            CH1 := CH2;
         end if;
      end loop;
   end Wait_Ok;

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
      use ASCII;
   begin
      Pin_Mode (ESP_EN, Output);
      Disable;
      Pin_Mode (ESP_RST, Output);
      Pin_Mode (ESP_GPIO_15, Output);
      Pin_Mode (ESP_GPIO_2, Output);
      Pin_Mode (ESP_GPIO_0, Output);
      Set_Boot_Mode (Normal);
      Enable;
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
      Serial_Write (To_Array ("wifi.setmode(wifi.STATION)" & CRLF));
      Wait_For ('>');
      Serial_Write (To_Array ("wifi.sta.config({ssid=""sierra24"",pwd=""whatevenisapassword""})" & CRLF));
      Wait_For ('>');
      Wait (5000);
      Serial_Write (To_Array ("sntp.sync()" & CRLF));
      Wait_For ('>');
      Wait (5000);
      Serial_Write (To_Array ("rtctime.get()" & CRLF));
      Wait_For (ASCII.LF);
      Wait_For (ASCII.LF);

      Hour := 0;
      Minute := 0;
      Second := 0;
   end Get_Time;
end ESP8266;
