with HAL.I2C; use HAL.I2C;

package body DS3231 is
   procedure Initialize
      (This : in out Device)
   is
   begin
      null;
   end Initialize;

   procedure Read
      (This : in out Device;
       Now  : out Date_Time)
   is
      Addr   : I2C_Data (1 .. 1) := (1 => 0);
      Status : I2C_Status;
      Data   : I2C_Data (0 .. Timer'Size / 8) := (others => 0);
      T      : Timer;
      for T'Address use Data'Address;
   begin
      This.Port.Master_Transmit (This.Address, Addr, Status);
      This.Port.Master_Receive (This.Address, Data, Status);
      Now :=
         (Year   => Natural (T.Year) + (10 * Natural (T.Year_10)),
          Month  => Natural (T.Month),
          Day    => Natural (T.Date) + (10 * Natural (T.Date_10)),
          Hour   => Natural (T.Hour) + (10 * Natural (T.Hour)),
          Minute => Natural (T.Minutes) + (10 * Natural (T.Minutes_10)),
          Second => Natural (T.Seconds) + (10 * Natural (T.Seconds_10)));
      if T.Month_10 then
         Now.Month := Now.Month + 10;
      end if;
      if T.Century then
         Now.Year := Now.Year + 2000;
      else
         Now.Year := Now.Year + 1900;
      end if;
   end Read;

end DS3231;
