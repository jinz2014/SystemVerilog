module return_value_function ();


initial begin
 printI(); // treat printI as an implicit VOID cast
 $display ("Value returned from function = %g", printI());
 #1 $finish;
end

function int printI;
begin
  for (int i = 0 ; i < 10; i ++) begin
    if (i >= 5) begin
      return i ; // value returned
    end
    $display ("Current value of i = %g", i);
  end
end
endfunction

endmodule
