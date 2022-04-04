function sm_boom_lift_crawler_setsolver(mdl,varfixed)
%SM_BOOM_LIFT_CRAWLER_SETSOLVER Configure solver
%   Set solver settings in sm_boom_lift_crawler models for variable or
%   fixed-step simulation.
%
% Copyright 2020-2022 The MathWorks, Inc.

solverBlock_pth = find_system(mdl,'FollowLinks','on','LookUnderMasks','on', 'SubClassName', 'solver');

ls_hydr_ind = find(startsWith(solverBlock_pth,[mdl '/Hydr Config']));
ls_mech_ind = find(startsWith(solverBlock_pth,[mdl '/Mech Config']));

if(~isempty(ls_hydr_ind))
    ls_hydr = solverBlock_pth{ls_hydr_ind};
else
    ls_hydr = [];
end

if(~isempty(ls_mech_ind))
    ls_mech = solverBlock_pth{ls_mech_ind};
else
    ls_mech = [];
end

%solverBlock_pth = find_system(mdl,'FollowLinks','on','LookUnderMasks','on', 'SubClassName', 'solver');

if strcmpi(varfixed,'variable')
    set_param(mdl,'Solver','ode23t');
    if(~isempty(ls_hydr))
        set_param(ls_hydr,...
            'UseLocalSolver','off',...
            'ResidualTolerance','1e-9',...
            'DoFixedCost','off');
    end
    if(~isempty(ls_mech))
        set_param(ls_mech,...
            'UseLocalSolver','off',...
            'DoFixedCost','off');
    end
    
else
    if(strcmp(mdl,'sm_boom_lift_crawler_abstract'))
        set_param(mdl,'Solver','ode5','FixedStep','2e-2');
    else
        set_param(mdl,'Solver','ode3','FixedStep','2e-3');
    end
    if(~isempty(ls_hydr))
        set_param(ls_hydr,...
            'UseLocalSolver','on',...
            'ResidualTolerance','1e-6',...
            'DoFixedCost','off',...
            'MaxNonlinIter','5',...
            'LocalSolverChoice','NE_BACKWARD_EULER_ADVANCER',...
            'LocalSolverSampleTime','2e-3');
    end
    if(~isempty(ls_mech))
        set_param(ls_mech,...
            'UseLocalSolver','off',...
            'DoFixedCost','off');
    end
end
end
