function sm_boom_lift_crawler_setsolver(mdl,varfixed)
%SM_BOOM_LIFT_CRAWLER_SETSOLVER Configure solver
%   Set solver settings in sm_boom_lift_crawler models for variable or
%   fixed-step simulation.
%
% Copyright 2020-2023 The MathWorks, Inc.

f    = Simulink.FindOptions('FollowLinks',1,'LookUnderMasks','all');
solverBlock_pth = getfullname(Simulink.findBlocks(mdl, 'SubClassName', 'solver',f));

% If only one element is found, getfullname returns char
% Convert to cell
if (ischar(solverBlock_pth))
    solverBlock_pth = {solverBlock_pth};
end

ls_hydr_ind = find(startsWith(solverBlock_pth,[mdl '/Hydr']));
ls_mech_ind = find(startsWith(solverBlock_pth,[mdl '/Mech']));

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
