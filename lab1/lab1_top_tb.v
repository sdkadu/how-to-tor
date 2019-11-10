module lab1_top_tb (); //gpg
// No inputs or outputs, because it is a testbench

	reg sim_LEFT_button;
	reg sim_RIGHT_button;
	reg [3:0] sim_A;
	reg [3:0] sim_B;
 
	wire [3:0] sim_result;

	lab1_top dut (
		.not_LEFT_pushbutton(!sim_LEFT_button),
		.not_RIGHT_pushbutton(!sim_RIGHT_button),
		.A(sim_A),
		.B(sim_B),
		.result(sim_result)
	);
	

	initial begin
		// start out by setting our buttons to "not-pushed"
		sim_LEFT_button = 1'b0;
		sim_RIGHT_button = 1'b0;

		// wait five simulation timesteps to allow changes to happen
		#5;

		// Our first test: try ANDing
		sim_LEFT_button = 1'b1;
		sim_A = 4'b1100;
		sim_B = 4'b1010;

		#5;

		// print current values of the Modelsim command line
		$display("Output is %b, we expected %b", sim_result, (4'b1100 & 4'b1010));

		// try adding
		sim_LEFT_button = 1'b0;
		sim_RIGHT_button = 1'b1;
		sim_A = 4'b1100;
		sim_B = 4'b1010;
		#5;
		
		$display("Output is %b, we expected %b", sim_result, (4'b1100 + 4'b1010));

		// try changing our inputs, note that still adding

		sim_A = 4'b0001;
		sim_B = 4'b0011;
		#5;

		$display("Output is %b, we expected %b", sim_result, (4'b0001 + 4'b0011));
		
		// now go back to ANDing
		sim_LEFT_button = 1'b1;
		sim_RIGHT_button = 1'b0;
		#5;

		$display("Output is %b, we expected %b", sim_result, (4'b0001 & 4'b0011));

		$stop;
	end
endmodule
