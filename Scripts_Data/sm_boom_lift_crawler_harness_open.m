function sm_boom_lift_crawler_harness_open(harness_name)
% Function to open selected test model

% Copyright 2020-2025 The MathWorks, Inc.

% Use strrep to ensure compatible with MATLAB Online
switch lower(strrep(harness_name,'%20',' '))
    case 'full motion'
        model_name     = 'sm_boom_lift_crawler_test_full_motion';
    case 'boom motion'
        model_name     = 'sm_boom_lift_crawler_test_boom_motion';
    case 'chassis motion'
        model_name     = 'sm_boom_lift_crawler_test_chassis_motion';
    case 'basket motion'
        model_name     = 'sm_boom_lift_crawler_test_basket_motion';
    case 'ground manifold hydr'
        model_name     = 'sm_boom_lift_crawler_test_ground_manifold_hydr';
    case 'outrigger hydr'
        model_name     = 'sm_boom_lift_crawler_test_outrigger_hydr';
    case 'track hydr'
        model_name     = 'sm_boom_lift_crawler_test_track_hydr';
    case 'sky manifold hydr'
        model_name     = 'sm_boom_lift_crawler_test_sky_manifold_hydr';
    case 'turret hydr'
        model_name     = 'sm_boom_lift_crawler_test_turret_hydr';
    case 'extend hydr'
        model_name     = 'sm_boom_lift_crawler_test_extend_hydr';
    case 'lift hydr'
        model_name     = 'sm_boom_lift_crawler_test_lift_hydr';
    case 'basket rotate hydr'
        model_name     = 'sm_boom_lift_crawler_test_basket_rotate_hydr';
    case 'basket level hydr'
        model_name     = 'sm_boom_lift_crawler_test_basket_level_hydr';
    case 'basket level tilt hydr'
        model_name     = 'sm_boom_lift_crawler_test_basket_level_tilt_hydr';
    case 'jib hydr 3d'
        model_name     = 'sm_boom_lift_crawler_test_jib_hydr_3D';
    case 'jib hydr 1d'
        model_name     = 'sm_boom_lift_crawler_test_jib_hydr_1D';
    case 'hydr model'
        model_name     = 'sm_boom_lift_crawler';
    case 'abstract model'
        model_name     = 'sm_boom_lift_crawler_abstract';
    case 'abstract flex model'
        model_name     = 'sm_boom_lift_crawler_abstract_flex_boom';
    case 'flex boom motion'
        model_name     = 'sm_boom_lift_crawler_flex_boom';
    otherwise
        model_name     = 'not found';
end

if(exist('model_name','var'))
    open_system(model_name)
else
    disp(['model ' model_name ' not found.']); 
end


