module fork_join_disable_process();

task automatic print_value;
  input [7:0] value;
  input [7:0] delay;
  begin
    #(delay) $display("@%g Passed Value %d Delay %d",
      $time, value, delay);
  end
endtask

initial begin
  fork 
    #1 print_value (10,7);
    #1 print_value (8,5);
    #1 print_value (4,2);
  join_none
  $display("@%g Came out of fork-join", $time);
  // terminate all the theads
  #5 disable fork;
  $display("@%g All threads are disabled", $time);
  #20 $finish;
end

endmodule
