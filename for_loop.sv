module for_loop ();

initial begin
  fork // two for loops execute in parallel
    for (int i = 0 ; i < 4; i ++) begin
      #1 $display ("@%t First  -> Current value of i = %g", $time, i);
    end
    for (int i = 4 ; i > 0; i --) begin
      #1 $display ("@%t Second -> Current value of i = %g", $time, i);
    end
  join
  #1 $finish;
end

endmodule
