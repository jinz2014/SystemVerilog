/* unique : A "unique if" indicates that there should not be any overlap in 
    a series of if...else...if conditions.
   priority: A "priority if" indicates that a series of if...else...if conditions
 shall be evaluated in the order listed.

If either keyword is used, it shall be a run-time error for no condition
to match unless there is an explicit else
*/ 


module unique_priority ();

byte a = 0;

// unique
always @ (*)
begin 
  unique if ((a==0) || (a==1)) begin
    $display("Unique if : 0 or 1"); 
  end else if (a == 2) begin
    $display("Unique if : 2"); 
  end else if (a == 4) begin
    $display("Unique if : 4"); 
  end
  // Warning if a is not in {0,1,2,4}
end

// priority
always @ (*)
begin
  priority if (a[2:1]==0) begin
    $display("Priority if : 0 or 1");  // 000, 001
  end else if (a[2] == 0) begin        // 010, 011
    $display("Priority if : 2 or 3"); 
  end else  begin
    $display("Priority if : 4 to 7"); 
  end
end

// unique case
always @ (*)
begin
  unique case(a) 
     0,1: $display("Unique Case 0 or 1");
     2  : $display("Unique Case 2");
     4  : $display("Unique Case 4");
  // Warning if a is not in {0,1,2,4}
  endcase
end

// priority case
always @ (*)
begin
  priority casez(a) 
    3'b00?: $display("Priority Casez 0 or 1");
    3'b0??: $display("Priority Casez 2 or 3");
  // Warning if a is not in {0,1,2,4}
  endcase
end

// unique case inside
always @ (*)
begin
  unique case(a) inside
     [0 : 3]: $display("Unique Case inside 0 to 3");
     2  : $display("Unique Case inside 2");
     4  : $display("Unique Case inside 4");
  // Warning if a is not in {0,1,2,4}
  endcase
end

initial begin
  repeat (7) begin
    #1 a ++;
  end
  #1 $finish;
end

endmodule
