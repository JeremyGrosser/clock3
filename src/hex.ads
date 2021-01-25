with HAL; use HAL;

package Hex is
   function To_String
      (Byte : UInt8)
      return String;

   function To_String
      (Bytes     : UInt8_Array;
       Delimiter : Character := ' ')
       return String
    with Pre => Bytes'Length <= 32;
end Hex;
