with HAL.I2C; use HAL.I2C;
with HAL; use HAL;
with Ada.Unchecked_Conversion;

package DS3231 is
   type Device
      (Port    : not null Any_I2C_Port;
       Address : I2C_Address)
   is tagged limited null record;

   subtype Seconds_Type is Natural range 0 .. 59;
   subtype Minutes_Type is Natural range 0 .. 59;
   subtype Hours_Type is Natural range 0 .. 23;
   subtype Date_Type is Natural range 1 .. 31;
   subtype Month_Type is Natural range 1 .. 12;
   subtype Year_Type is Natural;

   type Date_Time is record
      Second : Seconds_Type;
      Minute : Minutes_Type;
      Hour   : Hours_Type;
      Day    : Date_Type;
      Month  : Month_Type;
      Year   : Year_Type;
   end record;

   procedure Initialize
      (This : in out Device);

   procedure Read
      (This : in out Device;
       Now  : out Date_Time);

private

   type Timer is record
      Seconds_10    : UInt3;
      Seconds       : UInt4;
      Minutes_10    : UInt3;
      Minutes       : UInt4;
      Hour_24       : Boolean;
      AM_PM         : Boolean;
      Hour_10       : Boolean;
      Hour          : UInt4;
      Day           : UInt3;
      Date_10       : UInt2;
      Date          : UInt4;
      Century       : Boolean;
      Month_10      : Boolean;
      Month         : UInt4;
      Year_10       : UInt4;
      Year          : UInt4;
   end record
      with Size => 8 * 7;
   for Timer use record
      Seconds_10    at 0 range 4 .. 6;
      Seconds       at 0 range 0 .. 3;
      Minutes_10    at 1 range 4 .. 6;
      Minutes       at 1 range 0 .. 3;
      Hour_24       at 2 range 6 .. 6;
      AM_PM         at 2 range 5 .. 5;
      Hour_10       at 2 range 4 .. 4;
      Hour          at 2 range 0 .. 3;
      Day           at 3 range 0 .. 2;
      Date_10       at 4 range 4 .. 6;
      Date          at 4 range 0 .. 3;
      Century       at 5 range 7 .. 7;
      Month_10      at 5 range 4 .. 4;
      Month         at 5 range 0 .. 3;
      Year_10       at 6 range 4 .. 7;
      Year          at 6 range 0 .. 3;
   end record;

end DS3231;
