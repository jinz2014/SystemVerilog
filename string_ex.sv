// declare a string...
// exame string's methods:
// len()
// toupper/tolower
module string_ex ();

string my_string = "This is a string";
string my_new_string;

initial begin
  $display ("My String = %s",my_string);

  // the first char
  $display ("First char of My String = %s",my_string[0]);
  // the last char
  $display ("Last char of My String = %s",my_string[my_string.len()-1]);

  // runtime error: part-select reversed
  //$display ("Part of My String = %s",my_string[0:3]);

  // '{84, 104, 105, 115}
  $display ("Part of My String = %p",my_string[0:3]);

  // Assign new string of different size
  my_string = "This is a new string of different length";
  $display ("My String = %s",my_string);

  // Change to uppercase and assign to new string
  my_new_string = my_string.toupper();
  $display ("My New String = %s",my_new_string);

  // Get the length of sting
  $display ("Length of new string %0d",my_new_string.len());

  // Compare variable to another variable
  if (my_string.tolower() == my_new_string.tolower()) begin 
    $display("String Compare matches");
  end

  // Compare variable to variable
  if (my_string.toupper() == my_new_string) begin 
    $display("String Variable Compare matches");
  end

  #1 $finish;
end

endmodule
