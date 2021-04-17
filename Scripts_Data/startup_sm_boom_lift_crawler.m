% Startup script for startup_sm_boom_lift_crawler
% Copyright 2020-2021 The MathWorks, Inc.

MDatabase = sm_boom_lift_crawler_motion;
ODatabase = sm_boom_lift_crawler_operator_seq;
sm_boom_lift_crawler_settest('full test')

% Load operating points
load op_hold15Sec_FULL
load op_jib_hydr_1D
load op_sky_manifold_hydr
load op_lift_hydr

sm_boom_lift_crawler_load_params

% Solver settings for this model
limitDerivativePerturbations(1e-7, inf)
daesscSetMultibody()

%% Create custom components for valve
cd(fileparts(which('sm_boom_lift_crawler.slx')))
cd('Libraries')
custom_code = dir(['**' filesep 'mysmoothstep.ssc']);
cd(custom_code.folder)
ssc_build
cd(fileparts(which('sm_boom_lift_crawler.slx')))

% Return to defaults
%{
limitDerivativePerturbations([])
daesscSetMultibody([])
%}

open_system('sm_boom_lift_crawler_abstract');
sm_boom_lift_crawler_app

