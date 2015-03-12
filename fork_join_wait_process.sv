module fork_join_wait_process();

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
  #5; // at 0 came out of fork-join_none
      // now at 5 
  fork 
    #1 print_value (1,1);
    #1 print_value (2,2);
    #1 print_value (3,3);
  join_any

  $display("@%g Came out of fork-join", $time);

  // Wait till all the forks (threads are completed their execution)
  wait fork;
  $display("@%g All threads completed execution", $time);
  #20 $finish;
end

endmodule
