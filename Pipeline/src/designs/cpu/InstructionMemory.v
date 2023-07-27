module InstructionMemory(address, Instruction);
parameter RAM_SIZE_BIT = 10;

input [RAM_SIZE_BIT - 1:0] address;
output reg [31:0] Instruction;



always @(*)
		case (address)

        16'd0:  Instruction <= 32'h24170400;
        16'd1:  Instruction <= 32'h24080000;
        16'd2:  Instruction <= 32'h24040006;
        16'd3:  Instruction <= 32'h24100006;
        16'd4:  Instruction <= 32'h21050004;
        16'd5:  Instruction <= 32'h24180000;
        16'd6:  Instruction <= 32'hacb80000;
        16'd7:  Instruction <= 32'h24180009;
        16'd8:  Instruction <= 32'hacb80004;
        16'd9:  Instruction <= 32'h24180003;
        16'd10:  Instruction <= 32'hacb80008;
        16'd11:  Instruction <= 32'h24180006;
        16'd12:  Instruction <= 32'hacb8000c;
        16'd13:  Instruction <= 32'h2418ffff;
        16'd14:  Instruction <= 32'hacb80010;
        16'd15:  Instruction <= 32'h2418ffff;
        16'd16:  Instruction <= 32'hacb80014;
        16'd17:  Instruction <= 32'h20a50080;
        16'd18:  Instruction <= 32'h24180009;
        16'd19:  Instruction <= 32'hacb80000;
        16'd20:  Instruction <= 32'h24180000;
        16'd21:  Instruction <= 32'hacb80004;
        16'd22:  Instruction <= 32'h2418ffff;
        16'd23:  Instruction <= 32'hacb80008;
        16'd24:  Instruction <= 32'h24180003;
        16'd25:  Instruction <= 32'hacb8000c;
        16'd26:  Instruction <= 32'h24180004;
        16'd27:  Instruction <= 32'hacb80010;
        16'd28:  Instruction <= 32'h24180001;
        16'd29:  Instruction <= 32'hacb80014;
        16'd30:  Instruction <= 32'h20a50080;
        16'd31:  Instruction <= 32'h24180003;
        16'd32:  Instruction <= 32'hacb80000;
        16'd33:  Instruction <= 32'h2418ffff;
        16'd34:  Instruction <= 32'hacb80004;
        16'd35:  Instruction <= 32'h24180000;
        16'd36:  Instruction <= 32'hacb80008;
        16'd37:  Instruction <= 32'h24180002;
        16'd38:  Instruction <= 32'hacb8000c;
        16'd39:  Instruction <= 32'h2418ffff;
        16'd40:  Instruction <= 32'hacb80010;
        16'd41:  Instruction <= 32'h24180005;
        16'd42:  Instruction <= 32'hacb80014;
        16'd43:  Instruction <= 32'h20a50080;
        16'd44:  Instruction <= 32'h24180006;
        16'd45:  Instruction <= 32'hacb80000;
        16'd46:  Instruction <= 32'h24180003;
        16'd47:  Instruction <= 32'hacb80004;
        16'd48:  Instruction <= 32'h24180002;
        16'd49:  Instruction <= 32'hacb80008;
        16'd50:  Instruction <= 32'h24180000;
        16'd51:  Instruction <= 32'hacb8000c;
        16'd52:  Instruction <= 32'h24180006;
        16'd53:  Instruction <= 32'hacb80010;
        16'd54:  Instruction <= 32'h2418ffff;
        16'd55:  Instruction <= 32'hacb80014;
        16'd56:  Instruction <= 32'h20a50080;
        16'd57:  Instruction <= 32'h2418ffff;
        16'd58:  Instruction <= 32'hacb80000;
        16'd59:  Instruction <= 32'h24180004;
        16'd60:  Instruction <= 32'hacb80004;
        16'd61:  Instruction <= 32'h2418ffff;
        16'd62:  Instruction <= 32'hacb80008;
        16'd63:  Instruction <= 32'h24180006;
        16'd64:  Instruction <= 32'hacb8000c;
        16'd65:  Instruction <= 32'h24180000;
        16'd66:  Instruction <= 32'hacb80010;
        16'd67:  Instruction <= 32'h24180002;
        16'd68:  Instruction <= 32'hacb80014;
        16'd69:  Instruction <= 32'h20a50080;
        16'd70:  Instruction <= 32'h2418ffff;
        16'd71:  Instruction <= 32'hacb80000;
        16'd72:  Instruction <= 32'h24180001;
        16'd73:  Instruction <= 32'hacb80004;
        16'd74:  Instruction <= 32'h24180005;
        16'd75:  Instruction <= 32'hacb80008;
        16'd76:  Instruction <= 32'h2418ffff;
        16'd77:  Instruction <= 32'hacb8000c;
        16'd78:  Instruction <= 32'h24180002;
        16'd79:  Instruction <= 32'hacb80010;
        16'd80:  Instruction <= 32'h24180000;
        16'd81:  Instruction <= 32'hacb80014;
        16'd82:  Instruction <= 32'h21050004;
        16'd83:  Instruction <= 32'h0c100063;
        16'd84:  Instruction <= 32'h24160000;
        16'd85:  Instruction <= 32'h21180000;
        16'd86:  Instruction <= 32'h24080001;
        16'd87:  Instruction <= 32'h02e04820;
        16'd88:  Instruction <= 32'h24160000;
        16'd89:  Instruction <= 32'h21290004;
        16'd90:  Instruction <= 32'h8d240000;
        16'd91:  Instruction <= 32'h02c4b020;
        16'd92:  Instruction <= 32'h21080001;
        16'd93:  Instruction <= 32'h0110a822;
        16'd94:  Instruction <= 32'h06a0fffa;
        16'd95:  Instruction <= 32'h3c184000;
        16'd96:  Instruction <= 32'h23040010;
        16'd97:  Instruction <= 32'hac960000;
        16'd98:  Instruction <= 32'h08100062;
        16'd99:  Instruction <= 32'h02e04820;
        16'd100:  Instruction <= 32'had200000;
        16'd101:  Instruction <= 32'h24080001;
        16'd102:  Instruction <= 32'h240affff;
        16'd103:  Instruction <= 32'h21290004;
        16'd104:  Instruction <= 32'had2a0000;
        16'd105:  Instruction <= 32'h21080001;
        16'd106:  Instruction <= 32'h0104082a;
        16'd107:  Instruction <= 32'h1420fffb;
        16'd108:  Instruction <= 32'h24080001;
        16'd109:  Instruction <= 32'h00005021;
        16'd110:  Instruction <= 32'h240b0000;
        16'd111:  Instruction <= 32'h23bdfff4;
        16'd112:  Instruction <= 32'hafa50000;
        16'd113:  Instruction <= 32'hafa80004;
        16'd114:  Instruction <= 32'hafaa0008;
        16'd115:  Instruction <= 32'h000a6940;
        16'd116:  Instruction <= 32'h01ab6020;
        16'd117:  Instruction <= 32'h02e04820;
        16'd118:  Instruction <= 32'h000a5080;
        16'd119:  Instruction <= 32'h012a4820;
        16'd120:  Instruction <= 32'h000a5082;
        16'd121:  Instruction <= 32'h8d2d0000;
        16'd122:  Instruction <= 32'h02e04820;
        16'd123:  Instruction <= 32'h000b5880;
        16'd124:  Instruction <= 32'h012b4820;
        16'd125:  Instruction <= 32'h000b5882;
        16'd126:  Instruction <= 32'h8d2e0000;
        16'd127:  Instruction <= 32'h000c6080;
        16'd128:  Instruction <= 32'h00ac2820;
        16'd129:  Instruction <= 32'h000c6082;
        16'd130:  Instruction <= 32'h8caf0000;
        16'd131:  Instruction <= 32'h2001ffff;
        16'd132:  Instruction <= 32'h01a14023;
        16'd133:  Instruction <= 32'h34010001;
        16'd134:  Instruction <= 32'h0101402b;
        16'd135:  Instruction <= 32'h2001ffff;
        16'd136:  Instruction <= 32'h01e15023;
        16'd137:  Instruction <= 32'h34010001;
        16'd138:  Instruction <= 32'h0141502b;
        16'd139:  Instruction <= 32'h010a4025;
        16'd140:  Instruction <= 32'h1500000d;
        16'd141:  Instruction <= 32'h2001ffff;
        16'd142:  Instruction <= 32'h01c14023;
        16'd143:  Instruction <= 32'h34010001;
        16'd144:  Instruction <= 32'h0101402b;
        16'd145:  Instruction <= 32'h01af6820;
        16'd146:  Instruction <= 32'h01ae502a;
        16'd147:  Instruction <= 32'h010a4025;
        16'd148:  Instruction <= 32'h11000005;
        16'd149:  Instruction <= 32'h02e04820;
        16'd150:  Instruction <= 32'h000b5880;
        16'd151:  Instruction <= 32'h012b4820;
        16'd152:  Instruction <= 32'h000b5882;
        16'd153:  Instruction <= 32'had2d0000;
        16'd154:  Instruction <= 32'h8fa50000;
        16'd155:  Instruction <= 32'h8fa80004;
        16'd156:  Instruction <= 32'h8faa0008;
        16'd157:  Instruction <= 32'h23bd000c;
        16'd158:  Instruction <= 32'h216b0001;
        16'd159:  Instruction <= 32'h0164082a;
        16'd160:  Instruction <= 32'h1420ffce;
        16'd161:  Instruction <= 32'h214a0001;
        16'd162:  Instruction <= 32'h0144082a;
        16'd163:  Instruction <= 32'h1420ffca;
        16'd164:  Instruction <= 32'h21080001;
        16'd165:  Instruction <= 32'h0104082a;
        16'd166:  Instruction <= 32'h1420ffc6;
        16'd167:  Instruction <= 32'h03e00008;


			// -------- Paste Binary Instruction Above
			
			default: Instruction <= 32'h00000000;
		endcase


endmodule