function sm_boom_lift_crawler_harness_open(harness_name)
% Function to open selected test harness

% Copyright 2020 The MathWorks, Inc.

% Libraries with which harnesses are associated
lift_lib        = 'sm_boom_lift_crawler_lib_lift';
actuators_lib   = 'sm_boom_lift_crawler_lib_actuators';
outrigger_lib   = 'sm_boom_lift_crawler_lib';
chassis_lib     = 'sm_boom_lift_crawler_lib_chassis';
boom_lib        = 'sm_boom_lift_crawler_lib_boom';
basket_lib      = 'sm_boom_lift_crawler_lib_basket';
hydr_model      = 'sm_boom_lift_crawler';
ctrl_model      = 'sm_boom_lift_crawler_abstract';
abstrflex_model = 'sm_boom_lift_crawler_abstract_flex_boom';
flex_boom_model = 'sm_boom_lift_crawler_flex_boom';

switch lower(harness_name)
    case 'full motion'
        harness_suffix = 'full_motion';
        host_mdl       = lift_lib;
    case 'boom motion'
        harness_suffix = 'boom_motion';
        host_mdl       = boom_lib;
    case 'chassis motion'
        harness_suffix = 'chassis_motion';
        host_mdl       = chassis_lib;
    case 'basket motion'
        harness_suffix = 'basket_motion';
        host_mdl       = basket_lib;
    case 'ground manifold hydr'
        harness_suffix = 'ground_manifold_hydr';
        host_mdl       = actuators_lib;
    case 'outrigger hydr'
        harness_suffix = 'outrigger_hydr';
        host_mdl       = outrigger_lib;
    case 'track hydr'
        harness_suffix = 'track_hydr';
        host_mdl       = actuators_lib;
    case 'sky manifold hydr'
        harness_suffix = 'sky_manifold_hydr';
        host_mdl       = actuators_lib;
    case 'turret hydr'
        harness_suffix = 'turret_hydr';
        host_mdl       = actuators_lib;
    case 'extend hydr'
        harness_suffix = 'extend_hydr';
        host_mdl       = actuators_lib;
    case 'lift hydr'
        harness_suffix = 'lift_hydr';
        host_mdl       = actuators_lib;
    case 'basket rotate hydr'
        harness_suffix = 'basket_rotate_hydr';
        host_mdl       = actuators_lib;
    case 'basket level hydr'
        harness_suffix = 'basket_level_hydr';
        host_mdl       = actuators_lib;
    case 'basket level tilt hydr'
        harness_suffix = 'basket_level_tilt_hydr';
        host_mdl       = actuators_lib;
    case 'jib hydr 3d'
        harness_suffix = 'jib_hydr_3D';
        host_mdl       = actuators_lib;
    case 'jib hydr 1d'
        harness_suffix = 'jib_hydr_1D';
        host_mdl       = actuators_lib;
    case 'hydr model'
        harness_suffix = 'none';
        host_mdl       = hydr_model;
    case 'abstract model'
        harness_suffix = 'none';
        host_mdl       = ctrl_model;
    case 'abstract flex model'
        harness_suffix = 'none';
        host_mdl       = abstrflex_model;
    case 'flex boom motion'
        harness_suffix = 'none';
        host_mdl       = flex_boom_model;
    otherwise
        harness_suffix = 'not found';
        host_mdl       = 'not found';
end

harness_prefix = 'sm_boom_lift_crawler_harness_';
harness_mdl = [harness_prefix harness_suffix];

if(~strcmp(harness_suffix,'not found'))
    % Ensure host model/library is open
    open_system(host_mdl);
    
    % Look for harness in host model
    harness_list = sltest.harness.find(host_mdl);
    harness_ind = find(strcmp({harness_list.name},harness_mdl));
    if(isempty(harness_ind))
        harness_ind = -1;
    end
    open_ind    = find([harness_list.isOpen]);
    
    % If a harness is open close it
    if(~isempty(open_ind))
        % Do not close harness if it is desired harness
        if(open_ind~= harness_ind)
            sltest.harness.close(...
                harness_list(open_ind).ownerFullPath,...
                harness_list(open_ind).name);
        end
    end
    
    % If desired harness is already open, use open_system() to bring the
    % focus back to that harness.
    if(open_ind == harness_ind)
        open_system(harness_mdl);
        
    % If no harness is open OR desired harness is not yet open
    % AND the selected harness is not the main model, open harness
    elseif((isempty(open_ind) || open_ind ~= harness_ind) ...
            && harness_ind ~= -1)
        sltest.harness.open(...
            harness_list(harness_ind).ownerFullPath,...
            harness_list(harness_ind).name);
    end
else
    disp(['Harness ' lower(harness_name) ' not found.']); 
end


