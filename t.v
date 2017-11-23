module t(
	 input [10:0] x1,
	 input [10:0] y1,
	 input [10:0] x2,
	 input [10:0] y2,
	 input [10:0] x3,
	 input [10:0] y3,
	 input [10:0] cx,
	 input [10:0] cy,
	 output       o);

   wire signed [23:0] r1;
   wire signed [23:0] r2;
   wire signed [23:0] r3;

   prodvet p1(x1, y1, x2, y2, cx, cy, r1);
   prodvet p2(x2, y2, x3, y3, cx, cy, r2);
   prodvet p3(x3, y3, x1, y1, cx, cy, r3);

   assign o = r1 <= 0 & r2 <= 0 & r3 <= 0;

endmodule

   


   
   
