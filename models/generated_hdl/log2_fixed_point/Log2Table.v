
`timescale 1 ns / 1 ns

module Log2Table
          (i_CLK,
           enb,
           In1,
           Out1);


  input   i_CLK;
  input   enb;
  input   [4:0] In1;  // ufix5
  output  [9:0] Out1;  // ufix10_En10


  wire [4:0] alpha1_D_Lookup_Table_k;  // ufix5
  wire [9:0] alpha1_D_Lookup_Table_1 [0:31];  // ufix10_En10 [32]
  wire [9:0] alpha1_D_Lookup_Table_out1;  // ufix10_En10
  reg [9:0] alpha1_D_Lookup_Table_out1_1;  // ufix10_En10

  initial begin
    alpha1_D_Lookup_Table_out1_1 = 10'b0000000000;
  end

  assign alpha1_D_Lookup_Table_1[0] = 10'b0000000000;
  assign alpha1_D_Lookup_Table_1[1] = 10'b0000101101;
  assign alpha1_D_Lookup_Table_1[2] = 10'b0001011010;
  assign alpha1_D_Lookup_Table_1[3] = 10'b0010000100;
  assign alpha1_D_Lookup_Table_1[4] = 10'b0010101110;
  assign alpha1_D_Lookup_Table_1[5] = 10'b0011010110;
  assign alpha1_D_Lookup_Table_1[6] = 10'b0011111110;
  assign alpha1_D_Lookup_Table_1[7] = 10'b0100100100;
  assign alpha1_D_Lookup_Table_1[8] = 10'b0101001010;
  assign alpha1_D_Lookup_Table_1[9] = 10'b0101101110;
  assign alpha1_D_Lookup_Table_1[10] = 10'b0110010010;
  assign alpha1_D_Lookup_Table_1[11] = 10'b0110110100;
  assign alpha1_D_Lookup_Table_1[12] = 10'b0111010110;
  assign alpha1_D_Lookup_Table_1[13] = 10'b0111111000;
  assign alpha1_D_Lookup_Table_1[14] = 10'b1000011000;
  assign alpha1_D_Lookup_Table_1[15] = 10'b1000111000;
  assign alpha1_D_Lookup_Table_1[16] = 10'b1001010111;
  assign alpha1_D_Lookup_Table_1[17] = 10'b1001110101;
  assign alpha1_D_Lookup_Table_1[18] = 10'b1010010011;
  assign alpha1_D_Lookup_Table_1[19] = 10'b1010110001;
  assign alpha1_D_Lookup_Table_1[20] = 10'b1011001101;
  assign alpha1_D_Lookup_Table_1[21] = 10'b1011101001;
  assign alpha1_D_Lookup_Table_1[22] = 10'b1100000101;
  assign alpha1_D_Lookup_Table_1[23] = 10'b1100100000;
  assign alpha1_D_Lookup_Table_1[24] = 10'b1100111011;
  assign alpha1_D_Lookup_Table_1[25] = 10'b1101010101;
  assign alpha1_D_Lookup_Table_1[26] = 10'b1101101111;
  assign alpha1_D_Lookup_Table_1[27] = 10'b1110001000;
  assign alpha1_D_Lookup_Table_1[28] = 10'b1110100001;
  assign alpha1_D_Lookup_Table_1[29] = 10'b1110111001;
  assign alpha1_D_Lookup_Table_1[30] = 10'b1111010001;
  assign alpha1_D_Lookup_Table_1[31] = 10'b1111101001;
  assign alpha1_D_Lookup_Table_k = (In1 == 5'b00000 ? 5'b00000 :
              (In1 == 5'b11111 ? 5'b11111 :
              In1));
  assign alpha1_D_Lookup_Table_out1 = alpha1_D_Lookup_Table_1[alpha1_D_Lookup_Table_k];


  always @(posedge i_CLK)
    begin : PipelineRegister_process
      if (enb) begin
        alpha1_D_Lookup_Table_out1_1 <= alpha1_D_Lookup_Table_out1;
      end
    end



  assign Out1 = alpha1_D_Lookup_Table_out1_1;

endmodule  // Log2Table

