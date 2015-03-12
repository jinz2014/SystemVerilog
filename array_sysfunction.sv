`define print(func, array, dim, val) $display(`"$func(array, %0d) = %0d`", dim, val);

module array_sysfunction();
  logic [1:2][7:0] word [0:3][4:1];

  initial begin
    for (int i = 1; i <=4; i++) begin
      `print(left , word, i, $left(word, i))
      `print(right, word, i, $right(word, i))
      `print(low  , word, i, $low  (word, i))
      `print(high , word, i, $high (word, i))
      `print(size , word, i, $size (word, i))
    end
    $stop;
  end

endmodule
