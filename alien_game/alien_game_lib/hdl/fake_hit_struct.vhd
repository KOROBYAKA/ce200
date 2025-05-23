-- VHDL Entity alien_game_lib.fake_hit.symbol
--
-- Created:
--          by - cvalzu.UNKNOWN (HTC219-313-SPC)
--          at - 18:32:55 26.03.2025
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY fake_hit IS
   PORT( 
      alien_x : IN     std_logic_vector (7 DOWNTO 0);
      btn     : IN     std_logic;
      gun_x   : IN     std_logic_vector (7 DOWNTO 0);
      hit     : OUT    std_logic
   );

-- Declarations

END fake_hit ;

--
-- VHDL Architecture alien_game_lib.fake_hit.struct
--
-- Created:
--          by - cvalzu.UNKNOWN (HTC219-313-SPC)
--          at - 18:32:54 26.03.2025
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF fake_hit IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL hit1 : std_logic;


   -- Component Declarations
   COMPONENT vector_compare
   PORT (
      input_1 : IN     std_logic_vector (7 DOWNTO 0);
      input_2 : IN     std_logic_vector (7 DOWNTO 0);
      hit     : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : vector_compare USE ENTITY alien_game_lib.vector_compare;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'and'
   hit <= hit1 AND btn;

   -- Instance port mappings.
   U_1 : vector_compare
      PORT MAP (
         input_1 => alien_x,
         input_2 => gun_x,
         hit     => hit1
      );

END struct;
