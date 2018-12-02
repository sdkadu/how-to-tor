module shifter_tb();
  reg [15:0]      in;
  reg [1:0]       shift;
  wire [15:0]     sout;
  reg err;

  shifter DUT(in, shift, sout);

  initial begin
    // set err to 0
    err = 1'b0;
    // test for case in pdf
      // test1: shift = 2'b00
      // expected outcome: 16'b1111000011001111
    shift = 2'b00;
    in = 16'b1111000011001111;
    #10
    if(sout != 16'b1111000011001111) err = 1;
    #10
      // test2: shift = 2'b01
      // expected outcome: 16'b1110000110011110
    shift = 2'b01;
    #10
    if(sout != 16'b1110000110011110) err = 1;
    #10
      // test1: shift = 2'b10
      // expected outcome: 16'b111100001100111
    shift = 2'b10;
    #10
    if(sout != 16'b0111100001100111) err = 1;
    #10
      // test1: shift = 2'b11
      // expected outcome: 16'b111100001100111
    shift = 2'b11;
    #10
    if(sout != 16'b1111100001100111) err = 1;
    #10
    if(err == 0) $display("All tests for case 1 passed");
    else $display("Tests failed");

    // test for case (personal)
      // test1: shift = 2'b00
      // expected outcome: 16'b1000000000000001
    shift = 2'b00;
    in = 16'b1000000000000001;
    #10
    if(sout != 16'b1000000000000001) err = 1;
    #10
      // test2: shift = 2'b01
      // expected outcome: 16'b0000000000000010
    shift = 2'b01;
    #10
    if(sout != 16'b0000000000000010) err = 1;
    #10
      // test1: shift = 2'b10
      // expected outcome: 16'b0100000000000000
    shift = 2'b10;
    #10
    if(sout != 16'b0100000000000000) err = 1;
    #10
      // test1: shift = 2'b11
      // expected outcome: 16'b1100000000000000
    shift = 2'b11;
    #10
    if(sout != 16'b1100000000000000) err = 1;
    #10
    if(err == 0) $display("All tests for case 2 passed");
    else $display("Tests failed");
  end
endmodule
