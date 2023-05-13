% Code to plot simulation results from sm_boom_lift_crawler
%% Plot Description:
%

% Copyright 2020-2023 The MathWorks, Inc.

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
actList = {'Tilt','LevelM','LevelS'};
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
        assignin('base',['simlog_' actList{i} 'p'],...
            eval(['simlog_Actuator.Values.Mech.' actList{i} '.p.Data']));
    else
        assignin('base',['simlog_' actList{i} 'p'],noData);
    end    
    
end

%% Plot results

% Reuse figure if it exists, else create new figure
if ~exist('h9_sm_boom_lift_crawler', 'var') || ...
        ~isgraphics(h9_sm_boom_lift_crawler, 'figure')
    h9_sm_boom_lift_crawler = figure('Name', 'sm_boom_lift_crawler');
end
figure(h9_sm_boom_lift_crawler)
clf(h9_sm_boom_lift_crawler)

simlog_handles(1) = subplot(4, 1, 1);
plot(simlog_t, simlog_TiltpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_TiltpB, 'LineWidth', 1)
hold off
grid on
ylabel('Pressure (psi)');
legend({'Tilt pA','Tilt pB'},'Location','Best');
title('Boom Pressures: Tilt, Level Master, Level Slave');

simlog_handles(2) = subplot(4, 1, 2);
plot(simlog_t, simlog_LevelMpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_LevelMpB, 'LineWidth', 1)
hold off
grid on
ylabel('Pressure (psi)');
legend({'LevelM pA','LevelM pB'},'Location','Best');

simlog_handles(3) = subplot(4, 1, 3);
plot(simlog_t, simlog_LevelSpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_LevelSpB, 'LineWidth', 1)
hold off
grid on
ylabel('Pressure (psi)');
legend({'LevelS pA','LevelS pB'},'Location','Best');

simlog_handles(4) = subplot(4, 1, 4);
plot(simlog_t, simlog_Tiltp*100/2.54, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_LevelMp*100/2.54, 'LineWidth', 1)
plot(simlog_t, simlog_LevelSp*100/2.54, 'LineWidth', 1)
hold off
grid on
ylabel('Ext. (in.)');
xlabel('Time (s)');
legend({'Tilt','LevelM','LevelS'},'Location','Best');
title('Actuator Position');
linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_handles
