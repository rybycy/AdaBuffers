with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Buffers is
   task body Buffer is
      Start : Integer := 0;
      Actual_Size : Integer := 1;
      Data : Array(0..Size-1) of Integer;
      Test : Boolean := False ;
   begin
      loop
         select
            when ((Size > 1 and Start /= Actual_Size) or (Size = 1 and not Test)) =>
            accept Put ( Obj : in Integer ) do

               Data( Actual_Size - 1 ) := Obj;
               Actual_Size := (Actual_Size + 1 ) mod Size;
               Test := True;

            end Put;
         or
            when ((Size > 1 and (Start /= ((Actual_Size - 1) mod Size))) or (Size = 1 and Test)) =>
            accept Get (Obj : out Integer) do
               Obj := Data ( Start );
               Start := (Start + 1) mod Size;
               Test := False;

            end Get;
         or
            terminate;
         end select;
      end loop;
   end Buffer;
end Buffers;
