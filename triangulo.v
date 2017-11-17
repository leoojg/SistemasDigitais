module triangulo(
  		 input 	      CLOCK_50,
		 input [3:0]  KEY,
  		 output [3:0] VGA_R,
  		 output [3:0] VGA_G,
		 output [3:0] VGA_B,
 		 output       VGA_HS,
		 output       VGA_VS);
   
   reg [10:0] 		      cx = 0;
   reg [9:0] 		      cy = 0;		      
   reg [10:0] 		      ponto1_x = 400;
   reg [9:0] 		      ponto1_y = 80;
   reg [10:0] 		      ponto2_x = 700;
   reg [9:0] 		      ponto2_y = 500;
   reg [10:0] 		      ponto3_x = 1200;
   reg [9:0] 		      ponto3_y = 450;


   
   assign VGA_R = v ? (t ? 4'hc : 4'h0) : 4'b0;
   assign VGA_G = v ? (t ? 4'hc : 4'h0) : 4'b0;
   assign VGA_B = v ? (t ? 4'hc : 4'h0) : 4'b0;
   
   wire 		      v = (cx >= 285) & (cx < 1555) & (cy >= 35) & (cy < 515);
   wire 		      t = ((ponto2_x - ponto1_x) * (cy - ponto1_y) - (cx - ponto1_x) * (ponto2_y - ponto1_y) ) <= 0 &&
			      ((ponto3_x - ponto2_x) * (cx - ponto2_x) - (cy - ponto2_y) * (ponto3_y - ponto2_y) ) <= 0 &&
			      ((ponto1_x - ponto3_x) * (cy - ponto3_y) - (cx - ponto3_x) * (ponto1_y - ponto3_y) ) <= 0;
   reg [10:0] 		      c = 10;
   assign VGA_HS = cx >= 190;
   assign VGA_VS = cy >= 2;
   
   always @(posedge CLOCK_50) begin
      if (cx == 1585) 
	begin
           if (cy == 525) begin
	      cy <= 0;
           end
	   else 
	     cy <= cy + 1;
	   cx <= 0;
	end
      else 
	begin
	   cx <= cx + 1;
	end
   end
endmodule
