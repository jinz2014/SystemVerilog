//
// packed_union test
//
module test (
  input clk,
  input rst,
  input ld,
  input [7:0] din
);

typedef struct packed {
  logic [3:0] opcode;
  logic [3:0] rd;
  logic [3:0] rm;
  logic [3:0] rn;
  logic [15:0] imm;
} data_t;

// The compiler doesn't check the width of pkt, but the simulator does 
// for packed union. Unions are not supported in Quartus.
union packed { 
  data_t pkt;
  logic [3:0][7:0] bytes;
} dreg_t;

logic [1:0] i;
logic       ready;
logic       write;
logic [3:0] res;
logic [31:0] rf [16];

always @ (posedge clk) begin
  if (rst) begin
    dreg_t.pkt <= '0;
    i <= 0;
  end
  else if (ld) begin
    dreg_t.bytes[i] <= din;
    i <= i + 1;
  end 
end

always @ (posedge clk) begin
  if (i == 3 && ld)
    ready <= 1;
  else
    ready <= 0;
end

always @ (posedge clk) begin
  if (ready) begin
    write <= 1;
    case (dreg_t.pkt.opcode)
      4'b0001: res <= rf[dreg_t.pkt.rm] ^ rf[dreg_t.pkt.rn];
      4'b0010: res <= rf[dreg_t.pkt.rm] | rf[dreg_t.pkt.rn];
      default: res <= ^dreg_t.pkt.imm;
    endcase
  end
  else begin
    write <= 0;
  end
end

always @ (posedge clk)
  if (write) begin
    rf[dreg_t.pkt.rd] <= res;
  end

endmodule

  


 

