-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj_PRT_pred\hdlsrc\LSTM_cell\LSTM_predictor_tb.vhd
-- Created: 2024-05-08 02:20:58
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1
-- Target subsystem base rate: 1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LSTM_predictor_tb
-- Source Path: 
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_textio.ALL;
USE IEEE.float_pkg.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY STD;
USE STD.textio.ALL;
LIBRARY work;
USE work.LSTM_predictor_pkg.ALL;
USE work.LSTM_predictor_tb_pkg.ALL;

ENTITY LSTM_predictor_tb IS
END LSTM_predictor_tb;


ARCHITECTURE rtl OF LSTM_predictor_tb IS

  -- Component Declarations
  COMPONENT LSTM_predictor
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          x_t                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          ce_out                          :   OUT   std_logic;
          out_rsvd                        :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LSTM_predictor
    USE ENTITY work.LSTM_predictor(rtl);

  -- Signals
  SIGNAL clk                              : std_logic;
  SIGNAL reset                            : std_logic;
  SIGNAL clk_enable                       : std_logic;
  SIGNAL out_rsvd_done                    : std_logic;  -- ufix1
  SIGNAL rdEnb                            : std_logic;
  SIGNAL out_rsvd_done_enb                : std_logic;  -- ufix1
  SIGNAL out_rsvd_addr                    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL out_rsvd_active                  : std_logic;  -- ufix1
  SIGNAL LSTM_cell_boundary_DTC2_out1_addr : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL LSTM_cell_boundary_DTC2_out1_active : std_logic;  -- ufix1
  SIGNAL tb_enb_delay                     : std_logic;
  SIGNAL LSTM_cell_boundary_DTC2_out1_enb : std_logic;  -- ufix1
  SIGNAL LSTM_cell_boundary_DTC2_out1_addr_delay_1 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL rawData_x_t                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL holdData_x_t                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL x_t_offset                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL x_t                              : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL x_t_1                            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL check1_done                      : std_logic;  -- ufix1
  SIGNAL snkDonen                         : std_logic;
  SIGNAL resetn                           : std_logic;
  SIGNAL tb_enb                           : std_logic;
  SIGNAL ce_out                           : std_logic;
  SIGNAL out_rsvd                         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL out_rsvd_enb                     : std_logic;  -- ufix1
  SIGNAL out_rsvd_lastAddr                : std_logic;  -- ufix1
  SIGNAL out_rsvd_signed                  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL out_rsvd_addr_delay_1            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL out_rsvd_expected                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL out_rsvd_ref                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL out_rsvd_testFailure             : std_logic;  -- ufix1

BEGIN
  u_LSTM_predictor : LSTM_predictor
    PORT MAP( clk => clk,
              reset => reset,
              clk_enable => clk_enable,
              x_t => x_t_1,  -- sfix16_En15
              ce_out => ce_out,
              out_rsvd => out_rsvd  -- sfix16_En15
              );

  out_rsvd_done_enb <= out_rsvd_done AND rdEnb;

  
  out_rsvd_active <= '1' WHEN out_rsvd_addr /= to_unsigned(16#12C#, 9) ELSE
      '0';

  
  LSTM_cell_boundary_DTC2_out1_active <= '1' WHEN LSTM_cell_boundary_DTC2_out1_addr /= to_unsigned(16#12C#, 9) ELSE
      '0';

  LSTM_cell_boundary_DTC2_out1_enb <= LSTM_cell_boundary_DTC2_out1_active AND (rdEnb AND tb_enb_delay);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 300
  LSTM_cell_boundary_DTC2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        LSTM_cell_boundary_DTC2_out1_addr <= to_unsigned(16#000#, 9);
      ELSIF LSTM_cell_boundary_DTC2_out1_enb = '1' THEN
        IF LSTM_cell_boundary_DTC2_out1_addr >= to_unsigned(16#12C#, 9) THEN 
          LSTM_cell_boundary_DTC2_out1_addr <= to_unsigned(16#000#, 9);
        ELSE 
          LSTM_cell_boundary_DTC2_out1_addr <= LSTM_cell_boundary_DTC2_out1_addr + to_unsigned(16#001#, 9);
        END IF;
      END IF;
    END IF;
  END PROCESS LSTM_cell_boundary_DTC2_process;


  LSTM_cell_boundary_DTC2_out1_addr_delay_1 <= LSTM_cell_boundary_DTC2_out1_addr AFTER 1 ns;

  -- Data source for x_t
  x_t_fileread: PROCESS (LSTM_cell_boundary_DTC2_out1_addr_delay_1, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "x_t.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    rawData_x_t <= signed(read_data(15 DOWNTO 0));
  END PROCESS x_t_fileread;

  -- holdData reg for LSTM_cell_boundary_DTC2_out1
  stimuli_LSTM_cell_boundary_DTC2_out1_process: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        holdData_x_t <= (OTHERS => 'X');
      ELSE
        holdData_x_t <= rawData_x_t;
      END IF;
    END IF;
  END PROCESS stimuli_LSTM_cell_boundary_DTC2_out1_process;

  stimuli_LSTM_cell_boundary_DTC2_out1_1: PROCESS (rawData_x_t, rdEnb)
  BEGIN
    IF rdEnb = '0' THEN
      x_t_offset <= holdData_x_t;
    ELSE
      x_t_offset <= rawData_x_t;
    END IF;
  END PROCESS stimuli_LSTM_cell_boundary_DTC2_out1_1;

  x_t <= x_t_offset AFTER 2 ns;

  x_t_1 <= std_logic_vector(x_t);

  snkDonen <=  NOT check1_done;

  resetn <=  NOT reset;

  tb_enb <= resetn AND snkDonen;

  -- Delay inside enable generation: register depth 1
  u_enable_delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        tb_enb_delay <= '0';
      ELSE 
        tb_enb_delay <= tb_enb;
      END IF;
    END IF;
  END PROCESS u_enable_delay_process;


  
  rdEnb <= tb_enb_delay WHEN check1_done = '0' ELSE
      '0';

  clk_enable <= rdEnb AFTER 2 ns;

  reset_gen: PROCESS 
  BEGIN
    reset <= '1';
    WAIT FOR 20 ns;
    WAIT UNTIL clk'event AND clk = '1';
    WAIT FOR 2 ns;
    reset <= '0';
    WAIT;
  END PROCESS reset_gen;

  clk_gen: PROCESS 
  BEGIN
    clk <= '1';
    WAIT FOR 5 ns;
    clk <= '0';
    WAIT FOR 5 ns;
    IF check1_done = '1' THEN
      clk <= '1';
      WAIT FOR 5 ns;
      clk <= '0';
      WAIT FOR 5 ns;
      WAIT;
    END IF;
  END PROCESS clk_gen;

  out_rsvd_enb <= ce_out AND out_rsvd_active;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 300
  c_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        out_rsvd_addr <= to_unsigned(16#000#, 9);
      ELSIF out_rsvd_enb = '1' THEN
        IF out_rsvd_addr >= to_unsigned(16#12C#, 9) THEN 
          out_rsvd_addr <= to_unsigned(16#000#, 9);
        ELSE 
          out_rsvd_addr <= out_rsvd_addr + to_unsigned(16#001#, 9);
        END IF;
      END IF;
    END IF;
  END PROCESS c_3_process;


  
  out_rsvd_lastAddr <= '1' WHEN out_rsvd_addr >= to_unsigned(16#12C#, 9) ELSE
      '0';

  out_rsvd_done <= out_rsvd_lastAddr AND resetn;

  -- Delay to allow last sim cycle to complete
  checkDone_1_process: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        check1_done <= '0';
      ELSIF out_rsvd_done_enb = '1' THEN
        check1_done <= out_rsvd_done;
      END IF;
    END IF;
  END PROCESS checkDone_1_process;

  out_rsvd_signed <= signed(out_rsvd);

  out_rsvd_addr_delay_1 <= out_rsvd_addr AFTER 1 ns;

  -- Data source for out_rsvd_expected
  out_rsvd_expected_fileread: PROCESS (out_rsvd_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "out_rsvd_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    out_rsvd_expected <= signed(read_data(15 DOWNTO 0));
  END PROCESS out_rsvd_expected_fileread;

  out_rsvd_ref <= out_rsvd_expected;

  out_rsvd_signed_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      out_rsvd_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND out_rsvd_signed /= out_rsvd_ref THEN
        out_rsvd_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in out_rsvd_signed: Expected " & to_hex(out_rsvd_ref) & (" Actual " & to_hex(out_rsvd_signed))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS out_rsvd_signed_checker;

  completed_msg: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF check1_done = '1' THEN
        IF out_rsvd_testFailure = '0' THEN
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (PASSED)**************"
            SEVERITY NOTE;
        ELSE
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (FAILED)**************"
            SEVERITY NOTE;
        END IF;
      END IF;
    END IF;
  END PROCESS completed_msg;

END rtl;

