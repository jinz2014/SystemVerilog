module function_by_value ();

reg [7:0] data      ;
reg       parity_out;
integer   i         ;

function parity;
 input [31:0] data;
 integer i;
 begin
  parity = 0;
  for (i= 0; i < 32; i = i + 1) begin
    parity = parity ^ data[i];
  end
 end
endfunction

initial begin    
  parity_out = 0;
  for (i=250; i<256; i = i + 1) begin
   #5;
   parity_out = parity (i);
   $display ("Data = %b, Parity = %b", i, parity_out);
  end
  #10 $finish;
end

endmodule
