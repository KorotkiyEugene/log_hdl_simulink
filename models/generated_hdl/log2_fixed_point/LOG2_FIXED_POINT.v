// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// o_VALID       1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// o_LOG2_VALID                  o_VALID       1
// o_LOG2                        o_VALID       1
// -- -------------------------------------------------------------
// 
// filter
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: LOG2_FIXED_POINT
// Source Path: log2_fixed_point/LOG2_FIXED_POINT
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module LOG2_FIXED_POINT
          (i_CLK,
           i_RSTn,
           i_VALID,
           i_DATA_VALID,
           i_DATA,
           o_VALID,
           o_LOG2_VALID,
           o_LOG2);


  input   i_CLK;
  input   i_RSTn;
  input   i_VALID;
  input   i_DATA_VALID;
  input   [10:0] i_DATA;  // ufix11_En10
  output  o_VALID;
  output  o_LOG2_VALID;
  output  signed [10:0] o_LOG2;  // sfix11_En10


  wire enb;
  wire [10:0] UintCast_out1;  // ufix11
  wire [127:0] Data_Type_Conversion_out1;  // ufix128
  wire CLZ_out1;
  wire [7:0] CLZ_out2;  // uint8
  wire [127:0] CLZ_out3;  // ufix128
  reg  [0:1] delayMatch1_reg;  // ufix1 [2]
  wire [0:1] delayMatch1_reg_next;  // ufix1 [2]
  wire Delay_out1;
  wire [7:0] Constant_out1;  // uint8
  wire signed [8:0] Subtract_1;  // sfix9
  wire signed [8:0] Subtract_2;  // sfix9
  wire signed [8:0] Subtract_out1;  // sfix9
  reg signed [8:0] Subtract_out1_1;  // sfix9
  wire [127:0] Shift_Arithmetic_out1;  // ufix128
  wire [127:0] Bit_Shift_out1;  // ufix128
  wire [4:0] Data_Type_Conversion2_out1;  // ufix5
  wire [9:0] Log2Table_out1;  // ufix10_En10
  wire signed [18:0] Add_add_cast;  // sfix19_En10
  wire signed [18:0] Add_add_cast_1;  // sfix19_En10
  wire signed [18:0] Add_out1;  // sfix19_En10
  wire signed [10:0] Data_Type_Conversion1_out1;  // sfix11_En10
  reg signed [10:0] Delay1_out1;  // sfix11_En10


  assign UintCast_out1 = i_DATA;


  assign Data_Type_Conversion_out1 = {117'b0, UintCast_out1};


  CLZ u_CLZ (.i_CLK(i_CLK),
             .i_RSTn(i_RSTn),
             .enb(i_VALID),
             .i_VALID_1(i_DATA_VALID),
             .i_DATA(Data_Type_Conversion_out1),  // ufix128
             .o_VALID(CLZ_out1),
             .o_CLZ(CLZ_out2),  // uint8
             .o_DATA(CLZ_out3)  // ufix128
             );
  assign enb = i_VALID;

  always @(posedge i_CLK or negedge i_RSTn)
    begin : delayMatch1_process
      if (i_RSTn == 1'b0) begin
        delayMatch1_reg[0] <= 1'b0;
        delayMatch1_reg[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          delayMatch1_reg[0] <= delayMatch1_reg_next[0];
          delayMatch1_reg[1] <= delayMatch1_reg_next[1];
        end
      end
    end

  assign Delay_out1 = delayMatch1_reg[1];
  assign delayMatch1_reg_next[0] = CLZ_out1;
  assign delayMatch1_reg_next[1] = delayMatch1_reg[0];


  assign o_LOG2_VALID = Delay_out1;

  assign Constant_out1 = 8'b01110101;


  assign Subtract_1 = {1'b0, Constant_out1};
  assign Subtract_2 = {1'b0, CLZ_out2};
  assign Subtract_out1 = Subtract_1 - Subtract_2;


  always @(posedge i_CLK or negedge i_RSTn)
    begin : delayMatch_process
      if (i_RSTn == 1'b0) begin
        Subtract_out1_1 <= 9'sb000000000;
      end
      else begin
        if (enb) begin
          Subtract_out1_1 <= Subtract_out1;
        end
      end
    end



  assign Shift_Arithmetic_out1 = CLZ_out3 <<< CLZ_out2;


  assign Bit_Shift_out1 = Shift_Arithmetic_out1 >> 8'd122;


  assign Data_Type_Conversion2_out1 = Bit_Shift_out1[4:0];


  Log2Table u_Log2Table (.i_CLK(i_CLK),
                         .enb(i_VALID),
                         .In1(Data_Type_Conversion2_out1),  // ufix5
                         .Out1(Log2Table_out1)  // ufix10_En10
                         );
  assign Add_add_cast = {Subtract_out1_1, 10'b0000000000};
  assign Add_add_cast_1 = {9'b0, Log2Table_out1};
  assign Add_out1 = Add_add_cast + Add_add_cast_1;


  assign Data_Type_Conversion1_out1 = Add_out1[10:0];


  always @(posedge i_CLK or negedge i_RSTn)
    begin : Delay1_process
      if (i_RSTn == 1'b0) begin
        Delay1_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= Data_Type_Conversion1_out1;
        end
      end
    end


  assign o_LOG2 = Delay1_out1;

  assign o_VALID = i_VALID;

endmodule  // LOG2_FIXED_POINT

