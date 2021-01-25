package body Circular_Queue is
   function First
      (This : Queue)
      return Element_Type
   is (This.Elements (This.Head));

   function Last
      (This : Queue)
      return Element_Type
   is (This.Elements (This.Tail));

   function Available
      (This : Queue)
      return Natural
   is (Size - This.Used);

   function Empty
      (This : Queue)
      return Boolean
   is (This.Used = 0);

   procedure Add
      (This : in out Queue;
       Item : Element_Type)
   is
      Tail : Index_Type := This.Tail;
      Used : Natural := This.Used + 1;
   begin
      if Tail = Index_Type'Last then
         Tail := Index_Type'First;
      else
         Tail := Tail + 1;
      end if;
      This.Tail := Tail;
      This.Elements (This.Tail) := Item;
      This.Used := Used;
   end Add;

   function Consume
      (This : in out Queue)
      return access Element_Type
   is
      Head : Index_Type := This.Head;
      Used : Natural := This.Used - 1;
      Item : access Element_Type := This.Elements (Head)'Access;
   begin
      if Head >= Index_Type'Last then
         Head := Index_Type'First;
      else
         Head := Head + 1;
      end if;
      This.Head := Head;
      This.Used := Used;
      return Item;
   end Consume;

   procedure Clear
      (This : in out Queue)
   is
   begin
      This.Head := Index_Type'First + 1;
      This.Tail := Index_Type'First;
      This.Used := 0;
   end Clear;
end Circular_Queue;
