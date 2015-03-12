`timescale 1ns/10ps

// Type define a struct
typedef struct {
  byte a;
  reg  b;
  shortint unsigned c;
} myStruct;

module typedef_data ();

// Full typedef here
typedef integer myinteger;

// Typedef declaration without type
//typedef myinteger;

// Typedef used here
myinteger a = 10;
myStruct object = '{10,0,100};

initial begin
  $display ("a = %d", a);
  $display ("Displaying object");
  $display ("a = %h b = %h c = %h", object.a, object.b, object.c);
  #1 $finish;
end

endmodule
