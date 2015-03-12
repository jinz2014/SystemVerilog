module integer_associative_array ();

integer as_mem [integer];

integer i;

initial begin
  // Add element array
  as_mem[100] = 101;
  $display ("value stored in 100 is %d", 101);
  as_mem[1]   = 100;
  $display ("value stored in 1   is %d", 100);
  as_mem[50]   = 99;
  $display ("value stored in 50  is %d", 99);
  as_mem[256] = 77;
  $display ("value stored in 256 is %d", 77);

  // Print the size of array
  $display ("size of array is %d", as_mem.num());

  // Check if index 2 exists
  $display ("index 2 exists   %d", as_mem.exists(2));

  // Check if index 100 exists
  $display ("index 100 exists %d", as_mem.exists(100));

  // Value stored in first index
  if (as_mem.first(i)) begin
    $display ("value at first index %d value %d", i, as_mem[i]);
  end

  // Value stored in last index
  if (as_mem.last(i)) begin
    $display ("value at last index  %d value %d", i,  as_mem[i]);
  end

  // Delete the index 100
  as_mem.delete(100);
  $display ("Deleted index 100");

  // Value stored in first index
  if (as_mem.first(i)) begin
    $display ("value at first index %d value %d", i, as_mem[i]);
  end

  #1 $finish;
end

endmodule
