module ALU_tb();
  reg [15:0]    Ain, Bin;
  reg [1:0]     ALUop;
  wire [15:0]   out;
  wire          Z;
  reg           err;

  ALU DUT(Ain, Bin, ALUop, out, Z);


  initial begin
    err = 0;
    // Test for Ain and Bin = 0
    ALUop = 2'b00;
    // Expected output: Z is 1, and out = 0, because ALUop is 0 by default
    Ain = 16'b0000000000000000; Bin = 16'b0000000000000000;
    if(Z != 1) err = 1;
    #10;
    // Test for ALUop = 0;
    // addition 1, expected output = 16'b0000000000000001
    Ain = 16'b0000000000000001; Bin = 16'b0000000000000000;
    #10;
    if(out != 16'b0000000000000001) err = 1;
    if(Z != 0) err = 1;
    // addition 2, expected output = 16'b1000000000000001
    Ain = 16'b0000000000000001; Bin = 16'b1000000000000000;
    #10;
    if(out != 16'b1000000000000001) err = 1;
    if(Z != 0) err = 1;
    // addition 3, expected output = 16'b0000000000000010
    Ain = 16'b0000000000000001; Bin = 16'b0000000000000001;
    #10;
    if(out != 16'b0000000000000010) err = 1;
    if(Z != 0) err = 1;
      // errorTest for addition
	if(err == 0) begin
	  $display("All tests for ALUop = 00 passed");
	end
	else begin
	  $display("Tests not passed");
	end
    #20;

    // Test for ALUop = 01;
    ALUop = 2'b01;
    // subtraction 1, expected output = 16'b0000000000000000
    Ain = 16'b0000000000000010; Bin = 16'b0000000000000010;
    #10;
    if(out != 16'b0000000000000000) err = 1;
    if(Z != 1) err = 1;
    // subtraction 2, expected output = 16'b0000000000000010
    Ain = 16'b0000000000000100; Bin = 16'b0000000000000010;
    #10;
    if(out != 16'b0000000000000010) err = 1;
    if(Z != 0) err = 1;
    // subtraction 3, expected output = 16'b0000000000000000
    Ain = 16'b1000000000000001; Bin = 16'b1000000000000001;
    #10;
    if(out != 16'b0000000000000000) err = 1;
    if(Z != 1) err = 1;
      // errorTest for subtraction
	if(err == 0) begin
	  $display("All tests for ALUop = 01 passed");
	end
	else begin
	  $display("Tests not passed");
	end
    #20;

    // Test for ALUop = 10;
    ALUop = 2'b10;
    // and 1, expected output = 16'b0000000000000000
    Ain = 16'b0000000000000000; Bin = 16'b0000000000000000;
    #10;
    if(out != 16'b0000000000000000) err = 1;
    if(Z != 1) err = 1;
    // and 2, expected output = 16'b1111111111111111
    Ain = 16'b1111111111111111; Bin = 16'b1111111111111111;
    #10;
    if(out != 16'b1111111111111111) err = 1;
    if(Z != 0) err = 1;
    // and 3, expected output = 16'b1010101010101010
    Ain = 16'b1111111111111111; Bin = 16'b1010101010101010;
    #10;
    if(out != 16'b1010101010101010) err = 1;
    if(Z != 0) err = 1;
      // errorTest for subtraction
	if(err == 0) begin
	  $display("All tests for ALUop = 10 passed");
	end
	else begin
	  $display("Tests not passed");
	end

    // Test for ALUop = 11;
    ALUop = 2'b11;
    // not 1, expected output = 16'b111111111111111
    Ain = 16'b0000000000000000; Bin = 16'b0000000000000000;
    #10;
    if(out != 16'b1111111111111111) err = 1;
    if(Z != 0) err = 1;
    // not 2, expected output = 16'b0000000000000000
    Ain = 16'b1111111111111111; Bin = 16'b1111111111111111;
    #10;
    if(out != 16'b0000000000000000) err = 1;
    if(Z != 1) err = 1;
    // not 3, expected output = 16'b0101010101010101
    Ain = 16'b1111111111111111; Bin = 16'b1010101010101010;
    #10;
    if(out != 16'b0101010101010101) err = 1;
    if(Z != 0) err = 1;
      // errorTest for subtraction
	if(err == 0) begin
	  $display("All tests for ALUop = 11 passed");
	end
	else begin
	  $display("Tests not passed");
	end
  end
endmodule
