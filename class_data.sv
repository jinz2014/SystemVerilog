module class_data();

// Class with local fields
class Packet;
  int address; 
  bit [63:0] data;
  shortint crc;

  task print_packet;
    $display("address = %d data = %h crc = %d", 
              address, data, crc);
  endtask:print_packet

endclass:Packet

// Class with task
class print;
  task print_io (input string msg);
    $display("%s",msg); 
  endtask:print_io
endclass:print

// Create instance
Packet p;
print  prn;

initial begin
  // Allocate memory
  p = new();
  prn = new();

  // Assign values
  p.address = 32'hDEAD_BEAF;
  p.data = {4{16'h55AA}};
  p.crc  = 0; 

  // Print all the assigned values using method
  p.print_packet;

  prn.print_io("Test calling task inside class");

  $finish;
end

endmodule
