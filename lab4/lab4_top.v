// my five numbers: 60598
// 6 - 7'b0000010
// 0 - 7'b1000000
// 5 - 7'b0010010
// 9 - 7'b0010000
// 8 - 7'b0000000
// numbers array = 30'b000101000001100100010000110010
// display intervals =
//    digits[29:24]
//    digits[23:18]
//    digits[17:12]
//    digits[11:6]
//    digits[5:0]

module lab4_top(SW,KEY,HEX0);
  input [9:0] SW;
  input [3:0] KEY;
  output [6:0] HEX0;

  // declares the binary codes of the five digits in alphabetical order
  parameter A = 7'b0000010;
  parameter B = 7'b1000000;
  parameter C = 7'b0010010;
  parameter D = 7'b0010000;
  parameter E = 7'b0000000;

  // sets specific SW and KEY values
  wire reset = ~KEY[1];
  wire clock = ~KEY[0];
  wire direction = ~SW[0];

  // declares variables for current and next state
  reg [6:0] state;
  reg [6:0] nxtState;

  assign HEX0 = state;

  // always block as the state machine (decides where to go next)
  // when SW0 = 1 (off), direction = 0 - move forwards
  always @(state, direction) begin
	case (state)
	  A: if (direction == 1'b0) nxtState = B;
	     else		    nxtState = E;
	  B: if (direction == 1'b0) nxtState = C;
	     else		    nxtState = A;
	  C: if (direction == 1'b0) nxtState = D;
	     else		    nxtState = B;
	  D: if (direction == 1'b0) nxtState = E;
	     else		    nxtState = C;
	  E: if (direction == 1'b0) nxtState = A;
	     else		    nxtState = D;
	  default: nxtState = A;
	endcase
  end

  // checks condition if 'reset' button is pressed
  // if not, continue as per usual
  always @(posedge clock) begin
	   if(reset == 1'b1)	state = A;
	   else			          state = nxtState;
  end

endmodule
