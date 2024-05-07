-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj_PRT_pred\hdlsrc\LSTM_cell\lstm_cell_subsystem.vhd
-- Created: 2024-05-08 02:20:48
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: lstm_cell_subsystem
-- Source Path: LSTM_cell/LSTM_predictor/LSTM_layers/lstm_cell_subsystem
-- Hierarchy Level: 2
-- Model version: 5.46
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LSTM_predictor_pkg.ALL;

ENTITY lstm_cell_subsystem IS
  PORT( c_t_1                             :   IN    vector_of_std_logic_vector16(0 TO 9);  -- sfix16_En15 [10]
        h_t_1                             :   IN    vector_of_std_logic_vector16(0 TO 9);  -- sfix16_En15 [10]
        x_t                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        h_t                               :   OUT   vector_of_std_logic_vector16(0 TO 9);  -- sfix16_En15 [10]
        c_t                               :   OUT   vector_of_std_logic_vector16(0 TO 9)  -- sfix16_En15 [10]
        );
END lstm_cell_subsystem;


ARCHITECTURE rtl OF lstm_cell_subsystem IS

  -- Component Declarations
  COMPONENT forget_gate
    PORT( In1                             :   IN    vector_of_std_logic_vector16(0 TO 10);  -- sfix16_En15 [11]
          Out1                            :   OUT   vector_of_std_logic_vector16(0 TO 9)  -- sfix16_En15 [10]
          );
  END COMPONENT;

  COMPONENT input_gate
    PORT( In1                             :   IN    vector_of_std_logic_vector16(0 TO 10);  -- sfix16_En15 [11]
          Out1                            :   OUT   vector_of_std_logic_vector16(0 TO 9)  -- sfix16_En15 [10]
          );
  END COMPONENT;

  COMPONENT cell_gate
    PORT( In1                             :   IN    vector_of_std_logic_vector16(0 TO 10);  -- sfix16_En15 [11]
          Out1                            :   OUT   vector_of_std_logic_vector16(0 TO 9)  -- sfix16_En15 [10]
          );
  END COMPONENT;

  COMPONENT tanh_block
    PORT( In1                             :   IN    vector_of_std_logic_vector16(0 TO 9);  -- sfix16_En15 [10]
          Out1                            :   OUT   vector_of_std_logic_vector16(0 TO 9)  -- sfix16_En15 [10]
          );
  END COMPONENT;

  COMPONENT output_gate
    PORT( In1                             :   IN    vector_of_std_logic_vector16(0 TO 10);  -- sfix16_En15 [11]
          Out1                            :   OUT   vector_of_std_logic_vector16(0 TO 9)  -- sfix16_En15 [10]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : forget_gate
    USE ENTITY work.forget_gate(rtl);

  FOR ALL : input_gate
    USE ENTITY work.input_gate(rtl);

  FOR ALL : cell_gate
    USE ENTITY work.cell_gate(rtl);

  FOR ALL : tanh_block
    USE ENTITY work.tanh_block(rtl);

  FOR ALL : output_gate
    USE ENTITY work.output_gate(rtl);

  -- Signals
  SIGNAL h_t_1_signed                     : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL x_t_signed                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL y_t                              : vector_of_signed16(0 TO 10);  -- sfix16_En15 [11]
  SIGNAL c_t_1_signed                     : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL y_t_1                            : vector_of_std_logic_vector16(0 TO 10);  -- ufix16 [11]
  SIGNAL f_t                              : vector_of_std_logic_vector16(0 TO 9);  -- ufix16 [10]
  SIGNAL f_t_signed                       : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL Product_mul_temp                 : vector_of_signed32(0 TO 9);  -- sfix32_En30 [10]
  SIGNAL Product_out1                     : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL y_t_2                            : vector_of_std_logic_vector16(0 TO 10);  -- ufix16 [11]
  SIGNAL i_t                              : vector_of_std_logic_vector16(0 TO 9);  -- ufix16 [10]
  SIGNAL i_t_signed                       : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL y_t_3                            : vector_of_std_logic_vector16(0 TO 10);  -- ufix16 [11]
  SIGNAL c_t_2                            : vector_of_std_logic_vector16(0 TO 9);  -- ufix16 [10]
  SIGNAL c_t_signed                       : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL Product1_mul_temp                : vector_of_signed32(0 TO 9);  -- sfix32_En30 [10]
  SIGNAL Product1_out1                    : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL Add_out1                         : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL Add_out1_1                       : vector_of_std_logic_vector16(0 TO 9);  -- ufix16 [10]
  SIGNAL tanh_out1                        : vector_of_std_logic_vector16(0 TO 9);  -- ufix16 [10]
  SIGNAL tanh_out1_signed                 : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL y_t_4                            : vector_of_std_logic_vector16(0 TO 10);  -- ufix16 [11]
  SIGNAL o_t                              : vector_of_std_logic_vector16(0 TO 9);  -- ufix16 [10]
  SIGNAL o_t_signed                       : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]
  SIGNAL Product2_mul_temp                : vector_of_signed32(0 TO 9);  -- sfix32_En30 [10]
  SIGNAL Product2_out1                    : vector_of_signed16(0 TO 9);  -- sfix16_En15 [10]

BEGIN
  u_forget_gate : forget_gate
    PORT MAP( In1 => y_t_1,  -- sfix16_En15 [11]
              Out1 => f_t  -- sfix16_En15 [10]
              );

  u_input_gate : input_gate
    PORT MAP( In1 => y_t_2,  -- sfix16_En15 [11]
              Out1 => i_t  -- sfix16_En15 [10]
              );

  u_cell_gate : cell_gate
    PORT MAP( In1 => y_t_3,  -- sfix16_En15 [11]
              Out1 => c_t_2  -- sfix16_En15 [10]
              );

  u_tanh : tanh_block
    PORT MAP( In1 => Add_out1_1,  -- sfix16_En15 [10]
              Out1 => tanh_out1  -- sfix16_En15 [10]
              );

  u_output_gate : output_gate
    PORT MAP( In1 => y_t_4,  -- sfix16_En15 [11]
              Out1 => o_t  -- sfix16_En15 [10]
              );

  outputgen13: FOR k IN 0 TO 9 GENERATE
    h_t_1_signed(k) <= signed(h_t_1(k));
  END GENERATE;

  x_t_signed <= signed(x_t);

  y_t_gen: FOR idx0 IN 0 TO 9 GENERATE
    y_t(idx0) <= h_t_1_signed(idx0);
  END GENERATE;
  y_t(10) <= x_t_signed;

  outputgen12: FOR k IN 0 TO 9 GENERATE
    c_t_1_signed(k) <= signed(c_t_1(k));
  END GENERATE;

  outputgen11: FOR k IN 0 TO 10 GENERATE
    y_t_1(k) <= std_logic_vector(y_t(k));
  END GENERATE;

  outputgen10: FOR k IN 0 TO 9 GENERATE
    f_t_signed(k) <= signed(f_t(k));
  END GENERATE;


  Product_out1_gen: FOR t_0 IN 0 TO 9 GENERATE
    Product_mul_temp(t_0) <= c_t_1_signed(t_0) * f_t_signed(t_0);
    Product_out1(t_0) <= Product_mul_temp(t_0)(30 DOWNTO 15);
  END GENERATE Product_out1_gen;


  outputgen9: FOR k IN 0 TO 10 GENERATE
    y_t_2(k) <= std_logic_vector(y_t(k));
  END GENERATE;

  outputgen8: FOR k IN 0 TO 9 GENERATE
    i_t_signed(k) <= signed(i_t(k));
  END GENERATE;

  outputgen7: FOR k IN 0 TO 10 GENERATE
    y_t_3(k) <= std_logic_vector(y_t(k));
  END GENERATE;

  outputgen6: FOR k IN 0 TO 9 GENERATE
    c_t_signed(k) <= signed(c_t_2(k));
  END GENERATE;


  Product1_out1_gen: FOR t_01 IN 0 TO 9 GENERATE
    Product1_mul_temp(t_01) <= i_t_signed(t_01) * c_t_signed(t_01);
    Product1_out1(t_01) <= Product1_mul_temp(t_01)(30 DOWNTO 15);
  END GENERATE Product1_out1_gen;



  Add_out1_gen: FOR t_02 IN 0 TO 9 GENERATE
    Add_out1(t_02) <= Product_out1(t_02) + Product1_out1(t_02);
  END GENERATE Add_out1_gen;


  outputgen5: FOR k IN 0 TO 9 GENERATE
    Add_out1_1(k) <= std_logic_vector(Add_out1(k));
  END GENERATE;

  outputgen4: FOR k IN 0 TO 9 GENERATE
    tanh_out1_signed(k) <= signed(tanh_out1(k));
  END GENERATE;

  outputgen3: FOR k IN 0 TO 10 GENERATE
    y_t_4(k) <= std_logic_vector(y_t(k));
  END GENERATE;

  outputgen2: FOR k IN 0 TO 9 GENERATE
    o_t_signed(k) <= signed(o_t(k));
  END GENERATE;


  Product2_out1_gen: FOR t_03 IN 0 TO 9 GENERATE
    Product2_mul_temp(t_03) <= tanh_out1_signed(t_03) * o_t_signed(t_03);
    Product2_out1(t_03) <= Product2_mul_temp(t_03)(30 DOWNTO 15) + ('0' & (Product2_mul_temp(t_03)(31) AND (Product2_mul_temp(t_03)(14) OR Product2_mul_temp(t_03)(13) OR Product2_mul_temp(t_03)(12) OR Product2_mul_temp(t_03)(11) OR Product2_mul_temp(t_03)(10) OR Product2_mul_temp(t_03)(9) OR Product2_mul_temp(t_03)(8) OR Product2_mul_temp(t_03)(7) OR Product2_mul_temp(t_03)(6) OR Product2_mul_temp(t_03)(5) OR Product2_mul_temp(t_03)(4) OR Product2_mul_temp(t_03)(3) OR Product2_mul_temp(t_03)(2) OR Product2_mul_temp(t_03)(1) OR Product2_mul_temp(t_03)(0))));
  END GENERATE Product2_out1_gen;


  outputgen1: FOR k IN 0 TO 9 GENERATE
    h_t(k) <= std_logic_vector(Product2_out1(k));
  END GENERATE;

  outputgen: FOR k IN 0 TO 9 GENERATE
    c_t(k) <= std_logic_vector(Add_out1(k));
  END GENERATE;

END rtl;

