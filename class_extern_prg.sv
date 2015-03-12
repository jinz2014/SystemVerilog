program class_exterm_prg;

 `include "class_extern.sv"

class_extern c;

initial begin
  c = new();
  c.print();
  $finish;
end

endprogram
