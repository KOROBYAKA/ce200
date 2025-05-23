-- VHDL Entity alien_game_lib.register_bank.symbol
--
-- Created:
--          by - cvalzu.UNKNOWN (HTC219-306-SPC)
--          at - 22:21:56  6.04.2025
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY register_bank IS
   PORT( 
      clk        : IN     std_logic;
      frame_done : IN     std_logic;
      pixd_in    : IN     std_logic_vector (23 DOWNTO 0);
      rst_n      : IN     std_logic;
      write      : IN     std_logic;
      xr         : IN     std_logic_vector (7 DOWNTO 0);
      xw         : IN     std_logic_vector (7 DOWNTO 0);
      yr         : IN     std_logic_vector (7 DOWNTO 0);
      yw         : IN     std_logic_vector (7 DOWNTO 0);
      pixd_out   : OUT    std_logic_vector (23 DOWNTO 0);
      w_rdy      : OUT    std_logic  := '1'
   );

-- Declarations

END register_bank ;

--
-- VHDL Architecture alien_game_lib.register_bank.struct
--
-- Created:
--          by - cvalzu.UNKNOWN (HTC219-306-SPC)
--          at - 22:21:56  6.04.2025
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF register_bank IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL color_output : std_logic_vector(23 DOWNTO 0);
   SIGNAL din1         : std_logic;
   SIGNAL din2         : std_logic;
   SIGNAL din3         : std_logic_vector(23 DOWNTO 0);
   SIGNAL din4         : std_logic;
   SIGNAL dout         : std_logic;
   SIGNAL dout1        : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout2        : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout3        : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout4        : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout5        : std_logic;
   SIGNAL dout6        : std_logic;
   SIGNAL hit          : std_logic;
   SIGNAL hit1         : std_logic;
   SIGNAL hit2         : std_logic;
   SIGNAL lower_nulify : std_logic;
   SIGNAL upper_nulify : std_logic;
   SIGNAL x_in         : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT register_bank_column_struct
   PORT (
      clk          : IN     std_logic ;
      color_in     : IN     std_logic_vector (23 DOWNTO 0);
      nullify      : IN     std_logic ;
      rst_n        : IN     std_logic ;
      write_enable : IN     std_logic ;
      x_in         : IN     std_logic_vector (7 DOWNTO 0);
      y_in         : IN     std_logic_vector (7 DOWNTO 0);
      color_output : OUT    std_logic_vector (23 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT register_bank_fsm
   PORT (
      clk          : IN     std_logic ;
      frame_done   : IN     std_logic ;
      rst          : IN     std_logic ;
      lower        : OUT    std_logic ;
      lower_nulify : OUT    std_logic ;
      upper        : OUT    std_logic ;
      upper_nulify : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT vector_compare
   PORT (
      input_1 : IN     std_logic_vector (7 DOWNTO 0);
      input_2 : IN     std_logic_vector (7 DOWNTO 0);
      hit     : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : register_bank_column_struct USE ENTITY alien_game_lib.register_bank_column_struct;
   FOR ALL : register_bank_fsm USE ENTITY alien_game_lib.register_bank_fsm;
   FOR ALL : vector_compare USE ENTITY alien_game_lib.vector_compare;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_3' of 'and'
   dout <= write AND din2;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'and'
   dout5 <= write AND din1;

   -- ModuleWare code(v1.12) for instance 'U_9' of 'and'
   dout6 <= hit AND hit1 AND hit2;

   -- ModuleWare code(v1.12) for instance 'U_12' of 'constval'
   din4 <= '1';

   -- ModuleWare code(v1.12) for instance 'U_5' of 'mux'
   u_5combo_proc: PROCESS(yr, yw, din1)
   BEGIN
      CASE din1 IS
      WHEN '0' => dout1 <= yr;
      WHEN '1' => dout1 <= yw;
      WHEN OTHERS => dout1 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_5combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'mux'
   u_6combo_proc: PROCESS(xr, xw, din1)
   BEGIN
      CASE din1 IS
      WHEN '0' => dout2 <= xr;
      WHEN '1' => dout2 <= xw;
      WHEN OTHERS => dout2 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_6combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_7' of 'mux'
   u_7combo_proc: PROCESS(yr, yw, din2)
   BEGIN
      CASE din2 IS
      WHEN '0' => dout3 <= yr;
      WHEN '1' => dout3 <= yw;
      WHEN OTHERS => dout3 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_7combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_8' of 'mux'
   u_8combo_proc: PROCESS(xr, xw, din2)
   BEGIN
      CASE din2 IS
      WHEN '0' => x_in <= xr;
      WHEN '1' => x_in <= xw;
      WHEN OTHERS => x_in <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_8combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_14' of 'mux'
   u_14combo_proc: PROCESS(color_output, din3, din2)
   BEGIN
      CASE din2 IS
      WHEN '0' => dout4 <= color_output;
      WHEN '1' => dout4 <= din3;
      WHEN OTHERS => dout4 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_14combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_15' of 'mux'
   u_15combo_proc: PROCESS(color_output, din3, din1)
   BEGIN
      CASE din1 IS
      WHEN '0' => pixd_out <= color_output;
      WHEN '1' => pixd_out <= din3;
      WHEN OTHERS => pixd_out <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_15combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_16' of 'or'
   w_rdy <= dout6 OR din4;

   -- Instance port mappings.
   U_0 : register_bank_column_struct
      PORT MAP (
         clk          => clk,
         color_in     => pixd_in,
         nullify      => upper_nulify,
         rst_n        => rst_n,
         write_enable => dout5,
         x_in         => dout2,
         y_in         => dout1,
         color_output => color_output
      );
   U_2 : register_bank_column_struct
      PORT MAP (
         clk          => clk,
         color_in     => pixd_in,
         nullify      => lower_nulify,
         rst_n        => rst_n,
         write_enable => dout,
         x_in         => x_in,
         y_in         => dout3,
         color_output => din3
      );
   U_1 : register_bank_fsm
      PORT MAP (
         clk          => clk,
         frame_done   => frame_done,
         rst          => rst_n,
         lower        => din2,
         lower_nulify => lower_nulify,
         upper        => din1,
         upper_nulify => upper_nulify
      );
   U_10 : vector_compare
      PORT MAP (
         input_1 => dout4(15 DOWNTO 8),
         input_2 => pixd_in(15 DOWNTO 8),
         hit     => hit1
      );
   U_11 : vector_compare
      PORT MAP (
         input_1 => dout4(23 DOWNTO 16),
         input_2 => pixd_in(23 DOWNTO 16),
         hit     => hit2
      );
   U_13 : vector_compare
      PORT MAP (
         input_1 => dout4(7 DOWNTO 0),
         input_2 => pixd_in(7 DOWNTO 0),
         hit     => hit
      );

END struct;
