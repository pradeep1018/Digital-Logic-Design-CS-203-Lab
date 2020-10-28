module xor3_TB();
  
  reg r1;
  reg r2;
  reg r3;
  wire wxor3;
  wire wxo3_b;
  
  
  xor3 xor3_inst(
    .in1(r1), 
    .in2(r2), 
    .in3(r3),
    .out(wxor3));
  
  xor3_b xor3_b_inst(
    .in1(r1), 
    .in2(r2), 
    .in3(r3),
    .out(wxor3_b));
  
  initial 
   
    begin
      
      r1 = 1'b0;
      r2 = 1'b0;
      r3 = 1'b0;
      #10
      $display("in1: %b, in2: %b, in3: %b, xor3: %b, xo3_b: %b", r1, r2, r3, wxor3, wxor3_b);

      r1 = 1'b0;
      r2 = 1'b0;
      r3 = 1'b1;
      #10
      $display("in1: %b, in2: %b, in3: %b, xor3: %b, xo3_b: %b", r1, r2, r3, wxor3, wxor3_b);
      
      r1 = 1'b0;
      r2 = 1'b1;
      r3 = 1'b0;
      #10
      $display("in1: %b, in2: %b, in3: %b, xor3: %b, xo3_b: %b", r1, r2, r3, wxor3, wxor3_b);
      
      r1 = 1'b0;
      r2 = 1'b1;
      r3 = 1'b1;
      #10
      $display("in1: %b, in2: %b, in3: %b, xor3: %b, xo3_b: %b", r1, r2, r3, wxor3, wxor3_b);
      
      r1 = 1'b1;
      r2 = 1'b0;
      r3 = 1'b0;
      #10
      $display("in1: %b, in2: %b, in3: %b, xor3: %b, xo3_b: %b", r1, r2, r3, wxor3, wxor3_b);
      
      r1 = 1'b1;
      r2 = 1'b0;
      r3 = 1'b1;
      #10
      $display("in1: %b, in2: %b, in3: %b, xor3: %b, xo3_b: %b", r1, r2, r3, wxor3, wxor3_b);
      
      r1 = 1'b1;
      r2 = 1'b1;
      r3 = 1'b0;
      #10
      $display("in1: %b, in2: %b, in3: %b, xor3: %b, xo3_b: %b", r1, r2, r3, wxor3, wxor3_b);
      
      r1 = 1'b1;
      r2 = 1'b1;
      r3 = 1'b1;
      #10
      $display("in1: %b, in2: %b, in3: %b, xor3: %b, xo3_b: %b", r1, r2, r3, wxor3, wxor3_b);
      
    end
  
  initial
  
    begin
    
      $dumpfile("ha.vcd");
      $dumpvars;
      
    end

endmodule