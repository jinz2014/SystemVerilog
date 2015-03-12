module while_loop ();

byte a = 0;

initial begin
  do begin
    $display ("Current value of a = %g", a);
    a++;
  end while  (a < 10);

  a = 0;
  while (a < 10) begin
    $display ("Current value of a = %g", a);
    a++;
  end

  #1 $finish;

end

endmodule
