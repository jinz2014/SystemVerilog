module test (
  input clk, rst,
  input s, // sensor
  input [15:0] g_dc, y_dc,  // green/yellow downcount
  output logic [2:0] light1, light2      // green/yellow/red light
);

traffic_light1 traffic_light1 (
  clk, rst, s,
  g_dc, y_dc,
  light1[2], light1[1], light1[0]
);

traffic_light2 traffic_light2 (
  clk, rst, s,
  g_dc, y_dc,
  light2[2], light2[1], light2[0]
);

endmodule

module traffic_light1 (
  input clk, rst,
  input s, // sensor
  input [15:0] g_dc, y_dc,  // green/yellow downcount
  output logic g, y, r      // green/yellow/red light
);

enum logic [2:0] {RED = 3'd1, GREEN = 3'd2, YELLOW = 3'd4} 
state, next;

always @ (posedge clk) begin
  if (rst) state <= RED;
  else state <= next;
end

always @ (*) begin
  next = state;
  case (state)
    RED:    if (s) next = GREEN;
    GREEN:  if (g_dc == 0) next = YELLOW;
    YELLOW: if (y_dc == 0) next = RED;
	 default: next = state;
  endcase
end

always @ (*) begin
  r = 0; g = 0; y = 0;
  unique case (state)
    RED:    r=1; 
    GREEN:  g=1; 
    YELLOW: y=1; 
  endcase
end

endmodule

module traffic_light2 (
  input clk, rst,
  input s, // sensor
  input [15:0] g_dc, y_dc,  // green/yellow downcount
  output logic g, y, r      // green/yellow/red light
);

enum {R = 0, G = 1, Y = 2} state_bit;
enum logic [2:0] {RED = 3'd1 << R, GREEN = 3'd1 << G, YELLOW = 3'd1 << Y} 
state, next;

always @ (posedge clk) begin
  if (rst) state <= RED;
  else state <= next;
end

always @ (*) begin
  next = state;
  unique case (1'b1)
    state[R]: if (s) next = GREEN;
    state[G]: if (g_dc == 0) next = YELLOW;
    state[Y]: if (y_dc == 0) next = RED;
  endcase
end

//always @ (*) begin
//    r = state[R];
//    g = state[G];
//    y = state[Y];
//end
always @ (*) begin
  r = 0; g = 0; y = 0;
  unique case (1'b1)
    state[R]:    r=1; 
    state[G]:  g=1;
    state[Y]: y=1;
  endcase
end
endmodule
