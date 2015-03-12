module function_optional_list ();

reg [7:0] data      ;
reg       parity_out;
time      ltime;

function reg parity (reg [7:0] a = 8'hAA, time b = 0, time c = 0);
 parity = 0;
 for (int i= 0; i < 8; i++) begin
    parity = parity ^ a[i];
 end
endfunction

initial begin    
  parity_out = parity(); // () is not optional!
  $display ("Data = %00000000b, Parity = %b", 8'hAA, parity_out);

  data = 8'hFF;
  parity_out = parity(data); 
  $display ("Data = %00000000b, Parity = %b", data, parity_out);

  #10 $finish;
end

endmodule
