program class_data_hiding;
  class A;
    integer data;
    local   integer addr;
    protected integer cmd;
    static integer credits;
    function new();
      begin
        data = 100;
        addr = 200;
        cmd  = 1;
        credits = 10;
      end
    endfunction
    task printA();
      begin
        $write ("value of data %0d in A\n", data);
        $write ("value of addr %0d in A\n", addr);
        $write ("value of cmd  %0d in A\n", cmd);
      end
    endtask
  endclass
  
  class B extends A;
    task printB();
      begin
        $write ("value of data %0d in B\n", data);
        // Below line will give compile error
        //$write ("value of addr %0d in B\n", addr);
        $write ("value of cmd  %0d in B\n", cmd);
      end
    endtask
  endclass
  
  class C;
    A a;
    B b;
    function new();
      begin
        a = new();
        b = new();
        b.data = 2;
      end
    endfunction
    task printC();
      begin
        $write ("value of data %0d in C\n", a.data);
        $write ("value of data %0d in C\n", b.data);
        // Below line will give compile error
        //$write ("value of addr %0d in C\n", a.addr);
        //$write ("value of cmd  %0d in C\n", a.cmd);
        //$write ("value of addr %0d in C\n", b.addr);
        //$write ("value of cmd  %0d in C\n", b.cmd);
      end
    endtask
  endclass
  
  initial begin
    C c = new();
    c.a.printA();
    c.b.printB();
    c.printC();
    $write("value of credits is %0d\n",c.a.credits); 
    $write("value of credits is %0d\n",c.b.credits); 
    c.a.credits ++;
    $write("value of credits is %0d\n",c.a.credits); 
    $write("value of credits is %0d\n",c.b.credits); 
    c.b.credits ++;
    $write("value of credits is %0d\n",c.a.credits); 
    $write("value of credits is %0d\n",c.b.credits); 
  end

endprogram
