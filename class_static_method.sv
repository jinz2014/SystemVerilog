
program class_static_method;

  class A;
     string name;

     // Make size as static
     static integer size;


     // Constructor with no parameter
     function new (string name);
       begin
         this.name = name;
         this.size = 0;
       end 
     endfunction

     // static Increment size task
     static task inc_size();
       begin
         size ++; // Ok to access static member
         $write("size is incremented\n");
         // Not ok to access non static member name          
         //$write("%s -> size is incremented\n",name);
       end
     endtask

     // Task in class (object method)
	task print ();
	 begin 
	   $write("%s -> Size is %0d\n",this.name, this.size);
	 end 
	endtask
   endclass

   A a, b;

   initial begin
     a = new("A");
     a.inc_size();
     a.print();

     b = new("A");
     b.print();
   end

endprogram
