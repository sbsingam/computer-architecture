library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test5 is
Port ( 
pc,pr,pd,pl,pu: in std_logic;
clk: in std_logic;
reset: in std_logic;
switch : in std_logic_vector(15 downto 0);
An : out std_logic_vector (3 downto 0);
led : out std_logic_vector(15 downto 0);
led_out21: out std_logic_vector(6 downto 0)
);

end test5;

architecture Behavioral of test5 is
signal led_out,equal : std_logic_vector(3 downto 0);
signal new_clock : std_logic_vector(19 downto 0);
signal refresh,q : std_logic;
shared variable timer,timer1,timer2,timer3,counter,think0,think1,think2,think3,think4,think5,think6,think7,think8, howmany,ready: integer:=0;

shared variable attempt: integer:=0;
type state is (s0,s1,s2,s3,s4,s5,s6);
signal current_state,next_state : state;

signal led_out2:  std_logic_vector(6 downto 0);

shared variable temp3 :std_logic_vector(6 downto 0):="1111111"; 
shared variable temp0 :std_logic_vector(6 downto 0):="0110001"; --display L
shared variable temp2 :std_logic_vector(6 downto 0):="1110001"; -- display C
shared variable temp1 :std_logic_vector(6 downto 0):="0000001"; --display 0
shared variable temp4 :std_logic_vector(6 downto 0):="1001111"; --display 1
shared variable temp5 :std_logic_vector(6 downto 0):="0000110";  --display 3
shared variable temp6 :std_logic_vector(6 downto 0):="1001100"; --display 4
shared variable temp7 :std_logic_vector(6 downto 0):="0000110"; --display 3




begin


process(clk)

begin
if(rising_edge(clk))then
 new_clock <= new_clock+1;
 end if;
 end process;
  refresh<=new_clock(18);
 
process(refresh,next_state,pc,pr,pd,pl,pu)
variable count: integer := 0;



variable loc : std_logic:= '0'; 
variable paus,unlc : std_logic:= '0'; 

variable which:integer:=0;
begin
if(rising_edge(refresh)) then
if  howmany=0 then 
  next_state<=s0;
  end if;
  
 current_state<= next_state;
 
  case current_state is
   when s0 =>                      --state s1 displays LOC and latching of numbers
   think5:=think5+1;
   led<="0000000000000000";
   
     
    if counter >6000 then                    --30 sec timer
      counter:=0;
      timer:=0;
      timer1:=0;
      timer2:=0;
      timer3:=0;

      next_state<=s4;
      end if;
     
      
 if pc = '1'and think5>400 then -- condition to move to second state
 howmany:=1;
 think5:=0;
 timer:=0;
  timer1:=0;
 timer2:=0;
  timer3:=0;
 counter:=0;
 next_state<=s1;
 
 end if; 
       
 case count is
when 0 =>
  
   An<="1011";
  if pr='1' then
          timer:=1;
          led_out <= switch(3 downto 0);
          
          
          case led_out is
    when "0000" => led_out2 <= "0000001";   
    when "0001" => led_out2 <= "1001111";  
    when "0010" => led_out2 <= "0010010"; 
    when "0011" => led_out2 <= "0000110";  
    when "0100" => led_out2 <= "1001100";  
    when "0101" => led_out2 <= "0100100";  
    when "0110" => led_out2 <= "0100000";  
    when "0111" => led_out2 <= "0001111";  
    when "1000" => led_out2 <= "0000000";      
    when "1001" => led_out2 <= "0000100";  
    when "1010" => led_out2 <= "0000010"; 
    when "1011" => led_out2 <= "1100000"; 
    when "1100" => led_out2 <= "0110001"; 
    when "1101" => led_out2 <= "1000010"; 
    when "1110" => led_out2 <= "0110000"; 
    when "1111" => led_out2 <= "0111000";
    end case;
temp0:= led_out2;
led_out21<=led_out2;
end if;
led_out21<=temp0;
count:= count+1;
 when 1 =>    
    
 An<="1101";
 if pu='1' then
             timer1:=1;
           led_out<= switch(3 downto 0);
          
           case led_out is
    when "0000" => led_out2 <= "0000001";   
    when "0001" => led_out2 <= "1001111";  
    when "0010" => led_out2 <= "0010010"; 
    when "0011" => led_out2 <= "0000110";  
    when "0100" => led_out2 <= "1001100";  
    when "0101" => led_out2 <= "0100100";  
    when "0110" => led_out2 <= "0100000";  
    when "0111" => led_out2 <= "0001111";  
    when "1000" => led_out2 <= "0000000";      
    when "1001" => led_out2 <= "0000100";  
    when "1010" => led_out2 <= "0000010"; 
    when "1011" => led_out2 <= "1100000"; 
    when "1100" => led_out2 <= "0110001"; 
    when "1101" => led_out2 <= "1000010"; 
    when "1110" => led_out2 <= "0110000"; 
    when "1111" => led_out2 <= "0111000";
    end case;
   temp1:= led_out2;
led_out21<=led_out2;
end if;
led_out21<=temp1;
count:= count+1;
when 2 =>

  An<="1110";
  if pl='1' then 
            timer2:=1;
          led_out <= switch(3 downto 0);
          
           case led_out is
    when "0000" => led_out2 <= "0000001";   
    when "0001" => led_out2 <= "1001111";  
    when "0010" => led_out2 <= "0010010"; 
    when "0011" => led_out2 <= "0000110";  
    when "0100" => led_out2 <= "1001100";  
    when "0101" => led_out2 <= "0100100";  
    when "0110" => led_out2 <= "0100000";  
    when "0111" => led_out2 <= "0001111";  
    when "1000" => led_out2 <= "0000000";      
    when "1001" => led_out2 <= "0000100";  
    when "1010" => led_out2 <= "0000010"; 
    when "1011" => led_out2 <= "1100000"; 
    when "1100" => led_out2 <= "0110001"; 
    when "1101" => led_out2 <= "1000010"; 
    when "1110" => led_out2 <= "0110000"; 
    when "1111" => led_out2 <= "0111000";
    end case;
 temp2:= led_out2;
led_out21<=led_out2;
end if;
led_out21<=temp2;
count:= count+1;
when 3 =>

 An<="0111";
           if pd='1' then
           timer3:=1;
           led_out <= switch(3 downto 0);
          
            case led_out is
    when "0000" => led_out2 <= "0000001";   
    when "0001" => led_out2 <= "1001111";  
    when "0010" => led_out2 <= "0010010"; 
    when "0011" => led_out2 <= "0000110";  
    when "0100" => led_out2 <= "1001100";  
    when "0101" => led_out2 <= "0100100";  
    when "0110" => led_out2 <= "0100000";  
    when "0111" => led_out2 <= "0001111";  
    when "1000" => led_out2 <= "0000000";      
    when "1001" => led_out2 <= "0000100";  
    when "1010" => led_out2 <= "0000010"; 
    when "1011" => led_out2 <= "1100000"; 
    when "1100" => led_out2 <= "0110001"; 
    when "1101" => led_out2 <= "1000010"; 
    when "1110" => led_out2 <= "0110000"; 
    when "1111" => led_out2 <= "0111000";
    
   
    end case;
    temp3:= led_out2;
led_out21<=led_out2;
end if;
led_out21<=temp3;
count:=0;
when others   => null;
 end case;
if timer = 1 or timer1=1 or timer2 =1 or timer3 =1 then
      counter :=counter+1;
      end if;

 when s1 =>                --comparision state
  think7:=think7+1 ;
   if (temp4=temp0) and (temp5=temp1) and (temp6= temp2) and (temp7= temp3) then
     next_state<=s2;  
        
        elsif  attempt = 2 and think7>30 then
        think7:=0;
         next_state<=s3;   
         
         elsif attempt /=2  and think7>30 then
         think7:=0;
         attempt:=attempt+1;
         next_state<= s4;  
          
        end if;
  when s2=>
  think0:=think0+1;
  think1:=0;
  think2:=0;
  think3:=0;
  think8:=think8+1;
  if think8 > 400 then            --led flash
  led <="1111111111111111";
  think8:=0;
  else
  led <="0000000000000000";
  end if;
  if pc='1'and think0 > 400 then     -- goto lock state
     next_state<=s4;

      elsif pr='1'and think0 >400 then   -- goto change state 
      next_state<=s5;
      end if;
     
   case which is                      --dislay UNLN
    when 0=>  an <= "1110";led_out21 <= "1000001";which := which + 1;   
    when 1=>  an <= "1101";led_out21 <= "0001001"; which := which + 1;

    when 2=>  an <= "1011";led_out21 <= "1110001"; which := which + 1;
    when 3=>  an <= "0111";led_out21 <= "0001001"; which := 0;
    when others=>null;
    end case;
   when s3 =>      --display PAUS
   think1:=think1+1;
  think0:=0;
  think2:=0;
  think3:=0;
  attempt:=0;
   led <="0000000000000000";
   if think1>2000 then   -- wait for 10 sec
     next_state<=s4;
     end if;
   case which is
    when 0=> led_out21 <= "0011000"; an <= "1110"; which := which + 1;
    when 1=> led_out21 <= "0000010"; an <= "1101"; which := which + 1;
    when 2=> led_out21 <= "1000001"; an <= "1011"; which := which + 1;
    when 3=> led_out21 <= "0100100"; an <= "0111"; which := 0;
    when others=>null;
    end case;
    ready:=1;
    when s4=>       --display LOC
    think2:=think2+1;
  think1:=0;
  think0:=0;
  think3:=0;
  led <="0000000000000000";
    if  think2 >600 then
    think2:=0;
     next_state<=s0;
    
      end if;
     
    case which is
    when 0=> led_out21  <= "1110001";temp0:= "0110001";    an <= "1110"; which := which + 1; 
    when 1=> led_out21 <= "0000001"; temp1:= "0000001";    an <= "1101"; which := which + 1;
    when 2=> led_out21 <= "0110001"; temp2:= "1110001";   an <= "1011"; which := which + 1;
    when 3=> led_out21 <= "1111111"; temp3:= "1111111";   an <= "0111"; which := 0;
    when others=>null;
    end case;
when s5 =>         --display CHNG
think3:=think3+1;
  think1:=0;
  think2:=0;
  think0:=0;
  led <="0000000000000000";
     if  think3 >800 then
     next_state<=s6;
     end if;
    case which is
    when 0=> led_out21  <= "0110001"; an <= "1110"; which := which + 1; 
    when 1=> led_out21 <= "1001000"; an <= "1101"; which := which + 1;
    when 2=> led_out21 <= "0001001"; an <= "1011"; which := which + 1;
    when 3=> led_out21 <= "0100000"; an <= "0111"; which := 0;
    when others=>null;
    end case;
when s6 =>                  -- updating the new passcode
think6:=think6+1;
 if pc='1'and think6>400 then
  next_state<=s4;
  end if;
  led <="0000000000000000";
     case count is
when 0 =>
   An<="1011";
  if pr='1' then
          led_out <= switch(3 downto 0);
          
          
          case led_out is
    when "0000" => led_out2 <= "0000001";   
    when "0001" => led_out2 <= "1001111";  
    when "0010" => led_out2 <= "0010010"; 
    when "0011" => led_out2 <= "0000110";  
    when "0100" => led_out2 <= "1001100";  
    when "0101" => led_out2 <= "0100100";  
    when "0110" => led_out2 <= "0100000";  
    when "0111" => led_out2 <= "0001111";  
    when "1000" => led_out2 <= "0000000";      
    when "1001" => led_out2 <= "0000100";  
    when "1010" => led_out2 <= "0000010"; 
    when "1011" => led_out2 <= "1100000"; 
    when "1100" => led_out2 <= "0110001"; 
    when "1101" => led_out2 <= "1000010"; 
    when "1110" => led_out2 <= "0110000"; 
    when "1111" => led_out2 <= "0111000";
    end case;
temp4:= led_out2;
led_out21<=led_out2;
end if;
led_out21<=temp4;
count:= count+1;
 when 1 =>       
 An<="1101";
 if pu='1' then
           led_out<= switch(3 downto 0);
          
           case led_out is
    when "0000" => led_out2 <= "0000001";   
    when "0001" => led_out2 <= "1001111";  
    when "0010" => led_out2 <= "0010010"; 
    when "0011" => led_out2 <= "0000110";  
    when "0100" => led_out2 <= "1001100";  
    when "0101" => led_out2 <= "0100100";  
    when "0110" => led_out2 <= "0100000";  
    when "0111" => led_out2 <= "0001111";  
    when "1000" => led_out2 <= "0000000";      
    when "1001" => led_out2 <= "0000100";  
    when "1010" => led_out2 <= "0000010"; 
    when "1011" => led_out2 <= "1100000"; 
    when "1100" => led_out2 <= "0110001"; 
    when "1101" => led_out2 <= "1000010"; 
    when "1110" => led_out2 <= "0110000"; 
    when "1111" => led_out2 <= "0111000";
    end case;
   temp5:= led_out2;
led_out21<=led_out2;
end if;
led_out21<=temp5;
count:= count+1;
when 2 =>
  An<="1110";
  if pl='1' then 
      
          led_out <= switch(3 downto 0);
          
           case led_out is
    when "0000" => led_out2 <= "0000001";   
    when "0001" => led_out2 <= "1001111";  
    when "0010" => led_out2 <= "0010010"; 
    when "0011" => led_out2 <= "0000110";  
    when "0100" => led_out2 <= "1001100";  
    when "0101" => led_out2 <= "0100100";  
    when "0110" => led_out2 <= "0100000";  
    when "0111" => led_out2 <= "0001111";  
    when "1000" => led_out2 <= "0000000";      
    when "1001" => led_out2 <= "0000100";  
    when "1010" => led_out2 <= "0000010"; 
    when "1011" => led_out2 <= "1100000"; 
    when "1100" => led_out2 <= "0110001"; 
    when "1101" => led_out2 <= "1000010"; 
    when "1110" => led_out2 <= "0110000"; 
    when "1111" => led_out2 <= "0111000";
    end case;
 temp6:= led_out2;
led_out21<=led_out2;
end if;
led_out21<=temp6;
count:= count+1;
when 3 =>
 An<="0111";
           if pd='1' then
           led_out <= switch(3 downto 0);
          
            case led_out is
    when "0000" => led_out2 <= "0000001";   
    when "0001" => led_out2 <= "1001111";  
    when "0010" => led_out2 <= "0010010"; 
    when "0011" => led_out2 <= "0000110";  
    when "0100" => led_out2 <= "1001100";  
    when "0101" => led_out2 <= "0100100";  
    when "0110" => led_out2 <= "0100000";  
    when "0111" => led_out2 <= "0001111";  
    when "1000" => led_out2 <= "0000000";      
    when "1001" => led_out2 <= "0000100";  
    when "1010" => led_out2 <= "0000010"; 
    when "1011" => led_out2 <= "1100000"; 
    when "1100" => led_out2 <= "0110001"; 
    when "1101" => led_out2 <= "1000010"; 
    when "1110" => led_out2 <= "0110000"; 
    when "1111" => led_out2 <= "0111000";
    
   
    end case;
    temp7:= led_out2;
led_out21<=led_out2;
end if;
led_out21<=temp7;
count:=0;
when others   => null;
 end case;
 end case;
 end if;
end process;

 



end Behavioral;






