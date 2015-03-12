module continue_loop ();

initial begin
  for (int i = 0 ; i < 10; i ++) begin
    if ( (i >= 5) && (i < 8)) begin
      $display ("Continue with next interation");
      continue;
    end
    #1 $display ("Current value of i = %g", i);
  end
  #1 $finish;
end

endmodule
