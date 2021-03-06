module c64x8(
	output reg [7:0]q,
	input  wire [5:0]a

);						
always @*
begin
	case(a)	


	6'h00: q = 8'h3;//h2;	
	6'h01: q = 8'h2;//h8;
	6'h02: q = 8'h2;//h2;
	6'h03: q = 8'h8;//h8;
	6'h04: q = 8'h2;//h0;
	6'h05: q = 8'h8;//hf;
	6'h06: q = 8'h0;//h0;
	6'h07: q = 8'hf;//hf;
	6'h08: q = 8'h14;//0
	6'h09: q = 8'h1d;//4
	6'h0a: q = 8'h16;
	6'h0b: q = 8'h11;
	6'h0c: q = 8'h17;
	6'h0d: q = 8'h12;
	6'h0e: q = 8'h17;
	6'h0f: q = 8'h13;			
	6'h10: q = 8'h16;
	6'h11: q = 8'h1f;	
	6'h12: q = 8'h16;
	6'h13: q = 8'h18;
	6'h14: q = 8'h16;	
	6'h15: q = 8'h1f;
	6'h16: q = 8'h16;
	6'h17: q = 8'h14;
	6'h18: q = 8'hc;
	6'h19: q = 8'h0; 
	6'h1a: q = 8'h13;	
	6'h1b: q = 8'h11;
	6'h1c: q = 8'h13;
	6'h1d: q = 8'h12;
	6'h1e: q = 8'h13;	
	6'h1f: q = 8'h1a; 
	6'h20: q = 8'h13; 
	6'h21: q = 8'h13;	
	6'h22: q = 8'h13;
	6'h23: q = 8'h14;
	6'h24: q = 8'h13;
	6'h25: q = 8'h1a;
	6'h26: q = 8'h13;
	6'h27: q = 8'h15;
	6'h28: q = 8'h13;
	6'h29: q = 8'h16;
	6'h2a: q = 8'h12;
	6'h2b: q = 8'h10;
	6'h2c: q = 8'h15;
	6'h2d: q = 8'h17;
	6'h2e: q = 8'h16;
	6'h2f: q = 8'h1f;
	6'h30: q = 8'h12;
	6'h31: q = 8'h17;	
	6'h32: q = 8'h16;
	6'h33: q = 8'h1c;
	6'h34: q = 8'h16;
	6'h35: q = 8'h14;
	6'h36: q = 8'h14;
	6'h37: q = 8'h18;
	6'h38: q = 8'h16;
	6'h39: q = 8'h15;
	6'h3a: q = 8'h16;
	6'h3b: q = 8'h1c;
	6'h3c: q = 8'h16;
	6'h3d: q = 8'h1c;
	6'h3e: q = 8'hc;
	6'h3f: q = 8'h0;
	endcase
end
	
endmodule
