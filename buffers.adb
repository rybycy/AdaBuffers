package body Buffers is
   task body BufferTask is
      Size : Integer := 0;
      Actual_Size : Integer := 0;
      Data : Array(1..Size) of Element;
   begin
      loop
         select
            when Actual_Size < Size =>
               accept Put ( Obj : in Element ) do
                  Actual_Size := Actual_Size + 1;
                  Data( Actual_Size ) := Obj;
               end Put;
         or
            when Actual_Size > 0 =>
               accept Get (Obj : out Element) do
                  Obj := Data ( Actual_Size );
                  Actual_Size := Actual_Size - 1;
               end Get;

         end select;
      end loop;
   end BufferTask;

   procedure Putt ( Obj : in Element ) is
   begin
      BT.Put(Obj);
   end Putt;

   procedure Gett ( Obj : out Element ) is
   begin
      BT.Get(Obj);
   end Gett;

end Buffers;
