function eval_script(i)
log_res = true;
addpath('./functions');

directory = fullfile(pwd,'BaseShapes'); % change to the directory with ur coords
fileNames = dir(fullfile(directory,'*.dat')); co = {fileNames.name}';

coordFile = fullfile(directory,co{i});
copyfile(coordFile, append('./Tmp/','1.txt'));

disp(['Test Coord.: ', co{i}]);
disp('XFOIL starts...');

[CLD_max,alpha_stall,error_flag] = airfoil_func_calls(1);

disp(['CL/CD max.: ',num2str(CLD_max)]);
disp(['Delta alpha: ',num2str(alpha_stall)]);
disp(['Error flag: ',num2str(error_flag)]);

delete :00.bl

if log_res
   if isfolder('./Results')
	rmdir('./Results','s')
   end
   mkdir('./Results')
   resultfile=append('./Results/','cldmax_delalp_errflag.txt');
   fid=fopen(resultfile,'w');
   fprintf(fid,'%25s %15.9f %11.2f %04d \n',co{i},CLD_max,alpha_stall,error_flag);
   fclose(fid);

   copyfile(coordFile, append('./Results/',co{i}));
   copyfile('./Tmp/morphed_repanel.txt', append('./Results/','paneled_',co{i}));
end

end
