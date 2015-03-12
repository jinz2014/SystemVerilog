`define PRINT task print (); \
          begin \
            $write("Size is %0d\n",this.size); \
          end \
       endtask

program class_con;
  // Class with constructor, with no parameter
  class A;
     integer size;
     // Constructor
     function new ();
       begin
         this.size = 0;
       end 
     endfunction
     // Task in class (object method)
     `PRINT
   endclass

  // Class with constructor, with parameter
  class B;
     integer size;
     // Constructor
     function new (integer size);
       begin
         this.size = size;
       end 
     endfunction
     // Task in class (object method)
     `PRINT
   endclass

   // Class without constructor
   class C;
     integer size;
     task set_size(integer size);
       begin
         this.size = size;
       end
     endtask
     // Task in class (object method)
     `PRINT
   endclass
     
   A a;
   B b;
   C c;

   initial begin
     a = new();
     b = new(5);
     c = new();
     a.print();
     b.print();
     c.print(); // default size is x 
     c.set_size(5);
     c.print();
   end

endprogram
