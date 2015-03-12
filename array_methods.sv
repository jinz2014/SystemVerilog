module array_methods();
  
// find data in an unpacked array
// min, max and unique returns a queue

int data [0:9] = {1,2,3,6,5,7,8,9,9,2}; // int data[10] = ...
int queue [$];

reg [7:0] memory [0:7] = '{1, 2, 3, 4, 5, 6, 7, 8};

initial begin
  // return a queue 
  $display("Min of array %p",data.min);
  $display("Max of array %p",data.max);
  
  $display("Sum of array %0d",data.sum);
  $display("Product of array %0d",data.product);
  $display("XOR of array %0d",data.xor);
  $display("AND of array %0d",data.and);
  $display("OR  of array %0d",data.or);

  $display("Min of memory array %p",memory.min);

  queue = data.min;
  $display("Min size element is %0d",queue.pop_front());

  queue = data.max;
  $display("Max size element is %0d",queue.pop_front());
  
  // call data.sort(), data.reverse(), data.rsort() and data.shuffle()
  data.shuffle()
  
  $finish;
  
end

endmodule
