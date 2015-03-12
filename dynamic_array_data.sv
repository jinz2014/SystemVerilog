module dynamic_array_data();

// Declare dynamic array
reg [7:0] mem [];

initial begin

  // Allocate array for 4 locations
  $display ("Setting array size to 4");
  mem = new[4];

  $display("Initial the array with default values");
  for (int i = 0; i < 4; i ++) begin
    mem[i] = i;
  end

  // Doubling the size of array, with old content still valid
  // *** New contents are all 'x' ***
  mem = new[8] (mem);

  // Print current size
  $display ("Current array size is %d",mem.size());
  for (int i = 0; i < 8; i ++) begin
    $display ("Value at location %g is %d ", i, mem[i]);
  end

  // Doubling the size of array again, with old content still valid ? No
  mem = new[16];
  // Print current size
  $display ("Current array size is %d",mem.size());
  for (int i = 0; i < 16; i ++) begin
    $display ("Value at location %g is %d ", i, mem[i]);
  end

  // Delete array
  $display ("Deleting the array and the size becomes 0");
  mem.delete();
  $display ("Current array size is %d",mem.size());
  #1 $finish;
end

endmodule
