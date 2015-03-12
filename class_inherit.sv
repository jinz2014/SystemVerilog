program class_inherit;

  class A ;
    integer j = 5;
    task print();
      begin
        $display("j is %0d",j);
      end
    endtask
  endclass

  class B extends A;
    integer i = 1;
    // Override the parent class print
    task print();
      begin
        $display("i is %0d",i);
        $display("j is %0d",j);
      end
    endtask
  endclass
  
  initial begin
    B b1;
    b1 = new;
    b1.print();
  end

endprogram
