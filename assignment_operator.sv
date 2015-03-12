module assignment_operator ();

// a, d are unsigned number
reg [31:0] a = 32'hf000_0000;

// b, c are signed number
integer b = 32'hf000_0000;
int c = 32'hf000_0000;


reg [31:0] d = 32'hf000_0000;

initial begin
  $display (" a         := %h",  a );  
  a += 4; 
  $display (" a += 4    := %h",  a );  
  a -= 4; 
  $display (" a -= 4    := %h",  a ); 
  a *= 4; 
  $display (" a *= 4    := %h",  a ); 
  a /= 4; 
  $display (" a /= 4    := %h",  a ); 
  a %= 17; 
  $display (" a %s= 17    := %h", "%", a ); 
  a &= 16'hFFFF; 
  $display (" a &= 16'hFFFF    := %h",  a ); 
  a |= 16'hFFFF; 
  $display (" a |= 16'hFFFF    := %h",  a ); 
  a ^= 16'hAAAA; 
  $display (" a ^= 16h'AAAA    := %h",  a ); 
  a <<= 4; 
  $display (" a <<= 4   := %h",  a ); 
  a >>= 4; 
  $display (" a >>= 4   := %h",  a ); 
  a <<<= 14; 
  $display (" a <<<= 14  := %h",  a ); 

  a >>>= 14; 
  $display (" a >>>= 14  := %h",  a );

  b >>>= 14; 
  $display (" b >>>= 14  := %h",  b );

  c >>>= 14; 
  $display (" c >>>= 14  := %h",  c );

  d >>>= 14; 
  $display (" d >>>= 14  := %h",  d );

  b %= 17; 
  $display (" b %s= 17    := %h", "%", b); 
  b &= 16'hFFFF; 
  $display (" b &= 16'hFFFF    := %h", b); 
  b |= 16'hFFFF; 
  $display (" b |= 16'hFFFF    := %h", b); 
  b ^= 16'hAAAA; 
  $display (" b ^= 16h'AAAA    := %h", b); 

  #1 $finish;
end

endmodule
