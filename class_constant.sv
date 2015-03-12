`define PRINT task print (); \
   begin \
      $write("%s -> Size is %0d\n",this.name, this.Lsize); \
      $write("%s -> Size is %0d\n",this.name, this.Gsize); \
   end \
endtask

program class_constant;
  class A;
     const integer Gsize = 64; // constant value
     const integer Lsize;
     string name;
     // Constructor
     function new (string name);
       begin
         this.name = name;
         this.Lsize = 100; // only one assignment in new
       end 
     endfunction
     // This is not allowed
     task modify();
       begin
         // This is wrong 
         //this.Lsize ++; 
         // This is wrong 
         //this.Gsize ++; 
       end
     endtask
    
     `PRINT
   endclass

   A a;

   initial begin
     a = new("A");
     a.print();
   end

endprogram
