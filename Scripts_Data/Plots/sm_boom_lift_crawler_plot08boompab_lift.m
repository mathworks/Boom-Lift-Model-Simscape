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
actList = {'Lift','Extend','Jib'};
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
if ~exist('h8_sm_boom_lift_crawler', 'var') || ...
        ~isgraphics(h8_sm_boom_lift_crawler, 'figure')
    h8_sm_boom_lift_crawler = figure('Name', 'sm_boom_lift_crawler');
end
figure(h8_sm_boom_lift_crawler)
clf(h8_sm_boom_lift_crawler)

simlog_handles(1) = subplot(4, 1, 1);
plot(simlog_t, simlog_LiftpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_LiftpB, 'LineWidth', 1)
hold off
grid on
legend({'Lift pA','Lift pB'},'Location','Best');
ylabel('Pressure (psi)');
title('Boom Pressures: Lift, Extend, Jib');

simlog_handles(2) = subplot(4, 1, 2);
plot(simlog_t, simlog_ExtendpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_ExtendpB, 'LineWidth', 1)
hold off
grid on
legend({'Extend pA','Extend pB'},'Location','Best');
ylabel('Pressure (psi)');

simlog_handles(3) = subplot(4, 1, 3);
plot(simlog_t, simlog_JibpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_JibpB, 'LineWidth', 1)
hold off
grid on
ylabel('Pressure (psi)');
legend({'Jib pA','Jib pB'},'Location','Best');

simlog_handles(4) = subplot(4, 1, 4);
plot(simlog_t, simlog_Liftp*100/2.54, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_Extendp*100/2.54, 'LineWidth', 1)
plot(simlog_t, simlog_Jibp*100/2.54, 'LineWidth', 1)
hold off
grid on
legend({'Lift','Extend','Jib'},'Location','Best');
ylabel('Ext. (in.)')
xlabel('Time (s)');
title('Actuator Position');
linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_handles
