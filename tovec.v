module tovec(
	     input [10:0] 	  a_x,
	     input [10:0] 	  a_y,
	     input [10:0] 	  b_x,
	     input [10:0] 	  b_y,
	     output signed [11:0] X,
	     output signed [11:0] Y	     
	     );
   
   assign X = b_x - a_x;
   assign Y = b_y - a_y;
   
endmodule
