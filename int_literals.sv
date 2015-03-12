`timescale 1ns/100ps
module int_literals ();

integer a;

initial begin
  $monitor ("@ %gns a = %h", $time, a);
  a = '0;
  #1 a = 'x; // xxxxxxxx
  #1 a = '1; // 11111111
  #1 a = 'z; // zzzzzzzz
  #1 a = 'b0;
  #1 a = 'bx; // xxxxxxxx
  #1 a = 'b1; // 00000001
  #1 a = 'bz; // zzzzzzzz
  #1 $finish;
end

endmodule
