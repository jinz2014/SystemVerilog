module break_loop ();

initial begin
  for (int i = 0 ; i < 10; i++) begin
    #1 $display ("Current value of i = %g", i);
    if ( i == 5) begin
      $display ("Coming out of for loop");
      break;
    end
  end
  #1 $finish;
end

endmodule
