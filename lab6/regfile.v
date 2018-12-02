module regfile(data_in, writenum, write, readnum, clk, data_out);
  input [15:0]    data_in;
  input [2:0]     writenum, readnum;
  input           write, clk;
  output [15:0]   data_out;
  // fill out the rest
  wire [7:0]      dec_writenum, load;
  wire [15:0]     R0, R1, R2, R3, R4, R5, R6, R7; // output of each register
  // decode writenum
  Dec #(3,8) dwn(writenum, dec_writenum);
  // determine load for each register
  assign load = dec_writenum & {8{write}};
  // Instantiate 8 registers of 16 bits each for write
  vDFFE #(16) U0(clk, load[0], data_in, R0);
  vDFFE #(16) U1(clk, load[1], data_in, R1);
  vDFFE #(16) U2(clk, load[2], data_in, R2);
  vDFFE #(16) U3(clk, load[3], data_in, R3);
  vDFFE #(16) U4(clk, load[4], data_in, R4);
  vDFFE #(16) U5(clk, load[5], data_in, R5);
  vDFFE #(16) U6(clk, load[6], data_in, R6);
  vDFFE #(16) U7(clk, load[7], data_in, R7);
  // Instantiate binary select multiplexer for read
  Muxb8 #(16) read(R7, R6, R5, R4, R3, R2, R1, R0, readnum, data_out);
endmodule

// Register with load enable
module vDFFE(clk, load, in, out);
  parameter n = 16; // width
  input           clk, load ;
  input  [n-1:0]  in ;
  output [n-1:0]  out ;
  reg    [n-1:0]  out ;
  wire   [n-1:0]  next_out ;
  // assign next output to input if load is enabled
  assign next_out = load ? in : out;
  // change output only on rising edge of clk
  always @(posedge clk)
    out = next_out;
endmodule

// 8 input binary select multiplexer
module Muxb8(a7, a6, a5, a4, a3, a2, a1, a0, sb, b);
  parameter k = 16 ; // width
  input [k-1:0]   a7, a6, a5, a4, a3, a2, a1, a0; // inputs
  input [2:0]     sb; // binary select
  output[k-1:0]   b; // output
  wire  [7:0]     s; // one hot code
  // instantiate decoder and multiplexer
  Dec #(3,8) d(sb,s) ; // decoder converts binary to one-hot
  Mux8 #(16)  m(a7, a6, a5, a4, a3, a2, a1, a0, s, b) ; // multiplexer selects input
endmodule

// Decoder
module Dec(a, b) ;
  parameter n=3 ;
  parameter m=8 ;

  input  [n-1:0]  a ;
  output [m-1:0]  b ;

  wire [m-1:0] b = 1 << a ;
endmodule

// Multiplexer
module Mux8(a7, a6, a5, a4, a3, a2, a1, a0, s, out) ;
  parameter k = 16; // width
  input [k-1:0]   a0, a1, a2, a3, a4, a5, a6, a7; // inputs
  input [7:0]     s; // one-hot select
  output[k-1:0]   out;
  wire [k-1:0] out = ({k{s[0]}} & a0) | ({k{s[1]}} & a1) | ({k{s[2]}} & a2) | ({k{s[3]}} & a3) |
                     ({k{s[4]}} & a4) | ({k{s[5]}} & a5) | ({k{s[6]}} & a6) | ({k{s[7]}} & a7) ;
endmodule
