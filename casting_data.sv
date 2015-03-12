module casting_data();

int a = 0;
shortint b = 0;

initial begin
  $monitor ("%g a = %d b = %h", $time, a , b);
  #1 a = int'(2.3 * 3.3);
  #1 b = shortint'{8'hDE,8'hAD,8'hBE,8'hEF};
  //#1 b = shortint'{8'hBE,8'hEF};
  #1 $finish;
end

endmodule
