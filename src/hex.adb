package body Hex is
   function To_String
      (Nibble : UInt4)
      return Character
   is
      Hex : constant String := "0123456789abcdef";
   begin
      return Hex (Natural (Nibble) + 1);
   end To_String;

   function To_String
      (Byte : UInt8)
      return String
   is
      Result : constant String :=
         (To_String (UInt4 (Shift_Right (Byte, 4))),
          To_String (UInt4 (Byte and 16#F#)));
   begin
      return Result;
   end To_String;

   function To_String
      (Bytes     : UInt8_Array;
       Delimiter : Character := ' ')
       return String
   is
      Result : String (1 .. (Bytes'Length * 3) - 1);
      J      : Natural;
   begin
      for I in 0 .. (Bytes'Length - 1) loop
         J := (I * 3) + Result'First;
         Result (J .. J + 1) := To_String (Bytes (Bytes'First + I));
         if J + 2 <= Result'Length then
            Result (J + 2) := Delimiter;
         end if;
      end loop;
      return Result;
   end To_String;
end Hex;
