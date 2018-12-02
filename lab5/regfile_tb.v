module regfile_tb ();
  reg [15:0] data_in;
  reg [2:0] writenum, readnum;
  reg write, clk;
  wire [15:0] data_out;
  
  //wire [7:0] dec_writenum, load;
  //wire [15:0] R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out; // output of each register
  // include error signal
  reg err;
  
  // instantiate regfile
  regfile DUT(data_in, writenum, write, readnum, clk, data_out);

  initial begin
    // set error signal to 0
    err = 0;
    // test case where we write 42 to register 3 and read from register 3
    data_in = 16'b0000000000101010;
    writenum = 3'b011;
    readnum = 3'b011;
    write = 1'b1;
    clk = 1'b0;
    #5
    clk = 1'b1;
    #5
    clk = 1'b0;
    // check data out is 42
    if (data_out != 16'b0000000000101010) begin
      err = 1;
    end
    #5
    write = 1'b0;
    // display test result
    if(err == 0) $display("All tests for case 1 passed");
    else $display("Tests failed");
    // test case where we write 65432 to register 7 and read from register 7
    data_in = 16'b1111111110011000;
    writenum = 3'b111;
    readnum = 3'b111;
    write = 1'b1;
    clk = 1'b0;
    #5
    clk = 1'b1;
    #5
    clk = 1'b0;
    // check data out is 42
    if (data_out != 16'b1111111110011000) begin
      err = 1;
    end
    #5
    write = 1'b0;
    if(err == 0) $display("All tests for case 2 passed");
    else $display("Tests failed");
  end
endmodule
