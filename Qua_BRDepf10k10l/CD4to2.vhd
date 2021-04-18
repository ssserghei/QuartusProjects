LIBRARY ieee;				
USE ieee.std_logic_1164.all;
ENTITY CD4to2 IS
PORT 
( x1,x2,x3,x4 :in std_logic;
m1,m2,E: out std_logic);
end CD4to2;
architecture CD of CD4to2 IS
begin
m1<=not(x1)and not(x3)and(x2 xor x4);
m2<=not(x1)and not(x2)and(x3 xor x4);
E<=x1 or x2 or x3 or x4;
end CD;
