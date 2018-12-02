// TestWin
// Testbench to test if the identification code in the DetectWinner module works
// Inputs: None (Testbenches do not have inputs and outputs)
// Outputs: None (Testbenches do not have inputs and outputs)
// 
// Board mapping to be used:
// 
//   0 | 1 | 2 
//  ---+---+---
//   3 | 4 | 5 
//  ---+---+---
//   6 | 7 | 8 
//

module TestWin ();
// declare the two states of reg to be tested
  reg [8:0] xin;
  reg [8:0] oin;
// declare the wire output win_line that describes if anyone has won
  wire [7:0] win_line;

// instantiate module to be used
  DetectWinner dut(.ain(xin), .bin(oin), .win_line(win_line));

  initial begin
	// initial condition (game hasn't started)
	// expected outcome: no wins (all zero)
	xin = 0; oin = 0;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// unfinished game: no winner
	// expected outcome: no wins (all zero)
	xin = 9'b101010000; oin = 9'b010101000;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// win condition 1: top row
	// expected outcome: x wins (case 1 true - win_line = 00000001)
	xin = 9'b111000000; oin = 0;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// win condition 2: mid row
	// expected outcome: x wins (case 2 true - win_line = 00000010)
	xin = 9'b000111000;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// win condition 3: bot row
	// expected outcome: x wins (case 3 true - win_line = 00000100)
	xin = 9'b000000111;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// win condition 4: left col
	// expected outcome: x wins (case 4 true - win_line = 00001000)
	xin = 9'b100100100;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// win condition 5: mid col
	// expected outcome: x wins (case 5 true - win_line = 00010000)
	xin = 9'b010010010;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// win condition 6: right col
	// expected outcome: x wins (case 6 true - win_line = 00100000)
	xin = 9'b001001001;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// win condition 7: diagonal 1
	// expected outcome: x wins (case 7 true - win_line = 01000000)
	xin = 9'b100010001;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// win condition 8: diagonal 2
	// expected outcome: x wins (case 8 true - win_line = 10000000)
	xin = 9'b001010100;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// lose condition 1: blocked row
	// expected outcome: no wins (all zeros)
	xin = 9'b000101000; oin = 9'b000010000;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// lose condition 2: blocked column
	// expected outcome: no wins (all zeros)
	xin = 9'b010000010; oin = 9'b000010000;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// lose condition 3: blocked diagonal
	// expected outcome: no wins (all zeros)
	xin = 9'b100000001; oin = 9'b000010000;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");

	// win condition (special): o wins in diagonal
	// expected outcome: o wins (case 7 true - win_line = 01000000)
	xin = 9'b000000000; oin = 9'b100010001;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
	// lose condition (special): o loses by column
	// expected outcome: no wins (all zeros)
	xin = 9'b000010000; oin = 9'b000101000;
	#100
	$display("%h %h %h", {xin[0],oin[0]},{xin[1],oin[1]},{xin[2],oin[2]}) ;
	$display("%h %h %h", {xin[3],oin[3]},{xin[4],oin[4]},{xin[5],oin[5]}) ;
	$display("%h %h %h", {xin[6],oin[6]},{xin[7],oin[7]},{xin[8],oin[8]}) ;
	$display("win_line output is %b", win_line);
	$display(" ");
  end
endmodule

