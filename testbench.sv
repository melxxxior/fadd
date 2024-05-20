`timescale 1 ns / 1 ns

module testbench(output [31:0] testtest);

logic clk;              //Global clock. Rising edge active. 
logic nRST;             //Global reset. Active low. 
logic [31:0] leftArg[3:0];    //Left argument. Bit 31 - sign, Bits 30:23 exponent, Bits 22:0 mantissa. 
logic [31:0] rightArg[3:0];  //Right argument. Bit 31 - sign, Bits 30:23 exponent, Bits 22:0 mantissa. 
logic addSub;           //1 - Addition, 0 - Subtraction 
logic loadArgs;         //Arguments load strobe. Active high. 
logic [1:0]i;				// for iterating trough Arg vectors
logic [3:0] cnt;			// for load strobe

logic [2:0] status;    //Status output. Bit 2 - Not a Number, Bit 1 - Infinity, Bit 0 - Denormal. 
logic busy;            //BUSY - high means performing calculations, low means result ready.
logic [31:0] sum;  

assign loadArgs = (cnt == 9);
initial begin
	clk <= 0;
	cnt <= 0;
	nRST = 0;
	addSub = 1;

	#5 nRST = 1;
	leftArg[0] = 1 << 31; // -0
	rightArg[0] = '0; // 0
	// sum should be 0;
	
	leftArg[1] = 'h_40490fdb;	// 3.14159265
	rightArg[1] = 'h_402df854; // 2.718281828
	// sum should be 40bb8417
	
	leftArg[2] = 'h_4d001f73; // 134346547.82
	rightArg[2] = 'h_44030a3d; // 524.16
	// sum should be 4D001F94
	
	leftArg[3] = 'b_0111_1111_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx; // NaN
	rightArg[3] = 'h_402df854;
	// Nan
	
   $dumpvars;
   #100 $finish;
end


always begin
	#1 clk <= ~clk;
	if (loadArgs)
		cnt <= 0;
	else
		cnt <= cnt + 1;
end

always_ff @(negedge busy) begin
	if (nRST == 0)
		i <= 0;
	else
		i <= i + 1;
end


Float32Add dut(clk, nRST, leftArg[i], rightArg[i], addSub, loadArgs, status, busy, sum);

endmodule