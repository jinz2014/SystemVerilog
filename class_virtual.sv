program class_virtual;
  // Virtual class for body of any driver
  virtual class verif;
    // This starts all the threads
    virtual task startSim();
    endtask
    // This stops all the threads
    virtual task stopSim();
    endtask
    // This prints all the stats
    virtual task printStats();
    endtask
    // This check if driver is done or not
    virtual function bit isDone ();
      begin
        isDone = 0;
      end
    endfunction
    // set the driver config
    virtual task setConfig(integer item, integer value);
    endtask
    virtual function integer getConfig(integer item);
      begin
        getConfig = 32'hDEAD_BEAF;
      end
    endfunction
  endclass
  // ethernet inherits verif
  class ethernet extends verif;
    integer min_frame_size;
    integer max_frame_size;
    function new();
      begin
        min_frame_size = 32'h40;
        max_frame_size = 32'h200;
      end
    endfunction
    task startSim();
      begin
        $write("Starting Simulation\n");
      end
    endtask
    task stopSim();
      begin
        $write("Stopping Simulation\n");
      end
    endtask
    task printStats();
      begin
        $write("Sent normal   frames %d\n",100);
        $write("Sent runt     frames %d\n",1);
        $write("Sent oversize frames %d\n",1);
      end
    endtask
    function bit isDone();
      begin
        isDone = 1;
      end
    endfunction
    task setConfig(integer item, integer value);
      begin
        case(item)
           0 : min_frame_size = value;
           1 : max_frame_size = value;
        endcase
      end
    endtask
    function integer getConfig(integer item);
      begin
        case(item) 
           0 : getConfig = min_frame_size;
           1 : getConfig = max_frame_size;
           default :  begin
                     $write("Calling super.setConfig\n");
                      getConfig  = super.getConfig(item);
           end
        endcase
       end
    endfunction
  endclass
  
  class ethernet2 extends ethernet;
    integer min_ipg;
    function new();
      begin
        min_ipg = 32'hc;
      end
    endfunction
    task setConfig(integer item, integer value);
      begin
        case(item) 
           2 : min_ipg = value;
           default : begin
                     $write("Calling super.setConfig\n");
                     super.setConfig(item,value);
           end
        endcase
      end
    endtask
    function integer getConfig(integer item);
      begin
        case(item) 
           2 : getConfig = min_ipg;
           default :  begin
                     $write("Calling super.setConfig\n");
                      getConfig  = super.getConfig(item);
                    end
        endcase
      end
    endfunction
  endclass
 

  initial begin 
    ethernet2 eth = new();
    eth.setConfig(0,32'h100);
    eth.setConfig(2,32'h24);
    $write ("Value of min_frame is %0x\n", eth.getConfig(0));
    $write ("Value of max_frame is %0x\n", eth.getConfig(1));
    $write ("Value of min_ipg   is %0x\n", eth.getConfig(2));
    $write ("Value of unknown   is %0x\n", eth.getConfig(3));
  
    eth.startSim();
    while (eth.isDone() == 0) begin
     #1;
    end
    eth.stopSim();
    eth.printStats();
  end

endprogram
