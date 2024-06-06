% This file generate the results for the paper from the replication
% database from macromodeldatabase.com
% You can set run_worked_model=1 to run again with only worked model 
% after the first run through all model replications.


clear;


fprintf('-- %s.m started. --\n',mfilename);
tic

% Inputs -------------------------------

folder_routine = 'Research_routine';
folder_routine_exec = 'Routine_execution';
replication_directory_name = 'replication';
overview_table_input_file = 'overview_out.xlsx';
final_file_all='Result_allmodels.xlsx';
final_file_worked='Result_worked_models';
matfile_all='First_Run_AMG_JS.mat';
matfile_worked='First_Run_AMG_JS_worked.mat';
% Inputs Ende --------------------------

% create a test environment for the research routine
prepare_folder(folder_routine_exec);
% copy routine into test folder
copyfile(folder_routine,folder_routine_exec,'f');
% copy replication directory into test folder
%copyfile(replication_directory_name, [folder_routine_exec '\' replication_directory_name], 'f');
% copy overview table into test folder
%copyfile(overview_table_input_file, [folder_routine_exec '\' overview_table_input_file]);
toc
fprintf('\n-- %s.m completed. --\n',mfilename);

cd Routine_execution
mmb_loop_Max;
%%%%%Choose to run again with only worked models
run_worked_model=1; % 1 if you want to run only model with Newton, 0 if you want to run the whole replication database 

if run_worked_model==1
mmb_loop_Max_worked_models;
cd ..
folder_routine = 'Research_routine';
folder_routine_exec = 'Routine_execution';
replication_directory_name = 'replication';
overview_table_input_file = 'overview_out.xlsx';
final_file_all='Result_allmodels.xlsx';
final_file_worked='Result_worked_models.xlsx';
matfile_all='First_Run_AMG_JS.mat';
matfile_worked='First_Run_AMG_JS_worked.mat';
copyfile( [folder_routine_exec '\' final_file_all]);   
copyfile( [folder_routine_exec '\' final_file_worked]);   
copyfile( [folder_routine_exec '\' matfile_worked]); 
copyfile( [folder_routine_exec '\' matfile_all]); 
else
cd ..
folder_routine = 'Research_routine';
folder_routine_exec = 'Routine_execution';
replication_directory_name = 'replication';
overview_table_input_file = 'overview_out.xlsx';
final_file_all='Result_allmodels.xlsx';
final_file_worked='Result_worked_models';
matfile_all='First_Run_AMG_JS.mat';
matfile_worked='First_Run_AMG_JS_worked.mat';
copyfile( [folder_routine_exec '\' final_file_all]);   
copyfile( [folder_routine_exec '\' matfile_all]);  
end


function prepare_folder(folder)
%PREPARE_FOLDER makes sure a folder of given path and name exists and is
%empty.
%   folder is a character array containing (relative) path and name of the
%   folder to be created.
    if isfolder(folder)
        rmdir(folder,'s');
    end
    mkdir(folder);
end