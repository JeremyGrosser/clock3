package ESP8266 is
   procedure Initialize;

   procedure Enable;
   procedure Disable;

   procedure Get_Time
      (Hour, Minute, Second : out Natural);
end ESP8266;
