module regfile(data_in,writenum,write,readnum,clk,data_out);
 	// input-output declarations
	input [15:0] 		data_in;
	input [2:0] 		writenum, readnum;
	input 					write, clk;
	output [15:0] 	data_out;

	// wires
	wire [15:0] 		load;
	wire [15:0] 		R0_out, R1_out, R2_out, R3_out, R4_out, R5_out, R6_out, R7_out;
	wire [7:0] 			writenum_dec;

	// module instantiations
	  // register files
	vDFFe  #(16) R0(clk, load[0], data_in, R0_out);
	vDFFe  #(16) R1(clk, load[1], data_in, R1_out);
	vDFFe  #(16) R2(clk, load[2], data_in, R2_out);
	vDFFe  #(16) R3(clk, load[3], data_in, R3_out);
	vDFFe  #(16) R4(clk, load[4], data_in, R4_out);
	vDFFe  #(16) R5(clk, load[5], data_in, R5_out);
	vDFFe  #(16) R6(clk, load[6], data_in, R6_out);
	vDFFe  #(16) R7(clk, load[7], data_in, R7_out);

	Muxb8 #(16) read(R7_out, R6_out, R5_out, R4_out, R3_out, R2_out, R1_out, R0_out, readnum, data_out);
	Dec #(3,8) dec(writenum, writenum_dec);

	// choosing which register to write, if load is on
	assign load = {8{write}} & writenum_dec;

endmodule

// Loaded D flip flop module
// Inputs:	clock - operates if in is copied to out
//		load - operates at clock if load = 1, does nothing if load = 0
//		in - input
// Output:	out - output

module vDFFe(clk, load, in, out) ;
  parameter n = 16; // width
  // input-output declaration
  input 					clk, load ;
  input  [n-1:0] 	in ;
  output [n-1:0] 	out ;
  reg    [n-1:0] 	out ;
  wire   [n-1:0] 	next_out ;

  // assign next output to input if load is enabled
  assign next_out = load ? in : out;

  // change output only on rising edge of clk
  always @(posedge clk)
    out = next_out;
endmodule

// Decoder module
// Inputs:	a - input binary
// Outputs:	b - output one-hot code

module Dec(a, b);
  parameter n = 3; // width input
  parameter m = 8; // width output

  // input-output declaration
  input [n-1:0] 	a;
  output [m-1:0] 	b;

  // Decoding
  wire [m-1:0] b = 1 << a;
endmodule

// 8-Input Multiplexer module
// Inputs:	a7 to a0 - k-bit inputs
//		sel - 8-bit one-hot selector
// Outputs:	b - k-bit outputs

module Mux8(a7, a6, a5, a4, a3, a2, a1, a0, sel, b);
  parameter k = 16;

  // input-output declaration
  input[k-1:0] 		a7, a6, a5, a4, a3, a2, a1, a0;
  input [7:0] 		sel;
  output [k-1:0] 	b;

  // selecting output
  wire [k-1:0] b = ({k{sel[0]}} & a0) | ({k{sel[1]}} & a1) | ({k{sel[2]}} & a2) |
	  	     ({k{sel[3]}} & a3) | ({k{sel[4]}} & a4) | ({k{sel[5]}} & a5) |
	 	     ({k{sel[6]}} & a6) | ({k{sel[7]}} & a7);
endmodule

// 8-Input Binary Multiplexer module
// Inputs:	a7 to a0 - k-bit inputs
//		selb - 3-bit binary selector
// Outputs:	b - k-bit outputs
// The binary mutliplexer decodes the binary select before using it.

module Muxb8(a7, a6, a5, a4, a3, a2, a1, a0, selb, b);
  parameter k = 16;

  // input-output declaration
  input[k-1:0] 		a7, a6, a5, a4, a3, a2, a1, a0;
  input [2:0] 		selb;
  output [k-1:0] 	b;

  // decoding selb (binary) into sel (one-hot)
  wire [7:0] 			sel;
  Dec #(3,8) dec(selb, sel);

  // multiplex
  Mux8 #(16) mux(a7, a6, a5, a4, a3, a2, a1, a0, sel, b);
endmodule
