% Code to plot simulation results from sm_boom_lift_crawler
%% Plot Description:
%

% Copyright 2020-2023 The MathWorks, Inc.

% Get simulation results
RetWkspName = get_param(bdroot,'ReturnWorkspaceOutputsName');
simlog_Actuator = eval([RetWkspName '.logsout_sm_boom_lift_crawler.get(''Actuators'')']);
% For when Solver Profiler is used
%simlog_Actuator = logsout_sm_boom_lift_crawler.get('Actuators');

actNames = fieldnames(simlog_Actuator.Values.Mech);
varNames = fieldnames(simlog_Actuator.Values.Mech.(actNames{1}));
simlog_t = simlog_Actuator.Values.Mech.(actNames{1}).(varNames{1}).Time;
noData = simlog_t*0;
actList = {'LevelM','LevelS','Tilt'};
for i=1:length(actList)
    aN_ind = find(strcmp(actNames,actList{i}));
    %disp([actList{i} ': ' num2str(aN_ind)])
    if(~isempty(aN_ind))
        assignin('base',['simlog_' actList{i} 'p'],...
            eval(['simlog_Actuator.Values.Mech.' actList{i} '.p.Data']));
        assignin('base',['simlog_' actList{i} 'f'],...
            eval(['simlog_Actuator.Values.Mech.' actList{i} '.f.Data']));
    else
        assignin('base',['simlog_' actList{i} 'p'],noData);
        assignin('base',['simlog_' actList{i} 'f'],noData);
    end
end

%% Plot results

% Reuse figure if it exists, else create new figure
if ~exist('h4_sm_boom_lift_crawler', 'var') || ...
        ~isgraphics(h4_sm_boom_lift_crawler, 'figure')
    h4_sm_boom_lift_crawler = figure('Name', 'sm_boom_lift_crawler');
end
figure(h4_sm_boom_lift_crawler)
clf(h4_sm_boom_lift_crawler)

simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_Tiltp*100/2.54, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_LevelMp*100/2.54, 'LineWidth', 1)
plot(simlog_t, simlog_LevelSp*100/2.54, 'LineWidth', 1)
hold off

grid on
ylabel('Extension (in)')
title('Boom Motions: Tilt, Level Master, Level Slave')
legend({'Tilt','Bucket Master','Bucket Slave'},'Location','Best');

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_t, simlog_Tiltf, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_LevelMf, 'LineWidth', 1)
plot(simlog_t, simlog_LevelSf, 'LineWidth', 1)
ylabel('Force (N)')
hold off

grid on
title('Required Actuator Force')
ylabel('Force (N)')
xlabel('Time (s)')

maxF = max(abs([simlog_LevelMf;simlog_LevelSf;simlog_Tiltf]));
if(maxF == 0)
    set(gca,'YLim',[-1 1])
else
    set(gca,'YLim',[-1.1 1.1]*maxF)
end

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_handles

