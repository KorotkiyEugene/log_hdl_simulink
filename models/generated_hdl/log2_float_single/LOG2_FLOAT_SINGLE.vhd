-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1
-- Target subsystem base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- o_VALID       1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- o_LOG2_VALID                  o_VALID       1
-- o_LOG2                        o_VALID       1
-- -------------------------------------------------------------
-- 
-- filter
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LOG2_FLOAT_SINGLE
-- Source Path: log2_float_single/LOG2_FLOAT_SINGLE
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LOG2_FLOAT_SINGLE IS
  PORT( i_CLK                             :   IN    std_logic;
        i_RSTn                            :   IN    std_logic;
        i_VALID                           :   IN    std_logic;
        i_DATA_VALID                      :   IN    std_logic;
        i_DATA                            :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        o_VALID                           :   OUT   std_logic;
        o_LOG2_VALID                      :   OUT   std_logic;
        o_LOG2                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END LOG2_FLOAT_SINGLE;


ARCHITECTURE rtl OF LOG2_FLOAT_SINGLE IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(0 TO 16);  -- ufix1 [17]
  SIGNAL delayMatch_reg_next              : std_logic_vector(0 TO 16);  -- ufix1 [17]
  SIGNAL i_DATA_VALID_1                   : std_logic;
  SIGNAL initcounter                      : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL initcompare                      : std_logic;
  SIGNAL initcompare4                     : std_logic;
  SIGNAL Gain1_out1const0                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL initcompare13                    : std_logic;
  SIGNAL Math_Function_out1const0         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL enb_1                            : std_logic;
  SIGNAL i_RSTn_1                         : std_logic;
  SIGNAL kconst                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Math_Function_out1ipOut          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Math_Function_out1               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL enb_2                            : std_logic;
  SIGNAL i_RSTn_2                         : std_logic;
  SIGNAL Gain1_out1ipOut                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain1_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  alterafpf_log_single_1 : ENTITY work.alterafpf_log_single
    PORT MAP( a => i_DATA,  -- single
              clk => i_CLK,
              en(0) => enb_1,
              areset => i_RSTn_1,
              q => Math_Function_out1ipOut  -- single
              );

  alterafpf_mul_single_1 : ENTITY work.alterafpf_mul_single
    PORT MAP( a => kconst,  -- single
              b => Math_Function_out1,  -- single
              clk => i_CLK,
              en(0) => enb_2,
              areset => i_RSTn_2,
              q => Gain1_out1ipOut  -- single
              );

  enb <= i_VALID;

  delayMatch_process : PROCESS (i_CLK, i_RSTn)
  BEGIN
    IF i_RSTn = '0' THEN
      delayMatch_reg(0) <= '0';
      delayMatch_reg(1) <= '0';
      delayMatch_reg(2) <= '0';
      delayMatch_reg(3) <= '0';
      delayMatch_reg(4) <= '0';
      delayMatch_reg(5) <= '0';
      delayMatch_reg(6) <= '0';
      delayMatch_reg(7) <= '0';
      delayMatch_reg(8) <= '0';
      delayMatch_reg(9) <= '0';
      delayMatch_reg(10) <= '0';
      delayMatch_reg(11) <= '0';
      delayMatch_reg(12) <= '0';
      delayMatch_reg(13) <= '0';
      delayMatch_reg(14) <= '0';
      delayMatch_reg(15) <= '0';
      delayMatch_reg(16) <= '0';
    ELSIF i_CLK'EVENT AND i_CLK = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg(0) <= delayMatch_reg_next(0);
        delayMatch_reg(1) <= delayMatch_reg_next(1);
        delayMatch_reg(2) <= delayMatch_reg_next(2);
        delayMatch_reg(3) <= delayMatch_reg_next(3);
        delayMatch_reg(4) <= delayMatch_reg_next(4);
        delayMatch_reg(5) <= delayMatch_reg_next(5);
        delayMatch_reg(6) <= delayMatch_reg_next(6);
        delayMatch_reg(7) <= delayMatch_reg_next(7);
        delayMatch_reg(8) <= delayMatch_reg_next(8);
        delayMatch_reg(9) <= delayMatch_reg_next(9);
        delayMatch_reg(10) <= delayMatch_reg_next(10);
        delayMatch_reg(11) <= delayMatch_reg_next(11);
        delayMatch_reg(12) <= delayMatch_reg_next(12);
        delayMatch_reg(13) <= delayMatch_reg_next(13);
        delayMatch_reg(14) <= delayMatch_reg_next(14);
        delayMatch_reg(15) <= delayMatch_reg_next(15);
        delayMatch_reg(16) <= delayMatch_reg_next(16);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  i_DATA_VALID_1 <= delayMatch_reg(16);
  delayMatch_reg_next(0) <= i_DATA_VALID;
  delayMatch_reg_next(1) <= delayMatch_reg(0);
  delayMatch_reg_next(2) <= delayMatch_reg(1);
  delayMatch_reg_next(3) <= delayMatch_reg(2);
  delayMatch_reg_next(4) <= delayMatch_reg(3);
  delayMatch_reg_next(5) <= delayMatch_reg(4);
  delayMatch_reg_next(6) <= delayMatch_reg(5);
  delayMatch_reg_next(7) <= delayMatch_reg(6);
  delayMatch_reg_next(8) <= delayMatch_reg(7);
  delayMatch_reg_next(9) <= delayMatch_reg(8);
  delayMatch_reg_next(10) <= delayMatch_reg(9);
  delayMatch_reg_next(11) <= delayMatch_reg(10);
  delayMatch_reg_next(12) <= delayMatch_reg(11);
  delayMatch_reg_next(13) <= delayMatch_reg(12);
  delayMatch_reg_next(14) <= delayMatch_reg(13);
  delayMatch_reg_next(15) <= delayMatch_reg(14);
  delayMatch_reg_next(16) <= delayMatch_reg(15);

  o_LOG2_VALID <= i_DATA_VALID_1;

  
  initcompare <= '1' WHEN initcounter < to_unsigned(16#D#, 4) ELSE
      '0';

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 13
  ctr_0_13_process : PROCESS (i_CLK, i_RSTn)
  BEGIN
    IF i_RSTn = '0' THEN
      initcounter <= to_unsigned(16#0#, 4);
    ELSIF i_CLK'EVENT AND i_CLK = '1' THEN
      IF enb = '1' THEN
        IF initcompare = '1' THEN 
          IF initcounter >= to_unsigned(16#D#, 4) THEN 
            initcounter <= to_unsigned(16#0#, 4);
          ELSE 
            initcounter <= initcounter + to_unsigned(16#1#, 4);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS ctr_0_13_process;


  
  initcompare4 <= '1' WHEN initcounter >= to_unsigned(16#4#, 4) ELSE
      '0';

  Gain1_out1const0 <= X"00000000";

  
  initcompare13 <= '1' WHEN initcounter >= to_unsigned(16#D#, 4) ELSE
      '0';

  Math_Function_out1const0 <= X"00000000";

  enb_1 <= i_VALID;

  i_RSTn_1 <= NOT i_RSTn;

  kconst <= X"3fb8aa3b";

  
  Math_Function_out1 <= Math_Function_out1const0 WHEN initcompare13 = '0' ELSE
      Math_Function_out1ipOut;

  enb_2 <= i_VALID;

  i_RSTn_2 <= NOT i_RSTn;

  
  Gain1_out1 <= Gain1_out1const0 WHEN initcompare4 = '0' ELSE
      Gain1_out1ipOut;

  o_VALID <= i_VALID;

  o_LOG2 <= Gain1_out1;

END rtl;

