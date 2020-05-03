
`timescale 1 ns / 1 ns

module CLZ_STAGE5
          (i_WORD,
           i_RESULT,
           o_WORD,
           o_RESULT);


  input   [63:0] i_WORD;  // ufix64
  input   [7:0] i_RESULT;  // uint8
  output  [31:0] o_WORD;  // uint32
  output  [7:0] o_RESULT;  // uint8


  wire [31:0] HighPart_out1;  // uint32
  wire Bit_Reduce_out1;  // ufix1
  wire Logical_Operator_out1;
  wire [31:0] LowPart_out1;  // uint32
  wire [31:0] Multiport_Switch_out1;  // uint32
  wire [7:0] Bit_Set_out1;  // uint8
  wire [7:0] Multiport_Switch1_out1;  // uint8


  assign HighPart_out1 = i_WORD[63:32];


  assign Bit_Reduce_out1 = (|HighPart_out1[31:0]);


  assign Logical_Operator_out1 =  ~ Bit_Reduce_out1;


  assign LowPart_out1 = i_WORD[31:0];


  assign Multiport_Switch_out1 = (Logical_Operator_out1 == 1'b0 ? HighPart_out1 :
              LowPart_out1);


  assign o_WORD = Multiport_Switch_out1;

  assign Bit_Set_out1 = i_RESULT | 8'b00100000;


  assign Multiport_Switch1_out1 = (Logical_Operator_out1 == 1'b0 ? i_RESULT :
              Bit_Set_out1);


  assign o_RESULT = Multiport_Switch1_out1;

endmodule  // CLZ_STAGE5

