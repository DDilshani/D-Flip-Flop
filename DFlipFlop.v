module testbench;
	reg D,RESET;
	output Q;
	reg CLK;
	
	
	d_flipflop myD(CLK,D,RESET,Q);

	initial begin
		CLK=1;
		RESET=0;
		D=0;
		
		$dumpfile("D.vcd");
		$dumpvars(0,myD);

     	#1 RESET = 1;
	#2 RESET = 0;
        #1 D = 1;
        #3 RESET = 0;
        #8 D = 0;
        #6 D = 1;
        #2 D = 0;
        #6 D = 1;
        #5 D = 0;
        #6 D = 1;
        #8 RESET = 1;
        #10 $finish;
	end
always #5 CLK=~CLK;

endmodule

module d_flipflop(clk,d,reset,q);
	input d,clk,reset;
	output q,qbar;
	wire dbar,x,y,z;

	not u1 (dbar, d);
	and u2 (x , d , clk);
	and u3 (y , dbar, clk);
	nor u4 (q , qbar, z);
	nor u5 (qbar, q , y);
	or u6 (z,reset,x);
endmodule
