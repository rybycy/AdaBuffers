generic
   Size: in Positive;
   type Elem;

package Buffers is

   task type Buffer is
      entry Put ( Obj : in Integer );
      entry Get ( Obj : out Integer );
   end Buffer;

end Buffers;
