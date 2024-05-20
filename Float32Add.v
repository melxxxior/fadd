//////////////////////////////////////////////////////////////////
//                                                             
// Copyright (C) 2009 Pulse Logic                        
//                    info@pulselogic.com.pl                   
//                                                             
// This source file may be used and distributed without        
// restriction provided that this copyright statement is not   
// removed from the file and that any derivative work contains 
// the original copyright notice and the associated disclaimer.
//                                                             
//     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   
// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   
// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      
// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   
// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  
// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  
// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         
// POSSIBILITY OF SUCH DAMAGE.                                 
//                                                             
//////////////////////////////////////////////////////////////////
//
// Title       : Float32Add
// Design      : Float32 RTL Library
// Company     : Pulse Logic
//
//////////////////////////////////////////////////////////////////
//
// File        : Float32Add.v
// Tool        : Xilinx WebPack
//
//////////////////////////////////////////////////////////////////
//
// Description : IEEE 754 single precision synchronous floating point adder/subtractor. 
//				 Obfuscated code. 
//////////////////////////////////////////////////////////////////

module Float32Add (CLK, nRST, leftArg, rightArg, addSub, loadArgs, status, busy, sum);
input CLK;              //Global clock. Rising edge active. 
input nRST;             //Global reset. Active low. 
input [31:0]leftArg;    //Left argument. Bit 31 - sign, Bits 30:23 exponent, Bits 22:0 mantissa. 
input [31:0] rightArg;  //Right argument. Bit 31 - sign, Bits 30:23 exponent, Bits 22:0 mantissa. 
input addSub;           //1 - Addition, 0 - Subtraction 
input loadArgs;         //Arguments load strobe. Active high. 
output [2:0] status;    //Status output. Bit 2 - Not a Number, Bit 1 - Infinity, Bit 0 - Denormal. 
output busy;            //BUSY - high means performing calculations, low means result ready.
output [31:0] sum;      //Result. Valid if BUSY bit is low. Status bits 2:0 denote exceptions. 

wire[31:0]sum;wire[2:0]status;wire busy;reg [31:0]IOOOO1;wire[31:0]I0OOO1;wire IIOOO1;reg [31:0]IlOOO1;wire[31:0]I1OOO1;wire IOO0O1;reg I0O0O1;wire IIO0O1,IlO0O1;reg [8:0]I1O0O1;reg [8:0]
IOOIO1;wire I0OIO1;reg [27:0]IIOIO1;reg [27:0]IlOIO1;wire I1OIO1;reg [27:0]IOOlO1;wire[27:0]I0OlO1;wire IIOlO1;reg IlOlO1;wire I1OlO1,IOO1O1;reg [7:0]I0O1O1;wire[7:0]IIO1O1;wire IlO1O1;reg [7:0]I1O1O1;wire
[7:0]IOOO01;wire I0OO01;reg IIOO01;wire IlOO01,I1OO01;reg IOO001;wire I0O001,IIO001;reg [31:0]IlO001;wire[31:0]I1O001;wire IOOI01;reg [26:0]I0OI01;wire[26:0]IIOI01;wire IlOI01;reg [26:0]I1OI01;wire[26:0]IOOl01
;wire I0Ol01;reg IIOl01;wire IlOl01,I1Ol01;reg IOO101;wire I0O101,IIO101;reg [31:0]IlO101;wire[31:0]I1O101;wire IOOOI1;reg I0OOI1;wire IIOOI1,IlOOI1;reg I1OOI1;wire IOO0I1,I0O0I1;reg [9:0]IIO0I1;wire[9:0]IlO0I1
;wire I1O0I1;reg IOOII1;wire I0OII1,IIOII1;reg IlOII1;wire I1OII1,IOOlI1;reg I0OlI1;wire IIOlI1,IlOlI1;reg I1OlI1;wire IOO1I1,I0O1I1;reg [4:0]IIO1I1;wire[4:0]IlO1I1;wire I1O1I1;wire IOOOl1,I0OOl1,IIOOl1,IlOOl1
,I1OOl1,IOO0l1,I0O0l1,IIO0l1,IlO0l1,I1O0l1,IOOIl1,I0OIl1,IIOIl1,IlOIl1,I1OIl1,IOOll1,I0Oll1,IIOll1,IlOll1,I1Oll1,IOO1l1,I0O1l1,IIO1l1,IlO1l1,I1O1l1,IOOO11,I0OO11,IIOO11;reg [27:0]IlOO11;wire[27:0]I1OO11
,IOO011,I0O011;wire[8:0]IIO011,IlO011,I1O011;wire IOOI11,I0OI11,IIOI11,IlOI11,I1OI11,IOOl11,I0Ol11,IIOl11;reg [26:0]IlOl11;reg I1Ol11;wire[31:0]IOO111,I0O111,IIO111,IlO111,I1O111,IO0OO1,I00OO1,II0OO1,Il0OO1
,I10OO1,IO00O1,I000O1,II00O1,Il00O1,I100O1;wire[27:0]IO0IO1,I00IO1,II0IO1,Il0IO1,I10IO1;wire[26:0]IO0lO1,I00lO1;wire[8:0]II0lO1,Il0lO1,I10lO1,IO01O1,I001O1;wire[7:0]II01O1,Il01O1;wire[4:0]I101O1,IO0O01
,I00O01,II0O01;wire Il0O01,I10O01,IO0001,I00001,II0001,Il0001,I10001,IO0I01,I00I01,II0I01,Il0I01,I10I01,IO0l01,I00l01,II0l01,Il0l01,I10l01,IO0101,I00101,II0101,Il0101,I10101,IO0OI1,I00OI1,II0OI1,Il0OI1
,I10OI1,IO00I1,I000I1,II00I1,Il00I1,I100I1,IO0II1,I00II1,II0II1,Il0II1,I10II1,IO0lI1,I00lI1,II0lI1,Il0lI1,I10lI1,IO01I1,I001I1,II01I1,Il01I1,I101I1,IO0Ol1,I00Ol1,II0Ol1,Il0Ol1,I10Ol1,IO00l1,I000l1,II00l1
,Il00l1,I100l1,IO0Il1,I00Il1,II0Il1;assign IIOIl1=1'd1;assign I0OO11=loadArgs;assign status={IIOl01,IIOO01,IlOlO1};assign busy=I0O0O1;assign sum={IOOII1,I1O0O1[7:0],IIOIO1[25:3]};assign IlOIl1=1'd1;assign
IIOO11=1'd1;assign I0O0l1=IIO0I1[0];assign IOO1l1=I0O0l1;assign I0OOl1=IIO0I1[1];assign IOOll1=I0OOl1;assign IIO0l1=IIO0I1[2];assign I0O1l1=IIO0l1;assign I0OIl1=IIO0I1[3];assign IOOO11=I0OIl1;assign IlOOl1
=IIO0I1[4];assign IIOll1=IlOOl1;assign IOO0l1=IIO0I1[5];assign I1Oll1=IOO0l1;assign IlO0l1=IIO0I1[6];assign IIO1l1=IlO0l1;assign I1O0l1=IIO0I1[7];assign IlO1l1=I1O0l1;assign IOOOl1=IIO0I1[8];assign I1OIl1
=IOOOl1;assign I1OOl1=IIO0I1[9];assign IlOll1=I1OOl1;assign IOOIl1=1'd1;assign I1O1l1=1'd1;assign IIOOl1=loadArgs&& !I0O0O1;assign I0Oll1=IIOOl1;assign IOOI11=IIO0I1[8]&& IIOIO1[27];assign I0OI11=IIO0I1
[9]&& II00l1;assign IIOI11=IIO0I1[9]&& (IIOl01|| I1O0O1[8]|| I1O0O1[7:0]== 8'hff);assign IlOI11=IIO0I1[5]&& I100l1;assign I0Ol11=IIO0I1[9]&& !IIOl01&& (I1O0O1[8]|| I1O0O1[7:0]== 8'hff);assign IIO011=I1O0O1
+9'd1;assign I1O011=(!IlOII1&& !IOO001&& !IOOlO1[26])? IO01O1:Il0lO1;assign IlO011=(IIOl01|| I1O0O1[8]|| I1O0O1[7:0]== 8'hff)? 9'h1ff:9'd0;assign I1OO11={1'd0,IIOIO1[27:1]};assign IOO011=IIOl01 ? II0IO1
:28'd0;assign I0O011={IIOIO1[27:3]+{24'b0,Il00l1},IIOIO1[2:0]};always @(IIO1I1 or I10IO1 or Il0IO1 or IOOlO1)begin case (IIO1I1)5'd0:IlOO11=Il0IO1;5'd1:IlOO11=IOOlO1;default :IlOO11=I10IO1;endcase end assign
I1OI11=IlOII1|| IOO001|| !IOOlO1[26];assign IOOl11=!IO00l1&& !Il0Ol1&& ~(IlO001[30:23]!= 8'd0)& ~(IlO101[30:23]!= 8'd0)& (IlO001[22:0]!= 23'd0| IlO101[22:0]!= 23'd0);assign IIOl11=!IO00l1&& Il0Ol1&& (
!I10Ol1|| I000l1);assign I0OOO1=Il0O01 ? IlO101:IlO001;assign IIOOO1=I0OOl1;assign I1OOO1=Il0O01 ? IlO001:IlO101;assign IOO0O1=I0OOl1;assign IIO0O1=I0Oll1;assign IlO0O1=IIO0I1[9]|| I0Oll1;always @(IOOI11
or IIO011 or I0OI11 or IlO011 or IIO0I1 or I1O011)begin case (1'b1)IOOI11:IOOIO1=IIO011;I0OI11:IOOIO1=IlO011;IIO0I1[5]:IOOIO1=I1O011;default :IOOIO1=9'b010101010;endcase end assign I0OIO1=IIO0I1[8]&& IIOIO1
[27]|| IIO0I1[9]&& II00l1|| IIO0I1[5];always @(IOOI11 or I1OO11 or IIOI11 or IOO011 or IIO0I1 or I0O011 or IlOO11)begin case (1'b1)IOOI11:IlOIO1=I1OO11;IIOI11:IlOIO1=IOO011;IIO0I1[7]:IlOIO1=I0O011;IIO0I1[6]
:IlOIO1=IlOO11;default :IlOIO1=28'b1010101010101010101010101010;endcase end assign I1OIO1=IIO0I1[8]&& IIOIO1[27]|| IIO0I1[9]&& (IIOl01|| I1O0O1[8]|| I1O0O1[7:0]== 8'hff)|| IIO0I1[7]|| IIO0I1[6];assign
I0OlO1={I00IO1[27]^ I1OlI1,I00IO1[26:0]};assign IIOlO1=IlOOl1;assign I1OlO1=IlOI11 ? I1OI11:IOOl11;assign IOO1O1=IIO0I1[5]&& I100l1|| IIO0I1[0];assign IIO1O1=(IOO001&& IlOII1)? II01O1:(IOO001 ? Il01O1:8'h0
);assign IlO1O1=IIO0l1;assign IOOO01=Il0O01 ? IlO101[30:23]:IlO001[30:23];assign I0OO01=I0OOl1;assign IlOO01=I0Ol11|| IIOl11;assign I1OO01=IIO0I1[9]&& !IIOl01&& (I1O0O1[8]|| I1O0O1[7:0]== 8'hff)|| IIO0I1
[0];assign I0O001=Il0O01 ? IlO101[30:23]!= 8'd0:IlO001[30:23]!= 8'd0;assign IIO001=I0OOl1;assign I1O001=leftArg;assign IOOI01=IIOOl1;assign IIOI01={IOO001,IOOOO1[22:0],3'b0};assign IlOI01=IIO0l1;assign
IOOl01=I00Ol1 ? IlOl11:27'h0;assign I0Ol01=I0OIl1;assign IlOl01=IO00l1|| Il0Ol1&& I10Ol1&& !I000l1;assign I1Ol01=I0O0l1;assign I0O101=!I0Oll1;assign IIO101=IIO0I1[9]|| I0Oll1;assign I1O101=addSub ? rightArg
:{II0Il1,rightArg[30:0]};assign IOOOI1=IIOOl1;assign IlOOI1=1'b0;assign IIOOI1=1'b0;assign IOO0I1=1'b0;assign I0O0I1=1'b0;assign IlO0I1=IIO0I1[9]? 10'h0:{IIO0I1[8:0],I0O0O1&& IIO0I1== 10'd0};assign I1O0I1
=IIO0I1[9]|| I0O0O1&& IIO0I1== 10'd0|| IIO0I1[8:0]!= 9'd0;assign I0OII1=Il0O01 ? IlO101[31]:IlO001[31];assign IIOII1=I0OOl1;assign I1OII1=Il0O01 ? IlO001[30:23]!= 8'd0:IlO101[30:23]!= 8'd0;assign IOOlI1
=I0OOl1;assign IIOlI1=I00Ol1 ? I00Il1:IO0Il1;assign IlOlI1=I0OIl1;assign IOO1I1=IOOOO1[31]^ IlOOO1[31];assign I0O1I1=IIO0l1;assign IlO1I1=(!IlOII1&& !IOO001&& !IOOlO1[26])? 5'd1:I101O1;assign I1O1I1=IOO0l1
;assign II0lO1=(I1O1O1!= 8'd0&& !IIOl01&& !IIOO01)? I001O1:IO01O1;assign Il0lO1=(!IlOII1&& !IOO001&& IOOlO1[26])? 9'd1:I10lO1;assign I101O1=(!IlOII1&& !IOO001&& IOOlO1[26])? II0O01:IO0O01;assign IOO111
=(IOOlO1[0]&& I00I01)? 32'd0:((IOOlO1[1]&& (!IOOlO1[2]|| Il01I1)&& IO0l01&& I00l01)? 32'd1:I10OO1);assign I0O111=(IOOlO1[11]&& IO0001&& I00001)? 32'd11:IIO111;assign IIO111=(IOOlO1[12]&& I00001)? 32'd12
:((IOOlO1[13]&& (!IOOlO1[14]|| I10lI1)&& II0001&& Il0001)? 32'd13:IlO111);assign IlO111=(IOOlO1[14]&& II0001&& Il0001)? 32'd14:I1O111;assign I1O111=(IOOlO1[15]&& Il0001)? 32'd15:((IOOlO1[16]&& (!IOOlO1
[17]|| IO01I1)&& I10001&& IO0I01)? 32'd16:IO0OO1);assign IO0OO1=(IOOlO1[17]&& I10001&& IO0I01)? 32'd17:I00OO1;assign I00OO1=(IOOlO1[18]&& IO0I01)? 32'd18:((IOOlO1[19]&& (!IOOlO1[20]|| I001I1)&& II0I01
&& Il0I01)? 32'd19:II0OO1);assign II0OO1=(IOOlO1[20]&& II0I01&& Il0I01)? 32'd20:Il0OO1;assign Il0OO1=(IOOlO1[21]&& Il0I01)? 32'd21:((IOOlO1[22]&& (!IOOlO1[23]|| II01I1)&& I10I01)? 32'd22:((IOOlO1[23]&&
I10I01)? 32'd23:((IOOlO1[24]&& !IOOlO1[25]&& !IOOlO1[26]&& !IOOlO1[27])? 32'd24:((IOOlO1[25]&& !IOOlO1[26]&& !IOOlO1[27])? 32'd25:((IOOlO1[26]&& !IOOlO1[27])? 32'd26:(IOOlO1[27]? 32'd27:32'd0))))));assign
I10OO1=(IOOlO1[2]&& IO0l01&& I00l01)? 32'd2:IO00O1;assign IO00O1=(IOOlO1[3]&& I00l01)? 32'd3:((IOOlO1[4]&& (!IOOlO1[5]|| I101I1)&& II0l01&& Il0l01)? 32'd4:I000O1);assign I000O1=(IOOlO1[5]&& II0l01&& Il0l01
)? 32'd5:II00O1;assign II00O1=(IOOlO1[6]&& Il0l01)? 32'd6:((IOOlO1[7]&& (!IOOlO1[8]|| IO0Ol1)&& I10l01&& I10O01)? 32'd7:Il00O1);assign Il00O1=(IOOlO1[8]&& I10l01&& I10O01)? 32'd8:I100O1;assign I100O1=
(IOOlO1[9]&& I10O01)? 32'd9:((IOOlO1[10]&& (!IOOlO1[11]|| Il0lI1)&& IO0001&& I00001)? 32'd10:I0O111);assign Il0O01=(IlO001[30:0]== IlO101[30:0])? IlO001[31]&& !IlO101[31]:IlO101[30:0]>= IlO001[30:0];assign
I10lO1=(I1OlI1&& {3'b0,II0O01}>I1O1O1)? 9'd0:II0lO1;assign IO0O01=(I1OlI1&& {3'b0,II0O01}>I1O1O1)? I1O1O1[4:0]:II0O01;assign I10O01=(!IOOlO1[10]|| IOOlO1[11]|| Il0lI1)&& (!IOOlO1[11]|| Il0lI1)&& IO0001
&& I00001;assign IO0001=!IOOlO1[12]|| IOOlO1[13]|| IOOlO1[14]|| I10lI1;assign I00001=(!IOOlO1[13]|| IOOlO1[14]|| I10lI1)&& (!IOOlO1[14]|| I10lI1)&& II0001&& Il0001;assign II0001=!IOOlO1[15]|| IOOlO1[16
]|| IOOlO1[17]|| IO01I1;assign Il0001=(!IOOlO1[16]|| IOOlO1[17]|| IO01I1)&& (!IOOlO1[17]|| IO01I1)&& I10001&& IO0I01;assign I10001=!IOOlO1[18]|| IOOlO1[19]|| IOOlO1[20]|| I001I1;assign IO0I01=(!IOOlO1
[19]|| IOOlO1[20]|| I001I1)&& (!IOOlO1[20]|| I001I1)&& II0I01&& Il0I01;assign I00I01=(!IOOlO1[1]|| IOOlO1[2]|| Il01I1)&& (!IOOlO1[2]|| Il01I1)&& IO0l01&& I00l01;assign II0I01=!IOOlO1[21]|| IOOlO1[22]||
IOOlO1[23]|| II01I1;assign Il0I01=(!IOOlO1[22]|| IOOlO1[23]|| II01I1)&& (!IOOlO1[23]|| II01I1)&& I10I01;assign I10I01=(!IOOlO1[24]|| IOOlO1[25]|| IOOlO1[26]|| IOOlO1[27])&& !IOOlO1[25]&& !IOOlO1[26]&&
!IOOlO1[27];assign IO0l01=!IOOlO1[3]|| IOOlO1[4]|| IOOlO1[5]|| I101I1;assign I00l01=(!IOOlO1[4]|| IOOlO1[5]|| I101I1)&& (!IOOlO1[5]|| I101I1)&& II0l01&& Il0l01;assign II0l01=!IOOlO1[6]|| IOOlO1[7]|| IOOlO1
[8]|| IO0Ol1;assign Il0l01=(!IOOlO1[7]|| IOOlO1[8]|| IO0Ol1)&& (!IOOlO1[8]|| IO0Ol1)&& I10l01&& I10O01;assign I10l01=!IOOlO1[9]|| IOOlO1[10]|| IOOlO1[11]|| Il0lI1;assign IO0101=!IlOII1&& !IOO001&& IOOlO1
[26]|| I1OlI1&& {3'b0,II0O01}>I1O1O1;assign IO0IO1={1'b0,I0OI01}+{1'b0,I1OlI1 ? IO0lO1:I00lO1};assign I00IO1=IO0IO1+{27'h0,I1OlI1};assign II01O1=IOOOO1[30:23]-IlOOO1[30:23];assign I00101=IlOOO1[0]| IlOOO1
[1];assign II0101=I00101| IlOOO1[2];assign Il0101=II0101| IlOOO1[3];assign I10101=Il0101| IlOOO1[4];assign IO0OI1=I10101| IlOOO1[5];assign I00OI1=IO0OI1| IlOOO1[6];assign II0OI1=I00OI1| IlOOO1[7];assign
Il0OI1=II0OI1| IlOOO1[8];assign I10OI1=Il0OI1| IlOOO1[9];assign IO00I1=I10OI1| IlOOO1[10];assign I000I1=IO00I1| IlOOO1[11];assign II00I1=I000I1| IlOOO1[12];assign Il00I1=II00I1| IlOOO1[13];assign I100I1
=Il00I1| IlOOO1[14];assign IO0II1=I100I1| IlOOO1[15];assign I00II1=IO0II1| IlOOO1[16];assign II0II1=I00II1| IlOOO1[17];assign Il0II1=II0II1| IlOOO1[18];assign I10II1=Il0II1| IlOOO1[19];assign IO0lI1=I10II1
| IlOOO1[20];assign I00lI1=IO0lI1| IlOOO1[21];assign II0lI1=I00lI1| IlOOO1[22];assign Il0lI1=IOOlO1[12]|| IOOlO1[13]|| IOOlO1[14]|| I10lI1;assign I10lI1=IOOlO1[15]|| IOOlO1[16]|| IOOlO1[17]|| IO01I1;assign
IO01I1=IOOlO1[18]|| IOOlO1[19]|| IOOlO1[20]|| I001I1;assign I001I1=IOOlO1[21]|| IOOlO1[22]|| IOOlO1[23]|| II01I1;assign II01I1=IOOlO1[24]|| IOOlO1[25]|| IOOlO1[26]|| IOOlO1[27];assign Il01I1=IOOlO1[3]
|| IOOlO1[4]|| IOOlO1[5]|| I101I1;assign I101I1=IOOlO1[6]|| IOOlO1[7]|| IOOlO1[8]|| IO0Ol1;assign IO0Ol1=IOOlO1[9]|| IOOlO1[10]|| IOOlO1[11]|| Il0lI1;assign I00Ol1=I0O1O1<8'd27;assign II0Ol1=IlO001[30
:23]== 8'd255& ~(IlO001[22:0]!= 23'd0);assign Il0Ol1=II0Ol1| IlO101[30:23]== 8'd255& ~(IlO101[22:0]!= 23'd0);assign I10Ol1=II0Ol1& IlO101[30:23]== 8'd255& ~(IlO101[22:0]!= 23'd0);assign IO00l1=IlO001[
30:23]== 8'd255& IlO001[22:0]!= 23'd0| IlO101[30:23]== 8'd255& IlO101[22:0]!= 23'd0;assign I000l1=IlO001[31]== IlO101[31];assign IO0lO1={~I1OI01[26:1],~I0OlI1};assign I00lO1={I1OI01[26:1],I0OlI1};assign
II00l1=IIOl01|| I1O0O1[8]|| I1O0O1[7:0]== 8'hff|| IIOIO1== 28'd0;assign Il00l1=(IIOIO1[2]&& IIOIO1[1:0]== 2'b0)? IIOIO1[3]|| I0OlI1:IIOIO1[2]&& IIOIO1[1:0]!= 2'b0;assign I100l1=(IlOII1|| IOO001|| IOOlO1
[26])&& IO0101;assign IO0Il1={IlOOO1[22:0],2'd0}!= 25'd0;assign II0IO1={IIOIO1[27:26],1'b1,IIOIO1[24:0]};assign Il0IO1={1'd0,IOOlO1[27:1]};assign I10IO1=IOOlO1<< I00O01;assign IO01O1={1'b0,I1O1O1};assign
I001O1=IO01O1+9'd1-{4'h0,II0O01};assign Il01O1=II01O1-8'h01;assign I00Il1=I0O1O1[4:0]!= 5'd0&& I0O1O1[4:0]!= 5'd1&& I0O1O1[4:0]!= 5'd2&& I1Ol11;assign II0Il1=~rightArg[31];assign I00O01=IIO1I1-5'd1;assign
II0O01=5'd27-IOO111[4:0];always @(I0O1O1 or IlOII1 or IlOOO1)begin case (I0O1O1[4:0])5'd0:IlOl11={IlOII1,IlOOO1[22:0],3'b0};5'd1:IlOl11={1'd0,IlOII1,IlOOO1[22:0],2'd0};5'd2:IlOl11={2'd0,IlOII1,IlOOO1[22
:0],1'd0};5'd3:IlOl11={3'd0,IlOII1,IlOOO1[22:0]};5'd4:IlOl11={4'd0,IlOII1,IlOOO1[22:1]};5'd5:IlOl11={5'd0,IlOII1,IlOOO1[22:2]};5'd6:IlOl11={6'd0,IlOII1,IlOOO1[22:3]};5'd7:IlOl11={7'd0,IlOII1,IlOOO1[22
:4]};5'd8:IlOl11={8'd0,IlOII1,IlOOO1[22:5]};5'd9:IlOl11={9'd0,IlOII1,IlOOO1[22:6]};5'd10:IlOl11={10'd0,IlOII1,IlOOO1[22:7]};5'd11:IlOl11={11'd0,IlOII1,IlOOO1[22:8]};5'd12:IlOl11={12'd0,IlOII1,IlOOO1[22
:9]};5'd13:IlOl11={13'd0,IlOII1,IlOOO1[22:10]};5'd14:IlOl11={14'd0,IlOII1,IlOOO1[22:11]};5'd15:IlOl11={15'd0,IlOII1,IlOOO1[22:12]};5'd16:IlOl11={16'd0,IlOII1,IlOOO1[22:13]};5'd17:IlOl11={17'd0,IlOII1,
IlOOO1[22:14]};5'd18:IlOl11={18'd0,IlOII1,IlOOO1[22:15]};5'd19:IlOl11={19'd0,IlOII1,IlOOO1[22:16]};5'd20:IlOl11={20'd0,IlOII1,IlOOO1[22:17]};5'd21:IlOl11={21'd0,IlOII1,IlOOO1[22:18]};5'd22:IlOl11={22'd0
,IlOII1,IlOOO1[22:19]};5'd23:IlOl11={23'd0,IlOII1,IlOOO1[22:20]};5'd24:IlOl11={24'd0,IlOII1,IlOOO1[22:21]};5'd25:IlOl11={25'd0,IlOII1,IlOOO1[22]};5'd26:IlOl11={26'd0,IlOII1};default :IlOl11=27'd0;endcase
end always @(I0O1O1 or II0lI1 or IlOII1 or IlOOO1 or I00101 or II0101 or Il0101 or I10101 or IO0OI1 or I00OI1 or II0OI1 or Il0OI1 or I10OI1 or IO00I1 or I000I1 or II00I1 or Il00I1 or I100I1 or IO0II1 or I00II1 or II0II1 or
Il0II1 or I10II1 or IO0lI1 or I00lI1)begin case (I0O1O1[4:0])5'd3:I1Ol11=IlOOO1[0];5'd4:I1Ol11=I00101;5'd5:I1Ol11=II0101;5'd6:I1Ol11=Il0101;5'd7:I1Ol11=I10101;5'd8:I1Ol11=IO0OI1;5'd9:I1Ol11=I00OI1;5'd10:
I1Ol11=II0OI1;5'd11:I1Ol11=Il0OI1;5'd12:I1Ol11=I10OI1;5'd13:I1Ol11=IO00I1;5'd14:I1Ol11=I000I1;5'd15:I1Ol11=II00I1;5'd16:I1Ol11=Il00I1;5'd17:I1Ol11=I100I1;5'd18:I1Ol11=IO0II1;5'd19:I1Ol11=I00II1;5'd20:
I1Ol11=II0II1;5'd21:I1Ol11=Il0II1;5'd22:I1Ol11=I10II1;5'd23:I1Ol11=IO0lI1;5'd24:I1Ol11=I00lI1;5'd25:I1Ol11=II0lI1;default :I1Ol11=II0lI1| IlOII1;endcase end always @(posedge CLK)begin if(!nRST)begin IOOOO1
<= 32'd0;IlOOO1<= 32'd0;I0O0O1<= 1'b0;I1O0O1<= 9'd0;IIOIO1<= 28'd0;IOOlO1<= 28'd0;IlOlO1<= 1'd0;I0O1O1<= 8'h0;I1O1O1<= 8'h0;IIOO01<= 1'b0;IOO001<= 1'd0;IlO001<= 32'd0;I0OI01<= 27'h0;I1OI01<= 27'h0;IIOl01
<= 1'b0;IOO101<= 1'b0;IlO101<= 32'd0;I0OOI1<= 1'd0;I1OOI1<= 1'd0;IIO0I1<= 10'd0;IOOII1<= 1'd0;IlOII1<= 1'd0;I0OlI1<= 1'd0;I1OlI1<= 1'd0;IIO1I1<= 5'd0;end else begin if(IIOOO1)IOOOO1<= I0OOO1;if(IOO0O1
)IlOOO1<= I1OOO1;if(IlO0O1)I0O0O1<= IIO0O1;if(I0OIO1)I1O0O1<= IOOIO1;if(I1OIO1)IIOIO1<= IlOIO1;if(IIOlO1)IOOlO1<= I0OlO1;if(IOO1O1)IlOlO1<= I1OlO1;if(IlO1O1)I0O1O1<= IIO1O1;if(I0OO01)I1O1O1<= IOOO01;if
(I1OO01)IIOO01<= IlOO01;if(IIO001)IOO001<= I0O001;if(IOOI01)IlO001<= I1O001;if(IlOI01)I0OI01<= IIOI01;if(I0Ol01)I1OI01<= IOOl01;if(I1Ol01)IIOl01<= IlOl01;if(IIO101)IOO101<= I0O101;if(IOOOI1)IlO101<= I1O101
;if(IlOOI1)I0OOI1<= IIOOI1;if(I0O0I1)I1OOI1<= IOO0I1;if(I1O0I1)IIO0I1<= IlO0I1;if(IIOII1)IOOII1<= I0OII1;if(IOOlI1)IlOII1<= I1OII1;if(IlOlI1)I0OlI1<= IIOlI1;if(I0O1I1)I1OlI1<= IOO1I1;if(I1O1I1)IIO1I1<=
IlO1I1;end end endmodule
