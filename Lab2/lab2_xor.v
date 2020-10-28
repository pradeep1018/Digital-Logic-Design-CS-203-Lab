module xor2(out, in1, in2);
  
  input in1, in2;
  output out;
  wire io1, io2, io3, io4;
  
  not U1(io1, in1);
  not U2(io2, in2);
  and U3(io3, in1, io2);
  and U4(io4, io1, in2);
  or U5(out, io3, io4);
  
endmodule

module xor3(out, in1, in2, in3);
  
  input in1, in2, in3;
  output out;
  wire io;
  
  xor2 U1(io, in1, in2);
  xor2 U2(out, io, in3);
  
endmodule

module xor3_b(out, in1, in2, in3);
  
  input in1, in2, in3;
  output out;
  wire io;
  
  assign io = (in1 & ~in2) + (~in1 & in2);
  assign out = (io & ~in3) + (~io & in3);
  
endmodule