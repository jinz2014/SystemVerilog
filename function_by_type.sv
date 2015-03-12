module function_by_static ();

int count;

function automatic int count_ones_auto;
 input [31:0] data;

 // static
 int count = 0;
 int temp = data;
 for (int i= 0; i < 32; i = i + 1) begin
   if (temp[0]) count++;
   temp >>= 1;
 end

 return count;
endfunction

function int count_ones_static;
 input [31:0] data;

 // static
 int count = 0;
 int temp = data;
 for (int i= 0; i < 32; i = i + 1) begin
   if (temp[0]) count++;
   temp >>= 1;
 end

 return count;
endfunction

initial begin    
  for (int i=250; i<256; i = i + 1) begin
   #5;
   count = count_ones_static (i);
   $display ("input = %b, count_ones = %d", i, count);
  end

  for (int i=250; i<256; i = i + 1) begin
   #5;
   count = count_ones_auto (i);
   $display ("input = %b, count_ones = %d", i, count);
  end


  #10 $finish;
end

endmodule

