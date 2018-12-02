module lab4_tb();
  // hex output
  wire [6:0] out;
  // reg(s) to be tested in the initial block
  reg [9:0] directionSwitch;
  reg [6:0] state;
  reg [6:0] nxtState;
  reg [3:0] resetNclock;

  // for ease, set the numbers to parameters and reset/clock buttons
  parameter A = 7'b0000010;
  parameter B = 7'b1000000;
  parameter C = 7'b0010010;
  parameter D = 7'b0010000;
  parameter E = 7'b0000000;

  // module instantiation
  lab4_top dut(directionSwitch, resetNclock, out);

  // initial block
  initial begin
	// set default values for switch, and buttons
	directionSwitch = 10'b1111111111; resetNclock = 4'b1111;
	// test1: reset at the start
	// state starts at NULL, next is A, regardless direction
	// clock flipped once to proceed
	  //reset button is pressed
	resetNclock[1] = 0;
	#5;
	resetNclock[1] = 1;
	#5;
	  // clock button is pressed
	resetNclock[0] = 0;
	#5;
	resetNclock[0] = 1;
	#20;
	  // extra check: direction is changed
	directionSwitch[0] = 0;
	  // reset button is pressed
	resetNclock[1] = 0;
	#5;
	resetNclock[1] = 1;
	#5;
	  // clock button is pressed
	resetNclock[0] = 0;
	#5;
	resetNclock[0] = 1;
	#20;

	// test2: clock on and off 10 times
	// state starts at A, ends at A, direction = 0 (SW0 = low);
	directionSwitch[0] = 1;
	  // reset states
	resetNclock[1] = 0;
	resetNclock[1] = 1;
	resetNclock[0] = 0;
	resetNclock[0] = 1;
	#5;
	  // flips clock 10 times
	repeat(10) begin
	  resetNclock[0] = 0;
	  #5;
	  resetNclock[0] = 1;
	  #5;
	end
	#15;

	// test4: clock on and off 10 times (reverse direction)
	// state starts at A, ends at A, direction = 1 (SW0 = high);
	directionSwitch[0] = 0;
	  // reset states
	resetNclock[1] = 0;
	resetNclock[1] = 1;
	resetNclock[0] = 0;
	resetNclock[0] = 1;
	#5;
	  // flips clock 10 times
	repeat(10) begin
	  resetNclock[0] = 0;
	  #5;
	  resetNclock[0] = 1;
	  #5;
	end
	#15;

	// test5: clock on and off 3 times (forward direction), then reset
	// state starts at A, ends at A, direction = 0 (SW0 = low);
	directionSwitch[0] = 1;
	  // reset states
	resetNclock[1] = 0;
	resetNclock[1] = 1;
	resetNclock[0] = 0;
	resetNclock[0] = 1;
	#5;
	  // flips clock 10 times
	repeat(10) begin
	  resetNclock[0] = 0;
	  #5;
	  resetNclock[0] = 1;
	  #5;
	end
	  // reset states
	resetNclock[1] = 0;
	#5;
	resetNclock[1] = 1;
	#5;
	resetNclock[0] = 0;
	#5;
	resetNclock[0] = 1;
	#15;

	// test6: clock on and off 3 times (reverse direction), then reset
	// state starts at A, ends at A, direction = 1 (SW0 = high);
	directionSwitch[0] = 0;
	  // flips clock 10 times
	repeat(10) begin
	  resetNclock[0] = 0;
	  #5;
	  resetNclock[0] = 1;
	  #5;
	end
	  // reset states
	resetNclock[1] = 0;
	#5;
	resetNclock[1] = 1;
	#5;
	resetNclock[0] = 0;
	#5;
	resetNclock[0] = 1;
	#15;
  end

endmodule
