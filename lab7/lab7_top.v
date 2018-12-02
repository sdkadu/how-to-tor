`define MNONE 2'b00
`define MWRITE 2'b01
`define MREAD 2'b10

// HEX Displays Alphabets
`define NA 6'b111111
`define A 6'b001010
`define B 6'b001011
`define C 6'b001100
`define D 6'b001101
`define E 6'b001110
`define F 6'b001111
`define G 6'b100000
`define H 6'b100001
`define I 6'b100010
`define J 6'b100011
`define K 6'b100100
`define L 6'b100101
`define M 6'b100110 //nothing
`define N 6'b100111
`define O 6'b101000
`define P 6'b101001
`define Q 6'b101010
`define R 6'b101011
`define S 6'b101100
`define T 6'b101101
`define U 6'b101110
`define V 6'b101111
`define W 6'b110000 //nothing
`define X 6'b110001
`define Y 6'b110010
`define Z 6'b110011


module lab7_top(KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
  input [3:0]   KEY;
  input [9:0]   SW;
  output [9:0]  LEDR;
  output [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

  wire clk = ~KEY[0];
  wire reset = ~KEY[1];

  wire [15:0]   dout, write_data;
  wire [15:0]   din = write_data;
  wire [8:0]    mem_addr;
  wire [7:0]    read_address = mem_addr[7:0];
  wire [7:0]    write_address = mem_addr[7:0];
  wire          msel, weq, req; // equality comparator outputs
  wire          write = msel & weq;
  wire          mtse = msel & req; // tristate enable
  wire [1:0]    mem_cmd;
  wire [8:0]    PC;
  wire [4:0]    present_state;

  wire [15:0]   read_data = mtse ? dout : 16'bz; // tristate driver

  // Instantiations
  cpu CPU(clk,reset,read_data,write_data,N,V,Z,w,mem_addr,mem_cmd, PC, present_state);
  EqComp #(2) MW(`MWRITE, mem_cmd, weq);
  EqComp #(2) MR(`MREAD, mem_cmd, req);
  EqComp #(1) MS(1'b0, mem_addr[8], msel);
  RAM MEM(clk, read_address, write_address, write, din, dout); // needs fixing

  // Add code for switch control
  wire [2:0] switch_control;
  EqComp #(9) SC(mem_addr, 9'h140, switch_control[0]);
  EqComp #(2) SR(`MREAD, mem_cmd, switch_control[1]);
  assign switch_control[2] = &switch_control[1:0];
  assign read_data = switch_control[2] ? {{8{SW[7]}},SW[7:0]} : 16'bz; // tristate driver

  // Add code for LED control
  wire [2:0]  LED_control;
  EqComp #(9) LC(mem_addr, 9'h100, LED_control[0]);
  EqComp #(2) LR(`MWRITE, mem_cmd, LED_control[1]);
  assign LED_control[2] = &LED_control[1:0];
  vDFFE #(8) LEDS(clk, LED_control[2], write_data[7:0], LEDR[7:0]);

  // Add bindings for LEDR[9] - LEDR [9] is on whenever in wait stage
  assign LEDR[9] = w;

  // sseg modules
  reg [5:0]   f, e, d, c, b, a;
  sseg five(f, HEX5);
  sseg four(e, HEX4);
  sseg three(d, HEX3);
  sseg two(c, HEX2);
  sseg one(b, HEX1);
  sseg zero(a, HEX0);

  always @(*) begin
  // Add bindings for HEX display (always block)
    if(SW[9] == 1) begin // If SW9 up, display states on HEX0 - HEX5
      case(present_state)
        5'b00000: begin f = `R; e = `E; d = `S; c = `E; b = `T; a = `NA; end // Reset
        5'b00001: begin f = `I; e = `F; d = 6'b000001; c = `NA; b = `NA; a = `NA; end // IF1
        5'b00010: begin f = `I; e = `F; d = 6'b000010; c = `NA; b = `NA; a = `NA; end // IF2
	      5'b00011: begin f = `U; e = `P; d = `D; c = `A; b = `T; a = `E; end // UpdatePC
	      5'b00100: begin f = `D; e = `E; d = `C; c = `O; b = `D; a = `E; end // Decode
        5'b00101: begin f = `N; e = `N; d = `O; c = `U; b = `I; a = `NA; end // MovImm
        5'b00110: begin f = `G; e = `E; d = `T; c = `NA; b = `A; a = `NA; end // GetA
        5'b00111: begin f = `G; e = `E; d = `T; c = `NA; b = `B; a = `NA; end // GetB
        5'b01000: begin f = `N; e = `N; d = `O; c = `U; b = `S; a = `H; end // MoveSh
        5'b01001: begin f = `A; e = `D; d = `D; c = `NA; b = `NA; a = `NA; end // Add
        5'b01010: begin f = `C; e = `N; d = `N; c = `P; b = `NA; a = `NA; end // Cmp
        5'b01011: begin f = `A; e = `N; d = `D; c = `NA; b = `NA; a = `NA; end // And
        5'b01100: begin f = `N; e = `N; d = `V; c = `N; b = `NA; a = `NA; end // Mvn
        5'b01101: begin f = `L; e = `O; d = `A; c = `D; b = `A; a = `D; end // LoadAddr
        5'b01110: begin f = `L; e = `D; d = `R; c = `NA; b = `NA; a = `NA; end // LDR
        5'b01111: begin f = `S; e = `T; d = `R; c = `NA; b = `NA; a = `NA; end // STR
        5'b10000: begin f = `S; e = `T; d = `R; c = 6'b000010; b = `NA; a = `NA; end // STR2
        5'b10001: begin f = `S; e = `T; d = `R; c = 6'b000011; b = `NA; a = `NA; end // STR3
        5'b10010: begin f = `U; e = `U; d = `R; c = `I; b = `T; a = `E; end // WriteReg
        5'b10011: begin f = `H; e = `A; d = `L; c = `T; b = `NA; a = `NA; end // HALT
        default: begin f = 6'b000000; e = 6'b000000; d = 6'b000000; c = 6'b000000; b = 6'b000000; a = 6'b000000; end
      endcase
    end
     else begin // If SW9 down, display PC Counter Value on HEX 0 - HEX5
      b = PC[7:4];
      a = PC[3:0];
      c = {1'b0, 1'b0, 1'b0, PC[8]};
      d = `NA; e = `NA; f = `NA;
    end
  end
endmodule

// Memory block
module RAM(clk,read_address,write_address,write,din,dout);
  parameter data_width = 16;
  parameter addr_width = 8;
  parameter filename = "data.txt";

  input     clk;
  input     [addr_width-1:0] read_address, write_address;
  input     write;
  input     [data_width-1:0] din;
  output    [data_width-1:0] dout;
  reg       [data_width-1:0] dout;

  reg       [data_width-1:0] mem [2**addr_width-1:0];

  initial $readmemb(filename, mem);

  always @ (posedge clk) begin
    if (write)
      mem[write_address] <= din;
    dout <= mem[read_address]; // dout doesn't get din in this clock cycle
                               // (this is due to Verilog non-blocking assignment "<=")
  end
endmodule

// equality comparator
module EqComp(a, b, eq) ;
  parameter k=8;
  input     [k-1:0] a,b;
  output    eq;
  wire      eq;

  assign eq = (a==b) ;
endmodule


// sseg module (HEX Display)
module sseg(in, segs);
  input [5:0]       in;
  output reg [6:0]  segs;

  always @(*) begin
    case (in)
      6'b000000: segs = 7'b1000000; // 0
      6'b000001: segs = 7'b1111001; // 1
      6'b000010: segs = 7'b0100100; // 2
      6'b000011: segs = 7'b0110000; // 3
      6'b000100: segs = 7'b0011001; // 4
      6'b000101: segs = 7'b0010010; // 5
      6'b000110: segs = 7'b0000010; // 6
      6'b000111: segs = 7'b1111000; // 7
      6'b001000: segs = 7'b0000000; // 8
      6'b001001: segs = 7'b0011000; // 9
      6'b001010: segs = 7'b0001000; // A (10)
      6'b001011: segs = 7'b0000011; // B (11)
      6'b001100: segs = 7'b1000110; // C (12)
      6'b001101: segs = 7'b0100001; // D (13)
      6'b001110: segs = 7'b0000110; // E (14)
      6'b001111: segs = 7'b0001110; // F (15)
      6'b100000: segs = 7'b0000010; // G
      6'b100001: segs = 7'b0001001; // H
      6'b100010: segs = 7'b1111001; // I
      6'b100011: segs = 7'b1110001; // J
      6'b100100: segs = 7'b0001001; // K
      6'b100101: segs = 7'b1000111; // L
      6'b100110: segs = 7'b1111111; // M - WHAT?
      6'b100111: segs = 7'b1001000; // N
      6'b101000: segs = 7'b1000000; // O
      6'b101001: segs = 7'b0001100; // P
      6'b101010: segs = 7'b0011000; // Q
      6'b101011: segs = 7'b1001110; // R
      6'b101100: segs = 7'b0010010; // S
      6'b101101: segs = 7'b0000111; // T
      6'b101110: segs = 7'b1000001; // U
      6'b101111: segs = 7'b1100011; // V
      6'b110000: segs = 7'b1111111; // W - WHAT?
      6'b110001: segs = 7'b0101101; // X
      6'b110010: segs = 7'b0011001; // Y
      6'b110011: segs = 7'b0100100; // Z
      6'b111111: segs = 7'b1111111; //


      default: segs = 7'b1111111; // No display
    endcase
  end
endmodule
