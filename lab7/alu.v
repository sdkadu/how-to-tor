module ALU(Ain,Bin,ALUop,out,stat);
  input [15:0]      Ain, Bin;
  input [1:0]       ALUop;
  output reg [15:0] out;
  output reg [2:0]  stat;

  wire              aovf, sovf;
  wire [15:0]       added, subbed;

  AddSub #(16) Add(Ain,Bin,1'b0,added,aovf);
  AddSub #(16) Sub(Ain,Bin,1'b1,subbed,sovf) ;

  always @(*) begin
    case (ALUop)
      2'b00: out = added;
      2'b01: out = subbed;
      2'b10: out = Ain & Bin;
      2'b11: out = ~Bin;
      default: out = 0;
    endcase
    casex (out)
      16'b0000000000000000: stat[1:0] = 2'b01; // Zero
      16'b1xxxxxxxxxxxxxxx: stat[1:0] = 2'b10; // Negative
      16'b0xxxxxxxxxxxxxxx: stat[1:0] = 2'b00; // Positive
      default: stat[1:0] = 2'b00;
    endcase
    casex ({aovf,sovf})
      2'b00: stat[2] = 1'b0;
      2'b1x: stat[2] = 1'b1; // Add Overflow
      2'bx1: stat[2] = 1'b1; // Sub Overflow
      default: stat[2] = 1'b0;
    endcase
  end
endmodule

// add a+b or subtract a-b, check for overflow
module AddSub(a,b,sub,s,ovf) ;
  parameter n = 16 ;
  input [n-1:0]     a, b ;
  input             sub ;             // subtract if sub=1, otherwise add
  output [n-1:0]    s ;
  output            ovf ;             // 1 if overflow
  wire              c1, c2 ;          // carry out of last two bits
  wire              ovf = c1 ^ c2 ;   // overflow if signs don't match

  // add non sign bits
  Adder1 #(n-1) ai(a[n-2:0],b[n-2:0]^{n-1{sub}},sub,c1,s[n-2:0]) ;
  // add sign bits
  Adder1 #(1)   as(a[n-1],b[n-1]^sub,c1,c2,s[n-1]) ;
endmodule

// multi-bit adder - behavioral
module Adder1(a,b,cin,cout,s) ;
  parameter n = 16 ;
  input [n-1:0]     a, b ;
  input             cin ;
  output [n-1:0]    s ;
  output            cout ;
  wire [n-1:0]      s;
  wire              cout ;

  assign {cout, s} = a + b + cin ;
endmodule
