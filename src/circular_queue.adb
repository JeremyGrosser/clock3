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
      Extra : access Element_Type;
   begin
      if This.Used = Size then
         Extra := Consume (This);
      end if;
      if This.Tail = Index_Type'Last then
         This.Tail := Index_Type'First;
      else
         This.Tail := This.Tail + 1;
      end if;
      This.Elements (This.Tail) := Item;
      This.Used := This.Used + 1;
   end Add;

   function Consume
      (This : in out Queue)
      return access Element_Type
   is
      Item : access Element_Type := This.Elements (This.Head)'Access;
   begin
      if This.Head >= Index_Type'Last then
         This.Head := Index_Type'First;
      else
         This.Head := This.Head + 1;
      end if;
      This.Used := This.Used - 1;
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
