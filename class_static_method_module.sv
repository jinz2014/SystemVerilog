
  class A;
     string name;

     // Make size as static, which is shared by all instances of 
     // class A
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

module class_static_method;
   A a, b;

   initial begin
     a = new("A");
     b = new("A");
     a.inc_size();
     a.print();
     b.print();  // note size is 0 after calling the constructor

     // Error : use the class name to access
     //$display("%d", A.size);
     //A.inc_size();
     //$display("%d", A.size);

     $stop;
   end

endmodule
