module bit_logic_operator ();

// 2-value
bit   [7:0] a = 8'b01xz_01xz;
int         d = 32'b01xz_01xz_01xz_01xz;

// 4-value
logic [7:0] b = 8'b01xz_01xz;
integer     c = 32'b01xz_01xz_01xz_01xz;

initial begin
  $display  ("Value of bit     a = %b", a);
  $display  ("Value of logic   b = %b", b);
  $display  ("Value of integer c = %b", c);
  $display  ("Value of int     d = %b", d);
  $display  (" bit + integer     = %b", a + c);
  $display  (" logic + int       = %b", b + d);
  a = 10;
  b = 20;
  c = 30;
  d = 40;
  $display  (" bit + logic       = %b", a + b);
  $display  (" integer + int     = %b", c + d);
end

endmodule
