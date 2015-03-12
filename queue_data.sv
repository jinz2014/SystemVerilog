module queue_data();

// Queue is declated with $ in array size
integer queue[$] = { 0, 1, 2, 3, 4 };
integer i;

initial begin
  $display ("Initial value of queue");
  print_queue;

  // Insert new element at begin of queue
  queue = {5, queue};
  $display ("new element added using concate");
  print_queue;

  // Insert using method at begining
  queue.push_front(6);
  $display ("new element added using push_front");
  print_queue;

  // Insert using method at end
  queue.push_back(7);
  $display ("new element added using push_back");
  print_queue;

  // Using insert to insert, here 4 is index, 8 is value
  queue.insert(4,8);
  $display ("new element added using insert(index,value)");
  print_queue;

  // get first queue element method at begining
  i = queue.pop_front();
  $display ("element poped using pop_front");
  print_queue;

  // get last queue element method at end
  i = queue.pop_back();
  $display ("element poped using pop_end");
  print_queue;

  // Use delete method to delete element at index 4 in queue
  queue.delete(4);
  $display ("deleted element at index 4");
  print_queue;

  #1 $finish;
end

task print_queue;
  integer i;
  $write("Queue contains ");
  //for (i = 0; i < queue.size(); i ++) begin
  foreach (queue[i]) begin
    $write (" %g", queue[i]);
  end
  $write("\n");
endtask

endmodule
