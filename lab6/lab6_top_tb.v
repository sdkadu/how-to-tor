module lab6_top_tb();
  reg [3:0] KEY;
  reg [9:0] SW;
  wire [9:0] LEDR; 
  wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
  reg CLOCK_50;

  lab6_top DUT3(KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,CLOCK_50);

  initial begin
    CLOCK_50 = 0; #1;
    forever begin
      CLOCK_50 = 1; #1;
      CLOCK_50 = 0; #1;
    end
  end

  initial begin
    // reset
    KEY[3:0] = 4'b0011;
    SW[9:0] = 10'b0000000000;
    #10
    KEY[1:0] = 2'b00;
    #10
    // MOV R0, #32
    SW[9:0] = 10'b1011010000; #10 SW[9:0] = 10'b0000100000;
    #10
    KEY[0] = 1'b1; KEY[3] = 1'b1; // load into instruction register
    #10
    KEY[0] = 1'b0; KEY[3] = 1'b0;
    #10
    KEY[1:0] = 2'b11; #10 KEY[1:0] = 2'b00;
    #10
    KEY[0] = 1'b1; KEY[2] = 1'b1; // set s and move to decode state
    #10
    KEY[0] = 1'b0; KEY[2] = 1'b0;
    #10
    KEY[0] = 1'b1; #10 KEY[0] = 1'b0; // move to MovImm state
    #10
    KEY[0] = 1'b1; #10 KEY[0] = 1'b0; // move to wait state
    #10
    $display("Register 0 contains %b", lab6_top_tb.DUT3.U.DP.REGFILE.R0);

    $stop;
  end
endmodule
