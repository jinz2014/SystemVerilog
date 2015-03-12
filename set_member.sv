// http://www.asic-world.com/systemverilog/operators7.html 

// "inside" operator 

module set_member();

int array_set1 [$] = {1,2,3,4,5,6,7};
int array_set2 [$] = {10,2,3,40,5,11,7};
int array_set3 [7] = {1,2,3,4,5,6,7};
int check;

initial begin 

  check = 0;
  $display("check = %d", check);

  // use {} to indicate a list of ranges
  if (check inside {array_set1}) begin
    $display("check is inside array_set1");
  end else begin
    $display("check is not inside array_set");
  end

  check = 5;
  $display("check = %d", check);

  if (check inside {array_set2}) begin
    $display("check is inside array_set2");
  end else begin
    $display("check is not inside array_set2");
  end

  if (check inside {array_set3}) begin
    $display("check is inside array_set3");
  end else begin
    $display("check is not inside array_set3");
  end

  check = 11;
  $display("check = %d", check);
  if (check inside {array_set1, array_set2}) begin
    $display("check is inside array_set 1 and 2");
  end else begin
    $display("check is not inside array_set 1 and 2");
  end

  check = 12;  // not a member
  //check = 10;    // is a member
  $display("check = %d", check);
  // Constant range
  if (check inside {[0:10], [11:12]}) begin
    $display("check is inside array_set");
  end else begin
    $display("check is not inside array_set");
  end
  $finish;

end

endmodule
