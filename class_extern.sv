`ifndef CLASS_EXTERN_SV
`define CLASS_EXTERN_SV

`include "class_extern.svi"

function class_extern::new();
  this.address = $random; 
  this.data = {$random,$random};
  this.crc  = $random;
endfunction

task class_extern::print();
  $display("Address : %x",address);
  $display("Data    : %x",data);
  $display("CRC     : %x",crc);
endtask

`endif
