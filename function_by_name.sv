module function_by_name ();

reg [7:0] data      ;
reg       parity_out;

time      ltime;

function automatic reg parity (ref reg [7:0] idata, ref time itime);
 parity = 0;
 for (int i= 0; i < 8; i ++) begin
    parity = parity ^ idata[i];
 end
 // We can modify the data passed through reference
 idata ++ ;

 // We can modify the data passed through reference
 itime ++ ;
endfunction

initial begin    
  parity_out = 0;
  data = 0;
  for (int i=250; i<256; i++) begin
   #5 data = i;
   ltime = $time;

   // Args by Name
   parity_out = parity (.idata(data), .itime(ltime));

   // Args by position and name
   parity_out = parity (data, .itime(ltime));

   // This is wrong, by name should not be before position
   //parity_out = parity (.idata(data), ltime);

   $display ("Data = %00000000b, Parity = %b, Modified data : %b",
     i, parity_out, data);
  end
  #10 $finish;
end

endmodule
