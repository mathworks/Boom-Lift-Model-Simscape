% Calculate Reduced Order Flexible Solid (ROFS) properties
% for telescopic beam in sm_boom_lift_crawler
%
% Copyright 2020-2022 The MathWorks, Inc.

%% General Settings
meshSize  = [0.02 0.2]*2;
freqRange = [0 1e2];
dampingRatio = 0.1;

%% Generate ROFS for base
file_b20 = 'Base_20.STL';
origins_b20 = [ ...
    0.1258   0.1608   0
    0.1258   0.1608   4.195];
faces_b20 = [1 2];
ROM_b20 = sm_boom_lift_crawler_generate_ROM(...
    file_b20,origins_b20,faces_b20, meshSize,...
    freqRange,dampingRatio);

%% Generate ROFS for mid
file_m20 = 'Mid_20.STL';
origins_m20 = [...
    0.2007/2 0.2665/2 0
    0.2007/2 0.2665/2 2.994];
faces_m20 = [1 2];
ROM_m20 = sm_boom_lift_crawler_generate_ROM(...
    file_m20,origins_m20,faces_m20, meshSize,...
    freqRange, dampingRatio);

%% Generate ROFS for fly
file_f20 = 'Fly_20.STL';
origins_f20 = [...
    0.1626/2 0.2307/2 0
    0.1626/2 0.2307/2 3.582];
faces_f20 = [1 2];
ROM_f20 = sm_boom_lift_crawler_generate_ROM(...
    file_f20,origins_f20,faces_f20, meshSize, ...
    freqRange, dampingRatio);


