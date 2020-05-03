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
// Module: LOG2_FIXED_POINT_tb
// Source Path: 
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module LOG2_FIXED_POINT_tb;



  reg  i_CLK;
  reg  i_RSTn;
  wire i_VALID;
  wire rawData_i_DATA_VALID;
  wire o_LOG2_done;  // ufix1
  wire rdEnb;
  wire o_LOG2_done_enb;  // ufix1
  reg [19:0] o_LOG2_VALID_addr;  // ufix20
  wire o_LOG2_lastAddr;  // ufix1
  reg  check2_done;  // ufix1
  wire o_LOG2_VALID_done;  // ufix1
  wire o_LOG2_VALID_done_enb;  // ufix1
  wire o_LOG2_VALID_active;  // ufix1
  reg [19:0] in_valid_addr;  // ufix20
  wire in_valid_active;  // ufix1
  reg  tb_enb_delay;
  wire in_valid_enb;  // ufix1
  wire [19:0] in_scaled_data_addr_delay_1;  // ufix20
  reg signed [31:0] fp_i_DATA;  // sfix32
  reg [10:0] rawData_i_DATA;  // ufix11_En10
  reg signed [31:0] status_i_DATA;  // sfix32
  reg [10:0] holdData_i_DATA;  // ufix11_En10
  reg [10:0] i_DATA_offset;  // ufix11_En10
  wire [10:0] i_DATA;  // ufix11_En10
  reg  holdData_i_DATA_VALID;
  reg  i_DATA_VALID_offset;
  wire i_DATA_VALID_1;
  wire snkDone;
  wire snkDonen;
  wire tb_enb;
  wire o_VALID;
  wire o_LOG2_VALID;
  wire signed [10:0] o_LOG2;  // sfix11_En10
  wire o_LOG2_VALID_enb;  // ufix1
  wire o_LOG2_VALID_lastAddr;  // ufix1
  reg  check1_done;  // ufix1
  wire [19:0] o_LOG2_VALID_addr_delay_1;  // ufix20
  reg signed [31:0] fp_o_LOG2_VALID_expected;  // sfix32
  reg  o_LOG2_VALID_expected;
  reg signed [31:0] status_o_LOG2_VALID_expected;  // sfix32
  wire o_LOG2_VALID_ref;
  reg  o_LOG2_VALID_testFailure;  // ufix1
  wire [19:0] o_LOG2_addr_delay_1;  // ufix20
  reg signed [31:0] fp_o_LOG2_expected;  // sfix32
  reg signed [10:0] o_LOG2_expected;  // sfix11_En10
  reg signed [31:0] status_o_LOG2_expected;  // sfix32
  wire signed [10:0] o_LOG2_ref;  // sfix11_En10
  reg  o_LOG2_testFailure;  // ufix1
  wire testFailure;  // ufix1


  // Data source for i_DATA_VALID
  assign rawData_i_DATA_VALID = 1'b1;



  assign o_LOG2_done_enb = o_LOG2_done & rdEnb;



  assign o_LOG2_lastAddr = o_LOG2_VALID_addr >= 20'b11110100001001000000;



  assign o_LOG2_done = o_LOG2_lastAddr & i_RSTn;



  // Delay to allow last sim cycle to complete
  always @(posedge i_CLK or negedge i_RSTn)
    begin : checkDone_2
      if (!i_RSTn) begin
        check2_done <= 0;
      end
      else begin
        if (o_LOG2_done_enb) begin
          check2_done <= o_LOG2_done;
        end
      end
    end

  assign o_LOG2_VALID_done_enb = o_LOG2_VALID_done & rdEnb;



  assign o_LOG2_VALID_active = o_LOG2_VALID_addr != 20'b11110100001001000000;



  assign in_valid_active = in_valid_addr != 20'b11110100001001000000;



  assign in_valid_enb = in_valid_active & (rdEnb & tb_enb_delay);



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 1000000
  always @(posedge i_CLK or negedge i_RSTn)
    begin : Constant1_process
      if (i_RSTn == 1'b0) begin
        in_valid_addr <= 20'b00000000000000000000;
      end
      else begin
        if (in_valid_enb) begin
          if (in_valid_addr >= 20'b11110100001001000000) begin
            in_valid_addr <= 20'b00000000000000000000;
          end
          else begin
            in_valid_addr <= in_valid_addr + 20'b00000000000000000001;
          end
        end
      end
    end



  assign #1 in_scaled_data_addr_delay_1 = in_valid_addr;

  // Data source for i_DATA
  initial
    begin : i_DATA_fileread
      fp_i_DATA = $fopen("i_DATA.dat", "r");
      status_i_DATA = $rewind(fp_i_DATA);
    end

  always @(in_scaled_data_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_DATA <= 11'bx;
      end
      else if (rdEnb == 1) begin
        status_i_DATA = $fscanf(fp_i_DATA, "%h", rawData_i_DATA);
      end
    end

  // holdData reg for in_scaled_data
  always @(posedge i_CLK or negedge i_RSTn)
    begin : stimuli_in_scaled_data
      if (!i_RSTn) begin
        holdData_i_DATA <= 11'bx;
      end
      else begin
        holdData_i_DATA <= rawData_i_DATA;
      end
    end

  always @(rawData_i_DATA or rdEnb)
    begin : stimuli_in_scaled_data_1
      if (rdEnb == 1'b0) begin
        i_DATA_offset <= holdData_i_DATA;
      end
      else begin
        i_DATA_offset <= rawData_i_DATA;
      end
    end

  assign #2 i_DATA = i_DATA_offset;

  // holdData reg for in_valid
  always @(posedge i_CLK or negedge i_RSTn)
    begin : stimuli_in_valid
      if (!i_RSTn) begin
        holdData_i_DATA_VALID <= 1'bx;
      end
      else begin
        holdData_i_DATA_VALID <= rawData_i_DATA_VALID;
      end
    end

  always @(rawData_i_DATA_VALID or rdEnb)
    begin : stimuli_in_valid_1
      if (rdEnb == 1'b0) begin
        i_DATA_VALID_offset <= holdData_i_DATA_VALID;
      end
      else begin
        i_DATA_VALID_offset <= rawData_i_DATA_VALID;
      end
    end

  assign #2 i_DATA_VALID_1 = i_DATA_VALID_offset;

  assign snkDonen =  ~ snkDone;



  assign tb_enb = i_RSTn & snkDonen;



  // Delay inside enable generation: register depth 1
  always @(posedge i_CLK or negedge i_RSTn)
    begin : u_enable_delay
      if (!i_RSTn) begin
        tb_enb_delay <= 0;
      end
      else begin
        tb_enb_delay <= tb_enb;
      end
    end

  assign rdEnb = (snkDone == 1'b0 ? tb_enb_delay :
              1'b0);



  assign #2 i_VALID = rdEnb;

  initial
    begin : i_RSTn_gen
      i_RSTn <= 1'b0;
      # (40);
      @ (posedge i_CLK)
      # (2);
      i_RSTn <= 1'b1;
    end

  always 
    begin : i_CLK_gen
      i_CLK <= 1'b1;
      # (10);
      i_CLK <= 1'b0;
      # (10);
      if (snkDone == 1'b1) begin
        i_CLK <= 1'b1;
        # (10);
        i_CLK <= 1'b0;
        # (10);
        $stop;
      end
    end

  LOG2_FIXED_POINT u_LOG2_FIXED_POINT (.i_CLK(i_CLK),
                                       .i_RSTn(i_RSTn),
                                       .i_VALID(i_VALID),
                                       .i_DATA_VALID(i_DATA_VALID_1),
                                       .i_DATA(i_DATA),  // ufix11_En10
                                       .o_VALID(o_VALID),
                                       .o_LOG2_VALID(o_LOG2_VALID),
                                       .o_LOG2(o_LOG2)  // sfix11_En10
                                       );

  assign o_LOG2_VALID_enb = o_VALID & o_LOG2_VALID_active;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 1000000
  always @(posedge i_CLK or negedge i_RSTn)
    begin : c_2_process
      if (i_RSTn == 1'b0) begin
        o_LOG2_VALID_addr <= 20'b00000000000000000000;
      end
      else begin
        if (o_LOG2_VALID_enb) begin
          if (o_LOG2_VALID_addr >= 20'b11110100001001000000) begin
            o_LOG2_VALID_addr <= 20'b00000000000000000000;
          end
          else begin
            o_LOG2_VALID_addr <= o_LOG2_VALID_addr + 20'b00000000000000000001;
          end
        end
      end
    end



  assign o_LOG2_VALID_lastAddr = o_LOG2_VALID_addr >= 20'b11110100001001000000;



  assign o_LOG2_VALID_done = o_LOG2_VALID_lastAddr & i_RSTn;



  // Delay to allow last sim cycle to complete
  always @(posedge i_CLK or negedge i_RSTn)
    begin : checkDone_1
      if (!i_RSTn) begin
        check1_done <= 0;
      end
      else begin
        if (o_LOG2_VALID_done_enb) begin
          check1_done <= o_LOG2_VALID_done;
        end
      end
    end

  assign snkDone = check1_done & check2_done;



  assign #1 o_LOG2_VALID_addr_delay_1 = o_LOG2_VALID_addr;

  // Data source for o_LOG2_VALID_expected
  initial
    begin : o_LOG2_VALID_expected_fileread
      fp_o_LOG2_VALID_expected = $fopen("o_LOG2_VALID_expected.dat", "r");
      status_o_LOG2_VALID_expected = $rewind(fp_o_LOG2_VALID_expected);
    end

  always @(o_LOG2_VALID_addr_delay_1, o_VALID, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        o_LOG2_VALID_expected <= 1'bx;
      end
      else if (o_VALID == 1) begin
        status_o_LOG2_VALID_expected = $fscanf(fp_o_LOG2_VALID_expected, "%h", o_LOG2_VALID_expected);
      end
    end

  assign o_LOG2_VALID_ref = o_LOG2_VALID_expected;

  always @(posedge i_CLK or negedge i_RSTn)
    begin : o_LOG2_VALID_checker
      if (i_RSTn == 1'b0) begin
        o_LOG2_VALID_testFailure <= 1'b0;
      end
      else begin
        if (o_VALID == 1'b1 && o_LOG2_VALID !== o_LOG2_VALID_ref) begin
          o_LOG2_VALID_testFailure <= 1'b1;
          $display("ERROR in o_LOG2_VALID at time %t : Expected '%h' Actual '%h'", $time, o_LOG2_VALID_ref, o_LOG2_VALID);
        end
      end
    end

  assign #1 o_LOG2_addr_delay_1 = o_LOG2_VALID_addr;

  // Data source for o_LOG2_expected
  initial
    begin : o_LOG2_expected_fileread
      fp_o_LOG2_expected = $fopen("o_LOG2_expected.dat", "r");
      status_o_LOG2_expected = $rewind(fp_o_LOG2_expected);
    end

  always @(o_LOG2_addr_delay_1, o_VALID, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        o_LOG2_expected <= 11'bx;
      end
      else if (o_VALID == 1) begin
        status_o_LOG2_expected = $fscanf(fp_o_LOG2_expected, "%h", o_LOG2_expected);
      end
    end

  assign o_LOG2_ref = o_LOG2_expected;

  always @(posedge i_CLK or negedge i_RSTn)
    begin : o_LOG2_checker
      if (i_RSTn == 1'b0) begin
        o_LOG2_testFailure <= 1'b0;
      end
      else begin
        if (o_VALID == 1'b1 && o_LOG2 !== o_LOG2_ref) begin
          o_LOG2_testFailure <= 1'b1;
          $display("ERROR in o_LOG2 at time %t : Expected '%h' Actual '%h'", $time, o_LOG2_ref, o_LOG2);
        end
      end
    end

  assign testFailure = o_LOG2_VALID_testFailure | o_LOG2_testFailure;



  always @(posedge i_CLK)
    begin : completed_msg
      if (snkDone == 1'b1) begin
        if (testFailure == 1'b0) begin
          $display("**************TEST COMPLETED (PASSED)**************");
        end
        else begin
          $display("**************TEST COMPLETED (FAILED)**************");
        end
      end
    end

endmodule  // LOG2_FIXED_POINT_tb

