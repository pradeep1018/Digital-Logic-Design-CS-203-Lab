module confab_tb();
  
  reg clock, in1, in2, in3, in4, in5;
  wire out_lt;
  
  reg [3:0] in_sb;
  wire [3:0] out_sb;
  
  reg[31:0] mem_tb[0:2];
  
  logic_tile inst_logic_tile(
    .out(out_lt),
    .clock(clock),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5));
  
  switch_box_4x4 inst_switch_box_4x4(
    .out(out_sb),
    .in(in_sb));
  
  initial 
    begin
      $readmemh("lut.mem",mem_tb); 
      inst_logic_tile.mem[31:0] = mem_tb[0];
      inst_logic_tile.mem[32] = mem_tb[1][31];
      inst_switch_box_4x4.configure = mem_tb[2];
    end
  
  initial clock = 0;
  always #10 clock = ~clock;
  
  initial
    
    begin
      
      in1 = 1'b1;
      in2 = 1'b0;
      in3 = 1'b0;
      in4 = 1'b0;
      in5 = 1'b1;
      #20
      $display("clock: %b, in1: %b, in2: %b, in3: %b, in4: %b, in5: %b, out_lt: %b",clock,in1,in2,in3,in4,in5,out_lt);
      
      in1 = 1'b1;
      in2 = 1'b1;
      in3 = 1'b0;
      in4 = 1'b0;
      in5 = 1'b1;
      #20
      $display("clock: %b, in1: %b, in2: %b, in3: %b, in4: %b, in5: %b, out_lt: %b",clock,in1,in2,in3,in4,in5,out_lt);
      
      in1 = 1'b0;
      in2 = 1'b0;
      in3 = 1'b0;
      in4 = 1'b0;
      in5 = 1'b1;
      #20
      $display("clock: %b, in1: %b, in2: %b, in3: %b, in4: %b, in5: %b, out_lt: %b",clock,in1,in2,in3,in4,in5,out_lt);
      
      in_sb = 4'b0100;
      #30
      $display("in_sb: %b, out_sb: %b",in_sb,out_sb);
      
    end
  
  initial
  
    begin
    
      $dumpfile("ha.vcd");
      $dumpvars;
      
    end
  
  initial #1000 $finish;

endmodule