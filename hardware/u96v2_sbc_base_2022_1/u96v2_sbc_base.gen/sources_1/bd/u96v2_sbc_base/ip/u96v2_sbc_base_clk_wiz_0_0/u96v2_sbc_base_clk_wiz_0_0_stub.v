// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1.1 (lin64) Build 3557992 Fri Jun  3 09:56:20 MDT 2022
// Date        : Mon Aug 22 10:24:27 2022
// Host        : 86e49382c030 running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_clk_wiz_0_0/u96v2_sbc_base_clk_wiz_0_0_stub.v
// Design      : u96v2_sbc_base_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module u96v2_sbc_base_clk_wiz_0_0(clk_out1, clk_out2, clk_out3, clk_out4, clk_out5, 
  clk_out6, clk_out7, resetn, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,clk_out3,clk_out4,clk_out5,clk_out6,clk_out7,resetn,locked,clk_in1" */;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  output clk_out4;
  output clk_out5;
  output clk_out6;
  output clk_out7;
  input resetn;
  output locked;
  input clk_in1;
endmodule