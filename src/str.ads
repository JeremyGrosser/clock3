package Str is
   pragma Pure;

   function Find
      (S : String;
       C : Character)
       return Natural;

   function Find_Number
      (S : String)
      return Natural;

   function To_Natural
      (S    : String;
       Base : Positive := 10)
      return Natural;

   function Split
      (S         : String;
       Delimiter : Character;
       Skip      : Natural)
       return String;

   function Strip
      (S : String;
       C : Character)
       return String;

   function Starts_With
      (S      : String;
       Prefix : String)
       return Boolean;
end Str;
