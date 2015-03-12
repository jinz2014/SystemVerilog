`define PRINT task print (); \
  begin \
    $write("%s -> Size is %0d\n",this.name, this.size); \
 end \
endtask

program class_static;
  // Class with constructor, with no parameter
  class A;
     // Make size as static
     static integer size;
     string name;

     // Constructor
     function new (string name);
       begin
         this.name = name;
         this.size = 0;
       end 
     endfunction

     // Increment size task
     task inc_size();
       begin
         //this.size ++; // both are ok
         size ++;
         $write("%s -> size is incremented\n",this.name);
       end
     endtask

     // Task in class (object method)
     `PRINT
   endclass

   A a,b,c;

   initial begin
     a = new("A");
     b = new("B");
     c = new("C");
     a.inc_size();
     a.print();
     b.print();
     c.print();
     c.inc_size();
     a.print();
     b.print();
     c.print();
   end

endprogram
