function eval_script(i)
log_res = true;
addpath('./functions');

weightMat = readmatrix('weightInput.dat');

if (size(weightMat,1) < i)
    return
end

x=weightMat(i,:);

disp(['Weights: ',num2str(x(1:25),'%7.3f')]);
disp('XFOIL starts...');

[CLD_max,alpha_stall,error_flag] = airfoil_func_calls(x(1) ,x(2) ,x(3), x(4), x(5) , ...
                                                      x(6) ,x(7) ,x(8), x(9), x(10), ...
						      x(11),x(12),x(13),x(14),x(15), ...
						      x(16),x(17),x(18),x(19),x(20), ...
						      x(21),x(22),x(23),x(24),x(25));

disp(['CL/CD max.: ',num2str(CLD_max)]);
disp(['Delta alpha: ',num2str(alpha_stall)]);
disp(['Error flag: ',num2str(error_flag)]);

delete :00.bl

if log_res
   if isfolder('./Results')
	rmdir('./Results','s')
   end
   mkdir('./Results')
   resultfile=append('./Results/',num2str(-CLD_max,'%07.3f'),'_',num2str(-alpha_stall,'%f05.2f'),'.txt');
   fid=fopen(resultfile,'w');
   fprintf(fid,'%15.9f %11.2f %04d \n',CLD_max,alpha_stall,error_flag);
   fclose(fid);

   save('./Results/weight.dat','x','-ascii');

   copyfile('./Tmp/morphed_original.txt', append('./Results/',num2str(CLD_max,'%07.3f'),'_',num2str(alpha_stall,'%05.2f'),'.dat'));
   copyfile('./Tmp/morphed_repanel.txt', append('./Results/','paneled_',num2str(CLD_max,'%07.3f'),'_',num2str(alpha_stall,'%05.2f'),'.dat'));
end

end
