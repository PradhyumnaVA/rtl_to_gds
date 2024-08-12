/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Mon Aug 12 14:33:35 2024
/////////////////////////////////////////////////////////////


module up_down_counter ( i_clk, i_rst, i_en, i_up_down, o_Q );
  output [2:0] o_Q;
  input i_clk, i_rst, i_en, i_up_down;
  wire   n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69;
  wire   [2:0] count;
  wire   [2:0] Current_state;

  sky130_fd_sc_hd__dfrtp_1 \count_reg[0]  ( .D(n42), .CLK(i_clk), .RESET_B(n36), .Q(count[0]) );
  sky130_fd_sc_hd__dfrtp_1 \count_reg[1]  ( .D(n37), .CLK(i_clk), .RESET_B(n36), .Q(count[1]) );
  sky130_fd_sc_hd__dfrtp_1 \Current_state_reg[0]  ( .D(n38), .CLK(i_clk), 
        .RESET_B(n36), .Q(Current_state[0]) );
  sky130_fd_sc_hd__dfrtp_1 \count_reg[2]  ( .D(n40), .CLK(i_clk), .RESET_B(n36), .Q(count[2]) );
  sky130_fd_sc_hd__dfrtp_1 \Current_state_reg[1]  ( .D(n39), .CLK(i_clk), 
        .RESET_B(n36), .Q(Current_state[1]) );
  sky130_fd_sc_hd__dfrtp_1 \Current_state_reg[2]  ( .D(n41), .CLK(i_clk), 
        .RESET_B(n36), .Q(Current_state[2]) );
  sky130_fd_sc_hd__a21o_1 U45 ( .A1(o_Q[2]), .A2(n35), .B1(n32), .X(o_Q[2]) );
  sky130_fd_sc_hd__o2bb2ai_1 U46 ( .B1(n35), .B2(n33), .A1_N(n35), .A2_N(
        o_Q[1]), .Y(o_Q[1]) );
  sky130_fd_sc_hd__o2bb2ai_1 U47 ( .B1(n35), .B2(n34), .A1_N(n35), .A2_N(
        o_Q[0]), .Y(o_Q[0]) );
  sky130_fd_sc_hd__clkinv_1 U48 ( .A(count[1]), .Y(n33) );
  sky130_fd_sc_hd__clkinv_1 U49 ( .A(i_en), .Y(n35) );
  sky130_fd_sc_hd__clkinv_1 U50 ( .A(n67), .Y(n46) );
  sky130_fd_sc_hd__clkinv_1 U51 ( .A(i_up_down), .Y(n53) );
  sky130_fd_sc_hd__clkinvlp_2 U52 ( .A(count[2]), .Y(n60) );
  sky130_fd_sc_hd__clkinv_1 U53 ( .A(Current_state[1]), .Y(n62) );
  sky130_fd_sc_hd__clkinvlp_2 U54 ( .A(count[0]), .Y(n34) );
  sky130_fd_sc_hd__clkinv_1 U55 ( .A(i_rst), .Y(n36) );
  sky130_fd_sc_hd__clkinv_1 U56 ( .A(Current_state[2]), .Y(n56) );
  sky130_fd_sc_hd__nor2_1 U57 ( .A(Current_state[0]), .B(n62), .Y(n67) );
  sky130_fd_sc_hd__nand2_1 U58 ( .A(Current_state[0]), .B(n62), .Y(n47) );
  sky130_fd_sc_hd__nand2_1 U59 ( .A(n46), .B(n47), .Y(n43) );
  sky130_fd_sc_hd__nor4b_1 U60 ( .D_N(Current_state[0]), .A(Current_state[2]), 
        .B(i_up_down), .C(n62), .Y(n48) );
  sky130_fd_sc_hd__a31oi_1 U61 ( .A1(n56), .A2(n43), .A3(n34), .B1(n48), .Y(
        n44) );
  sky130_fd_sc_hd__o21ai_1 U62 ( .A1(n56), .A2(n34), .B1(n44), .Y(n42) );
  sky130_fd_sc_hd__nor2_1 U63 ( .A(Current_state[0]), .B(n35), .Y(n61) );
  sky130_fd_sc_hd__clkinv_1 U64 ( .A(n47), .Y(n58) );
  sky130_fd_sc_hd__o221ai_1 U65 ( .A1(i_up_down), .A2(n67), .B1(n53), .B2(n58), 
        .C1(n35), .Y(n45) );
  sky130_fd_sc_hd__a22oi_1 U66 ( .A1(n62), .A2(n61), .B1(n45), .B2(n56), .Y(
        n41) );
  sky130_fd_sc_hd__nor2_1 U67 ( .A(n34), .B(n47), .Y(n66) );
  sky130_fd_sc_hd__a32oi_1 U68 ( .A1(n67), .A2(n33), .A3(n34), .B1(n66), .B2(
        count[1]), .Y(n51) );
  sky130_fd_sc_hd__a221oi_1 U69 ( .A1(n67), .A2(count[0]), .B1(n58), .B2(n34), 
        .C1(Current_state[2]), .Y(n68) );
  sky130_fd_sc_hd__o221ai_1 U70 ( .A1(count[1]), .A2(n47), .B1(n33), .B2(n46), 
        .C1(n68), .Y(n49) );
  sky130_fd_sc_hd__a21oi_1 U71 ( .A1(count[2]), .A2(n49), .B1(n48), .Y(n50) );
  sky130_fd_sc_hd__o31ai_1 U72 ( .A1(count[2]), .A2(Current_state[2]), .A3(n51), .B1(n50), .Y(n40) );
  sky130_fd_sc_hd__nor2_1 U73 ( .A(n60), .B(n35), .Y(n32) );
  sky130_fd_sc_hd__nor2_1 U74 ( .A(Current_state[0]), .B(n56), .Y(n65) );
  sky130_fd_sc_hd__o22ai_1 U75 ( .A1(Current_state[0]), .A2(i_en), .B1(
        Current_state[1]), .B2(n65), .Y(n52) );
  sky130_fd_sc_hd__a2bb2oi_1 U76 ( .B1(n56), .B2(n58), .A1_N(i_up_down), 
        .A2_N(n52), .Y(n55) );
  sky130_fd_sc_hd__a31oi_1 U77 ( .A1(n32), .A2(n34), .A3(n33), .B1(n53), .Y(
        n54) );
  sky130_fd_sc_hd__o22ai_1 U78 ( .A1(n55), .A2(n54), .B1(n56), .B2(n62), .Y(
        n39) );
  sky130_fd_sc_hd__nor2_1 U79 ( .A(i_up_down), .B(n62), .Y(n57) );
  sky130_fd_sc_hd__o21ai_1 U80 ( .A1(n58), .A2(n57), .B1(n56), .Y(n59) );
  sky130_fd_sc_hd__a31oi_1 U81 ( .A1(n61), .A2(n60), .A3(n33), .B1(n59), .Y(
        n64) );
  sky130_fd_sc_hd__nand3_1 U82 ( .A(i_up_down), .B(i_en), .C(n62), .Y(n63) );
  sky130_fd_sc_hd__o21ai_1 U83 ( .A1(n65), .A2(n64), .B1(n63), .Y(n38) );
  sky130_fd_sc_hd__a21oi_1 U84 ( .A1(n67), .A2(n34), .B1(n66), .Y(n69) );
  sky130_fd_sc_hd__o32ai_1 U85 ( .A1(count[1]), .A2(Current_state[2]), .A3(n69), .B1(n68), .B2(n33), .Y(n37) );
endmodule

