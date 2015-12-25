module regfile (input logic clk, reset, input logic we3, input logic [4:0] ra1, ra2, wa3, input logic[31:0] wd3, 
					 output logic[31:0] rd1, rd2, output logic[6:0] gled, gled2, gled3, gled4, input logic[4:0] SW); 

	logic [31:0] rf[31:0];
	// three ported register file
	// read two ports combinationally
	// write third port on rising edge of clock
	// register 0 hardwired to 0

	always@(*)
	begin
		case(rf[SW[4:0]][3:0])
				4'h0: gled <= 7'b100_0000;	4'h1: gled <= 7'b111_1001; 4'h2: gled <= 7'b010_0100; 4'h3: gled <= 7'b011_0000;
				4'h4: gled <= 7'b001_1001; 4'h5: gled = 7'b001_0010; 4'h6: gled <= 7'b000_0010; 4'h7: gled <= 7'b111_1000;
				4'h8: gled <= 7'b000_0000; 4'h9: gled <= 7'b001_0000; 4'hA: gled <= 7'b000_1000; 4'hB: gled <= 7'b000_0011;
				4'hC: gled <= 7'b100_0110; 4'hD: gled <= 7'b010_0001; 4'hE: gled <= 7'b000_0110; 4'hF: gled <= 7'b000_1110;
				default: gled <= 7'b111_1111;
		endcase
		
		case(rf[SW[4:0]][7:4])
				4'h0: gled2 <= 7'b100_0000;	4'h1: gled2 <= 7'b111_1001; 4'h2: gled2 <= 7'b010_0100; 4'h3: gled2 <= 7'b011_0000;
				4'h4: gled2 <= 7'b001_1001; 4'h5: gled2 = 7'b001_0010; 4'h6: gled2 <= 7'b000_0010; 4'h7: gled2 <= 7'b111_1000;
				4'h8: gled2 <= 7'b000_0000; 4'h9: gled2 <= 7'b001_0000; 4'hA: gled2 <= 7'b000_1000; 4'hB: gled2 <= 7'b000_0011;
				4'hC: gled2 <= 7'b100_0110; 4'hD: gled2 <= 7'b010_0001; 4'hE: gled2 <= 7'b000_0110; 4'hF: gled2 <= 7'b000_1110;
				default: gled2 <= 7'b111_1111;
		endcase
		
		case(rf[SW[4:0]][11:8])
				4'h0: gled3 <= 7'b100_0000;	4'h1: gled3 <= 7'b111_1001; 4'h2: gled3 <= 7'b010_0100; 4'h3: gled3 <= 7'b011_0000;
				4'h4: gled3 <= 7'b001_1001; 4'h5: gled3 = 7'b001_0010; 4'h6: gled3 <= 7'b000_0010; 4'h7: gled3 <= 7'b111_1000;
				4'h8: gled3 <= 7'b000_0000; 4'h9: gled3 <= 7'b001_0000; 4'hA: gled3 <= 7'b000_1000; 4'hB: gled3 <= 7'b000_0011;
				4'hC: gled3 <= 7'b100_0110; 4'hD: gled3 <= 7'b010_0001; 4'hE: gled3 <= 7'b000_0110; 4'hF: gled3 <= 7'b000_1110;
				default: gled3 <= 7'b111_1111;
		endcase
		
		case(rf[SW[4:0]][16:13])
				4'h0: gled4 <= 7'b100_0000; 4'h1: gled4 <= 7'b111_1001; 4'h2: gled4 <= 7'b010_0100; 4'h3: gled4 <= 7'b011_0000;
				4'h4: gled4 <= 7'b001_1001; 4'h5: gled4 = 7'b001_0010; 4'h6: gled4 <= 7'b000_0010; 4'h7: gled4 <= 7'b111_1000;
				4'h8: gled4 <= 7'b000_0000; 4'h9: gled4 <= 7'b001_0000; 4'hA: gled4 <= 7'b000_1000; 4'hB: gled4 <= 7'b000_0011;
				4'hC: gled4 <= 7'b100_0110; 4'hD: gled4 <= 7'b010_0001; 4'hE: gled4 <= 7'b000_0110; 4'hF: gled4 <= 7'b000_1110;
				default: gled4 <= 7'b111_1111;
		endcase
	end

	always_ff @ (posedge clk)
		begin
			if (we3)
			begin
				rf[wa3] <= wd3;
			end
			
			if (~reset)
			begin
			//registers from 2 to 25 are reset
			//since these are the registers used by the users
				rf[8'h2] <= 32'b0;
				rf[8'h3] <= 32'b0;
				rf[8'h4] <= 32'b0;
				rf[8'h5] <= 32'b0;
				rf[8'h6] <= 32'b0;
				rf[8'h7] <= 32'b0;
				rf[8'h8] <= 32'b0;
				rf[8'h9] <= 32'b0;
				rf[8'hA] <= 32'b0;
				rf[8'hB] <= 32'b0;
				rf[8'hC] <= 32'b0;
				rf[8'hD] <= 32'b0;
				rf[8'hE] <= 32'b0;
				rf[8'hF] <= 32'b0;
				rf[8'h10] <= 32'b0;
				rf[8'h11] <= 32'b0;
				rf[8'h12] <= 32'b0;
				rf[8'h13] <= 32'b0;
				rf[8'h14] <= 32'b0;
				rf[8'h15] <= 32'b0;
				rf[8'h16] <= 32'b0;
				rf[8'h17] <= 32'b0;
				rf[8'h18] <= 32'b0;
				rf[8'h19] <= 32'b0;
			end
		end

	assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
	assign rd2 = (ra2 != 0) ? rf[ra2] : 0;	

endmodule