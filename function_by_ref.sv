// 1 modelsim reports error if the function that has "ref" argument type is not automatic 
// 2 Passing a non-dynamic array (data2) to a dynamic ref formal (a) is illegal
//   for example, display_da(data2);
module function_by_ref ();

reg [7:0] data      ;
reg [7:0] data1 [] = {1, 2,3};
reg [7:0] data2 [3]= {4,5,6};

reg       parity_out;

time      ltime;

function automatic void display_da(const ref reg [7:0] a[]);
  foreach (a[i])
    $display("%d ", a[i]);
endfunction

function automatic void display_fa(const ref reg [7:0] a[3]);
  foreach (a[i])
    $display("%d ", a[i]);
endfunction

function automatic reg parity (ref reg [7:0] idata, const ref time tdata);
 parity = 0;
 for (int i= 0; i < 8; i ++) begin
    parity = parity ^ idata[i];
 end
 // We can modify the data passed through reference
 idata ++ ;
 // Something that is passed as const  ref, can  not be modified
 // tdata ++ ; This is wrong
endfunction

initial begin    
  parity_out = 0;
  data = 0;
  for (int i=250; i<256; i ++) begin
   #5 data = i;
   ltime = $time;
   parity_out = parity (data, ltime);
   $display ("Data = %00000000b, Parity = %b, Modified data : %b",
      i, parity_out, data);
  end
  
  //display_da(data);  // formal doesn't match actual
  display_da(data1);
  
  display_fa(data2);
  
  #10 $finish;
end

endmodule
