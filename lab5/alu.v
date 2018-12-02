module ALU(Ain,Bin,ALUop,out,Z);
  // input-output declaration
  input [15:0]    Ain, Bin;
  input [1:0]     ALUop;
  output [15:0]   out;
  output          Z;

  reg [15:0]      out;

  // 'Status'
  assign Z = (|out) ? 0:1;

  // always block that changes for every input (ALUop, Ain, Bin)
  always @(*) begin
    casex(ALUop)
	    2'b00: out = Ain + Bin;
	    2'b01: out = Ain - Bin;
	    2'b10: out = Ain & Bin;
	    2'b11: out = ~Bin;
	    default: out = 16'b0000000000000000;
    endcase
  end
endmodule
