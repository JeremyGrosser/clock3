generic
   Size : Positive := 1;
   type Element_Type is private;
package Circular_Queue is
   pragma Preelaborate;
   pragma Pure;

   type Index_Type is new Positive range 1 .. Size;

   type Element_Array is array (Index_Type) of aliased Element_Type;

   type Queue is record
      Elements : Element_Array;
      Head     : Index_Type := Index_Type'First + 1;
      Tail     : Index_Type := Index_Type'First;
      Used     : Natural := 0;
   end record;

   function First
      (This : Queue)
      return Element_Type;

   function Last
      (This : Queue)
      return Element_Type;

   function Available
      (This : Queue)
      return Natural;

   function Empty
      (This : Queue)
      return Boolean;

   procedure Add
      (This : in out Queue;
       Item : Element_Type)
   with Pre => Available (This) > 0;

   function Consume
      (This : in out Queue)
      return access Element_Type
   with Pre => not Empty (This);

   procedure Clear
      (This : in out Queue);

end Circular_Queue;
