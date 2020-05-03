
`timescale 1 ns / 1 ns

module CLZ
          (i_CLK,
           i_RSTn,
           enb,
           i_VALID_1,
           i_DATA,
           o_VALID,
           o_CLZ,
           o_DATA);


  input   i_CLK;
  input   i_RSTn;
  input   enb;
  input   i_VALID_1;
  input   [127:0] i_DATA;  // ufix128
  output  o_VALID;
  output  [7:0] o_CLZ;  // uint8
  output  [127:0] o_DATA;  // ufix128


  reg  [0:7] Delay_reg;  // ufix1 [8]
  wire [0:7] Delay_reg_next;  // ufix1 [8]
  wire Delay_out1;
  reg [127:0] i_DATA_1;  // ufix128
  wire [7:0] Constant_out1;  // uint8
  wire [63:0] CLZ_STAGE6_out1;  // ufix64
  wire [7:0] CLZ_STAGE6_out2;  // uint8
  reg [63:0] Delay2_out1;  // ufix64
  reg [7:0] Delay3_out1;  // uint8
  wire [31:0] CLZ_STAGE5_out1;  // uint32
  wire [7:0] CLZ_STAGE5_out2;  // uint8
  reg [31:0] Delay4_out1;  // uint32
  reg [7:0] Delay5_out1;  // uint8
  wire [15:0] CLZ_STAGE4_out1;  // uint16
  wire [7:0] CLZ_STAGE4_out2;  // uint8
  reg [15:0] Delay6_out1;  // uint16
  reg [7:0] Delay7_out1;  // uint8
  wire [7:0] CLZ_STAGE3_out1;  // uint8
  wire [7:0] CLZ_STAGE3_out2;  // uint8
  reg [7:0] Delay8_out1;  // uint8
  reg [7:0] Delay9_out1;  // uint8
  wire [3:0] CLZ_STAGE2_out1;  // ufix4
  wire [7:0] CLZ_STAGE2_out2;  // uint8
  reg [3:0] Delay10_out1;  // ufix4
  reg [7:0] Delay11_out1;  // uint8
  wire [1:0] CLZ_STAGE1_out1;  // ufix2
  wire [7:0] CLZ_STAGE1_out2;  // uint8
  reg [1:0] Delay12_out1;  // ufix2
  reg [7:0] Delay13_out1;  // uint8
  wire CLZ_STAGE0_out1;  // ufix1
  wire [7:0] CLZ_STAGE0_out2;  // uint8
  wire Logical_Operator_out1;
  wire [7:0] Add_1;  // ufix8
  wire [7:0] Add_out1;  // uint8
  reg [7:0] Delay14_out1;  // uint8
  reg [127:0] reduced_reg [0:6];  // ufix128 [7]
  wire [127:0] reduced_reg_next [0:6];  // ufix128 [7]
  wire [127:0] i_DATA_2;  // ufix128


  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay_process
      if (i_RSTn == 1'b0) begin
        Delay_reg[0] <= 1'b0;
        Delay_reg[1] <= 1'b0;
        Delay_reg[2] <= 1'b0;
        Delay_reg[3] <= 1'b0;
        Delay_reg[4] <= 1'b0;
        Delay_reg[5] <= 1'b0;
        Delay_reg[6] <= 1'b0;
        Delay_reg[7] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay_reg[0] <= Delay_reg_next[0];
          Delay_reg[1] <= Delay_reg_next[1];
          Delay_reg[2] <= Delay_reg_next[2];
          Delay_reg[3] <= Delay_reg_next[3];
          Delay_reg[4] <= Delay_reg_next[4];
          Delay_reg[5] <= Delay_reg_next[5];
          Delay_reg[6] <= Delay_reg_next[6];
          Delay_reg[7] <= Delay_reg_next[7];
        end
      end
    end

  assign Delay_out1 = Delay_reg[7];
  assign Delay_reg_next[0] = i_VALID_1;
  assign Delay_reg_next[1] = Delay_reg[0];
  assign Delay_reg_next[2] = Delay_reg[1];
  assign Delay_reg_next[3] = Delay_reg[2];
  assign Delay_reg_next[4] = Delay_reg[3];
  assign Delay_reg_next[5] = Delay_reg[4];
  assign Delay_reg_next[6] = Delay_reg[5];
  assign Delay_reg_next[7] = Delay_reg[6];


  assign o_VALID = Delay_out1;

  always @(posedge i_CLK or negedge i_RSTn)
    begin : reduced_process
      if (i_RSTn == 1'b0) begin
        i_DATA_1 <= 128'h00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          i_DATA_1 <= i_DATA;
        end
      end
    end


  assign Constant_out1 = 8'b00000000;


  CLZ_STAGE6 u_CLZ_STAGE6 (.i_WORD(i_DATA_1),  // ufix128
                           .i_RESULT(Constant_out1),  // uint8
                           .o_WORD(CLZ_STAGE6_out1),  // ufix64
                           .o_RESULT(CLZ_STAGE6_out2)  // uint8
                           );
  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay2_process
      if (i_RSTn == 1'b0) begin
        Delay2_out1 <= 64'h0000000000000000;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= CLZ_STAGE6_out1;
        end
      end
    end


  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay3_process
      if (i_RSTn == 1'b0) begin
        Delay3_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= CLZ_STAGE6_out2;
        end
      end
    end


  CLZ_STAGE5 u_CLZ_STAGE5 (.i_WORD(Delay2_out1),  // ufix64
                           .i_RESULT(Delay3_out1),  // uint8
                           .o_WORD(CLZ_STAGE5_out1),  // uint32
                           .o_RESULT(CLZ_STAGE5_out2)  // uint8
                           );
  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay4_process
      if (i_RSTn == 1'b0) begin
        Delay4_out1 <= 32'b00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= CLZ_STAGE5_out1;
        end
      end
    end


  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay5_process
      if (i_RSTn == 1'b0) begin
        Delay5_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= CLZ_STAGE5_out2;
        end
      end
    end


  CLZ_STAGE4 u_CLZ_STAGE4 (.i_WORD(Delay4_out1),  // uint32
                           .i_RESULT(Delay5_out1),  // uint8
                           .o_WORD(CLZ_STAGE4_out1),  // uint16
                           .o_RESULT(CLZ_STAGE4_out2)  // uint8
                           );
  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay6_process
      if (i_RSTn == 1'b0) begin
        Delay6_out1 <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          Delay6_out1 <= CLZ_STAGE4_out1;
        end
      end
    end


  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay7_process
      if (i_RSTn == 1'b0) begin
        Delay7_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay7_out1 <= CLZ_STAGE4_out2;
        end
      end
    end


  CLZ_STAGE3 u_CLZ_STAGE3 (.i_WORD(Delay6_out1),  // uint16
                           .i_RESULT(Delay7_out1),  // uint8
                           .o_WORD(CLZ_STAGE3_out1),  // uint8
                           .o_RESULT(CLZ_STAGE3_out2)  // uint8
                           );
  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay8_process
      if (i_RSTn == 1'b0) begin
        Delay8_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay8_out1 <= CLZ_STAGE3_out1;
        end
      end
    end


  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay9_process
      if (i_RSTn == 1'b0) begin
        Delay9_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay9_out1 <= CLZ_STAGE3_out2;
        end
      end
    end


  CLZ_STAGE2 u_CLZ_STAGE2 (.i_WORD(Delay8_out1),  // uint8
                           .i_RESULT(Delay9_out1),  // uint8
                           .o_WORD(CLZ_STAGE2_out1),  // ufix4
                           .o_RESULT(CLZ_STAGE2_out2)  // uint8
                           );
  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay10_process
      if (i_RSTn == 1'b0) begin
        Delay10_out1 <= 4'b0000;
      end
      else begin
        if (enb) begin
          Delay10_out1 <= CLZ_STAGE2_out1;
        end
      end
    end


  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay11_process
      if (i_RSTn == 1'b0) begin
        Delay11_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay11_out1 <= CLZ_STAGE2_out2;
        end
      end
    end


  CLZ_STAGE1 u_CLZ_STAGE1 (.i_WORD(Delay10_out1),  // ufix4
                           .i_RESULT(Delay11_out1),  // uint8
                           .o_WORD(CLZ_STAGE1_out1),  // ufix2
                           .o_RESULT(CLZ_STAGE1_out2)  // uint8
                           );
  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay12_process
      if (i_RSTn == 1'b0) begin
        Delay12_out1 <= 2'b00;
      end
      else begin
        if (enb) begin
          Delay12_out1 <= CLZ_STAGE1_out1;
        end
      end
    end


  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay13_process
      if (i_RSTn == 1'b0) begin
        Delay13_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay13_out1 <= CLZ_STAGE1_out2;
        end
      end
    end


  CLZ_STAGE0 u_CLZ_STAGE0 (.i_WORD(Delay12_out1),  // ufix2
                           .i_RESULT(Delay13_out1),  // uint8
                           .o_WORD(CLZ_STAGE0_out1),  // ufix1
                           .o_RESULT(CLZ_STAGE0_out2)  // uint8
                           );
  assign Logical_Operator_out1 =  ~ CLZ_STAGE0_out1;


  assign Add_1 = {7'b0, Logical_Operator_out1};
  assign Add_out1 = Add_1 + CLZ_STAGE0_out2;


  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay14_process
      if (i_RSTn == 1'b0) begin
        Delay14_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay14_out1 <= Add_out1;
        end
      end
    end


  assign o_CLZ = Delay14_out1;

  always @(posedge i_CLK or negedge i_RSTn)
    begin : reduced_1_process
      if (i_RSTn == 1'b0) begin
        reduced_reg[0] <= 128'h00000000000000000000000000000000;
        reduced_reg[1] <= 128'h00000000000000000000000000000000;
        reduced_reg[2] <= 128'h00000000000000000000000000000000;
        reduced_reg[3] <= 128'h00000000000000000000000000000000;
        reduced_reg[4] <= 128'h00000000000000000000000000000000;
        reduced_reg[5] <= 128'h00000000000000000000000000000000;
        reduced_reg[6] <= 128'h00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          reduced_reg[0] <= reduced_reg_next[0];
          reduced_reg[1] <= reduced_reg_next[1];
          reduced_reg[2] <= reduced_reg_next[2];
          reduced_reg[3] <= reduced_reg_next[3];
          reduced_reg[4] <= reduced_reg_next[4];
          reduced_reg[5] <= reduced_reg_next[5];
          reduced_reg[6] <= reduced_reg_next[6];
        end
      end
    end

  assign i_DATA_2 = reduced_reg[6];
  assign reduced_reg_next[0] = i_DATA_1;
  assign reduced_reg_next[1] = reduced_reg[0];
  assign reduced_reg_next[2] = reduced_reg[1];
  assign reduced_reg_next[3] = reduced_reg[2];
  assign reduced_reg_next[4] = reduced_reg[3];
  assign reduced_reg_next[5] = reduced_reg[4];
  assign reduced_reg_next[6] = reduced_reg[5];


  assign o_DATA = i_DATA_2;

endmodule  // CLZ

