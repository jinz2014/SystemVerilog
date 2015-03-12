module  struct_expr_operator();

typedef struct { 
  string name; 
  int id; 
} myStruct; 

myStruct s1; 
int k = 1; 

initial begin 
  // by position 
  #1 s1 = '{"john", k}; 
  #1 $display("Value of name = %s id %g by position", s1.name, s1.id); 

  // by name 
  //#1 s1 = '{x:2, y:3+k}; 
  #1 s1 = '{id:3+k, name:"paul"};
  #1 $display("Value of s1 ", s1, " by name"); 
  #1 $finish; 
end

endmodule
