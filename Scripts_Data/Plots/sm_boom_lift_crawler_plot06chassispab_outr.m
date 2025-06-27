% Code to plot simulation results from sm_boom_lift_crawler
%% Plot Description:
%

% Copyright 2020-2024 The MathWorks, Inc.

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
actList = {'OutFL','OutFR','OutRL','OutRR'};

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
if ~exist('h6_sm_boom_lift_crawler', 'var') || ...
        ~isgraphics(h6_sm_boom_lift_crawler, 'figure')
    h6_sm_boom_lift_crawler = figure('Name', 'sm_boom_lift_crawler');
end
figure(h6_sm_boom_lift_crawler)
clf(h6_sm_boom_lift_crawler)

simlog_handles(1) = subplot(5, 1, 1);
plot(simlog_t, simlog_OutFLpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_OutFLpB, 'LineWidth', 1)
hold off
grid on

title('Chassis Pressures: Outriggers')
ylabel('(psi)');
legend({'FL pA','FL pB'},'Location','Best');

simlog_handles(2) = subplot(5, 1, 2);
plot(simlog_t, simlog_OutFRpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_OutFRpB, 'LineWidth', 1)
hold off
grid on

ylabel('(psi)');
legend({'FR pA','FR pB'},'Location','Best');
set(gca,'XTickLabel',[]);

simlog_handles(3) = subplot(5, 1, 3);
plot(simlog_t, simlog_OutRLpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_OutRLpB, 'LineWidth', 1)
hold off

grid on
ylabel('(psi)');
set(gca,'XTickLabel',[]);
legend({'RL pA','RL pB'},'Location','Best');

simlog_handles(4) = subplot(5, 1, 4);
plot(simlog_t, simlog_OutRRpA, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_OutRRpB, 'LineWidth', 1)
hold off
grid on

ylabel('(psi)');
set(gca,'XTickLabel',[]);
legend({'RR pA','RR pB'},'Location','Best');

simlog_handles(5) = subplot(5, 1, 5);
plot(simlog_t, simlog_OutFLp*100/2.54, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_OutFRp*100/2.54, 'LineWidth', 1)
plot(simlog_t, simlog_OutRLp*100/2.54, 'LineWidth', 1)
plot(simlog_t, simlog_OutRRp*100/2.54, 'LineWidth', 1)
hold off
grid on
ylabel('Ext. (In.)');
xlabel('Time (s)');
legend({'OutFL','OutFR','OutRL','OutRR'},'Location','Best');
linkaxes(simlog_handles, 'x')
title('Actuator Position');

% Remove temporary variables
clear simlog_handles

