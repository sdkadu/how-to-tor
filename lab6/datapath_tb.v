module datapath_tb ();
  reg           clk, vsel, loada, loadb, asel, bsel, loadc, loads, write;
  reg [1:0]     shift, ALUop;
  reg [2:0]     readnum, writenum;
  reg [15:0]    datapath_in;
  wire          Z_out;
  wire [15:0]   datapath_out;

  reg err;

  // instantiate datapath
  datapath DUT(clk, readnum , vsel, loada, loadb, shift, asel, bsel, ALUop, loadc, loads,
               writenum, write, datapath_in, Z_out, datapath_out);

  initial begin
    // set err to 0
    err = 1'b0;
    // insert 7 into R0
    datapath_in = 16'b0000000000000111;
    vsel = 1'b1;
    writenum = 3'b000;
    write = 1'b1;
    clk = 1'b1;
    #5
    clk = 1'b0;
    write = 1'b0;
    #5
    // insert 2 into R1
    datapath_in = 16'b0000000000000010;
    vsel = 1'b1;
    writenum = 3'b001;
    write = 1'b1;
    clk = 1'b1;
    #5
    clk = 1'b0;
    write = 1'b0;
    #5
    // read value R1 and put into register a
    readnum = 3'b001;
    loada = 1'b1;
    clk = 1'b1;
    #5
    clk = 1'b0;
    loada = 1'b0;
    #5
    // read value R0 and put into register b
    readnum = 3'b000;
    loadb = 1'b1;
    clk = 1'b1;
    #5
    clk = 1'b0;
    loadb = 1'b0;
    #5
    // set ALUop to add
    ALUop = 2'b00;
    // set shifter to shift one left
    shift = 2'b01;
    // set asel and bsel to 0
    asel = 1'b0;
    bsel = 1'b0;
    // set loadc to 1 so it will save the value of addition
    loadc = 1'b1;
    // set loads to 1 so it will save status of computation
    loads = 1'b1;
    #5
    // perform computation
    clk = 1'b1;
    #5
    // check computation
    if(datapath_out != 16'b0000000000010000) err = 1;
    clk = 1'b0;
    loadc = 1'b0;
    vsel = 1'b0;
    write = 1'b1;
    writenum = 3'b010;
    #5
    // store value in register 2
    clk = 1'b1;
    #5
    clk = 1'b0;
    if(err == 0) $display("All tests for case passed");
    else $display("Tests failed");
  end
endmodule
