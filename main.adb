with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Buffers;
procedure Main is
   package MyBuffers is new Buffers(10, Integer);
   Buff: MyBuffers.Buffer;
   task type Generator(N: Integer; Start: Integer; Step: Integer) is
   end Generator;
   task body Generator is
      J: Integer := Start;
   begin
      for I in 1 .. N loop
         Buff.Put(J);
         J := J + Step;
      end loop;
   end Generator;
   task type Drukuj(N: Integer) is
   end Drukuj;
   task body Drukuj is
      J : Integer;
   begin
      for I in 1 .. N loop
         Buff.Get(J);
         Put(J);
         New_Line;
      end loop;
   end Drukuj;
   T0: Drukuj(300);
   T1: Generator(101, 1000, 3);
   T2: Generator(101, 2000, 3);
   T3: Generator(101, 3000, 3);
begin
   null;
end Main;
