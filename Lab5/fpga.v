module logic_tile(out, clock, in1, in2, in3, in4, in5);
  
  input clock, in1, in2, in3, in4, in5;
  output out;
  reg [32:0] mem;
  integer in;
  wire d;
  reg q, qbar;
  
  assign in = in1*1 + in2*2 + in3*4 + in4*8 + in5*16;
  assign d = mem[in];
  
  always@(posedge clock)
  begin
    q <= d;
    qbar = !d;
  end
 
  assign out = d*!(mem[32]) + mem[32]*q;
  
endmodule

module switch_box_4x4(out, in);
  
  input [3:0] in;
  output [3:0] out;
  reg [15:0] configure;
  
  assign out[0] = (configure[0]&in[0])|(configure[1]&in[1])|(configure[2]&in[2])|(configure[3]&in[3]);
  assign out[1] = (configure[4]&in[0])|(configure[5]&in[1])|(configure[6]&in[2])|(configure[7]&in[3]);
  assign out[2] = (configure[8]&in[0])|(configure[9]&in[1])|(configure[10]&in[2])|(configure[11]&in[3]);
  assign out[3] = (configure[12]&in[0])|(configure[13]&in[1])|(configure[14]&in[2])|(configure[15]&in[3]);
  
endmodule

module fpga(in1, in2, in3, in4, in5, in6, in7, in8, c, out, clock);
  
  input in1, in2, in3, in4, in5, in6, in7, in8;
  input [2:0] c;
  output out;
  reg [32:0] mem1, mem2, mem3, mem4, mem5;
  input clock;
  wire w1, w2, w3, w4;
  
  logic_tile L1(w1, clock, in1, in2, c[0], c[1], c[2]);
  logic_tile L2(w2, clock, in3, in4, c[0], c[1], c[2]);
  logic_tile L3(w3, clock, in5, in6, c[0], c[1], c[2]);
  logic_tile L4(w4, clock, in7, in8, c[0], c[1], c[2]);
  logic_tile L5(out, clock, w1, w2, w3, w4, 0);
  
endmodule