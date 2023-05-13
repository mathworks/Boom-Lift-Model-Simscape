function sm_boom_lift_crawler_plot11valveseq(tVec,oVec)
% Code to plot simulation results from sm_boom_lift_crawler
%% Plot Description:
%

% Copyright 2020-2023 The MathWorks, Inc.

%% Plot results
% Reuse figure if it exists, else create new figure
figString = 'h11_sm_boom_lift_crawler_valves';
% Only create a figure if no figure exists
figExist = 0;
fig_hExist = evalin('base',['exist(''' figString ''')']);
if (fig_hExist)
    figExist = evalin('base',['ishandle(' figString ') && strcmp(get(' figString ', ''type''), ''figure'')']);
end
if ~figExist
    fig_h = figure('Name',figString);
    assignin('base',figString,fig_h);
else
    fig_h = evalin('base',figString);
end
figure(fig_h)
clf(fig_h)

time_vec = 0:0.02:tVec.StopTime;

% Sky valves
osc1 = interp1(tVec.sky.c1.all,oVec.sky.c1.all,time_vec,'previous','extrap')*0.45;
osc2 = interp1(tVec.sky.c2.all,oVec.sky.c2.all,time_vec,'previous','extrap')*0.45;
osc3 = interp1(tVec.sky.c3.all,oVec.sky.c3.all,time_vec,'previous','extrap')*0.45;
osc4 = interp1(tVec.sky.c4.all,oVec.sky.c4.all,time_vec,'previous','extrap')*0.45;
osr1 = interp1(tVec.sky.r1.all,oVec.sky.r1.all,time_vec,'previous','extrap')*0.45;
osr2 = interp1(tVec.sky.r2.all,oVec.sky.r2.all,time_vec,'previous','extrap')*0.45;
osp  = interp1(tVec.sky.proportional,oVec.sky.proportional,time_vec,'previous','extrap')*0.9;

plot(time_vec, osp+11.05, 'LineWidth', 2);
hold on
plot(time_vec, osr2+10.5, 'LineWidth', 1)
plot(time_vec, osc4+9.5, 'LineWidth', 1)
plot(time_vec, osc3+8.5, 'LineWidth', 1)
plot(time_vec, osc2+7.5, 'LineWidth', 1)
plot(time_vec, osc1+6.5, 'LineWidth', 1)
plot(time_vec, osr1+5.5, 'LineWidth', 1)

% Deviator Valves
ods = interp1(tVec.deviators.sky,oVec.deviators.sky,time_vec,'previous','extrap')*0.45;
odg = interp1(tVec.deviators.ground,oVec.deviators.ground,time_vec,'previous','extrap')*0.45;

plot(time_vec, ods+4.5, 'LineWidth', 1)
plot(time_vec, odg+3.5, 'LineWidth', 1)

% Ground Valves
ogc1 = interp1(tVec.ground.c1.all,oVec.ground.c1.all,time_vec,'previous','extrap')*0.45;
ogc5 = interp1(tVec.ground.c5.all,oVec.ground.c5.all,time_vec,'previous','extrap')*0.45;
ogp  = interp1(tVec.ground.proportional,oVec.ground.proportional,time_vec,'previous','extrap')*0.9;

plot(time_vec, ogp+2.05, 'LineWidth', 2)
plot(time_vec, ogc1+1.5, 'LineWidth', 1)
plot(time_vec, ogc5+0.5, 'LineWidth', 1)

set(gca,'YLim',[0 12])
set(gca,'YTick',[0.5:1:11.5])
set(gca,'YTickLabel',{...
    tVec.ground.c5.name,...
    tVec.ground.c1.name,...
    'Gnd Prop',...
    'Gnd Dev',...
    'Sky Dev',... 
    tVec.sky.r1.name,...
    tVec.sky.c1.name,...
    tVec.sky.c2.name,...
    tVec.sky.c3.name,...
    tVec.sky.c4.name,...
    tVec.sky.r2.name,...
    'Sky Prop'})

xlabel('Time (s)');
title(['Valve Sequence: ' tVec.SeqName])

% Remove temporary variables
clear simlog_handles
