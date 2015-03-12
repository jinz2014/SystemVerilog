module packed_unpacked_data();

// packed array
bit [7:0] packed_array = 8'hAA; 
reg [7:0] packed_reg_array = 8'hAA; 
wire [7:0] packed_wire_array = 8'hAA; 
logic [7:0] packed_logic_array = 8'hAA; 

// unpacked array
reg unpacked_array [7:0] = '{0,0,0,0,0,0,0,1}; 
reg [1:0] unpacked_array1 [7:0] = '{0,0,0,0,0,0,0,1}; 

initial begin
  $display ("packed array[0]   = %b", packed_array[0]);
  $display ("packed array[1]   = %b", packed_array[1]);
  $display ("packed array[2]   = %b", packed_array[2]);
  $display ("packed array[3]   = %b", packed_array[3]);
  $display ("unpacked array[0] = %b", unpacked_array[0]);
  $display ("packed array      = %h", packed_array);

  // Below one is wrong syntax
  //$display("unpacked array[0] = %b",unpacked_array);
  #1 $finish;
end

endmodule
