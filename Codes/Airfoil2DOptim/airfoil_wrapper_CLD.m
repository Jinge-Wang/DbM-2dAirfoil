function [CLD_max]=airfoil_wrapper_CLD(x)
i_string=strcat(string(java.util.UUID.randomUUID),string(sum(x)));
copyfile("Airfoil",i_string)
cd(i_string)
CLD_max=airfoil_func_calls_CLD(x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8),x(9),x(10),x(11),x(12),x(13),x(14),x(15),x(16),x(17),x(18),x(19),x(20),x(21),x(22),x(23),x(24),x(25));
if CLD_max>1500 || CLD_max<0.1
CLD_max=0;
end

CLD_max=-1*CLD_max;
cd ..
rmdir(i_string,'s')
end
