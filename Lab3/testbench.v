module adder_TB();
  
  reg [15:0] a16, b16;
  reg cin;
  wire [15:0] sum16_rc, sum16_cla;
  wire cout_rc, cout_cla;
  
  
  add16_rc add16_rc_inst(
    .sum16(sum16_rc),
    .cout(cout_rc),
    .a16(a16), 
    .b16(b16), 
    .cin(cin));
  
  add16_cla add16_cla_inst(
    .sum16(sum16_cla),
    .cout(cout_cla),
    .a16(a16), 
    .b16(b16), 
    .cin(cin));
  
  initial 
   
    begin
      
      a16 = 16'h0001;
      b16 = 16'hFFFF;
      cin = 1'b0;
      #100
      $display("a16: %b, b16: %b, cin: %b, sum16_rc: %b, cout_rc: %b, sum16_cla: %b, cout_cla: %b", a16, b16, cin, sum16_rc, cout_rc, sum16_cla, cout_cla);
      
      a16 = 16'hCCCC;
      b16 = 16'hC564;
      cin = 1'b0;
      #100
      $display("a16: %b, b16: %b, cin: %b, sum16_rc: %h, cout_rc: %b, sum16_cla: %h, cout_cla: %b", a16, b16, cin, sum16_rc, cout_rc, sum16_cla, cout_cla);
      
    end
  
  initial
  
    begin
    
      $dumpfile("ha.vcd");
      $dumpvars;
      
    end

endmodule
