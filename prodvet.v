module prodvet(
	       input [10:0] 	    p1_x,
	       input [10:0] 	    p1_y,
	       input [10:0] 	    p2_x,
	       input [10:0] 	    p2_y,
	       input [10:0] 	    c_x,
	       input [10:0] 	    c_y,
	       output signed [23:0] o);
   
   wire signed [11:0] 		    v1_x;
   wire signed [11:0] 		    v1_y;

   tovec v1(p1_x, p1_y, p2_x, p2_y, v1_x, v1_y); //p2 - p1

   wire signed [11:0] 		    c1_x;
   wire signed [11:0] 		    c1_y;
   
   tovec c1(p1_x, p1_y, c_x, c_y, c1_x, c1_y); // c - p1
   
   assign o = v1_x * c1_y - v1_y * c1_x;
   
endmodule
