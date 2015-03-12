module streaming();

//-------------------------------
// PACK Example
//-------------------------------
int j = { "A", "B", "C", "D" };

bit [31:0] stream;

initial begin
 $display("       PACK");
 $display("Value of j is %0x",j);
 $monitor("@%0dns stream value is %x",$time, stream);
 #1 stream = { << byte {j}}; 
 #1 stream = { >> {j}} ;
 #1 stream = { << { 8'b0011_0101 }};
 #1 stream = { << 16 {j}}; 
 #1 stream = { << 4 { 6'b11_0101 }};
 #1 stream = { >> 4 { 6'b11_0101 }} ;
 #1 stream = { << 2 { { << { 4'b1101 }} }};
end

//-------------------------------
// UNPACK Example
//-------------------------------
int          a, b, c;
logic [10:0] up [3:0];
logic [11:1] p1, p2, p3, p4;
bit   [96:1] y;
int          j ;
bit   [99:0] d;

initial begin
  #20;
  $display("       UNPACK");
  // Below line should give compile error
  //{>>{ a, b, c }} = 23'b1; 
  {>>{ a, b, c }} = 96'b1; 
  $display("@%0dns a %x b %x c %x",$time,a,b,c);
  {>>{ a, b, c }} = 100'b1; 
  $display("@%0dns a %x b %x c %x",$time,a,b,c);
  { >> {p1, p2, p3, p4}} = up; 
  $display("@%0dns p1 %x p2 %x p3 %x p4 %x",$time,p1,p2,p3,p4);
  y = {>>{ a, b, c }};
  $display("@%0dns y %x",$time,y);
  // Below line should give compile error
  //j = {>>{ a, b, c }};
  d = {>>{ a, b, c }};
  $display("@%0dns d %x",$time,d);
end

endmodule
