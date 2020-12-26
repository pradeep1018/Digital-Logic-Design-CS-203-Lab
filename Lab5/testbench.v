module tb();
  
  reg in1, in2, in3, in4, in5, in6, in7, in8;
  reg [2:0] c;
  wire out;
  reg[31:0] mem_tb[0:9];
  reg clock;
  
  fpga F1(in1, in2, in3, in4, in5, in6, in7, in8, c, out, clock);
  
  initial 
    begin
      $readmemh("configure.mem",mem_tb); 
      F1.L1.mem[31:0] = mem_tb[0];
      F1.L1.mem[32] = mem_tb[1][31];
      F1.L2.mem[31:0] = mem_tb[2];
      F1.L2.mem[32] = mem_tb[3][31];
      F1.L3.mem[31:0] = mem_tb[4];
      F1.L3.mem[32] = mem_tb[5][31];
      F1.L4.mem[31:0] = mem_tb[6];
      F1.L4.mem[32] = mem_tb[7][31];
      F1.L5.mem[31:0] = mem_tb[8];
      F1.L5.mem[32] = mem_tb[9][31];
    end
  
  initial clock = 0;
  always #10 clock = ~clock;
  
  initial
    
    begin
      
      in1 = 0;
      in2 = 0;
      in3 = 0;
      in4 = 0;
      in5 = 0;
      in6 = 0;
      in7 = 0;
      in8 = 1;
      c = 3'b111;
      #100
      $display("in1: %b, in2: %b, in3: %b, in4: %b, in5: %b, in6: %b, in7: %b, in8: %b, c: %b, out: %b",in1,in2,in3,in4,in5,in6,in7,in8,c,out);
      
    end
  
  initial 
        begin
            #10000 $finish;
        end
  
  initial
  
    begin
    
      $dumpfile("ha.vcd");
      $dumpvars;
      
    end
  
endmodule