-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj_PRT_pred\hdlsrc\LSTM_cell\DirectLUTSubNetwork_block3.vhd
-- Created: 2024-05-08 02:20:48
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: DirectLUTSubNetwork_block3
-- Source Path: DirectLUTSubNetwork
-- Hierarchy Level: 4
-- Model version: 5.46
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LSTM_predictor_pkg.ALL;

ENTITY DirectLUTSubNetwork_block3 IS
  PORT( Q1                                :   IN    vector_of_std_logic_vector5(0 TO 9);  -- ufix5 [10]
        fQ1                               :   OUT   vector_of_std_logic_vector16(0 TO 9)  -- sfix16_En15 [10]
        );
END DirectLUTSubNetwork_block3;


ARCHITECTURE rtl OF DirectLUTSubNetwork_block3 IS

  -- Constants
  CONSTANT DirectLUT_fQ11111_data         : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]
  CONSTANT DirectLUT_fQ11111_data_2       : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]
  CONSTANT DirectLUT_fQ11111_data_4       : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]
  CONSTANT DirectLUT_fQ11111_data_6       : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]
  CONSTANT DirectLUT_fQ11111_data_8       : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]
  CONSTANT DirectLUT_fQ11111_data_10      : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]
  CONSTANT DirectLUT_fQ11111_data_12      : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]
  CONSTANT DirectLUT_fQ11111_data_14      : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]
  CONSTANT DirectLUT_fQ11111_data_16      : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]
  CONSTANT DirectLUT_fQ11111_data_18      : vector_of_signed16(0 TO 100) := 
    (to_signed(-16#7FFD#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFC#, 16), to_signed(-16#7FFB#, 16),
     to_signed(-16#7FF9#, 16), to_signed(-16#7FF8#, 16), to_signed(-16#7FF6#, 16), to_signed(-16#7FF4#, 16),
     to_signed(-16#7FF1#, 16), to_signed(-16#7FEE#, 16), to_signed(-16#7FEA#, 16), to_signed(-16#7FE5#, 16),
     to_signed(-16#7FDF#, 16), to_signed(-16#7FD8#, 16), to_signed(-16#7FCF#, 16), to_signed(-16#7FC4#, 16),
     to_signed(-16#7FB7#, 16), to_signed(-16#7FA7#, 16), to_signed(-16#7F93#, 16), to_signed(-16#7F7B#, 16),
     to_signed(-16#7F5E#, 16), to_signed(-16#7F3A#, 16), to_signed(-16#7F0F#, 16), to_signed(-16#7ED9#, 16),
     to_signed(-16#7E98#, 16), to_signed(-16#7E49#, 16), to_signed(-16#7DE9#, 16), to_signed(-16#7D74#, 16),
     to_signed(-16#7CE5#, 16), to_signed(-16#7C38#, 16), to_signed(-16#7B65#, 16), to_signed(-16#7A66#, 16),
     to_signed(-16#7931#, 16), to_signed(-16#77BB#, 16), to_signed(-16#75F9#, 16), to_signed(-16#73DC#, 16),
     to_signed(-16#7153#, 16), to_signed(-16#6E4D#, 16), to_signed(-16#6AB5#, 16), to_signed(-16#6677#, 16),
     to_signed(-16#617C#, 16), to_signed(-16#5BB0#, 16), to_signed(-16#54FF#, 16), to_signed(-16#4D5C#, 16),
     to_signed(-16#44BE#, 16), to_signed(-16#3B27#, 16), to_signed(-16#30A2#, 16), to_signed(-16#254A#, 16),
     to_signed(-16#1944#, 16), to_signed(-16#0CC2#, 16), to_signed(16#0000#, 16), to_signed(16#0CC2#, 16),
     to_signed(16#1944#, 16), to_signed(16#254A#, 16), to_signed(16#30A2#, 16), to_signed(16#3B27#, 16),
     to_signed(16#44BE#, 16), to_signed(16#4D5C#, 16), to_signed(16#54FF#, 16), to_signed(16#5BB0#, 16),
     to_signed(16#617C#, 16), to_signed(16#6677#, 16), to_signed(16#6AB5#, 16), to_signed(16#6E4D#, 16),
     to_signed(16#7153#, 16), to_signed(16#73DC#, 16), to_signed(16#75F9#, 16), to_signed(16#77BB#, 16),
     to_signed(16#7931#, 16), to_signed(16#7A66#, 16), to_signed(16#7B65#, 16), to_signed(16#7C38#, 16),
     to_signed(16#7CE5#, 16), to_signed(16#7D74#, 16), to_signed(16#7DE9#, 16), to_signed(16#7E49#, 16),
     to_signed(16#7E98#, 16), to_signed(16#7ED9#, 16), to_signed(16#7F0F#, 16), to_signed(16#7F3A#, 16),
     to_signed(16#7F5E#, 16), to_signed(16#7F7B#, 16), to_signed(16#7F93#, 16), to_signed(16#7FA7#, 16),
     to_signed(16#7FB7#, 16), to_signed(16#7FC4#, 16), to_signed(16#7FCF#, 16), to_signed(16#7FD8#, 16),
     to_signed(16#7FDF#, 16), to_signed(16#7FE5#, 16), to_signed(16#7FEA#, 16), to_signed(16#7FEE#, 16),
     to_signed(16#7FF1#, 16), to_signed(16#7FF4#, 16), to_signed(16#7FF6#, 16), to_signed(16#7FF8#, 16),
     to_signed(16#7FF9#, 16), to_signed(16#7FFB#, 16), to_signed(16#7FFC#, 16), to_signed(16#7FFC#, 16),
     to_signed(16#7FFD#, 16));  -- sfix16 [101]

  -- Signals
  SIGNAL Q1_unsigned                      : vector_of_std_logic_vector5(0 TO 9);  -- ufix5 [10]
  SIGNAL Q1_0                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout1      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Q1_1                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout2      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Q1_2                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout3      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Q1_3                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout4      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Q1_4                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout5      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Q1_5                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout6      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Q1_6                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout7      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Q1_7                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout8      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Q1_8                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout9      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Q1_9                             : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL DirectLUT_fQ11111_tableout10     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL fQ1_tmp                          : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]

BEGIN
  Q1_unsigned <= Q1;

  Q1_0 <= unsigned(Q1_unsigned(0));

  DirectLUT_fQ11111_tableout1 <= DirectLUT_fQ11111_data(to_integer(Q1_0));

  Q1_1 <= unsigned(Q1_unsigned(1));

  DirectLUT_fQ11111_tableout2 <= DirectLUT_fQ11111_data_2(to_integer(Q1_1));

  Q1_2 <= unsigned(Q1_unsigned(2));

  DirectLUT_fQ11111_tableout3 <= DirectLUT_fQ11111_data_4(to_integer(Q1_2));

  Q1_3 <= unsigned(Q1_unsigned(3));

  DirectLUT_fQ11111_tableout4 <= DirectLUT_fQ11111_data_6(to_integer(Q1_3));

  Q1_4 <= unsigned(Q1_unsigned(4));

  DirectLUT_fQ11111_tableout5 <= DirectLUT_fQ11111_data_8(to_integer(Q1_4));

  Q1_5 <= unsigned(Q1_unsigned(5));

  DirectLUT_fQ11111_tableout6 <= DirectLUT_fQ11111_data_10(to_integer(Q1_5));

  Q1_6 <= unsigned(Q1_unsigned(6));

  DirectLUT_fQ11111_tableout7 <= DirectLUT_fQ11111_data_12(to_integer(Q1_6));

  Q1_7 <= unsigned(Q1_unsigned(7));

  DirectLUT_fQ11111_tableout8 <= DirectLUT_fQ11111_data_14(to_integer(Q1_7));

  Q1_8 <= unsigned(Q1_unsigned(8));

  DirectLUT_fQ11111_tableout9 <= DirectLUT_fQ11111_data_16(to_integer(Q1_8));

  Q1_9 <= unsigned(Q1_unsigned(9));

  DirectLUT_fQ11111_tableout10 <= DirectLUT_fQ11111_data_18(to_integer(Q1_9));

  fQ1_tmp(0) <= DirectLUT_fQ11111_tableout1;
  fQ1_tmp(1) <= DirectLUT_fQ11111_tableout2;
  fQ1_tmp(2) <= DirectLUT_fQ11111_tableout3;
  fQ1_tmp(3) <= DirectLUT_fQ11111_tableout4;
  fQ1_tmp(4) <= DirectLUT_fQ11111_tableout5;
  fQ1_tmp(5) <= DirectLUT_fQ11111_tableout6;
  fQ1_tmp(6) <= DirectLUT_fQ11111_tableout7;
  fQ1_tmp(7) <= DirectLUT_fQ11111_tableout8;
  fQ1_tmp(8) <= DirectLUT_fQ11111_tableout9;
  fQ1_tmp(9) <= DirectLUT_fQ11111_tableout10;

  outputgen: FOR k IN 0 TO 9 GENERATE
    fQ1(k) <= std_logic_vector(fQ1_tmp(k));
  END GENERATE;

END rtl;

