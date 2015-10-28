module alu32(A, B, F, Y, Z);
	input [31:0] A; 
	input [31:0] B;
	input [2:0]F;
	output reg [31:0]Y;
	output reg Z;

   wire [31:0] Bout;
	wire [31:0] sum;
       
   assign Bout = F[2]?~B:B;
   assign sum = A+Bout+F[2];
	assign Z = (Y==32'h00000000);

   always@(*)
		case(F[1:0])
			2'b00: Y = A&Bout;
			2'b01: Y = A|Bout;
			2'b10: Y = sum;
			2'b11: Y = sum[31];
      endcase

endmodule