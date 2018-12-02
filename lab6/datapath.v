module datapath (clk,
                 readnum,
                 vsel,
                 loada,
                 loadb,
                 shift,
                 asel,
                 bsel,
                 ALUop,
                 loadc,
                 loads,
                 writenum,
                 write,
                 mdata,
                 sximm8,
                 PC,
                 sximm5,
                 stat_out,
                 C          );

  input           clk, loada, loadb, asel, bsel, loadc, loads, write;
  input [1:0]     shift, ALUop, vsel;
  input [2:0]     readnum, writenum;

  wire [15:0]     data_in, data_out, Aout, Bout, sout, Ain, Bin, out;

  // Lab 6 additions
  input [15:0]    mdata, sximm8, sximm5;
  input [7:0]     PC;
  output [15:0]   C;
  output [2:0]    stat_out;

  wire [2:0]      stat;
  wire [15:0]     exPC = {8'b0,PC};

  // determine data_in
  Muxb4 #(16) muxv(mdata, sximm8, exPC, C, vsel, data_in);
  // determine data_out
  regfile REGFILE(data_in, writenum, write, readnum, clk, data_out);
  // determine Aout and Bout
  vDFFE #(16) A(clk, loada, data_out, Aout);
  vDFFE #(16) B(clk, loadb, data_out, Bout);
  // determine sout
  shifter shifter(Bout, shift, sout);
  // determine Ain and Bin
  Muxb2 #(16) muxa(16'b0000000000000000, Aout, asel, Ain);
  Muxb2 #(16) muxb(sximm5, sout, bsel, Bin);
  // determine out and stat
  ALU alu(Ain,Bin,ALUop,out,stat);
  // determine stat_out
  vDFFE #(3) status(clk, loads, stat, stat_out);
  // determine C
  vDFFE #(16) regC(clk, loadc, out, C);
endmodule

// 2 input binary select multiplexer
module Muxb2(a1, a0, sb, b);
  parameter k = 16; // width
  input [k-1:0]   a0, a1; // inputs
  input           sb; // binary select
  output[k-1:0]   b;
  wire  [1:0]     s;

  Dec #(1,2) d2(sb,s); // Decoder converts binary to one-hot
  Mux2 #(k) m2(a1, a0, s, b); // multiplexer selects input
endmodule


// 2 input multiplexer
module Mux2(a1, a0, s, out) ;
  parameter k = 16; // width
  input [k-1:0]   a0, a1; // inputs
  input [1:0]     s; // one-hot select
  output[k-1:0]   out;
  wire [k-1:0]    out = ({k{s[0]}} & a0) | ({k{s[1]}} & a1);
endmodule

// 4 input binary select multiplexer
module Muxb4(a3, a2, a1, a0, sb, b);
  parameter k = 16 ; // width
  input [k-1:0]   a3, a2, a1, a0; // inputs
  input [1:0]     sb; // binary select
  output[k-1:0]   b; // output
  wire  [3:0]     s; // one hot code
  // instantiate decoder and multiplexer
  Dec #(2,4) d(sb,s) ; // decoder converts binary to one-hot
  Mux4 #(16) m(a3, a2, a1, a0, s, b) ; // multiplexer selects input
endmodule

// 4 input multiplexer
module Mux4(a3, a2, a1, a0, s, out) ;
  parameter k = 16; // width
  input [k-1:0]   a0, a1, a2, a3; // inputs
  input [3:0]     s; // one-hot select
  output[k-1:0]   out;
  wire [k-1:0]    out = ({k{s[0]}} & a0) | ({k{s[1]}} & a1) | ({k{s[2]}} & a2) | ({k{s[3]}} & a3);
endmodule
