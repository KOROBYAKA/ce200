-- VHDL Entity alien_game_lib.full_adder.symbol
--
-- Created:
--          by - txdava.UNKNOWN (HTC219-322-SPC)
--          at - 17:37:42  4.02.2025
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY full_adder IS
   PORT( 
      A    : IN     std_logic;
      B    : IN     std_logic;
      CIN  : IN     std_logic;
      COUT : OUT    std_logic;
      SUM  : OUT    std_logic
   );

-- Declarations

END full_adder ;

--
-- VHDL Architecture alien_game_lib.full_adder.struct
--
-- Created:
--          by - txdava.UNKNOWN (HTC219-322-SPC)
--          at - 17:37:39  4.02.2025
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF full_adder IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL carry  : std_logic;
   SIGNAL carry1 : std_logic;
   SIGNAL sum1   : std_logic;


   -- Component Declarations
   COMPONENT c1_t1_half_adder
   PORT (
      sw0   : IN     std_logic ;
      sw1   : IN     std_logic ;
      carry : OUT    std_logic ;
      sum   : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c1_t1_half_adder USE ENTITY alien_game_lib.c1_t1_half_adder;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_2' of 'or'
   COUT <= carry1 OR carry;

   -- Instance port mappings.
   U_0 : c1_t1_half_adder
      PORT MAP (
         sw0   => CIN,
         sw1   => sum1,
         carry => carry1,
         sum   => SUM
      );
   U_1 : c1_t1_half_adder
      PORT MAP (
         sw0   => A,
         sw1   => B,
         carry => carry,
         sum   => sum1
      );

END struct;
