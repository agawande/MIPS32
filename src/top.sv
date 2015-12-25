module top (input logic clk, reset, output logic[31:0] writedata, dataadr, output logic memwrite,
				output logic[6:0] gled, gled2, gled3, gled4, input logic[4:0] SW);

	logic [31:0] pc, instr, readdata;

	// instantiate processor and memories
	mips mips (clk, reset, pc, instr, memwrite, dataadr, writedata, readdata, gled, gled2, gled3, gled4, SW);

	imem imem (pc[7:2], instr);

	dmem dmem (clk, memwrite, dataadr, writedata, readdata);

endmodule