module foreach_loop ();

// looks that we can omit the '...
byte a [10] = {0,6,7,4,5,66,77,99,22,11};
byte b [10] = '{0,6,7,4,5,66,77,99,22,11};

// initialize a dynamic array
byte c [] = '{6,7,4,5,66,77,11};

// 2D array
byte a1[2][4] = {{0,1,2,3}, {4,5,6,7}};
byte b1[2][4] = '{'{0,1,2,3}, '{4,5,6,7}};

// error size mismatch 12 > 10
//byte b [12] = {0,6,7,4,5,66,77,99,22,11};

initial begin
  foreach (a[i]) begin 
    $display ("Value at index %d of array a is %g", i, a[i]);
  end
  foreach (c[i]) begin 
    $display ("Value of array c is %g", c[i]);
  end  
  
  // foreach (a1[i][j]) begin // unexpected error 
  foreach (a1[i,j]) begin // simulation shows row-major iteration
    $display ("Value of array a1[%0d][%0d] is %g", i, j, a1[i][j]);
  end    
  
  // using some system function
  for (int i = 0; i < $size(a); i++) 
    $display ("Value at index %d of array a is %g", i, a[i]);

  for (int i = 0; i < $size(c); i++) 
    $display ("Value at index %d of array c is %g", i, c[i]);    
  
  
  #1 $finish;
end

endmodule
