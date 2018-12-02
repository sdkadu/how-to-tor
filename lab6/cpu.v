`define Wait 4'b0000
`define Decode 4'b0001
`define MovImm 4'b0010
`define GetA 4'b0011
`define GetB 4'b0100
`define MovSh 4'b0101
`define Add 4'b0110
`define Cmp 4'b0111
`define And 4'b1000
`define Mvn 4'b1001
`define WriteReg 4'b1010

module cpu(clk,reset,s,load,in,out,N,V,Z,w);
  input         clk, reset, s, load;
  input [15:0]  in;
  output [15:0] out;
  output        N, V, Z, w;

  // Instruction register
  wire [15:0]   irout;

  // Instruction decoder
  wire [15:0]   sximm5, sximm8;
  wire [2:0]    opcode, readnum, writenum;
  wire [1:0]    op, ALUop, shift;

  // State machine
  wire [2:0]    nsel; // one hot select
  wire [1:0]    vsel; // binary select for datapath in
  wire          loada, loadb, asel, bsel, loadc, loads, write;

  // Datapath
  wire [15:0]   mdata, C;
  wire [7:0]    PC; // program counter
  wire [2:0]    stat_out; // status

  assign mdata = 16'b0000000000000000;
  assign PC = 8'b00000000;

  // Instantiations

  vDFFE #(16) IR(clk, load, in, irout);

  instruction_decoder ID(irout, nsel, opcode, op, ALUop, sximm5, sximm8, shift, readnum, writenum);

  state_machine SM(clk, s, reset, opcode, op, vsel, loada, loadb, asel, bsel, loadc, loads, write, nsel, w);

  datapath DP(clk, readnum , vsel, loada, loadb, shift, asel, bsel, ALUop, loadc, loads,
              writenum, write, mdata, sximm8, PC, sximm5, stat_out, C); // pls check

  // Status output
  assign Z = stat_out[0]; // Check code matches
  assign N = stat_out[1]; // Check code matches
  assign V = stat_out[2]; // Check code matches

  // Output
  assign out = C;
endmodule

// Instruction decoder
module instruction_decoder (irout, nsel, opcode, op, ALUop, sximm5, sximm8, shift, readnum, writenum);
  input [15:0]    irout;
  input [2:0]     nsel;
  output [15:0]   sximm5, sximm8;
  output [2:0]    opcode, readnum, writenum;
  output [1:0]    op, ALUop, shift;

  wire [7:0]      imm8 = irout[7:0];
  wire [4:0]      imm5 = irout [4:0];
  wire [2:0]      Rn = irout[10:8];
  wire [2:0]      Rd = irout[7:5];
  wire [2:0]      Rm = irout[2:0];

  Mux3 #(3) muxn(Rn, Rd, Rm, nsel, writenum);

  assign opcode = irout[15:13];
  assign op = irout[12:11];
  assign ALUop = irout[12:11];
  assign sximm5 = {{11{imm5[4]}}, imm5};
  assign sximm8 = {{8{imm8[7]}},imm8};
  assign shift = irout[4:3];
  assign readnum = writenum;
endmodule

// State Machine
module state_machine(clk, s, reset, opcode, op, vsel, loada, loadb, asel, bsel, loadc, loads, write, nsel, w); // pls finish
  input [2:0]       opcode;
  input [1:0]       op;
  input             clk, s, reset;
  output reg [2:0]  nsel; // one hot select
  output reg [1:0]  vsel; // binary select for datapath in
  output reg        loada, loadb, asel, bsel, loadc, loads, write;
  output reg        w;

  reg [3:0]         present_state, next_state;

  always @(posedge clk) begin
    if (reset) begin
      present_state = `Wait;
      next_state = `Wait;
      vsel = 2'b00;
      loada = 1'b0;
      loadb = 1'b0;
      asel = 1'b0;
      bsel = 1'b0;
      loadc = 1'b0;
      loads = 1'b0;
      write = 1'b0;
      nsel = 3'b000;
      w = 1'b1;
    end
    else begin
      case (present_state)
        `Wait: if (s) begin
                 next_state = `Decode;
                 vsel = 2'b00;
                 loada = 1'b0;
                 loadb = 1'b0;
                 asel = 1'b0;
                 bsel = 1'b0;
                 loadc = 1'b0;
                 loads = 1'b0;
                 write = 1'b0;
                 nsel = 3'b000;
                 w = 1'b0;
               end
               else begin
                 next_state = `Wait;
                 vsel = 2'b00;
                 loada = 1'b0;
                 loadb = 1'b0;
                 asel = 1'b0;
                 bsel = 1'b0;
                 loadc = 1'b0;
                 loads = 1'b0;
                 write = 1'b0;
                 nsel = 3'b000;
                 w = 1'b1;
               end
        `Decode: begin
                   if ({opcode,op} == 5'b11010) begin // Move immediate
                     next_state = `MovImm;
                   end
                   else if (({opcode,op} == 5'b11000) | ({opcode,op} == 5'b10111)) begin // Move shifted or move negative
                     next_state = `GetB;
                   end
                   else begin // Add, compare or and
                      next_state = `GetA;
                   end
                 end
        `MovImm: begin
                     nsel = 3'b100; // selects Rn as register to write to
                     vsel = 2'b10; // selects sximm8 as data_in
                     write = 1'b1;
                     next_state = `Wait;
                  end
        `GetA: begin
                 nsel = 3'b100; // selects Rn
                 loada = 1'b1;
                 next_state = `GetB;
               end
        `GetB: begin
                 nsel = 3'b001; // selects Rm
                 loada = 1'b0;
                 loadb = 1'b1;
                 if ({opcode,op} == 5'b10100) begin // add
                   next_state = `Add;
                 end
                 else if ({opcode,op} == 5'b10101) begin // compare
                   next_state = `Cmp;
                 end
                 else if ({opcode,op} == 5'b10110) begin // and
                   next_state = `And;
                 end
                 else if ({opcode,op} == 5'b10111) begin // move negative
                   next_state = `Mvn;
                 end
                 else begin // move shifted
                   next_state = `MovSh;
                 end
               end
        `Add: begin
                asel = 1'b0; // selects A
                bsel = 1'b0; // selects B
                loadb = 1'b0;
                loadc = 1'b1;
                next_state = `WriteReg;
              end
        `Cmp: begin
                asel = 1'b0; // selects A
                bsel = 1'b0; // selects B
                loadb = 1'b0;
                loadc = 1'b1;
                loads = 1'b1; // output status
                next_state = `WriteReg;
              end
        `And: begin
                asel = 1'b0; // selects A
                bsel = 1'b0; // selects B
                loadb = 1'b0;
                loadc = 1'b1;
                next_state = `WriteReg;
              end
        `Mvn: begin
                asel = 1'b1; // selects zero
                bsel = 1'b0; // selects B
                loadb = 1'b0;
                loadc = 1'b1;
                next_state = `WriteReg;
              end
        `MovSh: begin
                  asel = 1'b1; // selects zero
                  bsel = 1'b0; // selects B
                  loadb = 1'b0;
                  loadc = 1'b1;
                  next_state = `WriteReg;
                end
        `WriteReg: begin
                     nsel = 3'b010; // selects Rd
                     vsel = 2'b00; // selects C
                     write = 1'b1;
                     next_state = `Wait;
                   end
         default: begin
                  present_state = `Wait;
                  next_state = `Wait;
                  end
      endcase
    end
    present_state = next_state;
  end
endmodule

// 3 input multiplexer
module Mux3(a2, a1, a0, s, out) ;
  parameter k = 16; // width
  input [k-1:0]   a0, a1, a2; // inputs
  input [2:0]     s; // one-hot select
  output[k-1:0]   out;
  wire [k-1:0]    out = ({k{s[0]}} & a0) | ({k{s[1]}} & a1) | ({k{s[2]}} & a2);
endmodule
