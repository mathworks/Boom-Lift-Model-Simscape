% Code to plot simulation results from sm_boom_lift_crawler
%% Plot Description:
%

% Copyright 2020-2021 The MathWorks, Inc.
    
% Get simulation results
RetWkspName = get_param(bdroot,'ReturnWorkspaceOutputsName');
simlog_Actuator = eval([RetWkspName '.logsout_sm_boom_lift_crawler.get(''Actuators'')']);
% For when Solver Profiler is used
%simlog_Actuator = logsout_sm_boom_lift_crawler.get('Actuators');

actNames = fieldnames(simlog_Actuator.Values.Mech);
varNames = fieldnames(simlog_Actuator.Values.Mech.(actNames{1}));
simlog_t = simlog_Actuator.Values.Mech.(actNames{1}).(varNames{1}).Time;
noData = simlog_t*0;
actList = {'BasketR','Turret'};
for i=1:length(actList)
    aN_ind = find(strcmp(actNames,actList{i}));
    if(~isempty(aN_ind))
        assignin('base',['simlog_' actList{i} 'q'],...
            eval(['simlog_Actuator.Values.Mech.' actList{i} '.q.Data']));
        assignin('base',['simlog_' actList{i} 't'],...
            eval(['simlog_Actuator.Values.Mech.' actList{i} '.t.Data']));
    else
        assignin('base',['simlog_' actList{i} 'q'],noData);
        assignin('base',['simlog_' actList{i} 't'],noData);
    end
end

%% Plot results

% Reuse figure if it exists, else create new figure
if ~exist('h5_sm_boom_lift_crawler', 'var') || ...
        ~isgraphics(h5_sm_boom_lift_crawler, 'figure')
    h5_sm_boom_lift_crawler = figure('Name', 'sm_boom_lift_crawler');
end
figure(h5_sm_boom_lift_crawler)
clf(h5_sm_boom_lift_crawler)

simlog_handles(1) = subplot(2, 1, 1);
yyaxis left
plot(simlog_t, simlog_Turretq*180/pi, 'LineWidth', 1)
ylabel('Angle (deg)')

yyaxis right
plot(simlog_t, simlog_BasketRq*180/pi, 'LineWidth', 1)
grid on

ylabel('Angle (deg)')
legend({'Turret','BasketR'},'Location','Best');
title('Boom Motion: Turret, Basket Rotate')

simlog_handles(2) = subplot(2, 1, 2);
yyaxis left
plot(simlog_t, simlog_Turrett, 'LineWidth', 1)
ylabel('Torque (N*m)')
maxF = max(abs(simlog_Turrett));
if(maxF == 0)
    set(gca,'YLim',[-1 1])
else
    set(gca,'YLim',[-1.1 1.1]*maxF)
end
yyaxis right
plot(simlog_t, simlog_BasketRt, 'LineWidth', 1)
ylabel('Torque (N*m)')
maxF = max(abs(simlog_BasketRt));
if(maxF == 0)
    set(gca,'YLim',[-1 1])
else
    set(gca,'YLim',[-1.1 1.1]*maxF)
end

grid on
xlabel('Time (s)');
title('Required Actuator Torque')

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_handles

