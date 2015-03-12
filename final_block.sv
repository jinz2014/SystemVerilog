module final_block ();

initial begin
  for (int i = 0 ; i < 10; i ++) begin
    if ( (i >= 5) && (i < 8)) begin
      $display ("@%g Continue with next interation", $time);
      continue;
    end
    #1 $display ("@%g Current value of i = %g", $time, i);
  end
  #1 $finish;
end

final begin
  $display ("Final block called at time %g", $time);
  $display ("---- We can not have delays in it ----");
end

endmodule
