% This code creates a new folder in which the mmb loop can be executed. All
% the required files (replication directory, the matlab files of the mmb
% loop routine and the Excel replication directory overview file) are
% copied into this folder.

clear;
fprintf('-- %s.m started. --\n',mfilename);
tic

% Inputs -------------------------------
folder_routine = 'Research_routine';
folder_routine_exec = 'Routine_execution';
replication_directory_name = 'replication';
overview_table_input_file = 'overview_out.xlsx';
% Inputs Ende --------------------------

% create a test environment for the research routine
prepare_folder(folder_routine_exec);
% copy routine into test folder
copyfile(folder_routine,folder_routine_exec,'f');
% copy replication directory into test folder
copyfile(replication_directory_name, [folder_routine_exec '\' replication_directory_name], 'f');
% copy overview table into test folder
copyfile(overview_table_input_file, [folder_routine_exec '\' overview_table_input_file]);
toc
fprintf('\n-- %s.m completed. --\n',mfilename);

cd Routine_execution

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