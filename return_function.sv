module return_function ();

initial begin
 printI();
 #1 $finish;
end

function void printI;
begin
  for (int i = 0 ; i < 10; i ++) begin
    if (i >= 5) begin
      return; // no value returned
    end
    $display ("Current value of i = %g", i);
  end
end
endfunction


endmodule
