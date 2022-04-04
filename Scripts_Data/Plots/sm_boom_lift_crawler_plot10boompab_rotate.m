% Code to plot simulation results from sm_boom_lift_crawler
%% Plot Description:
%

% Copyright 2020-2022 The MathWorks, Inc.

% Get simulation results
RetWkspName = get_param(bdroot,'ReturnWorkspaceOutputsName');
simlog_Actuator = eval([RetWkspName '.logsout_sm_boom_lift_crawler.get(''Actuators'')']);
% For when Solver Profiler is used
%simlog_Actuator = logsout_sm_boom_lift_crawler.get('Actuators');

if(isfield(simlog_Actuator.Values,'Hydr'))
    HactNames = fieldnames(simlog_Actuator.Values.Hydr);
else
    HactNames = [];
end

MactNames = fieldnames(simlog_Actuator.Values.Mech);
varNames = fieldnames(simlog_Actuator.Values.Mech.(MactNames{1}));
simlog_t = simlog_Actuator.Values.Mech.(MactNames{1}).(varNames{1}).Time;

noData = simlog_t*0;
actList = {'BasketR','Turret'};
for i=1:length(actList)
    aN_ind = find(strcmp(HactNames,actList{i}), 1);
    if(~isempty(aN_ind))
        assignin('base',['simlog_' actList{i} 'pA'],...
            eval(['simlog_Actuator.Values.Hydr.' actList{i} '.A.P.Data*0.000145038']));
        assignin('base',['simlog_' actList{i} 'pB'],...
            eval(['simlog_Actuator.Values.Hydr.' actList{i} '.B.P.Data*0.000145038']));
    else
        assignin('base',['simlog_' actList{i} 'pA'],noData);
        assignin('base',['simlog_' actList{i} 'pB'],noData);
    end
    aN_ind = find(strcmp(MactNames,actList{i}));
    if(~isempty(aN_ind))
        assignin('base',['simlog_' actList{i} 'q'],...
            eval(['simlog_Actuator.Values.Mech.' actList{i} '.q.Data']));
    else
        assignin('base',['simlog_' actList{i} 'q'],noData);
    end
end

%% Plot results

% Reuse figure if it exists, else create new figure
if ~exist('h11_sm_boom_lift_crawler', 'var') || ...
        ~isgraphics(h11_sm_boom_lift_crawler, 'figure')
    h11_sm_boom_lift_crawler = figure('Name', 'sm_boom_lift_crawler');
end
figure(h11_sm_boom_lift_crawler)
clf(h11_sm_boom_lift_crawler)


simlog_handles(1) = subplot(3, 1, 1);
plot(simlog_t, simlog_TurretpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_TurretpB, 'LineWidth', 1)
hold off
grid on
legend({'Turret pA','Turret pB'},'Location','Best');
ylabel('Pressure (psi)');
title('Boom Pressures: Turret, Basket Rotate');

simlog_handles(2) = subplot(3, 1, 2);
plot(simlog_t, simlog_BasketRpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_BasketRpB, 'LineWidth', 1)
hold off
grid on
ylabel('Pressure (psi)');
legend({'BasketR pA','BasketR pB'},'Location','Best');

simlog_handles(3) = subplot(3, 1, 3);
yyaxis left
plot(simlog_t, simlog_Turretq*180/pi, 'LineWidth', 1)
ylabel('Angle (deg)')

yyaxis right
plot(simlog_t, simlog_BasketRq*180/pi, 'LineWidth', 1)
ylabel('Angle (deg)');
grid on

xlabel('Time (s)');
legend({'Turret','BasketR'},'Location','Best');
title('Actuator Position');
linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_handles
