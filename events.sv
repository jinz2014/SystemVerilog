module events();
// Declare a new event called ack
event ack; 
// Declare done as alias to ack 
event done = ack; 
// Event variable with no synchronization object
event empty = null; 

// Declare a new event called ready
event ready;

initial begin
  #1 -> ack;   // triggers ack and done
  #1 -> empty;
  #1 -> done;   // triggers ack and done
  #1 -> ready;
  #1 $finish;
end

always @ (ack)
begin
  $display($time,, "ack event emitted");
end

always @ (done)
begin
  $display($time,, "done event emitted");
end

always @ (ready)
begin
  $display($time,,"ready event emitted");
end

always @ (empty)
begin
  $display($time,,"empty event emitted");
end

endmodule
