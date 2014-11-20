
generic
   Size: Positive;
   type Element is private;
   BT : BufferTask;

package Buffers is

   --task type BufferTask is
   --   entry Put ( Obj : in Element );
   --   entry Get ( Obj : out Element );
   --end BufferTask;

   procedure Putt ( Obj : in Element );
   procedure Gett ( Obj : out Element );

end Buffers;
