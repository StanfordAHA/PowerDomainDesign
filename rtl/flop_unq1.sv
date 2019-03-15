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
//  Source file: /horowitz/users/ankitan/MagmaCGRAGenerator/GARNET.02.14/garnet/global_controller/genesis/flop.svp
//  Source template: flop
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter Width 	= 5
// Parameter Default 	= 0
// Parameter Type 	= REFlop
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

/* *****************************************************************************
 * File: flop.vp
 * 
 * Description:
 * Genesis2 flip-flop generator.
 * 
 * Required Genesis2 Controlable Parameters:
 * * Type		- Constant, Flop, RFlop, EFlop, or REFlop
 * * Width		- integer value specifying register width
 * * Default		- default value for the flop 
 *			 (only applies when flop_type=constant|rflop|reflop)
 * * SyncMode		- Sync or ASync flop * Change bar:
 * 
 * 
 * -----------
 * Date          Author   Description
 * Mar 30, 2010  shacham  init version  --  
 * May 20, 2014  jingpu   Add Async mode, change to active low reset
 * Feb 20, 2018  ajcars   Change back to active high reset 
 * ****************************************************************************/


/*******************************************************************************
 * REQUIRED PARAMETERIZATION
 ******************************************************************************/
// Type (_GENESIS2_INHERITANCE_PRIORITY_) = REFlop
//
// Default (_GENESIS2_INHERITANCE_PRIORITY_) = 0
//
// Width (_GENESIS2_INHERITANCE_PRIORITY_) = 5
//
// SyncMode (_GENESIS2_DECLARATION_PRIORITY_) = ASync
//

module flop_unq1(
	       //inputs
	       input 		   Clk,
	       input [4:0]  din,
	       input 		   Reset,
	       input 		   en,

	       //outputs
	       output reg [4:0] dout
	       );


   /* synopsys dc_tcl_script_begin
    set_dont_retime [current_design] true
    set_optimize_registers false -design [current_design]
    */
   


   
   always_ff @(posedge Clk or posedge Reset) begin
      if (Reset) 
	dout <= 5'h0;
      else if (en)
	dout <= din;
   end

endmodule