-- VHDL Entity tb_lib.tb_bin2onehot_tt.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-316-SPC)
--          at - 15:32:10 06/12/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_bin2onehot_tt IS
-- Declarations

END tb_bin2onehot_tt ;

--
-- VHDL Architecture tb_lib.tb_bin2onehot_tt.struct
--
-- Created:
--          by - cvalzu.UNKNOWN (HTC219-316-SPC)
--          at - 17:51:30  6.02.2025
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_bin2onehot_tt IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL correct : std_logic;
   SIGNAL res     : std_logic_vector(7 DOWNTO 0);
   SIGNAL to_duv  : std_logic_vector(2 DOWNTO 0);


   -- Component Declarations
   COMPONENT One_hot_converter
   PORT (
      binary_in   : IN     std_logic_vector (2 DOWNTO 0);
      one_hot_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT tt_tester
   PORT (
      res     : IN     std_logic_vector (7 DOWNTO 0);
      correct : OUT    std_logic ;
      to_duv  : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : One_hot_converter USE ENTITY alien_game_lib.One_hot_converter;
   FOR ALL : tt_tester USE ENTITY tb_lib.tt_tester;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : One_hot_converter
      PORT MAP (
         binary_in   => to_duv,
         one_hot_out => res
      );
   U_0 : tt_tester
      PORT MAP (
         res     => res,
         correct => correct,
         to_duv  => to_duv
      );

END struct;
