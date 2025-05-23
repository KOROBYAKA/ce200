-- VHDL Entity tb_lib.tx_test_sequencer.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-322-SPC)
--          at - 10:10:25 06/12/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tx_test_sequencer IS
   PORT( 
      clk    : IN     std_logic;
      rdy    : IN     std_logic;
      rst_n  : IN     std_logic;
      bit_in : OUT    std_logic;
      run    : OUT    std_logic
   );

-- Declarations

END tx_test_sequencer ;

--
-- VHDL Architecture tb_lib.tx_test_sequencer.fsm
--
-- Created:
--          by - kayra.UNKNOWN (WS-11696-PC)
--          at - 15:27:00  3.09.2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ARCHITECTURE fsm OF tx_test_sequencer IS

   -- Architecture Declarations
   SIGNAL data : std_logic_vector(31 DOWNTO 0);  
   SIGNAL indexer : integer;  

   TYPE STATE_TYPE IS (
      reset,
      wait_rdy,
      send_bit,
      tx_done
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

   -- Declare any pre-registered internal signals
   SIGNAL bit_in_cld : std_logic ;
   SIGNAL run_cld : std_logic ;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      rst_n
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst_n = '0') THEN
         current_state <= reset;
         -- Default Reset Values
         bit_in_cld <= '0';
         run_cld <= '0';
         data <= "11011110101011011011111011101111";
         indexer <= 31;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
         -- Default Assignment To Internals
         data <= "11011110101011011011111011101111";

         -- Combined Actions
         CASE current_state IS
            WHEN reset => 
               indexer <= 31;
               bit_in_cld<='0';
               run_cld<='0';
            WHEN send_bit => 
               bit_in_cld<=data(indexer);
               run_cld<='1';
               IF (indexer=0) THEN 
               ELSIF (rdy='0') THEN 
                  indexer<=indexer-1;
                  run_cld<='0';
               END IF;
            WHEN OTHERS =>
               NULL;
         END CASE;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      current_state,
      indexer,
      rdy
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN reset => 
            next_state <= wait_rdy;
         WHEN wait_rdy => 
            IF (rdy='1') THEN 
               next_state <= send_bit;
            ELSE
               next_state <= wait_rdy;
            END IF;
         WHEN send_bit => 
            IF (indexer=0) THEN 
               next_state <= tx_done;
            ELSIF (rdy='0') THEN 
               next_state <= wait_rdy;
            ELSE
               next_state <= send_bit;
            END IF;
         WHEN tx_done => 
            next_state <= tx_done;
         WHEN OTHERS =>
            next_state <= reset;
      END CASE;
   END PROCESS nextstate_proc;
 
   -- Concurrent Statements
   -- Clocked output assignments
   bit_in <= bit_in_cld;
   run <= run_cld;
END fsm;
