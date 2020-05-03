
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity alterafpf_log_single is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end alterafpf_log_single;

architecture normal of alterafpf_log_single is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 270007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpLogETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid7_fpLogETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllZWF_uid8_fpLogETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstBias_uid10_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasMO_uid11_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllOWE_uid13_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid15_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid17_fpLogETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid18_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid18_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid19_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid19_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid20_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid20_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid21_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid22_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid23_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid24_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid25_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid26_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal e_uid29_fpLogETest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal e_uid29_fpLogETest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal e_uid29_fpLogETest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal e_uid29_fpLogETest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal c_uid31_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addrFull_uid32_fpLogETest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yAddr_uid34_fpLogETest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal zPPolyEval_uid35_fpLogETest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal zPPolyEval_uid35_fpLogETest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal peOR_uid37_fpLogETest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal peOR_uid37_fpLogETest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aPostPad_uid39_fpLogETest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oMz_uid40_fpLogETest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal oMz_uid40_fpLogETest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal oMz_uid40_fpLogETest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal oMz_uid40_fpLogETest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal z2_uid41_fpLogETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sEz_uid42_fpLogETest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal multTermOne_uid44_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal multTermOne_uid44_fpLogETest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal postPEMul_uid45_fpLogETest_a0 : STD_LOGIC_VECTOR (24 downto 0);
    signal postPEMul_uid45_fpLogETest_b0 : STD_LOGIC_VECTOR (25 downto 0);
    signal postPEMul_uid45_fpLogETest_s1 : STD_LOGIC_VECTOR (50 downto 0);
    signal postPEMul_uid45_fpLogETest_reset : std_logic;
    signal postPEMul_uid45_fpLogETest_q : STD_LOGIC_VECTOR (50 downto 0);
    signal wideZero_uid46_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal addTermOne_uid47_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal addTermOne_uid47_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeB_uid48_fpLogETest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal lowRangeB_uid48_fpLogETest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal highBBits_uid49_fpLogETest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal finalSumsumAHighB_uid50_fpLogETest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal finalSumsumAHighB_uid50_fpLogETest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal finalSumsumAHighB_uid50_fpLogETest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal finalSumsumAHighB_uid50_fpLogETest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal finalSum_uid51_fpLogETest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal msbUFinalSum_uid52_fpLogETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal finalSumOneComp_uid54_fpLogETest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal finalSumOneComp_uid54_fpLogETest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal finalSumAbs_uid55_fpLogETest_a : STD_LOGIC_VECTOR (57 downto 0);
    signal finalSumAbs_uid55_fpLogETest_b : STD_LOGIC_VECTOR (57 downto 0);
    signal finalSumAbs_uid55_fpLogETest_o : STD_LOGIC_VECTOR (57 downto 0);
    signal finalSumAbs_uid55_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal cstMSBFinalSumPBias_uid58_fpLogETest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRExt_uid59_fpLogETest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExt_uid59_fpLogETest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExt_uid59_fpLogETest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExt_uid59_fpLogETest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracR_uid60_fpLogETest_in : STD_LOGIC_VECTOR (56 downto 0);
    signal fracR_uid60_fpLogETest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracConc_uid61_fpLogETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal expFracPostRnd_uid63_fpLogETest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracPostRnd_uid63_fpLogETest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracPostRnd_uid63_fpLogETest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracPostRnd_uid63_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal FPOne_uid66_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal excRZero_uid68_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid68_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid69_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfC1_uid70_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid71_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal negNonZero_uid73_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid74_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal notC_uid75_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signTerm2_uid76_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRC1_uid77_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRC11_uid78_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid79_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid80_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRFull_uid81_fpLogETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRFull_uid81_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid82_fpLogETest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid83_fpLogETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid84_fpLogETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid87_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid87_fpLogETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid91_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid91_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal RLn_uid92_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xv0_uid94_eLn2_uid30_fpLogETest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid94_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid95_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal p1_uid96_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal p0_uid97_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_a : STD_LOGIC_VECTOR (39 downto 0);
    signal lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_o : STD_LOGIC_VECTOR (39 downto 0);
    signal lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal lev1_a0_uid101_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal minValueInFormat_uid103_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal paddingX_uid104_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal updatedX_uid105_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal ovf_uid104_eLn2_uid30_fpLogETest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid104_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid104_eLn2_uid30_fpLogETest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid104_eLn2_uid30_fpLogETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid108_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal udf_uid107_eLn2_uid30_fpLogETest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid107_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid107_eLn2_uid30_fpLogETest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid107_eLn2_uid30_fpLogETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid110_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid111_eLn2_uid30_fpLogETest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal sR_uid111_eLn2_uid30_fpLogETest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal sRA0_uid112_eLn2_uid30_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA0_uid112_eLn2_uid30_fpLogETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal os_uid136_lnTables_q : STD_LOGIC_VECTOR (30 downto 0);
    signal os_uid140_lnTables_q : STD_LOGIC_VECTOR (20 downto 0);
    signal yT1_uid148_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rndBit_uid150_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid151_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid153_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid153_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid153_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid153_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid154_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rndBit_uid157_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid158_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal ts2_uid160_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid160_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid160_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid160_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal s2_uid161_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal zs_uid163_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid164_countZ_uid56_fpLogETest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid165_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid166_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal vStage_uid167_countZ_uid56_fpLogETest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal vStage_uid167_countZ_uid56_fpLogETest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal cStage_uid168_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid170_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid170_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid171_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid173_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid176_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid176_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid179_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid182_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid182_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid183_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid185_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid188_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid188_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid191_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid194_countZ_uid56_fpLogETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid194_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid196_countZ_uid56_fpLogETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid197_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid198_countZ_uid56_fpLogETest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal nx_mergedSignalTM_uid202_pT1_uid149_invPolyEval_q : STD_LOGIC_VECTOR (13 downto 0);
    signal topRangeX_mergedSignalTM_uid236_pT1_uid149_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_bottomExtension_uid238_pT1_uid149_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal topRangeY_mergedSignalTM_uid240_pT1_uid149_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid242_pT1_uid149_invPolyEval_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid242_pT1_uid149_invPolyEval_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid242_pT1_uid149_invPolyEval_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid242_pT1_uid149_invPolyEval_reset : std_logic;
    signal sm0_uid242_pT1_uid149_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid243_pT1_uid149_invPolyEval_in : STD_LOGIC_VECTOR (34 downto 0);
    signal osig_uid243_pT1_uid149_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal nx_mergedSignalTM_uid247_pT2_uid156_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal topRangeX_mergedSignalTM_uid287_pT2_uid156_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid295_pT2_uid156_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal aboveLeftY_mergedSignalTM_uid298_pT2_uid156_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid319_pT2_uid156_invPolyEval_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid319_pT2_uid156_invPolyEval_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid319_pT2_uid156_invPolyEval_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid319_pT2_uid156_invPolyEval_reset : std_logic;
    signal sm0_uid319_pT2_uid156_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid320_pT2_uid156_invPolyEval_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid320_pT2_uid156_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid320_pT2_uid156_invPolyEval_s1 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid320_pT2_uid156_invPolyEval_reset : std_logic;
    signal sm0_uid320_pT2_uid156_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeA_uid321_pT2_uid156_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid321_pT2_uid156_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid322_pT2_uid156_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0high_uid323_pT2_uid156_invPolyEval_a : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0high_uid323_pT2_uid156_invPolyEval_b : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0high_uid323_pT2_uid156_invPolyEval_o : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0high_uid323_pT2_uid156_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0_uid324_pT2_uid156_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal osig_uid325_pT2_uid156_invPolyEval_in : STD_LOGIC_VECTOR (34 downto 0);
    signal osig_uid325_pT2_uid156_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage0Idx1Rng16_uid330_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal leftShiftStage0Idx1Rng16_uid330_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal leftShiftStage0Idx1_uid331_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage0Idx2_uid334_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage0Idx3Pad48_uid335_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal leftShiftStage0Idx3Rng48_uid336_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal leftShiftStage0Idx3Rng48_uid336_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal leftShiftStage0Idx3_uid337_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage0_uid339_normVal_uid57_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid339_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage1Idx1Rng4_uid341_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage1Idx1Rng4_uid341_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage1Idx1_uid342_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage1Idx2Rng8_uid344_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (49 downto 0);
    signal leftShiftStage1Idx2Rng8_uid344_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (49 downto 0);
    signal leftShiftStage1Idx2_uid345_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage1Idx3Pad12_uid346_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage1Idx3Rng12_uid347_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (45 downto 0);
    signal leftShiftStage1Idx3Rng12_uid347_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal leftShiftStage1Idx3_uid348_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage1_uid350_normVal_uid57_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid350_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage2Idx1Rng1_uid352_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1Rng1_uid352_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1_uid353_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage2Idx2Rng2_uid355_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx2Rng2_uid355_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx2_uid356_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage2Idx3Rng3_uid358_normVal_uid57_fpLogETest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx3Rng3_uid358_normVal_uid57_fpLogETest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx3_uid359_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal leftShiftStage2_uid361_normVal_uid57_fpLogETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid361_normVal_uid57_fpLogETest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid134_lnTables_lutmem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_ir : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid134_lnTables_lutmem_r : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid135_lnTables_lutmem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_ir : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC0_uid135_lnTables_lutmem_r : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid138_lnTables_lutmem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_ir : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid138_lnTables_lutmem_r : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid139_lnTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid139_lnTables_lutmem_ia : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC1_uid139_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid139_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid139_lnTables_lutmem_ir : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC1_uid139_lnTables_lutmem_r : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid142_lnTables_lutmem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_ir : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid142_lnTables_lutmem_r : STD_LOGIC_VECTOR (12 downto 0);
    signal fracR_uid64_fpLogETest_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracR_uid64_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracR_uid64_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (33 downto 0);
    signal topRangeY_uid289_pT2_uid156_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid289_pT2_uid156_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid184_countZ_uid56_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid184_countZ_uid56_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_vCount_uid185_countZ_uid56_fpLogETest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_vCount_uid179_countZ_uid56_fpLogETest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_vCount_uid173_countZ_uid56_fpLogETest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_vStage_uid167_countZ_uid56_fpLogETest_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist4_vCount_uid165_countZ_uid56_fpLogETest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_excREnc_uid83_fpLogETest_q_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_signRFull_uid81_fpLogETest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_excRZero_uid68_fpLogETest_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_finalSumAbs_uid55_fpLogETest_q_2_q : STD_LOGIC_VECTOR (57 downto 0);
    signal redist10_yAddr_uid34_fpLogETest_b_3_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist11_yAddr_uid34_fpLogETest_b_6_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist12_c_uid31_fpLogETest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_c_uid31_fpLogETest_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_fracXIsZero_uid20_fpLogETest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_frac_x_uid17_fpLogETest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist17_signX_uid7_fpLogETest_b_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_reset0 : std_logic;
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_ia : STD_LOGIC_VECTOR (14 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_iq : STD_LOGIC_VECTOR (14 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_i : signal is true;
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_eq : std_logic;
    attribute preserve of redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_eq : signal is true;
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist9_zPPolyEval_uid35_fpLogETest_b_3_sticky_ena_q : signal is true;
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_mem_reset0 : std_logic;
    signal redist16_frac_x_uid17_fpLogETest_b_8_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_i : signal is true;
    signal redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_eq : std_logic;
    attribute preserve of redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_eq : signal is true;
    signal redist16_frac_x_uid17_fpLogETest_b_8_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist16_frac_x_uid17_fpLogETest_b_8_sticky_ena_q : signal is true;
    signal redist16_frac_x_uid17_fpLogETest_b_8_enaMux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_frac_x_uid17_fpLogETest_b_8_enaMux_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_mem_reset0 : std_logic;
    signal redist18_expX_uid6_fpLogETest_b_10_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist18_expX_uid6_fpLogETest_b_10_rdcnt_i : signal is true;
    signal redist18_expX_uid6_fpLogETest_b_10_rdcnt_eq : std_logic;
    attribute preserve of redist18_expX_uid6_fpLogETest_b_10_rdcnt_eq : signal is true;
    signal redist18_expX_uid6_fpLogETest_b_10_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist18_expX_uid6_fpLogETest_b_10_sticky_ena_q : signal is true;
    signal redist18_expX_uid6_fpLogETest_b_10_enaMux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpLogETest_b_10_enaMux_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- cstBiasMO_uid11_fpLogETest(CONSTANT,10)
    cstBiasMO_uid11_fpLogETest_q <= "01111110";

    -- expX_uid6_fpLogETest(BITSELECT,5)@0
    expX_uid6_fpLogETest_b <= a(30 downto 23);

    -- c_uid31_fpLogETest(LOGICAL,30)@0
    c_uid31_fpLogETest_q <= "1" WHEN expX_uid6_fpLogETest_b = cstBiasMO_uid11_fpLogETest_q ELSE "0";

    -- frac_x_uid17_fpLogETest(BITSELECT,16)@0
    frac_x_uid17_fpLogETest_b <= a(22 downto 0);

    -- addrFull_uid32_fpLogETest(BITJOIN,31)@0
    addrFull_uid32_fpLogETest_q <= c_uid31_fpLogETest_q & frac_x_uid17_fpLogETest_b;

    -- yAddr_uid34_fpLogETest(BITSELECT,33)@0
    yAddr_uid34_fpLogETest_b <= addrFull_uid32_fpLogETest_q(23 downto 15);

    -- memoryC2_uid142_lnTables_lutmem(DUALMEM,366)@0 + 2
    -- in j@20000000
    memoryC2_uid142_lnTables_lutmem_aa <= yAddr_uid34_fpLogETest_b;
    memoryC2_uid142_lnTables_lutmem_reset0 <= areset;
    memoryC2_uid142_lnTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 13,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "alterafpf_log_single_memoryC2_uid142_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC2_uid142_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid142_lnTables_lutmem_aa,
        q_a => memoryC2_uid142_lnTables_lutmem_ir
    );
    memoryC2_uid142_lnTables_lutmem_r <= memoryC2_uid142_lnTables_lutmem_ir(12 downto 0);

    -- topRangeY_bottomExtension_uid238_pT1_uid149_invPolyEval(CONSTANT,237)
    topRangeY_bottomExtension_uid238_pT1_uid149_invPolyEval_q <= "00000";

    -- topRangeY_mergedSignalTM_uid240_pT1_uid149_invPolyEval(BITJOIN,239)@2
    topRangeY_mergedSignalTM_uid240_pT1_uid149_invPolyEval_q <= memoryC2_uid142_lnTables_lutmem_r & topRangeY_bottomExtension_uid238_pT1_uid149_invPolyEval_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- redist15_frac_x_uid17_fpLogETest_b_2(DELAY,390)
    redist15_frac_x_uid17_fpLogETest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_x_uid17_fpLogETest_b, xout => redist15_frac_x_uid17_fpLogETest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- zPPolyEval_uid35_fpLogETest(BITSELECT,34)@2
    zPPolyEval_uid35_fpLogETest_in <= redist15_frac_x_uid17_fpLogETest_b_2_q(14 downto 0);
    zPPolyEval_uid35_fpLogETest_b <= zPPolyEval_uid35_fpLogETest_in(14 downto 0);

    -- yT1_uid148_invPolyEval(BITSELECT,147)@2
    yT1_uid148_invPolyEval_b <= zPPolyEval_uid35_fpLogETest_b(14 downto 2);

    -- nx_mergedSignalTM_uid202_pT1_uid149_invPolyEval(BITJOIN,201)@2
    nx_mergedSignalTM_uid202_pT1_uid149_invPolyEval_q <= GND_q & yT1_uid148_invPolyEval_b;

    -- zs_uid183_countZ_uid56_fpLogETest(CONSTANT,182)
    zs_uid183_countZ_uid56_fpLogETest_q <= "0000";

    -- topRangeX_mergedSignalTM_uid236_pT1_uid149_invPolyEval(BITJOIN,235)@2
    topRangeX_mergedSignalTM_uid236_pT1_uid149_invPolyEval_q <= nx_mergedSignalTM_uid202_pT1_uid149_invPolyEval_q & zs_uid183_countZ_uid56_fpLogETest_q;

    -- sm0_uid242_pT1_uid149_invPolyEval(MULT,241)@2 + 3
    sm0_uid242_pT1_uid149_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid236_pT1_uid149_invPolyEval_q);
    sm0_uid242_pT1_uid149_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid240_pT1_uid149_invPolyEval_q);
    sm0_uid242_pT1_uid149_invPolyEval_reset <= areset;
    sm0_uid242_pT1_uid149_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 3
    )
    PORT MAP (
        dataa => sm0_uid242_pT1_uid149_invPolyEval_a0,
        datab => sm0_uid242_pT1_uid149_invPolyEval_b0,
        clken => en(0),
        aclr => sm0_uid242_pT1_uid149_invPolyEval_reset,
        clock => clk,
        result => sm0_uid242_pT1_uid149_invPolyEval_s1
    );
    sm0_uid242_pT1_uid149_invPolyEval_q <= sm0_uid242_pT1_uid149_invPolyEval_s1;

    -- osig_uid243_pT1_uid149_invPolyEval(BITSELECT,242)@5
    osig_uid243_pT1_uid149_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid242_pT1_uid149_invPolyEval_q(34 downto 0));
    osig_uid243_pT1_uid149_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid243_pT1_uid149_invPolyEval_in(34 downto 20));

    -- redist10_yAddr_uid34_fpLogETest_b_3(DELAY,385)
    redist10_yAddr_uid34_fpLogETest_b_3 : dspba_delay
    GENERIC MAP ( width => 9, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid34_fpLogETest_b, xout => redist10_yAddr_uid34_fpLogETest_b_3_q, ena => en(0), clk => clk, aclr => areset );

    -- memoryC1_uid139_lnTables_lutmem(DUALMEM,365)@3 + 2
    -- in j@20000000
    memoryC1_uid139_lnTables_lutmem_aa <= redist10_yAddr_uid34_fpLogETest_b_3_q;
    memoryC1_uid139_lnTables_lutmem_reset0 <= areset;
    memoryC1_uid139_lnTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 3,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "alterafpf_log_single_memoryC1_uid139_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC1_uid139_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid139_lnTables_lutmem_aa,
        q_a => memoryC1_uid139_lnTables_lutmem_ir
    );
    memoryC1_uid139_lnTables_lutmem_r <= memoryC1_uid139_lnTables_lutmem_ir(2 downto 0);

    -- memoryC1_uid138_lnTables_lutmem(DUALMEM,364)@3 + 2
    -- in j@20000000
    memoryC1_uid138_lnTables_lutmem_aa <= redist10_yAddr_uid34_fpLogETest_b_3_q;
    memoryC1_uid138_lnTables_lutmem_reset0 <= areset;
    memoryC1_uid138_lnTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 18,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "alterafpf_log_single_memoryC1_uid138_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC1_uid138_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid138_lnTables_lutmem_aa,
        q_a => memoryC1_uid138_lnTables_lutmem_ir
    );
    memoryC1_uid138_lnTables_lutmem_r <= memoryC1_uid138_lnTables_lutmem_ir(17 downto 0);

    -- os_uid140_lnTables(BITJOIN,139)@5
    os_uid140_lnTables_q <= memoryC1_uid139_lnTables_lutmem_r & memoryC1_uid138_lnTables_lutmem_r;

    -- rndBit_uid150_invPolyEval(CONSTANT,149)
    rndBit_uid150_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid151_invPolyEval(BITJOIN,150)@5
    cIncludingRoundingBit_uid151_invPolyEval_q <= os_uid140_lnTables_q & rndBit_uid150_invPolyEval_q;

    -- ts1_uid153_invPolyEval(ADD,152)@5
    ts1_uid153_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid151_invPolyEval_q(22)) & cIncludingRoundingBit_uid151_invPolyEval_q));
    ts1_uid153_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 15 => osig_uid243_pT1_uid149_invPolyEval_b(14)) & osig_uid243_pT1_uid149_invPolyEval_b));
    ts1_uid153_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid153_invPolyEval_a) + SIGNED(ts1_uid153_invPolyEval_b));
    ts1_uid153_invPolyEval_q <= ts1_uid153_invPolyEval_o(23 downto 0);

    -- s1_uid154_invPolyEval(BITSELECT,153)@5
    s1_uid154_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid153_invPolyEval_q(23 downto 1));

    -- topRangeY_uid289_pT2_uid156_invPolyEval_merged_bit_select(BITSELECT,369)@5
    topRangeY_uid289_pT2_uid156_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s1_uid154_invPolyEval_b(22 downto 5));
    topRangeY_uid289_pT2_uid156_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s1_uid154_invPolyEval_b(4 downto 0));

    -- paddingX_uid104_eLn2_uid30_fpLogETest(CONSTANT,103)
    paddingX_uid104_eLn2_uid30_fpLogETest_q <= "000";

    -- aboveLeftY_mergedSignalTM_uid298_pT2_uid156_invPolyEval(BITJOIN,297)@5
    aboveLeftY_mergedSignalTM_uid298_pT2_uid156_invPolyEval_q <= topRangeY_uid289_pT2_uid156_invPolyEval_merged_bit_select_c & paddingX_uid104_eLn2_uid30_fpLogETest_q;

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt(COUNTER,395)
    -- low=0, high=2, step=1, init=0
    redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                    redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_eq <= '1';
                ELSE
                    redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_eq <= '0';
                END IF;
                IF (redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_eq = '1') THEN
                    redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_i <= redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_i + 2;
                ELSE
                    redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_i <= redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_i, 2)));

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_wraddr(REG,396)
    redist9_zPPolyEval_uid35_fpLogETest_b_3_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist9_zPPolyEval_uid35_fpLogETest_b_3_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist9_zPPolyEval_uid35_fpLogETest_b_3_wraddr_q <= STD_LOGIC_VECTOR(redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_mem(DUALMEM,394)
    redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_ia <= STD_LOGIC_VECTOR(zPPolyEval_uid35_fpLogETest_b);
    redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_aa <= redist9_zPPolyEval_uid35_fpLogETest_b_3_wraddr_q;
    redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_ab <= redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_q;
    redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 15,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "UNREGISTERED",
        outdata_aclr_b => "NONE",
        clock_enable_output_b => "BYPASS",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => en(0),
        clock0 => clk,
        address_a => redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_aa,
        data_a => redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_ia,
        wren_a => en(0),
        address_b => redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_ab,
        q_b => redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_iq
    );
    redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_q <= redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_iq(14 downto 0);

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_notEnable(LOGICAL,400)
    redist9_zPPolyEval_uid35_fpLogETest_b_3_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_nor(LOGICAL,401)
    redist9_zPPolyEval_uid35_fpLogETest_b_3_nor_q <= not (redist9_zPPolyEval_uid35_fpLogETest_b_3_notEnable_q or redist9_zPPolyEval_uid35_fpLogETest_b_3_sticky_ena_q);

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_last(CONSTANT,397)
    redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_last_q <= "01";

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_cmp(LOGICAL,398)
    redist9_zPPolyEval_uid35_fpLogETest_b_3_cmp_q <= "1" WHEN redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_last_q = redist9_zPPolyEval_uid35_fpLogETest_b_3_rdcnt_q ELSE "0";

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_cmpReg(REG,399)
    redist9_zPPolyEval_uid35_fpLogETest_b_3_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist9_zPPolyEval_uid35_fpLogETest_b_3_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist9_zPPolyEval_uid35_fpLogETest_b_3_cmpReg_q <= STD_LOGIC_VECTOR(redist9_zPPolyEval_uid35_fpLogETest_b_3_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_sticky_ena(REG,402)
    redist9_zPPolyEval_uid35_fpLogETest_b_3_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist9_zPPolyEval_uid35_fpLogETest_b_3_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist9_zPPolyEval_uid35_fpLogETest_b_3_nor_q = "1") THEN
                redist9_zPPolyEval_uid35_fpLogETest_b_3_sticky_ena_q <= STD_LOGIC_VECTOR(redist9_zPPolyEval_uid35_fpLogETest_b_3_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux(MUX,404)
    redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_s <= redist9_zPPolyEval_uid35_fpLogETest_b_3_sticky_ena_q;
    redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_combproc: PROCESS (redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_s, GND_q, redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_q)
    BEGIN
        CASE (redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_s) IS
            WHEN "0" => redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_q <= STD_LOGIC_VECTOR((14 downto 1 => GND_q(0)) & GND_q);
            WHEN "1" => redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_q <= redist9_zPPolyEval_uid35_fpLogETest_b_3_mem_q;
            WHEN OTHERS => redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- nx_mergedSignalTM_uid247_pT2_uid156_invPolyEval(BITJOIN,246)@5
    nx_mergedSignalTM_uid247_pT2_uid156_invPolyEval_q <= GND_q & redist9_zPPolyEval_uid35_fpLogETest_b_3_enaMux_q;

    -- aboveLeftX_uid295_pT2_uid156_invPolyEval(BITSELECT,294)@5
    aboveLeftX_uid295_pT2_uid156_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid247_pT2_uid156_invPolyEval_q(15 downto 7));

    -- sm0_uid320_pT2_uid156_invPolyEval(MULT,319)@5 + 3
    sm0_uid320_pT2_uid156_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid295_pT2_uid156_invPolyEval_b);
    sm0_uid320_pT2_uid156_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid298_pT2_uid156_invPolyEval_q;
    sm0_uid320_pT2_uid156_invPolyEval_reset <= areset;
    sm0_uid320_pT2_uid156_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 9,
        lpm_widthb => 9,
        lpm_widthp => 18,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 3
    )
    PORT MAP (
        dataa => sm0_uid320_pT2_uid156_invPolyEval_a0,
        datab => sm0_uid320_pT2_uid156_invPolyEval_b0,
        clken => en(0),
        aclr => sm0_uid320_pT2_uid156_invPolyEval_reset,
        clock => clk,
        result => sm0_uid320_pT2_uid156_invPolyEval_s1
    );
    sm0_uid320_pT2_uid156_invPolyEval_q <= sm0_uid320_pT2_uid156_invPolyEval_s1(16 downto 0);

    -- z2_uid41_fpLogETest(CONSTANT,40)
    z2_uid41_fpLogETest_q <= "00";

    -- topRangeX_mergedSignalTM_uid287_pT2_uid156_invPolyEval(BITJOIN,286)@5
    topRangeX_mergedSignalTM_uid287_pT2_uid156_invPolyEval_q <= nx_mergedSignalTM_uid247_pT2_uid156_invPolyEval_q & z2_uid41_fpLogETest_q;

    -- sm0_uid319_pT2_uid156_invPolyEval(MULT,318)@5 + 3
    sm0_uid319_pT2_uid156_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid287_pT2_uid156_invPolyEval_q);
    sm0_uid319_pT2_uid156_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid289_pT2_uid156_invPolyEval_merged_bit_select_b);
    sm0_uid319_pT2_uid156_invPolyEval_reset <= areset;
    sm0_uid319_pT2_uid156_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 3
    )
    PORT MAP (
        dataa => sm0_uid319_pT2_uid156_invPolyEval_a0,
        datab => sm0_uid319_pT2_uid156_invPolyEval_b0,
        clken => en(0),
        aclr => sm0_uid319_pT2_uid156_invPolyEval_reset,
        clock => clk,
        result => sm0_uid319_pT2_uid156_invPolyEval_s1
    );
    sm0_uid319_pT2_uid156_invPolyEval_q <= sm0_uid319_pT2_uid156_invPolyEval_s1;

    -- highABits_uid322_pT2_uid156_invPolyEval(BITSELECT,321)@8
    highABits_uid322_pT2_uid156_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid319_pT2_uid156_invPolyEval_q(35 downto 1));

    -- lev1_a0high_uid323_pT2_uid156_invPolyEval(ADD,322)@8
    lev1_a0high_uid323_pT2_uid156_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 35 => highABits_uid322_pT2_uid156_invPolyEval_b(34)) & highABits_uid322_pT2_uid156_invPolyEval_b));
    lev1_a0high_uid323_pT2_uid156_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 17 => sm0_uid320_pT2_uid156_invPolyEval_q(16)) & sm0_uid320_pT2_uid156_invPolyEval_q));
    lev1_a0high_uid323_pT2_uid156_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid323_pT2_uid156_invPolyEval_a) + SIGNED(lev1_a0high_uid323_pT2_uid156_invPolyEval_b));
    lev1_a0high_uid323_pT2_uid156_invPolyEval_q <= lev1_a0high_uid323_pT2_uid156_invPolyEval_o(35 downto 0);

    -- lowRangeA_uid321_pT2_uid156_invPolyEval(BITSELECT,320)@8
    lowRangeA_uid321_pT2_uid156_invPolyEval_in <= sm0_uid319_pT2_uid156_invPolyEval_q(0 downto 0);
    lowRangeA_uid321_pT2_uid156_invPolyEval_b <= lowRangeA_uid321_pT2_uid156_invPolyEval_in(0 downto 0);

    -- lev1_a0_uid324_pT2_uid156_invPolyEval(BITJOIN,323)@8
    lev1_a0_uid324_pT2_uid156_invPolyEval_q <= lev1_a0high_uid323_pT2_uid156_invPolyEval_q & lowRangeA_uid321_pT2_uid156_invPolyEval_b;

    -- osig_uid325_pT2_uid156_invPolyEval(BITSELECT,324)@8
    osig_uid325_pT2_uid156_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid324_pT2_uid156_invPolyEval_q(34 downto 0));
    osig_uid325_pT2_uid156_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid325_pT2_uid156_invPolyEval_in(34 downto 10));

    -- redist11_yAddr_uid34_fpLogETest_b_6(DELAY,386)
    redist11_yAddr_uid34_fpLogETest_b_6 : dspba_delay
    GENERIC MAP ( width => 9, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist10_yAddr_uid34_fpLogETest_b_3_q, xout => redist11_yAddr_uid34_fpLogETest_b_6_q, ena => en(0), clk => clk, aclr => areset );

    -- memoryC0_uid135_lnTables_lutmem(DUALMEM,363)@6 + 2
    -- in j@20000000
    memoryC0_uid135_lnTables_lutmem_aa <= redist11_yAddr_uid34_fpLogETest_b_6_q;
    memoryC0_uid135_lnTables_lutmem_reset0 <= areset;
    memoryC0_uid135_lnTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 13,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "alterafpf_log_single_memoryC0_uid135_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC0_uid135_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid135_lnTables_lutmem_aa,
        q_a => memoryC0_uid135_lnTables_lutmem_ir
    );
    memoryC0_uid135_lnTables_lutmem_r <= memoryC0_uid135_lnTables_lutmem_ir(12 downto 0);

    -- memoryC0_uid134_lnTables_lutmem(DUALMEM,362)@6 + 2
    -- in j@20000000
    memoryC0_uid134_lnTables_lutmem_aa <= redist11_yAddr_uid34_fpLogETest_b_6_q;
    memoryC0_uid134_lnTables_lutmem_reset0 <= areset;
    memoryC0_uid134_lnTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 18,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "alterafpf_log_single_memoryC0_uid134_lnTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => en(0),
        aclr0 => memoryC0_uid134_lnTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid134_lnTables_lutmem_aa,
        q_a => memoryC0_uid134_lnTables_lutmem_ir
    );
    memoryC0_uid134_lnTables_lutmem_r <= memoryC0_uid134_lnTables_lutmem_ir(17 downto 0);

    -- os_uid136_lnTables(BITJOIN,135)@8
    os_uid136_lnTables_q <= memoryC0_uid135_lnTables_lutmem_r & memoryC0_uid134_lnTables_lutmem_r;

    -- rndBit_uid157_invPolyEval(CONSTANT,156)
    rndBit_uid157_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid158_invPolyEval(BITJOIN,157)@8
    cIncludingRoundingBit_uid158_invPolyEval_q <= os_uid136_lnTables_q & rndBit_uid157_invPolyEval_q;

    -- ts2_uid160_invPolyEval(ADD,159)@8
    ts2_uid160_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => cIncludingRoundingBit_uid158_invPolyEval_q(33)) & cIncludingRoundingBit_uid158_invPolyEval_q));
    ts2_uid160_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 25 => osig_uid325_pT2_uid156_invPolyEval_b(24)) & osig_uid325_pT2_uid156_invPolyEval_b));
    ts2_uid160_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid160_invPolyEval_a) + SIGNED(ts2_uid160_invPolyEval_b));
    ts2_uid160_invPolyEval_q <= ts2_uid160_invPolyEval_o(34 downto 0);

    -- s2_uid161_invPolyEval(BITSELECT,160)@8
    s2_uid161_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid160_invPolyEval_q(34 downto 1));

    -- peOR_uid37_fpLogETest(BITSELECT,36)@8
    peOR_uid37_fpLogETest_in <= STD_LOGIC_VECTOR(s2_uid161_invPolyEval_b(32 downto 0));
    peOR_uid37_fpLogETest_b <= STD_LOGIC_VECTOR(peOR_uid37_fpLogETest_in(32 downto 7));

    -- redist16_frac_x_uid17_fpLogETest_b_8_rdcnt(COUNTER,407)
    -- low=0, high=4, step=1, init=0
    redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                    redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_eq <= '1';
                ELSE
                    redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_eq <= '0';
                END IF;
                IF (redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_eq = '1') THEN
                    redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_i <= redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_i + 4;
                ELSE
                    redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_i <= redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_i, 3)));

    -- redist16_frac_x_uid17_fpLogETest_b_8_wraddr(REG,408)
    redist16_frac_x_uid17_fpLogETest_b_8_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_frac_x_uid17_fpLogETest_b_8_wraddr_q <= "100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist16_frac_x_uid17_fpLogETest_b_8_wraddr_q <= STD_LOGIC_VECTOR(redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_frac_x_uid17_fpLogETest_b_8_mem(DUALMEM,406)
    redist16_frac_x_uid17_fpLogETest_b_8_mem_ia <= STD_LOGIC_VECTOR(redist15_frac_x_uid17_fpLogETest_b_2_q);
    redist16_frac_x_uid17_fpLogETest_b_8_mem_aa <= redist16_frac_x_uid17_fpLogETest_b_8_wraddr_q;
    redist16_frac_x_uid17_fpLogETest_b_8_mem_ab <= redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_q;
    redist16_frac_x_uid17_fpLogETest_b_8_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "UNREGISTERED",
        outdata_aclr_b => "NONE",
        clock_enable_output_b => "BYPASS",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => en(0),
        clock0 => clk,
        address_a => redist16_frac_x_uid17_fpLogETest_b_8_mem_aa,
        data_a => redist16_frac_x_uid17_fpLogETest_b_8_mem_ia,
        wren_a => en(0),
        address_b => redist16_frac_x_uid17_fpLogETest_b_8_mem_ab,
        q_b => redist16_frac_x_uid17_fpLogETest_b_8_mem_iq
    );
    redist16_frac_x_uid17_fpLogETest_b_8_mem_q <= redist16_frac_x_uid17_fpLogETest_b_8_mem_iq(22 downto 0);

    -- redist16_frac_x_uid17_fpLogETest_b_8_notEnable(LOGICAL,412)
    redist16_frac_x_uid17_fpLogETest_b_8_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist16_frac_x_uid17_fpLogETest_b_8_nor(LOGICAL,413)
    redist16_frac_x_uid17_fpLogETest_b_8_nor_q <= not (redist16_frac_x_uid17_fpLogETest_b_8_notEnable_q or redist16_frac_x_uid17_fpLogETest_b_8_sticky_ena_q);

    -- redist16_frac_x_uid17_fpLogETest_b_8_mem_last(CONSTANT,409)
    redist16_frac_x_uid17_fpLogETest_b_8_mem_last_q <= "011";

    -- redist16_frac_x_uid17_fpLogETest_b_8_cmp(LOGICAL,410)
    redist16_frac_x_uid17_fpLogETest_b_8_cmp_q <= "1" WHEN redist16_frac_x_uid17_fpLogETest_b_8_mem_last_q = redist16_frac_x_uid17_fpLogETest_b_8_rdcnt_q ELSE "0";

    -- redist16_frac_x_uid17_fpLogETest_b_8_cmpReg(REG,411)
    redist16_frac_x_uid17_fpLogETest_b_8_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_frac_x_uid17_fpLogETest_b_8_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist16_frac_x_uid17_fpLogETest_b_8_cmpReg_q <= STD_LOGIC_VECTOR(redist16_frac_x_uid17_fpLogETest_b_8_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_frac_x_uid17_fpLogETest_b_8_sticky_ena(REG,414)
    redist16_frac_x_uid17_fpLogETest_b_8_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_frac_x_uid17_fpLogETest_b_8_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist16_frac_x_uid17_fpLogETest_b_8_nor_q = "1") THEN
                redist16_frac_x_uid17_fpLogETest_b_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist16_frac_x_uid17_fpLogETest_b_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_frac_x_uid17_fpLogETest_b_8_enaMux(MUX,416)
    redist16_frac_x_uid17_fpLogETest_b_8_enaMux_s <= redist16_frac_x_uid17_fpLogETest_b_8_sticky_ena_q;
    redist16_frac_x_uid17_fpLogETest_b_8_enaMux_combproc: PROCESS (redist16_frac_x_uid17_fpLogETest_b_8_enaMux_s, GND_q, redist16_frac_x_uid17_fpLogETest_b_8_mem_q)
    BEGIN
        CASE (redist16_frac_x_uid17_fpLogETest_b_8_enaMux_s) IS
            WHEN "0" => redist16_frac_x_uid17_fpLogETest_b_8_enaMux_q <= STD_LOGIC_VECTOR((22 downto 1 => GND_q(0)) & GND_q);
            WHEN "1" => redist16_frac_x_uid17_fpLogETest_b_8_enaMux_q <= redist16_frac_x_uid17_fpLogETest_b_8_mem_q;
            WHEN OTHERS => redist16_frac_x_uid17_fpLogETest_b_8_enaMux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist16_frac_x_uid17_fpLogETest_b_8_outputreg(DELAY,405)
    redist16_frac_x_uid17_fpLogETest_b_8_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_frac_x_uid17_fpLogETest_b_8_enaMux_q, xout => redist16_frac_x_uid17_fpLogETest_b_8_outputreg_q, ena => en(0), clk => clk, aclr => areset );

    -- cstAllZWF_uid8_fpLogETest(CONSTANT,7)
    cstAllZWF_uid8_fpLogETest_q <= "00000000000000000000000";

    -- aPostPad_uid39_fpLogETest(BITJOIN,38)@8
    aPostPad_uid39_fpLogETest_q <= VCC_q & cstAllZWF_uid8_fpLogETest_q;

    -- oMz_uid40_fpLogETest(SUB,39)@8
    oMz_uid40_fpLogETest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid39_fpLogETest_q);
    oMz_uid40_fpLogETest_b <= STD_LOGIC_VECTOR("00" & redist16_frac_x_uid17_fpLogETest_b_8_outputreg_q);
    oMz_uid40_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMz_uid40_fpLogETest_a) - UNSIGNED(oMz_uid40_fpLogETest_b));
    oMz_uid40_fpLogETest_q <= oMz_uid40_fpLogETest_o(24 downto 0);

    -- sEz_uid42_fpLogETest(BITJOIN,41)@8
    sEz_uid42_fpLogETest_q <= z2_uid41_fpLogETest_q & redist16_frac_x_uid17_fpLogETest_b_8_outputreg_q;

    -- redist12_c_uid31_fpLogETest_q_8(DELAY,387)
    redist12_c_uid31_fpLogETest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => c_uid31_fpLogETest_q, xout => redist12_c_uid31_fpLogETest_q_8_q, ena => en(0), clk => clk, aclr => areset );

    -- multTermOne_uid44_fpLogETest(MUX,43)@8
    multTermOne_uid44_fpLogETest_s <= redist12_c_uid31_fpLogETest_q_8_q;
    multTermOne_uid44_fpLogETest_combproc: PROCESS (multTermOne_uid44_fpLogETest_s, en, sEz_uid42_fpLogETest_q, oMz_uid40_fpLogETest_q)
    BEGIN
        CASE (multTermOne_uid44_fpLogETest_s) IS
            WHEN "0" => multTermOne_uid44_fpLogETest_q <= sEz_uid42_fpLogETest_q;
            WHEN "1" => multTermOne_uid44_fpLogETest_q <= oMz_uid40_fpLogETest_q;
            WHEN OTHERS => multTermOne_uid44_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- postPEMul_uid45_fpLogETest(MULT,44)@8 + 3
    postPEMul_uid45_fpLogETest_a0 <= STD_LOGIC_VECTOR(multTermOne_uid44_fpLogETest_q);
    postPEMul_uid45_fpLogETest_b0 <= STD_LOGIC_VECTOR(peOR_uid37_fpLogETest_b);
    postPEMul_uid45_fpLogETest_reset <= areset;
    postPEMul_uid45_fpLogETest_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 25,
        lpm_widthb => 26,
        lpm_widthp => 51,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 3
    )
    PORT MAP (
        dataa => postPEMul_uid45_fpLogETest_a0,
        datab => postPEMul_uid45_fpLogETest_b0,
        clken => en(0),
        aclr => postPEMul_uid45_fpLogETest_reset,
        clock => clk,
        result => postPEMul_uid45_fpLogETest_s1
    );
    postPEMul_uid45_fpLogETest_q <= postPEMul_uid45_fpLogETest_s1;

    -- highBBits_uid49_fpLogETest(BITSELECT,48)@11
    highBBits_uid49_fpLogETest_b <= STD_LOGIC_VECTOR(postPEMul_uid45_fpLogETest_q(50 downto 21));

    -- wideZero_uid46_fpLogETest(CONSTANT,45)
    wideZero_uid46_fpLogETest_q <= "00000000000000000000000000000000000";

    -- maxValInOutFormat_uid102_eLn2_uid30_fpLogETest(CONSTANT,101)
    maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q <= "01111111111111111111111111111111111";

    -- minValueInFormat_uid103_eLn2_uid30_fpLogETest(CONSTANT,102)
    minValueInFormat_uid103_eLn2_uid30_fpLogETest_q <= "10000000000000000000000000000000000";

    -- cstBias_uid10_fpLogETest(CONSTANT,9)
    cstBias_uid10_fpLogETest_q <= "01111111";

    -- redist18_expX_uid6_fpLogETest_b_10_rdcnt(COUNTER,418)
    -- low=0, high=9, step=1, init=0
    redist18_expX_uid6_fpLogETest_b_10_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist18_expX_uid6_fpLogETest_b_10_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist18_expX_uid6_fpLogETest_b_10_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist18_expX_uid6_fpLogETest_b_10_rdcnt_i = TO_UNSIGNED(8, 4)) THEN
                    redist18_expX_uid6_fpLogETest_b_10_rdcnt_eq <= '1';
                ELSE
                    redist18_expX_uid6_fpLogETest_b_10_rdcnt_eq <= '0';
                END IF;
                IF (redist18_expX_uid6_fpLogETest_b_10_rdcnt_eq = '1') THEN
                    redist18_expX_uid6_fpLogETest_b_10_rdcnt_i <= redist18_expX_uid6_fpLogETest_b_10_rdcnt_i + 7;
                ELSE
                    redist18_expX_uid6_fpLogETest_b_10_rdcnt_i <= redist18_expX_uid6_fpLogETest_b_10_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist18_expX_uid6_fpLogETest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist18_expX_uid6_fpLogETest_b_10_rdcnt_i, 4)));

    -- redist18_expX_uid6_fpLogETest_b_10_wraddr(REG,419)
    redist18_expX_uid6_fpLogETest_b_10_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist18_expX_uid6_fpLogETest_b_10_wraddr_q <= "1001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist18_expX_uid6_fpLogETest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist18_expX_uid6_fpLogETest_b_10_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_expX_uid6_fpLogETest_b_10_mem(DUALMEM,417)
    redist18_expX_uid6_fpLogETest_b_10_mem_ia <= STD_LOGIC_VECTOR(expX_uid6_fpLogETest_b);
    redist18_expX_uid6_fpLogETest_b_10_mem_aa <= redist18_expX_uid6_fpLogETest_b_10_wraddr_q;
    redist18_expX_uid6_fpLogETest_b_10_mem_ab <= redist18_expX_uid6_fpLogETest_b_10_rdcnt_q;
    redist18_expX_uid6_fpLogETest_b_10_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 10,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "UNREGISTERED",
        outdata_aclr_b => "NONE",
        clock_enable_output_b => "BYPASS",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => en(0),
        clock0 => clk,
        address_a => redist18_expX_uid6_fpLogETest_b_10_mem_aa,
        data_a => redist18_expX_uid6_fpLogETest_b_10_mem_ia,
        wren_a => en(0),
        address_b => redist18_expX_uid6_fpLogETest_b_10_mem_ab,
        q_b => redist18_expX_uid6_fpLogETest_b_10_mem_iq
    );
    redist18_expX_uid6_fpLogETest_b_10_mem_q <= redist18_expX_uid6_fpLogETest_b_10_mem_iq(7 downto 0);

    -- redist18_expX_uid6_fpLogETest_b_10_notEnable(LOGICAL,423)
    redist18_expX_uid6_fpLogETest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist18_expX_uid6_fpLogETest_b_10_nor(LOGICAL,424)
    redist18_expX_uid6_fpLogETest_b_10_nor_q <= not (redist18_expX_uid6_fpLogETest_b_10_notEnable_q or redist18_expX_uid6_fpLogETest_b_10_sticky_ena_q);

    -- redist18_expX_uid6_fpLogETest_b_10_mem_last(CONSTANT,420)
    redist18_expX_uid6_fpLogETest_b_10_mem_last_q <= "01000";

    -- redist18_expX_uid6_fpLogETest_b_10_cmp(LOGICAL,421)
    redist18_expX_uid6_fpLogETest_b_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist18_expX_uid6_fpLogETest_b_10_rdcnt_q);
    redist18_expX_uid6_fpLogETest_b_10_cmp_q <= "1" WHEN redist18_expX_uid6_fpLogETest_b_10_mem_last_q = redist18_expX_uid6_fpLogETest_b_10_cmp_b ELSE "0";

    -- redist18_expX_uid6_fpLogETest_b_10_cmpReg(REG,422)
    redist18_expX_uid6_fpLogETest_b_10_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist18_expX_uid6_fpLogETest_b_10_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist18_expX_uid6_fpLogETest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist18_expX_uid6_fpLogETest_b_10_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_expX_uid6_fpLogETest_b_10_sticky_ena(REG,425)
    redist18_expX_uid6_fpLogETest_b_10_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist18_expX_uid6_fpLogETest_b_10_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist18_expX_uid6_fpLogETest_b_10_nor_q = "1") THEN
                redist18_expX_uid6_fpLogETest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist18_expX_uid6_fpLogETest_b_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_expX_uid6_fpLogETest_b_10_enaMux(MUX,427)
    redist18_expX_uid6_fpLogETest_b_10_enaMux_s <= redist18_expX_uid6_fpLogETest_b_10_sticky_ena_q;
    redist18_expX_uid6_fpLogETest_b_10_enaMux_combproc: PROCESS (redist18_expX_uid6_fpLogETest_b_10_enaMux_s, GND_q, redist18_expX_uid6_fpLogETest_b_10_mem_q)
    BEGIN
        CASE (redist18_expX_uid6_fpLogETest_b_10_enaMux_s) IS
            WHEN "0" => redist18_expX_uid6_fpLogETest_b_10_enaMux_q <= STD_LOGIC_VECTOR((7 downto 1 => GND_q(0)) & GND_q);
            WHEN "1" => redist18_expX_uid6_fpLogETest_b_10_enaMux_q <= redist18_expX_uid6_fpLogETest_b_10_mem_q;
            WHEN OTHERS => redist18_expX_uid6_fpLogETest_b_10_enaMux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- e_uid29_fpLogETest(SUB,28)@10
    e_uid29_fpLogETest_a <= STD_LOGIC_VECTOR("0" & redist18_expX_uid6_fpLogETest_b_10_enaMux_q);
    e_uid29_fpLogETest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid10_fpLogETest_q);
    e_uid29_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(e_uid29_fpLogETest_a) - UNSIGNED(e_uid29_fpLogETest_b));
    e_uid29_fpLogETest_q <= e_uid29_fpLogETest_o(8 downto 0);

    -- xv1_uid95_eLn2_uid30_fpLogETest(BITSELECT,94)@10
    xv1_uid95_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(e_uid29_fpLogETest_q(8 downto 6));

    -- p1_uid96_eLn2_uid30_fpLogETest(LOOKUP,95)@10
    p1_uid96_eLn2_uid30_fpLogETest_combproc: PROCESS (xv1_uid95_eLn2_uid30_fpLogETest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (xv1_uid95_eLn2_uid30_fpLogETest_b) IS
            WHEN "000" => p1_uid96_eLn2_uid30_fpLogETest_q <= "00000000000000000000000000000000000010";
            WHEN "001" => p1_uid96_eLn2_uid30_fpLogETest_q <= "00001011000101110010000110000000000010";
            WHEN "010" => p1_uid96_eLn2_uid30_fpLogETest_q <= "00010110001011100100001100000000000010";
            WHEN "011" => p1_uid96_eLn2_uid30_fpLogETest_q <= "00100001010001010110010010000000000010";
            WHEN "100" => p1_uid96_eLn2_uid30_fpLogETest_q <= "11010011101000110111101000000000000010";
            WHEN "101" => p1_uid96_eLn2_uid30_fpLogETest_q <= "11011110101110101001101110000000000010";
            WHEN "110" => p1_uid96_eLn2_uid30_fpLogETest_q <= "11101001110100011011110100000000000010";
            WHEN "111" => p1_uid96_eLn2_uid30_fpLogETest_q <= "11110100111010001101111010000000000010";
            WHEN OTHERS => -- unreachable
                           p1_uid96_eLn2_uid30_fpLogETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest(ADD,99)@10
    lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((39 downto 38 => p1_uid96_eLn2_uid30_fpLogETest_q(37)) & p1_uid96_eLn2_uid30_fpLogETest_q));
    lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_c));
    lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_a) + SIGNED(lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_b));
    lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_q <= lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_o(38 downto 0);

    -- xv0_uid94_eLn2_uid30_fpLogETest(BITSELECT,93)@10
    xv0_uid94_eLn2_uid30_fpLogETest_in <= e_uid29_fpLogETest_q(5 downto 0);
    xv0_uid94_eLn2_uid30_fpLogETest_b <= xv0_uid94_eLn2_uid30_fpLogETest_in(5 downto 0);

    -- p0_uid97_eLn2_uid30_fpLogETest(LOOKUP,96)@10
    p0_uid97_eLn2_uid30_fpLogETest_combproc: PROCESS (xv0_uid94_eLn2_uid30_fpLogETest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (xv0_uid94_eLn2_uid30_fpLogETest_b) IS
            WHEN "000000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00000000000000000000000000000000000";
            WHEN "000001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00000010110001011100100001100000000";
            WHEN "000010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00000101100010111001000011000000000";
            WHEN "000011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00001000010100010101100100100000000";
            WHEN "000100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00001011000101110010000110000000000";
            WHEN "000101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00001101110111001110100111100000000";
            WHEN "000110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00010000101000101011001001000000000";
            WHEN "000111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00010011011010000111101010100000000";
            WHEN "001000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00010110001011100100001100000000000";
            WHEN "001001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00011000111101000000101101100000000";
            WHEN "001010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00011011101110011101001111000000000";
            WHEN "001011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00011110011111111001110000100000000";
            WHEN "001100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00100001010001010110010010000000000";
            WHEN "001101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00100100000010110010110011100000000";
            WHEN "001110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00100110110100001111010101000000000";
            WHEN "001111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00101001100101101011110110100000000";
            WHEN "010000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00101100010111001000011000000000000";
            WHEN "010001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00101111001000100100111001100000000";
            WHEN "010010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00110001111010000001011011000000000";
            WHEN "010011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00110100101011011101111100100000000";
            WHEN "010100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00110111011100111010011110000000000";
            WHEN "010101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00111010001110010110111111100000000";
            WHEN "010110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00111100111111110011100001000000000";
            WHEN "010111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "00111111110001010000000010100000000";
            WHEN "011000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01000010100010101100100100000000000";
            WHEN "011001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01000101010100001001000101100000000";
            WHEN "011010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01001000000101100101100111000000000";
            WHEN "011011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01001010110111000010001000100000000";
            WHEN "011100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01001101101000011110101010000000000";
            WHEN "011101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01010000011001111011001011100000000";
            WHEN "011110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01010011001011010111101101000000000";
            WHEN "011111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01010101111100110100001110100000000";
            WHEN "100000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01011000101110010000110000000000000";
            WHEN "100001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01011011011111101101010001100000000";
            WHEN "100010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01011110010001001001110011000000000";
            WHEN "100011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01100001000010100110010100100000000";
            WHEN "100100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01100011110100000010110110000000000";
            WHEN "100101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01100110100101011111010111100000000";
            WHEN "100110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01101001010110111011111001000000000";
            WHEN "100111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01101100001000011000011010100000000";
            WHEN "101000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01101110111001110100111100000000000";
            WHEN "101001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01110001101011010001011101100000000";
            WHEN "101010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01110100011100101101111111000000000";
            WHEN "101011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01110111001110001010100000100000000";
            WHEN "101100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01111001111111100111000010000000000";
            WHEN "101101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01111100110001000011100011100000000";
            WHEN "101110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "01111111100010100000000101000000000";
            WHEN "101111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10000010010011111100100110100000000";
            WHEN "110000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10000101000101011001001000000000000";
            WHEN "110001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10000111110110110101101001100000000";
            WHEN "110010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10001010101000010010001011000000000";
            WHEN "110011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10001101011001101110101100100000000";
            WHEN "110100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10010000001011001011001110000000000";
            WHEN "110101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10010010111100100111101111100000000";
            WHEN "110110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10010101101110000100010001000000000";
            WHEN "110111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10011000011111100000110010100000000";
            WHEN "111000" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10011011010000111101010100000000000";
            WHEN "111001" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10011110000010011001110101100000000";
            WHEN "111010" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10100000110011110110010111000000000";
            WHEN "111011" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10100011100101010010111000100000000";
            WHEN "111100" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10100110010110101111011010000000000";
            WHEN "111101" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10101001001000001011111011100000000";
            WHEN "111110" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10101011111001101000011101000000000";
            WHEN "111111" => p0_uid97_eLn2_uid30_fpLogETest_q <= "10101110101011000100111110100000000";
            WHEN OTHERS => -- unreachable
                           p0_uid97_eLn2_uid30_fpLogETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select(BITSELECT,368)@10
    lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_b <= p0_uid97_eLn2_uid30_fpLogETest_q(0 downto 0);
    lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_c <= p0_uid97_eLn2_uid30_fpLogETest_q(34 downto 1);

    -- lev1_a0_uid101_eLn2_uid30_fpLogETest(BITJOIN,100)@10
    lev1_a0_uid101_eLn2_uid30_fpLogETest_q <= lev1_a0sumAHighB_uid100_eLn2_uid30_fpLogETest_q & lowRangeB_uid98_eLn2_uid30_fpLogETest_merged_bit_select_b;

    -- sR_uid111_eLn2_uid30_fpLogETest(BITSELECT,110)@10
    sR_uid111_eLn2_uid30_fpLogETest_in <= STD_LOGIC_VECTOR(lev1_a0_uid101_eLn2_uid30_fpLogETest_q(37 downto 0));
    sR_uid111_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(sR_uid111_eLn2_uid30_fpLogETest_in(37 downto 3));

    -- updatedX_uid105_eLn2_uid30_fpLogETest(BITJOIN,104)@10
    updatedX_uid105_eLn2_uid30_fpLogETest_q <= maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q & paddingX_uid104_eLn2_uid30_fpLogETest_q;

    -- ovf_uid104_eLn2_uid30_fpLogETest(COMPARE,105)@10
    ovf_uid104_eLn2_uid30_fpLogETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 38 => updatedX_uid105_eLn2_uid30_fpLogETest_q(37)) & updatedX_uid105_eLn2_uid30_fpLogETest_q));
    ovf_uid104_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => lev1_a0_uid101_eLn2_uid30_fpLogETest_q(39)) & lev1_a0_uid101_eLn2_uid30_fpLogETest_q));
    ovf_uid104_eLn2_uid30_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid104_eLn2_uid30_fpLogETest_a) - SIGNED(ovf_uid104_eLn2_uid30_fpLogETest_b));
    ovf_uid104_eLn2_uid30_fpLogETest_c(0) <= ovf_uid104_eLn2_uid30_fpLogETest_o(41);

    -- updatedY_uid108_eLn2_uid30_fpLogETest(BITJOIN,107)@10
    updatedY_uid108_eLn2_uid30_fpLogETest_q <= minValueInFormat_uid103_eLn2_uid30_fpLogETest_q & paddingX_uid104_eLn2_uid30_fpLogETest_q;

    -- udf_uid107_eLn2_uid30_fpLogETest(COMPARE,108)@10
    udf_uid107_eLn2_uid30_fpLogETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => lev1_a0_uid101_eLn2_uid30_fpLogETest_q(39)) & lev1_a0_uid101_eLn2_uid30_fpLogETest_q));
    udf_uid107_eLn2_uid30_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 38 => updatedY_uid108_eLn2_uid30_fpLogETest_q(37)) & updatedY_uid108_eLn2_uid30_fpLogETest_q));
    udf_uid107_eLn2_uid30_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid107_eLn2_uid30_fpLogETest_a) - SIGNED(udf_uid107_eLn2_uid30_fpLogETest_b));
    udf_uid107_eLn2_uid30_fpLogETest_c(0) <= udf_uid107_eLn2_uid30_fpLogETest_o(41);

    -- ovfudfcond_uid110_eLn2_uid30_fpLogETest(BITJOIN,109)@10
    ovfudfcond_uid110_eLn2_uid30_fpLogETest_q <= ovf_uid104_eLn2_uid30_fpLogETest_c & udf_uid107_eLn2_uid30_fpLogETest_c;

    -- sRA0_uid112_eLn2_uid30_fpLogETest(MUX,111)@10 + 1
    sRA0_uid112_eLn2_uid30_fpLogETest_s <= ovfudfcond_uid110_eLn2_uid30_fpLogETest_q;
    sRA0_uid112_eLn2_uid30_fpLogETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sRA0_uid112_eLn2_uid30_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (sRA0_uid112_eLn2_uid30_fpLogETest_s) IS
                    WHEN "00" => sRA0_uid112_eLn2_uid30_fpLogETest_q <= sR_uid111_eLn2_uid30_fpLogETest_b;
                    WHEN "01" => sRA0_uid112_eLn2_uid30_fpLogETest_q <= minValueInFormat_uid103_eLn2_uid30_fpLogETest_q;
                    WHEN "10" => sRA0_uid112_eLn2_uid30_fpLogETest_q <= maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q;
                    WHEN "11" => sRA0_uid112_eLn2_uid30_fpLogETest_q <= maxValInOutFormat_uid102_eLn2_uid30_fpLogETest_q;
                    WHEN OTHERS => sRA0_uid112_eLn2_uid30_fpLogETest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- addTermOne_uid47_fpLogETest(MUX,46)@11
    addTermOne_uid47_fpLogETest_s <= redist13_c_uid31_fpLogETest_q_11_q;
    addTermOne_uid47_fpLogETest_combproc: PROCESS (addTermOne_uid47_fpLogETest_s, en, sRA0_uid112_eLn2_uid30_fpLogETest_q, wideZero_uid46_fpLogETest_q)
    BEGIN
        CASE (addTermOne_uid47_fpLogETest_s) IS
            WHEN "0" => addTermOne_uid47_fpLogETest_q <= sRA0_uid112_eLn2_uid30_fpLogETest_q;
            WHEN "1" => addTermOne_uid47_fpLogETest_q <= wideZero_uid46_fpLogETest_q;
            WHEN OTHERS => addTermOne_uid47_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- finalSumsumAHighB_uid50_fpLogETest(ADD,49)@11
    finalSumsumAHighB_uid50_fpLogETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 35 => addTermOne_uid47_fpLogETest_q(34)) & addTermOne_uid47_fpLogETest_q));
    finalSumsumAHighB_uid50_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 30 => highBBits_uid49_fpLogETest_b(29)) & highBBits_uid49_fpLogETest_b));
    finalSumsumAHighB_uid50_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(finalSumsumAHighB_uid50_fpLogETest_a) + SIGNED(finalSumsumAHighB_uid50_fpLogETest_b));
    finalSumsumAHighB_uid50_fpLogETest_q <= finalSumsumAHighB_uid50_fpLogETest_o(35 downto 0);

    -- lowRangeB_uid48_fpLogETest(BITSELECT,47)@11
    lowRangeB_uid48_fpLogETest_in <= postPEMul_uid45_fpLogETest_q(20 downto 0);
    lowRangeB_uid48_fpLogETest_b <= lowRangeB_uid48_fpLogETest_in(20 downto 0);

    -- finalSum_uid51_fpLogETest(BITJOIN,50)@11
    finalSum_uid51_fpLogETest_q <= finalSumsumAHighB_uid50_fpLogETest_q & lowRangeB_uid48_fpLogETest_b;

    -- msbUFinalSum_uid52_fpLogETest(BITSELECT,51)@11
    msbUFinalSum_uid52_fpLogETest_b <= STD_LOGIC_VECTOR(finalSum_uid51_fpLogETest_q(56 downto 56));

    -- notC_uid75_fpLogETest(LOGICAL,74)@11
    notC_uid75_fpLogETest_q <= not (redist13_c_uid31_fpLogETest_q_11_q);

    -- signTerm2_uid76_fpLogETest(LOGICAL,75)@11
    signTerm2_uid76_fpLogETest_q <= notC_uid75_fpLogETest_q and msbUFinalSum_uid52_fpLogETest_b;

    -- redist13_c_uid31_fpLogETest_q_11(DELAY,388)
    redist13_c_uid31_fpLogETest_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist12_c_uid31_fpLogETest_q_8_q, xout => redist13_c_uid31_fpLogETest_q_11_q, ena => en(0), clk => clk, aclr => areset );

    -- signRC1_uid77_fpLogETest(LOGICAL,76)@11
    signRC1_uid77_fpLogETest_q <= redist13_c_uid31_fpLogETest_q_11_q or signTerm2_uid76_fpLogETest_q;

    -- cstAllOWE_uid13_fpLogETest(CONSTANT,12)
    cstAllOWE_uid13_fpLogETest_q <= "11111111";

    -- expXIsMax_uid19_fpLogETest(LOGICAL,18)@10 + 1
    expXIsMax_uid19_fpLogETest_qi <= "1" WHEN redist18_expX_uid6_fpLogETest_b_10_enaMux_q = cstAllOWE_uid13_fpLogETest_q ELSE "0";
    expXIsMax_uid19_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid19_fpLogETest_qi, xout => expXIsMax_uid19_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- invExpXIsMax_uid24_fpLogETest(LOGICAL,23)@11
    invExpXIsMax_uid24_fpLogETest_q <= not (expXIsMax_uid19_fpLogETest_q);

    -- InvExpXIsZero_uid25_fpLogETest(LOGICAL,24)@11
    InvExpXIsZero_uid25_fpLogETest_q <= not (excZ_x_uid18_fpLogETest_q);

    -- excR_x_uid26_fpLogETest(LOGICAL,25)@11
    excR_x_uid26_fpLogETest_q <= InvExpXIsZero_uid25_fpLogETest_q and invExpXIsMax_uid24_fpLogETest_q;

    -- signRC11_uid78_fpLogETest(LOGICAL,77)@11
    signRC11_uid78_fpLogETest_q <= excR_x_uid26_fpLogETest_q and signRC1_uid77_fpLogETest_q;

    -- cstAllZWE_uid15_fpLogETest(CONSTANT,14)
    cstAllZWE_uid15_fpLogETest_q <= "00000000";

    -- excZ_x_uid18_fpLogETest(LOGICAL,17)@10 + 1
    excZ_x_uid18_fpLogETest_qi <= "1" WHEN redist18_expX_uid6_fpLogETest_b_10_enaMux_q = cstAllZWE_uid15_fpLogETest_q ELSE "0";
    excZ_x_uid18_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid18_fpLogETest_qi, xout => excZ_x_uid18_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- signR_uid79_fpLogETest(LOGICAL,78)@11
    signR_uid79_fpLogETest_q <= excZ_x_uid18_fpLogETest_q or signRC11_uid78_fpLogETest_q;

    -- fracXIsZero_uid20_fpLogETest(LOGICAL,19)@8 + 1
    fracXIsZero_uid20_fpLogETest_qi <= "1" WHEN cstAllZWF_uid8_fpLogETest_q = redist16_frac_x_uid17_fpLogETest_b_8_outputreg_q ELSE "0";
    fracXIsZero_uid20_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid20_fpLogETest_qi, xout => fracXIsZero_uid20_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist14_fracXIsZero_uid20_fpLogETest_q_3(DELAY,389)
    redist14_fracXIsZero_uid20_fpLogETest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid20_fpLogETest_q, xout => redist14_fracXIsZero_uid20_fpLogETest_q_3_q, ena => en(0), clk => clk, aclr => areset );

    -- fracXIsNotZero_uid21_fpLogETest(LOGICAL,20)@11
    fracXIsNotZero_uid21_fpLogETest_q <= not (redist14_fracXIsZero_uid20_fpLogETest_q_3_q);

    -- excN_x_uid23_fpLogETest(LOGICAL,22)@11
    excN_x_uid23_fpLogETest_q <= expXIsMax_uid19_fpLogETest_q and fracXIsNotZero_uid21_fpLogETest_q;

    -- signX_uid7_fpLogETest(BITSELECT,6)@0
    signX_uid7_fpLogETest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist17_signX_uid7_fpLogETest_b_11(DELAY,392)
    redist17_signX_uid7_fpLogETest_b_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid7_fpLogETest_b, xout => redist17_signX_uid7_fpLogETest_b_11_q, ena => en(0), clk => clk, aclr => areset );

    -- negNonZero_uid73_fpLogETest(LOGICAL,72)@11
    negNonZero_uid73_fpLogETest_q <= InvExpXIsZero_uid25_fpLogETest_q and redist17_signX_uid7_fpLogETest_b_11_q;

    -- excRNaN_uid74_fpLogETest(LOGICAL,73)@11
    excRNaN_uid74_fpLogETest_q <= negNonZero_uid73_fpLogETest_q or excN_x_uid23_fpLogETest_q;

    -- invExcRNaN_uid80_fpLogETest(LOGICAL,79)@11
    invExcRNaN_uid80_fpLogETest_q <= not (excRNaN_uid74_fpLogETest_q);

    -- signRFull_uid81_fpLogETest(LOGICAL,80)@11 + 1
    signRFull_uid81_fpLogETest_qi <= invExcRNaN_uid80_fpLogETest_q and signR_uid79_fpLogETest_q;
    signRFull_uid81_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRFull_uid81_fpLogETest_qi, xout => signRFull_uid81_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist6_signRFull_uid81_fpLogETest_q_2(DELAY,381)
    redist6_signRFull_uid81_fpLogETest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRFull_uid81_fpLogETest_q, xout => redist6_signRFull_uid81_fpLogETest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- zs_uid163_countZ_uid56_fpLogETest(CONSTANT,162)
    zs_uid163_countZ_uid56_fpLogETest_q <= "00000000000000000000000000000000";

    -- finalSumOneComp_uid54_fpLogETest(LOGICAL,53)@11
    finalSumOneComp_uid54_fpLogETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((56 downto 1 => msbUFinalSum_uid52_fpLogETest_b(0)) & msbUFinalSum_uid52_fpLogETest_b));
    finalSumOneComp_uid54_fpLogETest_q <= finalSum_uid51_fpLogETest_q xor finalSumOneComp_uid54_fpLogETest_b;

    -- finalSumAbs_uid55_fpLogETest(ADD,54)@11 + 1
    finalSumAbs_uid55_fpLogETest_a <= STD_LOGIC_VECTOR("0" & finalSumOneComp_uid54_fpLogETest_q);
    finalSumAbs_uid55_fpLogETest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000" & msbUFinalSum_uid52_fpLogETest_b);
    finalSumAbs_uid55_fpLogETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            finalSumAbs_uid55_fpLogETest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                finalSumAbs_uid55_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(finalSumAbs_uid55_fpLogETest_a) + UNSIGNED(finalSumAbs_uid55_fpLogETest_b));
            END IF;
        END IF;
    END PROCESS;
    finalSumAbs_uid55_fpLogETest_q <= finalSumAbs_uid55_fpLogETest_o(57 downto 0);

    -- rVStage_uid164_countZ_uid56_fpLogETest(BITSELECT,163)@12
    rVStage_uid164_countZ_uid56_fpLogETest_b <= finalSumAbs_uid55_fpLogETest_q(57 downto 26);

    -- vCount_uid165_countZ_uid56_fpLogETest(LOGICAL,164)@12
    vCount_uid165_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid164_countZ_uid56_fpLogETest_b = zs_uid163_countZ_uid56_fpLogETest_q ELSE "0";

    -- redist4_vCount_uid165_countZ_uid56_fpLogETest_q_1(DELAY,379)
    redist4_vCount_uid165_countZ_uid56_fpLogETest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid165_countZ_uid56_fpLogETest_q, xout => redist4_vCount_uid165_countZ_uid56_fpLogETest_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- zs_uid171_countZ_uid56_fpLogETest(CONSTANT,170)
    zs_uid171_countZ_uid56_fpLogETest_q <= "0000000000000000";

    -- vStage_uid167_countZ_uid56_fpLogETest(BITSELECT,166)@12
    vStage_uid167_countZ_uid56_fpLogETest_in <= finalSumAbs_uid55_fpLogETest_q(25 downto 0);
    vStage_uid167_countZ_uid56_fpLogETest_b <= vStage_uid167_countZ_uid56_fpLogETest_in(25 downto 0);

    -- mO_uid166_countZ_uid56_fpLogETest(CONSTANT,165)
    mO_uid166_countZ_uid56_fpLogETest_q <= "111111";

    -- cStage_uid168_countZ_uid56_fpLogETest(BITJOIN,167)@12
    cStage_uid168_countZ_uid56_fpLogETest_q <= vStage_uid167_countZ_uid56_fpLogETest_b & mO_uid166_countZ_uid56_fpLogETest_q;

    -- vStagei_uid170_countZ_uid56_fpLogETest(MUX,169)@12
    vStagei_uid170_countZ_uid56_fpLogETest_s <= vCount_uid165_countZ_uid56_fpLogETest_q;
    vStagei_uid170_countZ_uid56_fpLogETest_combproc: PROCESS (vStagei_uid170_countZ_uid56_fpLogETest_s, en, rVStage_uid164_countZ_uid56_fpLogETest_b, cStage_uid168_countZ_uid56_fpLogETest_q)
    BEGIN
        CASE (vStagei_uid170_countZ_uid56_fpLogETest_s) IS
            WHEN "0" => vStagei_uid170_countZ_uid56_fpLogETest_q <= rVStage_uid164_countZ_uid56_fpLogETest_b;
            WHEN "1" => vStagei_uid170_countZ_uid56_fpLogETest_q <= cStage_uid168_countZ_uid56_fpLogETest_q;
            WHEN OTHERS => vStagei_uid170_countZ_uid56_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select(BITSELECT,370)@12
    rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select_b <= vStagei_uid170_countZ_uid56_fpLogETest_q(31 downto 16);
    rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select_c <= vStagei_uid170_countZ_uid56_fpLogETest_q(15 downto 0);

    -- vCount_uid173_countZ_uid56_fpLogETest(LOGICAL,172)@12
    vCount_uid173_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select_b = zs_uid171_countZ_uid56_fpLogETest_q ELSE "0";

    -- redist2_vCount_uid173_countZ_uid56_fpLogETest_q_1(DELAY,377)
    redist2_vCount_uid173_countZ_uid56_fpLogETest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid173_countZ_uid56_fpLogETest_q, xout => redist2_vCount_uid173_countZ_uid56_fpLogETest_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid176_countZ_uid56_fpLogETest(MUX,175)@12
    vStagei_uid176_countZ_uid56_fpLogETest_s <= vCount_uid173_countZ_uid56_fpLogETest_q;
    vStagei_uid176_countZ_uid56_fpLogETest_combproc: PROCESS (vStagei_uid176_countZ_uid56_fpLogETest_s, en, rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select_b, rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid176_countZ_uid56_fpLogETest_s) IS
            WHEN "0" => vStagei_uid176_countZ_uid56_fpLogETest_q <= rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select_b;
            WHEN "1" => vStagei_uid176_countZ_uid56_fpLogETest_q <= rVStage_uid172_countZ_uid56_fpLogETest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid176_countZ_uid56_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select(BITSELECT,371)@12
    rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select_b <= vStagei_uid176_countZ_uid56_fpLogETest_q(15 downto 8);
    rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select_c <= vStagei_uid176_countZ_uid56_fpLogETest_q(7 downto 0);

    -- vCount_uid179_countZ_uid56_fpLogETest(LOGICAL,178)@12
    vCount_uid179_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select_b = cstAllZWE_uid15_fpLogETest_q ELSE "0";

    -- redist1_vCount_uid179_countZ_uid56_fpLogETest_q_1(DELAY,376)
    redist1_vCount_uid179_countZ_uid56_fpLogETest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid179_countZ_uid56_fpLogETest_q, xout => redist1_vCount_uid179_countZ_uid56_fpLogETest_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid182_countZ_uid56_fpLogETest(MUX,181)@12
    vStagei_uid182_countZ_uid56_fpLogETest_s <= vCount_uid179_countZ_uid56_fpLogETest_q;
    vStagei_uid182_countZ_uid56_fpLogETest_combproc: PROCESS (vStagei_uid182_countZ_uid56_fpLogETest_s, en, rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select_b, rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid182_countZ_uid56_fpLogETest_s) IS
            WHEN "0" => vStagei_uid182_countZ_uid56_fpLogETest_q <= rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select_b;
            WHEN "1" => vStagei_uid182_countZ_uid56_fpLogETest_q <= rVStage_uid178_countZ_uid56_fpLogETest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid182_countZ_uid56_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid184_countZ_uid56_fpLogETest_merged_bit_select(BITSELECT,372)@12
    rVStage_uid184_countZ_uid56_fpLogETest_merged_bit_select_b <= vStagei_uid182_countZ_uid56_fpLogETest_q(7 downto 4);
    rVStage_uid184_countZ_uid56_fpLogETest_merged_bit_select_c <= vStagei_uid182_countZ_uid56_fpLogETest_q(3 downto 0);

    -- vCount_uid185_countZ_uid56_fpLogETest(LOGICAL,184)@12
    vCount_uid185_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid184_countZ_uid56_fpLogETest_merged_bit_select_b = zs_uid183_countZ_uid56_fpLogETest_q ELSE "0";

    -- redist0_vCount_uid185_countZ_uid56_fpLogETest_q_1(DELAY,375)
    redist0_vCount_uid185_countZ_uid56_fpLogETest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid185_countZ_uid56_fpLogETest_q, xout => redist0_vCount_uid185_countZ_uid56_fpLogETest_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid188_countZ_uid56_fpLogETest(MUX,187)@12 + 1
    vStagei_uid188_countZ_uid56_fpLogETest_s <= vCount_uid185_countZ_uid56_fpLogETest_q;
    vStagei_uid188_countZ_uid56_fpLogETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid188_countZ_uid56_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (vStagei_uid188_countZ_uid56_fpLogETest_s) IS
                    WHEN "0" => vStagei_uid188_countZ_uid56_fpLogETest_q <= rVStage_uid184_countZ_uid56_fpLogETest_merged_bit_select_b;
                    WHEN "1" => vStagei_uid188_countZ_uid56_fpLogETest_q <= rVStage_uid184_countZ_uid56_fpLogETest_merged_bit_select_c;
                    WHEN OTHERS => vStagei_uid188_countZ_uid56_fpLogETest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select(BITSELECT,373)@13
    rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select_b <= vStagei_uid188_countZ_uid56_fpLogETest_q(3 downto 2);
    rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select_c <= vStagei_uid188_countZ_uid56_fpLogETest_q(1 downto 0);

    -- vCount_uid191_countZ_uid56_fpLogETest(LOGICAL,190)@13
    vCount_uid191_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select_b = z2_uid41_fpLogETest_q ELSE "0";

    -- vStagei_uid194_countZ_uid56_fpLogETest(MUX,193)@13
    vStagei_uid194_countZ_uid56_fpLogETest_s <= vCount_uid191_countZ_uid56_fpLogETest_q;
    vStagei_uid194_countZ_uid56_fpLogETest_combproc: PROCESS (vStagei_uid194_countZ_uid56_fpLogETest_s, en, rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select_b, rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid194_countZ_uid56_fpLogETest_s) IS
            WHEN "0" => vStagei_uid194_countZ_uid56_fpLogETest_q <= rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select_b;
            WHEN "1" => vStagei_uid194_countZ_uid56_fpLogETest_q <= rVStage_uid190_countZ_uid56_fpLogETest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid194_countZ_uid56_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid196_countZ_uid56_fpLogETest(BITSELECT,195)@13
    rVStage_uid196_countZ_uid56_fpLogETest_b <= vStagei_uid194_countZ_uid56_fpLogETest_q(1 downto 1);

    -- vCount_uid197_countZ_uid56_fpLogETest(LOGICAL,196)@13
    vCount_uid197_countZ_uid56_fpLogETest_q <= "1" WHEN rVStage_uid196_countZ_uid56_fpLogETest_b = GND_q ELSE "0";

    -- r_uid198_countZ_uid56_fpLogETest(BITJOIN,197)@13
    r_uid198_countZ_uid56_fpLogETest_q <= redist4_vCount_uid165_countZ_uid56_fpLogETest_q_1_q & redist2_vCount_uid173_countZ_uid56_fpLogETest_q_1_q & redist1_vCount_uid179_countZ_uid56_fpLogETest_q_1_q & redist0_vCount_uid185_countZ_uid56_fpLogETest_q_1_q & vCount_uid191_countZ_uid56_fpLogETest_q & vCount_uid197_countZ_uid56_fpLogETest_q;

    -- cstMSBFinalSumPBias_uid58_fpLogETest(CONSTANT,57)
    cstMSBFinalSumPBias_uid58_fpLogETest_q <= "010001001";

    -- expRExt_uid59_fpLogETest(SUB,58)@13
    expRExt_uid59_fpLogETest_a <= STD_LOGIC_VECTOR("0" & cstMSBFinalSumPBias_uid58_fpLogETest_q);
    expRExt_uid59_fpLogETest_b <= STD_LOGIC_VECTOR("0000" & r_uid198_countZ_uid56_fpLogETest_q);
    expRExt_uid59_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExt_uid59_fpLogETest_a) - UNSIGNED(expRExt_uid59_fpLogETest_b));
    expRExt_uid59_fpLogETest_q <= expRExt_uid59_fpLogETest_o(9 downto 0);

    -- leftShiftStage2Idx3Rng3_uid358_normVal_uid57_fpLogETest(BITSELECT,357)@13
    leftShiftStage2Idx3Rng3_uid358_normVal_uid57_fpLogETest_in <= leftShiftStage1_uid350_normVal_uid57_fpLogETest_q(54 downto 0);
    leftShiftStage2Idx3Rng3_uid358_normVal_uid57_fpLogETest_b <= leftShiftStage2Idx3Rng3_uid358_normVal_uid57_fpLogETest_in(54 downto 0);

    -- leftShiftStage2Idx3_uid359_normVal_uid57_fpLogETest(BITJOIN,358)@13
    leftShiftStage2Idx3_uid359_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx3Rng3_uid358_normVal_uid57_fpLogETest_b & paddingX_uid104_eLn2_uid30_fpLogETest_q;

    -- leftShiftStage2Idx2Rng2_uid355_normVal_uid57_fpLogETest(BITSELECT,354)@13
    leftShiftStage2Idx2Rng2_uid355_normVal_uid57_fpLogETest_in <= leftShiftStage1_uid350_normVal_uid57_fpLogETest_q(55 downto 0);
    leftShiftStage2Idx2Rng2_uid355_normVal_uid57_fpLogETest_b <= leftShiftStage2Idx2Rng2_uid355_normVal_uid57_fpLogETest_in(55 downto 0);

    -- leftShiftStage2Idx2_uid356_normVal_uid57_fpLogETest(BITJOIN,355)@13
    leftShiftStage2Idx2_uid356_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx2Rng2_uid355_normVal_uid57_fpLogETest_b & z2_uid41_fpLogETest_q;

    -- leftShiftStage2Idx1Rng1_uid352_normVal_uid57_fpLogETest(BITSELECT,351)@13
    leftShiftStage2Idx1Rng1_uid352_normVal_uid57_fpLogETest_in <= leftShiftStage1_uid350_normVal_uid57_fpLogETest_q(56 downto 0);
    leftShiftStage2Idx1Rng1_uid352_normVal_uid57_fpLogETest_b <= leftShiftStage2Idx1Rng1_uid352_normVal_uid57_fpLogETest_in(56 downto 0);

    -- leftShiftStage2Idx1_uid353_normVal_uid57_fpLogETest(BITJOIN,352)@13
    leftShiftStage2Idx1_uid353_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx1Rng1_uid352_normVal_uid57_fpLogETest_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid347_normVal_uid57_fpLogETest(BITSELECT,346)@13
    leftShiftStage1Idx3Rng12_uid347_normVal_uid57_fpLogETest_in <= leftShiftStage0_uid339_normVal_uid57_fpLogETest_q(45 downto 0);
    leftShiftStage1Idx3Rng12_uid347_normVal_uid57_fpLogETest_b <= leftShiftStage1Idx3Rng12_uid347_normVal_uid57_fpLogETest_in(45 downto 0);

    -- leftShiftStage1Idx3Pad12_uid346_normVal_uid57_fpLogETest(CONSTANT,345)
    leftShiftStage1Idx3Pad12_uid346_normVal_uid57_fpLogETest_q <= "000000000000";

    -- leftShiftStage1Idx3_uid348_normVal_uid57_fpLogETest(BITJOIN,347)@13
    leftShiftStage1Idx3_uid348_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx3Rng12_uid347_normVal_uid57_fpLogETest_b & leftShiftStage1Idx3Pad12_uid346_normVal_uid57_fpLogETest_q;

    -- leftShiftStage1Idx2Rng8_uid344_normVal_uid57_fpLogETest(BITSELECT,343)@13
    leftShiftStage1Idx2Rng8_uid344_normVal_uid57_fpLogETest_in <= leftShiftStage0_uid339_normVal_uid57_fpLogETest_q(49 downto 0);
    leftShiftStage1Idx2Rng8_uid344_normVal_uid57_fpLogETest_b <= leftShiftStage1Idx2Rng8_uid344_normVal_uid57_fpLogETest_in(49 downto 0);

    -- leftShiftStage1Idx2_uid345_normVal_uid57_fpLogETest(BITJOIN,344)@13
    leftShiftStage1Idx2_uid345_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx2Rng8_uid344_normVal_uid57_fpLogETest_b & cstAllZWE_uid15_fpLogETest_q;

    -- leftShiftStage1Idx1Rng4_uid341_normVal_uid57_fpLogETest(BITSELECT,340)@13
    leftShiftStage1Idx1Rng4_uid341_normVal_uid57_fpLogETest_in <= leftShiftStage0_uid339_normVal_uid57_fpLogETest_q(53 downto 0);
    leftShiftStage1Idx1Rng4_uid341_normVal_uid57_fpLogETest_b <= leftShiftStage1Idx1Rng4_uid341_normVal_uid57_fpLogETest_in(53 downto 0);

    -- leftShiftStage1Idx1_uid342_normVal_uid57_fpLogETest(BITJOIN,341)@13
    leftShiftStage1Idx1_uid342_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx1Rng4_uid341_normVal_uid57_fpLogETest_b & zs_uid183_countZ_uid56_fpLogETest_q;

    -- leftShiftStage0Idx3Rng48_uid336_normVal_uid57_fpLogETest(BITSELECT,335)@13
    leftShiftStage0Idx3Rng48_uid336_normVal_uid57_fpLogETest_in <= redist8_finalSumAbs_uid55_fpLogETest_q_2_q(9 downto 0);
    leftShiftStage0Idx3Rng48_uid336_normVal_uid57_fpLogETest_b <= leftShiftStage0Idx3Rng48_uid336_normVal_uid57_fpLogETest_in(9 downto 0);

    -- leftShiftStage0Idx3Pad48_uid335_normVal_uid57_fpLogETest(CONSTANT,334)
    leftShiftStage0Idx3Pad48_uid335_normVal_uid57_fpLogETest_q <= "000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx3_uid337_normVal_uid57_fpLogETest(BITJOIN,336)@13
    leftShiftStage0Idx3_uid337_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx3Rng48_uid336_normVal_uid57_fpLogETest_b & leftShiftStage0Idx3Pad48_uid335_normVal_uid57_fpLogETest_q;

    -- redist3_vStage_uid167_countZ_uid56_fpLogETest_b_1(DELAY,378)
    redist3_vStage_uid167_countZ_uid56_fpLogETest_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid167_countZ_uid56_fpLogETest_b, xout => redist3_vStage_uid167_countZ_uid56_fpLogETest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid334_normVal_uid57_fpLogETest(BITJOIN,333)@13
    leftShiftStage0Idx2_uid334_normVal_uid57_fpLogETest_q <= redist3_vStage_uid167_countZ_uid56_fpLogETest_b_1_q & zs_uid163_countZ_uid56_fpLogETest_q;

    -- leftShiftStage0Idx1Rng16_uid330_normVal_uid57_fpLogETest(BITSELECT,329)@13
    leftShiftStage0Idx1Rng16_uid330_normVal_uid57_fpLogETest_in <= redist8_finalSumAbs_uid55_fpLogETest_q_2_q(41 downto 0);
    leftShiftStage0Idx1Rng16_uid330_normVal_uid57_fpLogETest_b <= leftShiftStage0Idx1Rng16_uid330_normVal_uid57_fpLogETest_in(41 downto 0);

    -- leftShiftStage0Idx1_uid331_normVal_uid57_fpLogETest(BITJOIN,330)@13
    leftShiftStage0Idx1_uid331_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx1Rng16_uid330_normVal_uid57_fpLogETest_b & zs_uid171_countZ_uid56_fpLogETest_q;

    -- redist8_finalSumAbs_uid55_fpLogETest_q_2(DELAY,383)
    redist8_finalSumAbs_uid55_fpLogETest_q_2 : dspba_delay
    GENERIC MAP ( width => 58, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => finalSumAbs_uid55_fpLogETest_q, xout => redist8_finalSumAbs_uid55_fpLogETest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- leftShiftStage0_uid339_normVal_uid57_fpLogETest(MUX,338)@13
    leftShiftStage0_uid339_normVal_uid57_fpLogETest_s <= leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select_b;
    leftShiftStage0_uid339_normVal_uid57_fpLogETest_combproc: PROCESS (leftShiftStage0_uid339_normVal_uid57_fpLogETest_s, en, redist8_finalSumAbs_uid55_fpLogETest_q_2_q, leftShiftStage0Idx1_uid331_normVal_uid57_fpLogETest_q, leftShiftStage0Idx2_uid334_normVal_uid57_fpLogETest_q, leftShiftStage0Idx3_uid337_normVal_uid57_fpLogETest_q)
    BEGIN
        CASE (leftShiftStage0_uid339_normVal_uid57_fpLogETest_s) IS
            WHEN "00" => leftShiftStage0_uid339_normVal_uid57_fpLogETest_q <= redist8_finalSumAbs_uid55_fpLogETest_q_2_q;
            WHEN "01" => leftShiftStage0_uid339_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx1_uid331_normVal_uid57_fpLogETest_q;
            WHEN "10" => leftShiftStage0_uid339_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx2_uid334_normVal_uid57_fpLogETest_q;
            WHEN "11" => leftShiftStage0_uid339_normVal_uid57_fpLogETest_q <= leftShiftStage0Idx3_uid337_normVal_uid57_fpLogETest_q;
            WHEN OTHERS => leftShiftStage0_uid339_normVal_uid57_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid350_normVal_uid57_fpLogETest(MUX,349)@13
    leftShiftStage1_uid350_normVal_uid57_fpLogETest_s <= leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select_c;
    leftShiftStage1_uid350_normVal_uid57_fpLogETest_combproc: PROCESS (leftShiftStage1_uid350_normVal_uid57_fpLogETest_s, en, leftShiftStage0_uid339_normVal_uid57_fpLogETest_q, leftShiftStage1Idx1_uid342_normVal_uid57_fpLogETest_q, leftShiftStage1Idx2_uid345_normVal_uid57_fpLogETest_q, leftShiftStage1Idx3_uid348_normVal_uid57_fpLogETest_q)
    BEGIN
        CASE (leftShiftStage1_uid350_normVal_uid57_fpLogETest_s) IS
            WHEN "00" => leftShiftStage1_uid350_normVal_uid57_fpLogETest_q <= leftShiftStage0_uid339_normVal_uid57_fpLogETest_q;
            WHEN "01" => leftShiftStage1_uid350_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx1_uid342_normVal_uid57_fpLogETest_q;
            WHEN "10" => leftShiftStage1_uid350_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx2_uid345_normVal_uid57_fpLogETest_q;
            WHEN "11" => leftShiftStage1_uid350_normVal_uid57_fpLogETest_q <= leftShiftStage1Idx3_uid348_normVal_uid57_fpLogETest_q;
            WHEN OTHERS => leftShiftStage1_uid350_normVal_uid57_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select(BITSELECT,374)@13
    leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select_b <= r_uid198_countZ_uid56_fpLogETest_q(5 downto 4);
    leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select_c <= r_uid198_countZ_uid56_fpLogETest_q(3 downto 2);
    leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select_d <= r_uid198_countZ_uid56_fpLogETest_q(1 downto 0);

    -- leftShiftStage2_uid361_normVal_uid57_fpLogETest(MUX,360)@13
    leftShiftStage2_uid361_normVal_uid57_fpLogETest_s <= leftShiftStageSel5Dto4_uid338_normVal_uid57_fpLogETest_merged_bit_select_d;
    leftShiftStage2_uid361_normVal_uid57_fpLogETest_combproc: PROCESS (leftShiftStage2_uid361_normVal_uid57_fpLogETest_s, en, leftShiftStage1_uid350_normVal_uid57_fpLogETest_q, leftShiftStage2Idx1_uid353_normVal_uid57_fpLogETest_q, leftShiftStage2Idx2_uid356_normVal_uid57_fpLogETest_q, leftShiftStage2Idx3_uid359_normVal_uid57_fpLogETest_q)
    BEGIN
        CASE (leftShiftStage2_uid361_normVal_uid57_fpLogETest_s) IS
            WHEN "00" => leftShiftStage2_uid361_normVal_uid57_fpLogETest_q <= leftShiftStage1_uid350_normVal_uid57_fpLogETest_q;
            WHEN "01" => leftShiftStage2_uid361_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx1_uid353_normVal_uid57_fpLogETest_q;
            WHEN "10" => leftShiftStage2_uid361_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx2_uid356_normVal_uid57_fpLogETest_q;
            WHEN "11" => leftShiftStage2_uid361_normVal_uid57_fpLogETest_q <= leftShiftStage2Idx3_uid359_normVal_uid57_fpLogETest_q;
            WHEN OTHERS => leftShiftStage2_uid361_normVal_uid57_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracR_uid60_fpLogETest(BITSELECT,59)@13
    fracR_uid60_fpLogETest_in <= leftShiftStage2_uid361_normVal_uid57_fpLogETest_q(56 downto 0);
    fracR_uid60_fpLogETest_b <= fracR_uid60_fpLogETest_in(56 downto 33);

    -- expFracConc_uid61_fpLogETest(BITJOIN,60)@13
    expFracConc_uid61_fpLogETest_q <= expRExt_uid59_fpLogETest_q & fracR_uid60_fpLogETest_b;

    -- expFracPostRnd_uid63_fpLogETest(ADD,62)@13
    expFracPostRnd_uid63_fpLogETest_a <= STD_LOGIC_VECTOR("0" & expFracConc_uid61_fpLogETest_q);
    expFracPostRnd_uid63_fpLogETest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & VCC_q);
    expFracPostRnd_uid63_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRnd_uid63_fpLogETest_a) + UNSIGNED(expFracPostRnd_uid63_fpLogETest_b));
    expFracPostRnd_uid63_fpLogETest_q <= expFracPostRnd_uid63_fpLogETest_o(34 downto 0);

    -- fracR_uid64_fpLogETest_merged_bit_select(BITSELECT,367)@13
    fracR_uid64_fpLogETest_merged_bit_select_in <= expFracPostRnd_uid63_fpLogETest_q(31 downto 0);
    fracR_uid64_fpLogETest_merged_bit_select_b <= fracR_uid64_fpLogETest_merged_bit_select_in(23 downto 1);
    fracR_uid64_fpLogETest_merged_bit_select_c <= fracR_uid64_fpLogETest_merged_bit_select_in(31 downto 24);

    -- invSignX_uid69_fpLogETest(LOGICAL,68)@11
    invSignX_uid69_fpLogETest_q <= not (redist17_signX_uid7_fpLogETest_b_11_q);

    -- excI_x_uid22_fpLogETest(LOGICAL,21)@11
    excI_x_uid22_fpLogETest_q <= expXIsMax_uid19_fpLogETest_q and redist14_fracXIsZero_uid20_fpLogETest_q_3_q;

    -- excRInfC1_uid70_fpLogETest(LOGICAL,69)@11
    excRInfC1_uid70_fpLogETest_q <= excI_x_uid22_fpLogETest_q and invSignX_uid69_fpLogETest_q;

    -- excRInf_uid71_fpLogETest(LOGICAL,70)@11
    excRInf_uid71_fpLogETest_q <= excRInfC1_uid70_fpLogETest_q or excZ_x_uid18_fpLogETest_q;

    -- FPOne_uid66_fpLogETest(BITJOIN,65)@0
    FPOne_uid66_fpLogETest_q <= GND_q & cstBias_uid10_fpLogETest_q & cstAllZWF_uid8_fpLogETest_q;

    -- excRZero_uid68_fpLogETest(LOGICAL,67)@0 + 1
    excRZero_uid68_fpLogETest_qi <= "1" WHEN a = FPOne_uid66_fpLogETest_q ELSE "0";
    excRZero_uid68_fpLogETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid68_fpLogETest_qi, xout => excRZero_uid68_fpLogETest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist7_excRZero_uid68_fpLogETest_q_11(DELAY,382)
    redist7_excRZero_uid68_fpLogETest_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid68_fpLogETest_q, xout => redist7_excRZero_uid68_fpLogETest_q_11_q, ena => en(0), clk => clk, aclr => areset );

    -- concExc_uid82_fpLogETest(BITJOIN,81)@11
    concExc_uid82_fpLogETest_q <= excRNaN_uid74_fpLogETest_q & excRInf_uid71_fpLogETest_q & redist7_excRZero_uid68_fpLogETest_q_11_q;

    -- excREnc_uid83_fpLogETest(LOOKUP,82)@11 + 1
    excREnc_uid83_fpLogETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid83_fpLogETest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (concExc_uid82_fpLogETest_q) IS
                    WHEN "000" => excREnc_uid83_fpLogETest_q <= "01";
                    WHEN "001" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN "010" => excREnc_uid83_fpLogETest_q <= "10";
                    WHEN "011" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN "100" => excREnc_uid83_fpLogETest_q <= "11";
                    WHEN "101" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN "110" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN "111" => excREnc_uid83_fpLogETest_q <= "00";
                    WHEN OTHERS => -- unreachable
                                   excREnc_uid83_fpLogETest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist5_excREnc_uid83_fpLogETest_q_2(DELAY,380)
    redist5_excREnc_uid83_fpLogETest_q_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excREnc_uid83_fpLogETest_q, xout => redist5_excREnc_uid83_fpLogETest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- expRPostExc_uid91_fpLogETest(MUX,90)@13
    expRPostExc_uid91_fpLogETest_s <= redist5_excREnc_uid83_fpLogETest_q_2_q;
    expRPostExc_uid91_fpLogETest_combproc: PROCESS (expRPostExc_uid91_fpLogETest_s, en, cstAllZWE_uid15_fpLogETest_q, fracR_uid64_fpLogETest_merged_bit_select_c, cstAllOWE_uid13_fpLogETest_q)
    BEGIN
        CASE (expRPostExc_uid91_fpLogETest_s) IS
            WHEN "00" => expRPostExc_uid91_fpLogETest_q <= cstAllZWE_uid15_fpLogETest_q;
            WHEN "01" => expRPostExc_uid91_fpLogETest_q <= fracR_uid64_fpLogETest_merged_bit_select_c;
            WHEN "10" => expRPostExc_uid91_fpLogETest_q <= cstAllOWE_uid13_fpLogETest_q;
            WHEN "11" => expRPostExc_uid91_fpLogETest_q <= cstAllOWE_uid13_fpLogETest_q;
            WHEN OTHERS => expRPostExc_uid91_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid84_fpLogETest(CONSTANT,83)
    oneFracRPostExc2_uid84_fpLogETest_q <= "00000000000000000000001";

    -- fracRPostExc_uid87_fpLogETest(MUX,86)@13
    fracRPostExc_uid87_fpLogETest_s <= redist5_excREnc_uid83_fpLogETest_q_2_q;
    fracRPostExc_uid87_fpLogETest_combproc: PROCESS (fracRPostExc_uid87_fpLogETest_s, en, cstAllZWF_uid8_fpLogETest_q, fracR_uid64_fpLogETest_merged_bit_select_b, oneFracRPostExc2_uid84_fpLogETest_q)
    BEGIN
        CASE (fracRPostExc_uid87_fpLogETest_s) IS
            WHEN "00" => fracRPostExc_uid87_fpLogETest_q <= cstAllZWF_uid8_fpLogETest_q;
            WHEN "01" => fracRPostExc_uid87_fpLogETest_q <= fracR_uid64_fpLogETest_merged_bit_select_b;
            WHEN "10" => fracRPostExc_uid87_fpLogETest_q <= cstAllZWF_uid8_fpLogETest_q;
            WHEN "11" => fracRPostExc_uid87_fpLogETest_q <= oneFracRPostExc2_uid84_fpLogETest_q;
            WHEN OTHERS => fracRPostExc_uid87_fpLogETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RLn_uid92_fpLogETest(BITJOIN,91)@13
    RLn_uid92_fpLogETest_q <= redist6_signRFull_uid81_fpLogETest_q_2_q & expRPostExc_uid91_fpLogETest_q & fracRPostExc_uid87_fpLogETest_q;

    -- xOut(GPOUT,4)@13
    q <= RLn_uid92_fpLogETest_q;

END normal;
