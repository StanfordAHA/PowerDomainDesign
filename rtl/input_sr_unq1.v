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
//  Source file: /horowitz/users/ankitan/MagmaCGRAGenerator/GARNET.02.14/garnet/memory_core/genesis/input_sr.vp
//  Source template: input_sr
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter dwidth 	= 16
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

///////////////////////////////////////////////////////////////////
// CGRA memory generator
//////////////////////////////////////////////////////////////////


`define xassert(condition, message) if(condition) begin $display(message); $finish(1); end


// dwidth (_GENESIS2_INHERITANCE_PRIORITY_) = 16
//
module input_sr_unq1(
clk,
reset,
flush,
fsm_en,
data_in,
wen,
data_out,
avail_w1,
avail_w2,
ren_w1,
ren_w2,
count
);

  input clk;
  input reset;
  input flush;
  input fsm_en;
  input [15:0] data_in;
  input ren_w1;
  input ren_w2;
  input wen;
  output reg avail_w1;
  output reg avail_w2;
  output reg [31:0] data_out;
  
  reg [47:0] data_sr;
  output reg [1:0] count;
  
  wire ___genesis_wire_16;

  always @(posedge clk) begin
   if (fsm_en==1'b1) begin
     if (wen==1'b1) begin
       data_sr <= {data_sr[31:0],data_in};
     end
   end
  end

  always @(posedge clk) begin
   // assert only ren_w2 or ren_w1 at a time.
   // asserting both is an error
   `xassert((ren_w2&ren_w1)==1'b1 , "both ren_w2 and ren_w1 are asserted" )
  end
  always @(posedge clk or posedge reset) begin
    if (reset==1'b1) begin
      count <= 2'd0;
    end	
    else if (flush==1'b1) begin
      count <= 2'd0;
    end
    else if (fsm_en==1'b1) begin
      if (wen==1'b1 && (ren_w2==1'b0 && ren_w1==1'b0)) begin
        count <= count + 2'd1;
        `xassert(count >= 2'd3, "pushing data into sr when count >= 3")
      end else if (wen==1'b1 && ren_w2==1'b1) begin
        count <= count - 2'd1;
        `xassert(count == 2'd0, "popping pixel from sr when count == 0. Case A.")
      end else if (wen==1'b0 && ren_w2==1'b1) begin
        count <= count - 2'd2;
        `xassert(count <= 2'd1, "popping two pixels from sr when count <= 1")
      end else if (wen==1'b0 && ren_w1==1'b1) begin
        count <= count - 2'd1;
        `xassert(count == 2'd0, "popping pixel from sr when count ==0. Case B.")
      end else if (wen==1'b1 && ren_w1==1'b1) begin
        count <= count;
      end
    end
  end


  always @(*) begin
      avail_w2 <= 1'b0;
      if (wen==1'b0 && ren_w2==1'b0) begin
        avail_w2 <= (count >= 2'd2);        
      end else if (wen==1'b0 && ren_w2==1'b1) begin
        avail_w2 <= 1'b0;      
      end else if (wen==1'b1 && ren_w2==1'b0) begin
        avail_w2 <= (count >= 2'd1);      
      end else if (wen==1'b1 && ren_w2==1'b1) begin
        avail_w2 <= (count == 2'd3);      
      end
  end
  always @(*) begin
      avail_w1 <= 1'b0;
      if (wen==1'b0 && ren_w1==1'b0 && ren_w2==1'b0) begin
        avail_w1 <= (count >= 2'd1);      
      end else if (wen==1'b0 && ren_w1==1'b0 && ren_w2==1'b1) begin
        avail_w1 <= (count == 2'd3); 
      end else if (wen==1'b0 && ren_w1==1'b1) begin
        avail_w1 <= (count >= 2'd2);      
      end else if (wen==1'b1 && ren_w1==1'b0 && ren_w2==1'b0) begin
        avail_w1 <= 1'b1;      
      end else if (wen==1'b1 && ren_w1==1'b0 && ren_w2==1'b1) begin
        avail_w1 <= (count >= 2'd2);
      end else if (wen==1'b1 && ren_w1==1'b1) begin
        avail_w1 <= 1'b1;      
      end
  end

  always @(*) begin
    if (ren_w2==1'b1) begin
      if (count==2'd2) begin
        data_out <= data_sr[31:0];
      end else if (count==2'd3) begin
        data_out <= data_sr[47: 16];
      end else begin
        data_out <= 32'h0;
      end
      
    end else if (ren_w1==1'b1) begin
      if (count==2'd1) begin
        data_out <= {16'd0, data_sr[15:0]};
      end else if (count==2'd2) begin
        data_out <= {16'd0, data_sr[31:16]};
      end else if (count==2'd3) begin
        data_out <= {16'd0, data_sr[47: 32]};
      end else begin
        data_out <= 32'h0;
      end
    end else begin
      data_out <= 32'd0;
    end
  end

endmodule

