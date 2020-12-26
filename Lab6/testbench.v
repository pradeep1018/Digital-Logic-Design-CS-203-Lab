module tb();
  
  reg in1, in2, in3, in4, in5, in6, in7, in8, c1, c2, c3, c4;
  wire out1, out2, out3, out4, out5, out6, out7, out8, out9;
  reg clock, reset;
  reg[31:0] mem_tb[0:82];
  
  fpga F1(in1, in2, in3, in4, in5, in6, in7, in8, c1, c2, c3, c4, out1, out2, out3, out4, out5, out6, out7, out8, out9, reset, clock);
  
  initial clock = 0;
  always #10 clock = ~clock;
  
  initial 
    begin
      
      $readmemh("mux.mem",mem_tb); 
      F1.L1.mem[31:0] = mem_tb[0];
      F1.L1.mem[32] = mem_tb[1];
      F1.L2.mem[31:0] = mem_tb[2];
      F1.L2.mem[32] = mem_tb[3];
      F1.L3.mem[31:0] = mem_tb[4];
      F1.L3.mem[32] = mem_tb[5];
      F1.L4.mem[31:0] = mem_tb[6];
      F1.L4.mem[32] = mem_tb[7];
      F1.L5.mem[31:0] = mem_tb[8];
      F1.L5.mem[32] = mem_tb[9];
      F1.L6.mem[31:0] = mem_tb[10];
      F1.L6.mem[32] = mem_tb[11];
      F1.L7.mem[31:0] = mem_tb[12];
      F1.L7.mem[32] = mem_tb[13];
      F1.L8.mem[31:0] = mem_tb[14];
      F1.L8.mem[32] = mem_tb[15];
      F1.L9.mem[31:0] = mem_tb[16];
      F1.L9.mem[32] = mem_tb[17];
      F1.L10.mem[31:0] = mem_tb[18];
      F1.L10.mem[32] = mem_tb[19];
      F1.L11.mem[31:0] = mem_tb[20];
      F1.L11.mem[32] = mem_tb[21];
      F1.L12.mem[31:0] = mem_tb[22];
      F1.L12.mem[32] = mem_tb[23];
      F1.L13.mem[31:0] = mem_tb[24];
      F1.L13.mem[32] = mem_tb[25];
      F1.L14.mem[31:0] = mem_tb[26];
      F1.L14.mem[32] = mem_tb[27];
      F1.L15.mem[31:0] = mem_tb[28];
      F1.L15.mem[32] = mem_tb[29];
      F1.L16.mem[31:0] = mem_tb[30];
      F1.L16.mem[32] = mem_tb[31];
      F1.L17.mem[31:0] = mem_tb[32];
      F1.L17.mem[32] = mem_tb[33];
      F1.L18.mem[31:0] = mem_tb[34];
      F1.L18.mem[32] = mem_tb[35];
      F1.L19.mem[31:0] = mem_tb[36];
      F1.L19.mem[32] = mem_tb[37];
      F1.L20.mem[31:0] = mem_tb[38];
      F1.L20.mem[32] = mem_tb[39];
      F1.L21.mem[31:0] = mem_tb[40];
      F1.L21.mem[32] = mem_tb[41];
      F1.L22.mem[31:0] = mem_tb[42];
      F1.L22.mem[32] = mem_tb[43];
      F1.L23.mem[31:0] = mem_tb[44];
      F1.L23.mem[32] = mem_tb[45];
      F1.L24.mem[31:0] = mem_tb[46];
      F1.L24.mem[32] = mem_tb[47];
      F1.L25.mem[31:0] = mem_tb[48];
      F1.L25.mem[32] = mem_tb[49];
      F1.L26.mem[31:0] = mem_tb[50];
      F1.L26.mem[32] = mem_tb[51];
      F1.L27.mem[31:0] = mem_tb[52];
      F1.L27.mem[32] = mem_tb[53];
      F1.L28.mem[31:0] = mem_tb[54];
      F1.L28.mem[32] = mem_tb[55];
      F1.L29.mem[31:0] = mem_tb[56];
      F1.L29.mem[32] = mem_tb[57];
      F1.L30.mem[31:0] = mem_tb[58];
      F1.L30.mem[32] = mem_tb[59];
      F1.L31.mem[31:0] = mem_tb[60];
      F1.L31.mem[32] = mem_tb[61];
      F1.L32.mem[31:0] = mem_tb[62];
      F1.L32.mem[32] = mem_tb[63];
      F1.L33.mem[31:0] = mem_tb[64];
      F1.L33.mem[32] = mem_tb[65];
      F1.L34.mem[31:0] = mem_tb[66];
      F1.L34.mem[32] = mem_tb[67];
      F1.L35.mem[31:0] = mem_tb[68];
      F1.L35.mem[32] = mem_tb[69];
      F1.L36.mem[31:0] = mem_tb[70];
      F1.L36.mem[32] = mem_tb[71];
      F1.L37.mem[31:0] = mem_tb[72];
      F1.L37.mem[32] = mem_tb[73];
      F1.L38.mem[31:0] = mem_tb[74];
      F1.L38.mem[32] = mem_tb[75];
      F1.L39.mem[31:0] = mem_tb[76];
      F1.L39.mem[32] = mem_tb[77];
      F1.L40.mem[31:0] = mem_tb[78];
      F1.L40.mem[32] = mem_tb[79];
      F1.S1.configure = mem_tb[80];
      F1.S2.configure = mem_tb[81];
      F1.S3.configure = mem_tb[82];
    
    end
  
  initial
    
    begin
      
      //initialisation
      reset = 1;
      in1 = 0;
      in2 = 0;
      in3 = 0;
      in4 = 0;
      in5 = 0;
      in6 = 0;
      in7 = 0;
      in8 = 0;
      c1 = 0;
      c2 = 0;
      c3 = 0;
      c4 = 0;
      #50 $display("Initialized inputs: in1: %b, in2: %b, in3: %b, in4: %b, in5: %b, in6: %b, in7: %b, in8: %b, c1: %b, c2: %b, c3: %b, c4: %b",in1,in2,in3,in4,in5,in6,in7,in8,c1,c2,c3,c4);
      $display("Initialized outputs: out1: %b, out2: %b, out3: %b, out4: %b, out5: %b, out6: %b, out7: %b, out8: %b, out9: %b",out1,out2,out3,out4,out5,out6,out7,out8,out9);
      
    end
  
  initial 
    
    begin
      
      //multiplexer
      #100 reset = 0;
      in1 = 0;
      in2 = 0;
      in3 = 0;
      in4 = 0;
      in5 = 1;
      in6 = 0;
      in7 = 1;
      in8 = 0;
      c1 = 1;
      c2 = 1;
      c3 = 1;
      c4 = 0;
      #100 $display("Inputs of mux: in1: %b, in2: %b, in3: %b, in4: %b, in5: %b, in6: %b, in7: %b, in8: %b",in1,in2,in3,in4,in5,in6,in7,in8);
      $display("Control input: %b%b%b",c1,c2,c3);
      $display("Output: %b",out1);
      
      
    end
  
  initial 
    begin
      
      #300 $readmemh("bcdadder.mem",mem_tb); 
      F1.L1.mem[31:0] = mem_tb[0];
      F1.L1.mem[32] = mem_tb[1];
      F1.L2.mem[31:0] = mem_tb[2];
      F1.L2.mem[32] = mem_tb[3];
      F1.L3.mem[31:0] = mem_tb[4];
      F1.L3.mem[32] = mem_tb[5];
      F1.L4.mem[31:0] = mem_tb[6];
      F1.L4.mem[32] = mem_tb[7];
      F1.L5.mem[31:0] = mem_tb[8];
      F1.L5.mem[32] = mem_tb[9];
      F1.L6.mem[31:0] = mem_tb[10];
      F1.L6.mem[32] = mem_tb[11];
      F1.L7.mem[31:0] = mem_tb[12];
      F1.L7.mem[32] = mem_tb[13];
      F1.L8.mem[31:0] = mem_tb[14];
      F1.L8.mem[32] = mem_tb[15];
      F1.L9.mem[31:0] = mem_tb[16];
      F1.L9.mem[32] = mem_tb[17];
      F1.L10.mem[31:0] = mem_tb[18];
      F1.L10.mem[32] = mem_tb[19];
      F1.L11.mem[31:0] = mem_tb[20];
      F1.L11.mem[32] = mem_tb[21];
      F1.L12.mem[31:0] = mem_tb[22];
      F1.L12.mem[32] = mem_tb[23];
      F1.L13.mem[31:0] = mem_tb[24];
      F1.L13.mem[32] = mem_tb[25];
      F1.L14.mem[31:0] = mem_tb[26];
      F1.L14.mem[32] = mem_tb[27];
      F1.L15.mem[31:0] = mem_tb[28];
      F1.L15.mem[32] = mem_tb[29];
      F1.L16.mem[31:0] = mem_tb[30];
      F1.L16.mem[32] = mem_tb[31];
      F1.L17.mem[31:0] = mem_tb[32];
      F1.L17.mem[32] = mem_tb[33];
      F1.L18.mem[31:0] = mem_tb[34];
      F1.L18.mem[32] = mem_tb[35];
      F1.L19.mem[31:0] = mem_tb[36];
      F1.L19.mem[32] = mem_tb[37];
      F1.L20.mem[31:0] = mem_tb[38];
      F1.L20.mem[32] = mem_tb[39];
      F1.L21.mem[31:0] = mem_tb[40];
      F1.L21.mem[32] = mem_tb[41];
      F1.L22.mem[31:0] = mem_tb[42];
      F1.L22.mem[32] = mem_tb[43];
      F1.L23.mem[31:0] = mem_tb[44];
      F1.L23.mem[32] = mem_tb[45];
      F1.L24.mem[31:0] = mem_tb[46];
      F1.L24.mem[32] = mem_tb[47];
      F1.L25.mem[31:0] = mem_tb[48];
      F1.L25.mem[32] = mem_tb[49];
      F1.L26.mem[31:0] = mem_tb[50];
      F1.L26.mem[32] = mem_tb[51];
      F1.L27.mem[31:0] = mem_tb[52];
      F1.L27.mem[32] = mem_tb[53];
      F1.L28.mem[31:0] = mem_tb[54];
      F1.L28.mem[32] = mem_tb[55];
      F1.L29.mem[31:0] = mem_tb[56];
      F1.L29.mem[32] = mem_tb[57];
      F1.L30.mem[31:0] = mem_tb[58];
      F1.L30.mem[32] = mem_tb[59];
      F1.L31.mem[31:0] = mem_tb[60];
      F1.L31.mem[32] = mem_tb[61];
      F1.L32.mem[31:0] = mem_tb[62];
      F1.L32.mem[32] = mem_tb[63];
      F1.L33.mem[31:0] = mem_tb[64];
      F1.L33.mem[32] = mem_tb[65];
      F1.L34.mem[31:0] = mem_tb[66];
      F1.L34.mem[32] = mem_tb[67];
      F1.L35.mem[31:0] = mem_tb[68];
      F1.L35.mem[32] = mem_tb[69];
      F1.L36.mem[31:0] = mem_tb[70];
      F1.L36.mem[32] = mem_tb[71];
      F1.L37.mem[31:0] = mem_tb[72];
      F1.L37.mem[32] = mem_tb[73];
      F1.L38.mem[31:0] = mem_tb[74];
      F1.L38.mem[32] = mem_tb[75];
      F1.L39.mem[31:0] = mem_tb[76];
      F1.L39.mem[32] = mem_tb[77];
      F1.L40.mem[31:0] = mem_tb[78];
      F1.L40.mem[32] = mem_tb[79];
      F1.S1.configure = mem_tb[80];
      F1.S2.configure = mem_tb[81];
      F1.S3.configure = mem_tb[82];
    
    end
      
  initial
    
    begin
      
      //initialisation
      #300 reset = 1;
      in1 = 0;
      in2 = 0;
      in3 = 0;
      in4 = 0;
      in5 = 0;
      in6 = 0;
      in7 = 0;
      in8 = 0;
      c1 = 0;
      c2 = 0;
      c3 = 0;
      c4 = 0;
      
    end
  
  initial 
    
    begin
      
      //bcd adder
      #400 reset = 0;
      in7 = 1;
      in5 = 0;
      in3 = 0;
      in1 = 1;
      in8 = 1;
      in6 = 0;
      in4 = 0;
      in2 = 1;
      c3 = 1;
      c1 = 0;
      c2 = 1;
      c4 = 1;
      #200 $display("A: %b%b%b%b, B: %b%b%b%b, Carry: %b",in7,in5,in3,in1,in8,in6,in4,in2,c3);
      $display("Sum: %b %b%b%b%b",out9,out7,out5,out3,out1);
      
    end
  
  initial 
    begin
      
      #700 $readmemh("register.mem",mem_tb); 
      F1.L1.mem[31:0] = mem_tb[0];
      F1.L1.mem[32] = mem_tb[1];
      F1.L2.mem[31:0] = mem_tb[2];
      F1.L2.mem[32] = mem_tb[3];
      F1.L3.mem[31:0] = mem_tb[4];
      F1.L3.mem[32] = mem_tb[5];
      F1.L4.mem[31:0] = mem_tb[6];
      F1.L4.mem[32] = mem_tb[7];
      F1.L5.mem[31:0] = mem_tb[8];
      F1.L5.mem[32] = mem_tb[9];
      F1.L6.mem[31:0] = mem_tb[10];
      F1.L6.mem[32] = mem_tb[11];
      F1.L7.mem[31:0] = mem_tb[12];
      F1.L7.mem[32] = mem_tb[13];
      F1.L8.mem[31:0] = mem_tb[14];
      F1.L8.mem[32] = mem_tb[15];
      F1.L9.mem[31:0] = mem_tb[16];
      F1.L9.mem[32] = mem_tb[17];
      F1.L10.mem[31:0] = mem_tb[18];
      F1.L10.mem[32] = mem_tb[19];
      F1.L11.mem[31:0] = mem_tb[20];
      F1.L11.mem[32] = mem_tb[21];
      F1.L12.mem[31:0] = mem_tb[22];
      F1.L12.mem[32] = mem_tb[23];
      F1.L13.mem[31:0] = mem_tb[24];
      F1.L13.mem[32] = mem_tb[25];
      F1.L14.mem[31:0] = mem_tb[26];
      F1.L14.mem[32] = mem_tb[27];
      F1.L15.mem[31:0] = mem_tb[28];
      F1.L15.mem[32] = mem_tb[29];
      F1.L16.mem[31:0] = mem_tb[30];
      F1.L16.mem[32] = mem_tb[31];
      F1.L17.mem[31:0] = mem_tb[32];
      F1.L17.mem[32] = mem_tb[33];
      F1.L18.mem[31:0] = mem_tb[34];
      F1.L18.mem[32] = mem_tb[35];
      F1.L19.mem[31:0] = mem_tb[36];
      F1.L19.mem[32] = mem_tb[37];
      F1.L20.mem[31:0] = mem_tb[38];
      F1.L20.mem[32] = mem_tb[39];
      F1.L21.mem[31:0] = mem_tb[40];
      F1.L21.mem[32] = mem_tb[41];
      F1.L22.mem[31:0] = mem_tb[42];
      F1.L22.mem[32] = mem_tb[43];
      F1.L23.mem[31:0] = mem_tb[44];
      F1.L23.mem[32] = mem_tb[45];
      F1.L24.mem[31:0] = mem_tb[46];
      F1.L24.mem[32] = mem_tb[47];
      F1.L25.mem[31:0] = mem_tb[48];
      F1.L25.mem[32] = mem_tb[49];
      F1.L26.mem[31:0] = mem_tb[50];
      F1.L26.mem[32] = mem_tb[51];
      F1.L27.mem[31:0] = mem_tb[52];
      F1.L27.mem[32] = mem_tb[53];
      F1.L28.mem[31:0] = mem_tb[54];
      F1.L28.mem[32] = mem_tb[55];
      F1.L29.mem[31:0] = mem_tb[56];
      F1.L29.mem[32] = mem_tb[57];
      F1.L30.mem[31:0] = mem_tb[58];
      F1.L30.mem[32] = mem_tb[59];
      F1.L31.mem[31:0] = mem_tb[60];
      F1.L31.mem[32] = mem_tb[61];
      F1.L32.mem[31:0] = mem_tb[62];
      F1.L32.mem[32] = mem_tb[63];
      F1.L33.mem[31:0] = mem_tb[64];
      F1.L33.mem[32] = mem_tb[65];
      F1.L34.mem[31:0] = mem_tb[66];
      F1.L34.mem[32] = mem_tb[67];
      F1.L35.mem[31:0] = mem_tb[68];
      F1.L35.mem[32] = mem_tb[69];
      F1.L36.mem[31:0] = mem_tb[70];
      F1.L36.mem[32] = mem_tb[71];
      F1.L37.mem[31:0] = mem_tb[72];
      F1.L37.mem[32] = mem_tb[73];
      F1.L38.mem[31:0] = mem_tb[74];
      F1.L38.mem[32] = mem_tb[75];
      F1.L39.mem[31:0] = mem_tb[76];
      F1.L39.mem[32] = mem_tb[77];
      F1.L40.mem[31:0] = mem_tb[78];
      F1.L40.mem[32] = mem_tb[79];
      F1.S1.configure = mem_tb[80];
      F1.S2.configure = mem_tb[81];
      F1.S3.configure = mem_tb[82];
    
    end
      
  initial
    
    begin
      
      //initialisation
      #700 reset = 1;
      in1 = 0;
      in2 = 0;
      in3 = 0;
      in4 = 0;
      in5 = 0;
      in6 = 0;
      in7 = 0;
      in8 = 0;
      c1 = 0;
      c2 = 0;
      c3 = 0;
      
    end
  
  initial 
    
    begin
      
      //shift register
      #800 reset = 0;
      in1 = 1;
      in2 = 0;
      in3 = 0;
      in4 = 1;
      in5 = 1;
      in6 = 0;
      in7 = 0;
      in8 = 1;
      c1 = 1;
      c2 = 0;
      c3 = 0;
      c4 = 1;
      #200 $display("Parallel input: %b%b%b%b%b%b%b%b",in8,in7,in6,in5,in4,in3,in2,in1);
      $display("Serial input(SI): %b",c4);
      $display("L: %b, shl: %b,sh: %b",c1,c2,c3);
      $display("Output: %b%b%b%b%b%b%b%b",out8,out7,out6,out5,out4,out3,out2,out1);
      
      //shift register
      #100 reset = 0;
      in1 = 1;
      in2 = 0;
      in3 = 0;
      in4 = 1;
      in5 = 1;
      in6 = 0;
      in7 = 0;
      in8 = 1;
      c1 = 0;
      c2 = 0;
      c3 = 0;
      c4 = 1;
      #200 $display("Parallel input: %b%b%b%b%b%b%b%b",in8,in7,in6,in5,in4,in3,in2,in1);
      $display("Serial input(SI): %b",c4);
      $display("L: %b, shl: %b,sh: %b",c1,c2,c3);
      $display("Output: %b%b%b%b%b%b%b%b",out8,out7,out6,out5,out4,out3,out2,out1);
      
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
