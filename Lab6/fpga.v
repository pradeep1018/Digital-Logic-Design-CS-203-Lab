module logic_tile(out, clock, reset, in1, in2, in3, in4, in5);
  
  input clock, reset, in1, in2, in3, in4, in5;
  output out;
  reg out;
  reg [32:0] mem;
  integer in;
  wire d;
  reg q, qbar;
  
  assign in = in1*1 + in2*2 + in3*4 + in4*8 + in5*16;
  assign d = mem[in];
  
  always@(posedge clock) begin
    if(reset == 1)
      begin
  		q <= 0;
  		qbar <= 1;
      end
  	else 
      begin
		q <= d; 
		qbar <= !d;
      end
  end 
 
  always @(q,out)
    begin
      case (mem[32])
        1'b0 : out=d;
        1'b1 : out=q;
        default : out=1'bx;
      endcase
    end
  
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

module fpga(in1, in2, in3, in4, in5, in6, in7, in8, c1, c2, c3, c4, out1, out2, out3, out4, out5, out6, out7, out8, out9, reset, clock);
  
  input in1, in2, in3, in4, in5, in6, in7, in8, c1, c2, c3, c4;
  output out1, out2, out3, out4, out5, out6, out7, out8, out9;
  input clock, reset;
  wire d1, d2, d3;
  reg [40:1] w;
  
  logic_tile L1(w[1],clock,reset,in1,w[7],c3,c2,c1);
  logic_tile L2(w[2],clock,reset,w[6],0,c3,c2,c1);
  logic_tile L3(w[3],clock,reset,w[1],w[2],c3,c2,c1);
  logic_tile L4(w[4],clock,reset,in2,w[6],c3,c2,c1);
  logic_tile L5(w[5],clock,reset,w[36],w[7],c3,c2,c1);
  logic_tile L6(w[6],clock,reset,w[4],w[5],c3,c2,c1);
  logic_tile L7(w[7],clock,reset,w[3],w[6],c3,c2,c1);
  logic_tile L8(w[8],clock,reset,w[3],w[6],c3,c2,c1);
  
  logic_tile L9(w[9],clock,reset,in3,w[36],w[8],c2,c1);
  logic_tile L10(w[10],clock,reset,w[14],w[6],w[8],c2,c1);
  logic_tile L11(w[11],clock,reset,w[9],w[10],w[8],c2,c1);
  logic_tile L12(w[12],clock,reset,in4,w[14],w[8],c2,c1);
  logic_tile L13(w[13],clock,reset,w[38],w[36],w[8],c2,c1);
  logic_tile L14(w[14],clock,reset,w[12],w[13],w[8],c2,c1);
  logic_tile L15(w[15],clock,reset,w[11],w[14],w[8],c2,c1);
  logic_tile L16(w[16],clock,reset,w[11],w[14],w[8],c2,c1);
  
  logic_tile L17(w[17],clock,reset,in5,w[38],w[16],c2,c1);
  logic_tile L18(w[18],clock,reset,w[22],w[14],w[16],c2,c1);
  logic_tile L19(w[19],clock,reset,w[17],w[18],w[16],c2,c1);
  logic_tile L20(w[20],clock,reset,in6,w[22],w[16],c2,c1);
  logic_tile L21(w[21],clock,reset,w[40],w[38],w[16],c2,c1);
  logic_tile L22(w[22],clock,reset,w[20],w[21],w[16],c2,c1);
  logic_tile L23(w[23],clock,reset,w[19],w[22],w[16],c2,c1);
  logic_tile L24(w[24],clock,reset,w[19],w[22],w[16],c2,c1);
  
  logic_tile L25(w[25],clock,reset,in7,w[40],w[24],c2,c1);
  logic_tile L26(w[26],clock,reset,w[30],w[22],w[24],c2,c1);
  logic_tile L27(w[27],clock,reset,w[25],w[26],w[24],c2,c1);
  logic_tile L28(w[28],clock,reset,in8,w[30],w[24],c2,c1);
  logic_tile L29(w[29],clock,reset,c4,w[40],w[24],c2,c1);
  logic_tile L30(w[30],clock,reset,w[28],w[29],w[24],c2,c1);
  logic_tile L31(w[31],clock,reset,w[27],w[30],w[24],c2,c1);
  logic_tile L32(w[32],clock,reset,w[27],w[30],w[24],c2,c1);
  
  logic_tile L33(w[33],clock,reset,w[31],w[23],0,0,0);
  logic_tile L34(w[34],clock,reset,w[31],w[15],0,0,0);
  logic_tile L35(w[35],clock,reset,w[32],w[33],w[34],0,0);
  
  logic_tile L36(w[36],clock,reset,w[15],w[35],0,0,0);
  logic_tile L37(w[37],clock,reset,w[15],w[35],0,0,0);
  logic_tile L38(w[38],clock,reset,w[23],w[35],w[37],0,0);
  logic_tile L39(w[39],clock,reset,w[23],w[35],w[37],0,0);
  logic_tile L40(w[40],clock,reset,w[31],w[39],0,0,0);
  
  switch_box_4x4 S1({out7,out5,out3,out1},{w[40],w[38],w[36],w[7]});
  switch_box_4x4 S2({out8,out6,out4,out2},{w[30],w[22],w[14],w[6]});
  switch_box_4x4 S3({d1,d2,d3,out9},{1'b0,1'b0,1'b0,w[35]});
  
endmodule