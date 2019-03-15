//
//--------------------------------------------------------------------------------
//          THIS FILE WAS AUTOMATICALLY GENERATED BY THE GENESIS2 ENGINE        
//  FOR MORE INFORMATION: OFER SHACHAM (CHIP GENESIS INC / STANFORD VLSI GROUP)
//    !! THIS VERSION OF GENESIS2 IS NOT FOR ANY COMMERCIAL USE !!
//     FOR COMMERCIAL LICENSE CONTACT SHACHAM@ALUMNI.STANFORD.EDU
//--------------------------------------------------------------------------------
//
//  
//	-----------------------------------------------
//	|            Genesis Release Info             |
//	|  $Change: 11879 $ --- $Date: 2013/06/11 $   |
//	-----------------------------------------------
//	
//
//  Source file: /horowitz/users/ankitan/MagmaCGRAGenerator/GARNET.02.14/garnet/pe_core/genesis/test_mult_add.svp
//  Source template: test_mult_add
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter use_mad 	= 0
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Command Line input (priority=4):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From XML input (priority=3):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Config File input (priority=2):
//
// ---------------- End Pre-Generation Pramameters Status Report ----------------

// use_mad (_GENESIS2_INHERITANCE_PRIORITY_) = 0
//

module  test_mult_add  #(
  parameter DataWidth = 16
) (
  input                  is_signed,

  input  [DataWidth-1:0] a,
  input  [DataWidth-1:0] b,


  output logic [2*DataWidth-1:0] res,
  output logic                   c_out
);

  logic signed [2*(DataWidth+1)-1:0] res_signed;
  logic [1:0] nc_res_signed_msb;
  assign nc_res_signed_msb = res_signed[2*(DataWidth+1)-1:2*(DataWidth+1)-2];

  logic signed [DataWidth:0] a_ext;
  logic signed [DataWidth:0] b_ext;

  assign a_ext = $signed({is_signed & a[DataWidth-1], a});
  assign b_ext = $signed({is_signed & b[DataWidth-1], b});

  assign res_signed = a_ext*b_ext;

  assign res = $unsigned(res_signed[2*DataWidth-1:0]);
  assign c_out = 1'b0;

endmodule
