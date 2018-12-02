module testAdjLogic ();
	reg [8:0] xin;
	reg [8:0] oin;
	wire [8:0] cout;

	// instantiate modules used
	PlayAdjacentEdge xMove(xin, oin, cout);
	initial begin
	// tests under the condition that o has placed at corners, while x is in the middle
		xin = 9'b000010000; oin = 9'b100000001;
		#100
		// displays whethere there are possible placements for x
		$display("possible placement output is %b", cout);
		$display(" ");
	// tests under the condition that o has placed at corners (2), while x is in the middle
		xin = 9'b000010000; oin = 9'b001000100;
		#100
		// displays whethere there are possible placements for x
		$display("possible placement output is %b", cout);
		$display(" ");
	// tests under the condition that o has placed at corners, while x is not in the middle
		xin = 9'b010000000; oin = 9'b001000100;
		#100
		// displays whethere there are possible placements for x
		$display("possible placement output is %b", cout);
		$display(" ");
	// tests under the condition that o has not placed at corners, while x is in the middle (no adjacent logic needed)
		oin = 9'b000101000; xin = 9'b000010000;
		#100
		// displays whethere there are possible placements for x
		$display("possible placement output is %b", cout);
		$display(" ");
	// test that priority is not overrided (win is still first priority)
		xin = 9'b001001000; oin = 9'b100100000;
		#100;
		// displays whethere there are possible placements for x
		$display("possible placement output is %b", cout);
		$display(" ");
	end
endmodule
	
