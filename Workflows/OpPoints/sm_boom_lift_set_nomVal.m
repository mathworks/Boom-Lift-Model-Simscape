%% Script to update nominal value setting for .slx models

% This script updates the Simscape nominal value settings for 
% the .slx files within the folders of the project.  This script
% may be useful for confirming that any new model has the 
% correct settings for nominal values

% Copyright 2020-2025 The MathWorks, Inc.


snv = '[{"value":"1","unit":"A"},{"value":"nomval_psi","unit":"psi"},{"value":"1","unit":"cm^2"},{"value":"nomval_cmv3_s","unit":"cm^3/s"},{"value":"1","unit":"kJ/kg"},{"value":"1","unit":"kW"},{"value":"1","unit":"l"},{"value":"nomval_N","unit":"N"},{"value":"nomval_Nm","unit":"N*m"},{"value":"1","unit":"V"}]';

cp = currentProject;
cpRootFolder = cp.RootFolder;
cd(cpRootFolder);

slxList = dir('**/*.slx');

for i = 1:length(slxList)
    cd(slxList(i).folder)
    load_system(slxList(i).name);
    disp(bdroot)
    if(~bdIsLibrary(bdroot))
        try
            set_param(bdroot,'SimscapeNominalValues',snv);
            save_system(bdroot)
            disp('... Simscape Nominal Values Set')
        catch ME
            ME.identifier
        end
    end
    bdclose(bdroot)
end


