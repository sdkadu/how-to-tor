module lab1_top (                                                               // initializes module
  input not_LEFT_pushbutton,                                                    // declares inputs & outputs
  input not_RIGHT_pushbutton,
  input [3:0] A,
  input [3:0] B, 
  output reg [3:0] result );

  wire [3:0] ANDed_result;                                                      // declares wires to use as 'variables'
  wire [3:0] ADDed_result;
  wire LEFT_pushbutton;
  wire RIGHT_pushbutton;

  assign ANDed_result = A & B;                                                  // assign wire connections/values
  assign ADDed_result = A + B;

  assign LEFT_pushbutton = ~ not_LEFT_pushbutton;
  assign RIGHT_pushbutton = ~ not_RIGHT_pushbutton;

  always @* begin                                                               // always block to describe logical behavior of circuit
    case( {LEFT_pushbutton, RIGHT_pushbutton} )                                 // 'case' statements used as 'if' statements
			2'b01: result = ADDed_result;
			2'b10: result = ANDed_result;
			2'b11: result = ADDed_result;
			/* default statement to prevent inferred latches */
			default: result = 4'b0000;
			/*************************************************/
		endcase
	end
endmodule
