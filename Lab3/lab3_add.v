module full_adder(sum, cout, a, b, cin);
  
  input a, b, cin;
  output sum, cout;
  
  wire c1, c2, c3;
  
  assign #4 sum = (a^b^cin);
  
  assign #1 c1 = a & b;
  assign #1 c2 = b & cin;
  assign #1 c3 = cin & a;
  assign #2 cout = c1 + c2 + c3;
  
endmodule

module add16_rc(sum16, cout, a16, b16, cin);
  
  input [15:0] a16, b16;
  input cin;
  output [15:0] sum16;
  output cout;
  
  wire [15:1] c;
  
  full_adder U1(sum16[0], c[1], a16[0], b16[0], cin);
  full_adder U2[14:1](sum16[14:1], c[15:2], a16[14:1], b16[14:1], c[14:1]);
  full_adder U3(sum16[15], cout, a16[15], b16[15], c[15]);
  
endmodule

module full_adder_pg(sum, cout, p, g, a, b, cin);
  
  input a, b, cin;
  output sum, cout, p, g;
  
  xor #3 U1(p,a,b);
  and #1 U2(g,a,b);
  
endmodule

module carry_generator(couts, p, g, cin);
  
  input [3:0] p, g;
  input cin;
  output [3:0] couts;
  
  wire io1;
  and #1 U1(io1, p[0], cin);
  or #1 U2(couts[0], g[0], io1);
  
  wire io2;
  wire io3;
  and #1 U3(io2, p[1], g[0]);
  and #2 U4(io3, p[1], p[0], cin);
  or #2 U5(couts[1], io2, io3, g[1]);
  
  wire io4;
  wire io5;
  wire io6;
  and #1 U6(io4, p[2], g[1]);
  and #2 U7(io5, p[2], p[1], g[0]);
  and #2 U8(io6, p[2], p[1], p[0], cin);
  or #2 U9(couts[2], io4, io5, io6, g[2]);
  
  wire io7;
  wire io8;
  wire io9;
  wire io10;
  and #1 U10(io7, p[3], g[2]);
  and #2 U11(io8, p[3], p[2], g[1]);
  and #2 U12(io9, p[3], p[2], p[1], g[0]);
  and #3 U13(io10, p[3], p[2], p[1], p[0], cin);
  or #3 U14(couts[3], io7, io8, io9, io10, g[3]);
  
endmodule
   

module add4_cla(sum4, cout, a4, b4, cin);
  
  input [3:0] a4, b4;
  input cin;
  output [3:0] sum4;
  output cout;
  
  wire [3:0] c, p, g;
  
  full_adder_pg U1(sum4[0], c[0], p[0], g[0], a4[0], b4[0], cin);
  full_adder_pg U2(sum4[1], c[1], p[1], g[1], a4[1], b4[1], c[0]);
  full_adder_pg U3(sum4[2], c[2], p[2], g[2], a4[2], b4[2], c[1]);
  full_adder_pg U4(sum4[3], c[3], p[3], g[3], a4[3], b4[3], c[2]);
  
  carry_generator U5(c,p,g,cin);
  
  xor #3 U6(sum4[0], p[0] , cin);
  xor #3 U7(sum4[1], p[1] , c[0]);
  xor #3 U8(sum4[2], p[2] , c[1]);
  xor #3 U9(sum4[3], p[3] , c[2]);
  
  assign cout = c[3];
  
endmodule
  
module add16_cla(sum16, cout, a16, b16, cin);
  
  input [15:0] a16, b16;
  input cin;
  output [15:0] sum16;
  output cout;
  
  wire [3:1] c;
  
  add4_cla U1(sum16[3:0], c[1], a16[3:0], b16[3:0], cin);
  add4_cla U2(sum16[7:4], c[2], a16[7:4], b16[7:4], c[1]);
  add4_cla U3(sum16[11:8], c[3], a16[11:8], b16[11:8], c[2]);
  add4_cla U4(sum16[15:12], cout, a16[15:12], b16[15:12], c[3]);
  
endmodule
  
  

  