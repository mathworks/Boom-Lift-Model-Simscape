% Code to load parameters for sm_boom_lift_crawler
%
% Copyright 2020-2024 The MathWorks, Inc.

sm_boom_lift_crawler_params_multibody
sm_boom_lift_crawler_params_hydr
load sm_boom_lift_crawler_boom_data

% Nominal values
nomval_psi = 400;   % psi
nomval_cmv3_s = 16; % cm^3/s
nomval_N   = 500;   % N
nomval_Nm  = 1000;  % N*m

[tVec, oVec] = sm_boom_lift_crawler_vseq_fulltest;