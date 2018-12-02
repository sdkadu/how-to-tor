// module datapath
// Inputs:	datapath_in - 16-bit input data
//		writenum - 3-bit to decide which register file to write
//		write - 1-bit to decide whether in writing mode
//		readnum - 3-bit to decide which register file to read
//		clk - clock switch
//		loada - load for 'a'
//		loadb - load for 'b'
//		loadc - load for 'c'
//		loads - load for 'status'
//		shift - how much to shift 'b'
//		asel - select 'a' or nah
//		bsel - select 'b' or nah
//		vsel - select initial
//		ALUop - ALU calculations
//
// Outputs:	datapath_out - 16-bit output of computation/ALU module

module datapath(datapath_in, writenum, write, readnum, clk, loada, loadb, loadc, loads, shift, asel, bsel, vsel, ALUop, Z_out, datapath_out);
  // input-output declaration
  input [15:0]    datapath_in;
  input [2:0]     writenum, readnum;
  input           write, clk, loada, loadb, loadc, loads, asel, bsel, vsel;
  input [1:0]     shift, ALUop;
  output [15:0]   datapath_out;
  output          Z_out;

  // wire declarations
  wire [15:0]     data_in, data_out;
  wire [15:0]     A_in, B_in, C_in, sout, Ain, Bin, out;
  wire            Z;

  // module instantiations
    // storage registers
  vDFFe #(16) A(clk, loada, data_out, A_in);
  vDFFe #(16) B(clk, loadb, data_out, B_in);
  vDFFe #(16) C(clk, loadc, out, datapath_out);
  vDFFe #(1) status(clk, loads, Z, Z_out);

    // other instantiations
  // determine data_in
  Mux2b #(16) in(datapath_in, datapath_out, vsel, data_in);
  // determine data_out
  regfile U0(data_in, writenum, write, readnum, clk, data_out);
  // determine sout
  shifter U1(B_in, shift, sout);
  // determine Ain
  Mux2b #(16) as(16'b0000000000000000, A_in, asel, Ain);
  // determine Bin
  Mux2b #(16) bs({11'b00000000000, datapath_in[4:0]}, sout, bsel, Bin);
  // determine out and status Z
  ALU U2(Ain, Bin, ALUop, out, Z);

endmodule

// 2-Input Multiplexer module
// Inputs:	a1 to a0 - k-bit inputs
//		sel - 2-bit one-hot selector
// Outputs:	b - k-bit outputs

module Mux2(a1, a0, sel, b);
  parameter k = 16;

  // input-output declaration
  input[k-1:0]    a1, a0;
  input [1:0]     sel;
  output [k-1:0]  b;

  // selecting output
  wire [k-1:0] b = ({k{sel[0]}} & a0) | ({k{sel[1]}} & a1);
endmodule

// 2-Input Binary Multiplexer module
// Inputs:	a1 to a0 - k-bit inputs
//		      selb - 2-bit binary selector
// Outputs:	b - k-bit outputs
// The binary mutliplexer decodes the binary select before using it.

module Mux2b(a1, a0, selb, b);
  parameter k = 16;

  // input-output declaration
  input[k-1:0]    a1, a0;
  input           selb;
  output [k-1:0]  b;

  // decoding selb (binary) into sel (one-hot)
  wire [1:0]      sel;
  Dec #(1,2) dec(selb, sel);

  // multiplex
  Mux2 #(16) mux(a1, a0, sel, b);
endmodule
