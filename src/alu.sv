module alu(A, B, F, Y, Z);
	input logic [31:0] A; 
	input logic [31:0] B;
	input logic [2:0]F;
	output logic[31:0]Y;
	output logic Z;

   logic [31:0] Bout;
	logic [31:0] sum;

   assign Bout = F[2]?~B:B;
   assign sum = A+Bout+F[2];
	assign Z = (Y==32'b0);

   always@(*)
		case(F[1:0])
			2'b00: Y = A&Bout;
			2'b01: Y = A|Bout;
			2'b10: Y = sum;
			2'b11: Y = sum[31];
      endcase

endmodule
