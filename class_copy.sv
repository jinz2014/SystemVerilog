program class_copy;

  class A ;
    integer j = 5;
    task print();
      begin
        $display("j is %0d",j);
      end
    endtask
  endclass

  class B ;
    integer i = 1;
    A a = new;

    task print();
      begin
        $display("i is %0d",i);
        a.print();
      end
    endtask

    // custom deep copy task
    task copy(ref B bb);
      begin
        bb = new this;
        bb.a = new this.a;
      end
    endtask
  endclass
  
  initial begin
    B b1,b2,b3;
    $display("Testing shallow copy");

    b1 = new; // Create an object of class B
    b1.print();

    b2 = new b1; // Create an object that is a copy of b1
    b2.print();
    b2.i = 10; // i is changed in b2, but not in b1
    b2.a.j = 50; // change a.j, shared by both b1 and b2
    b2.print();

    b1.print(); // Updated due to shallow copy

    // Now do a deep copy
    $display("Testing deep copy");
    b1.copy(b3) ; // Create an object that is a deep copy of b1
    b3.print();
    b3.i = 100; // i is changed in b3, but not in b1
    b3.a.j = 500;// j is changes in b3, but not in b1
    b3.print();
    // i and J should not change due to deep copy
    b1.print();
  end

endprogram
