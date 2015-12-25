module mips (input logic clk, reset, output logic [31:0] pc, input logic [31:0] instr, output logic memwrite,
             output logic [31:0] aluout, writedata, input logic [31:0] readdata,
				 output logic[6:0] gled, gled2, gled3, gled4, input logic[4:0] SW);
				 
	logic memtoreg, branch, alusrc, regdst, regwrite, jump;
				 
	logic [2:0] alucontrol; 
	
	controller c(instr[31:26], instr[5:0], zero, memtoreg, memwrite, pcsrc,
             alusrc, regdst, regwrite, jump, alucontrol);

	datapath dp(clk, reset, memtoreg, pcsrc,alusrc, regdst, regwrite, jump, alucontrol,
	            zero, pc, instr, aluout, writedata, readdata, gled, gled2, gled3, gled4, SW);

endmodule
