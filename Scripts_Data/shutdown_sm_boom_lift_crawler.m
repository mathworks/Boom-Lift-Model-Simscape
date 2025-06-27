% Shutdown script for startup_sm_boom_lift_crawler
% Copyright 2020-2025 The MathWorks, Inc.

cd(fileparts(which('sm_boom_lift_crawler.slx')))
cd('Libraries')
custom_code = dir(['**' filesep 'mysmoothstep.ssc']);
cd(custom_code.folder)
cd('..')
bdclose('MyMath_lib')
ssc_clean MyMath
cd(fileparts(which('sm_boom_lift_crawler.slx')))
