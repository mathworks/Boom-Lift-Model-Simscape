function sm_boom_lift_crawler_plot13operatorseq(operator_seq)
% Code to plot operation sequence from sm_boom_lift_crawler_abstract
%% Plot Description:
%

% Copyright 2020-2024 The MathWorks, Inc.

%% Plot results
% Reuse figure if it exists, else create new figure
figString = 'h13_sm_boom_lift_crawler_valves';
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

time_vec = 0:0.02:operator_seq.StopTime;

% Sky valves
basketR = interp1(operator_seq.basketR.t,operator_seq.basketR.q,time_vec,'previous','extrap')*0.45;
jib     = interp1(operator_seq.jib.t,    operator_seq.jib.p,time_vec,'previous','extrap')*0.45;
extend  = interp1(operator_seq.extend.t, operator_seq.extend.p,time_vec,'previous','extrap')*0.45;
tilt    = interp1(operator_seq.tilt.t,   operator_seq.tilt.p,time_vec,'previous','extrap')*0.45;
lift    = interp1(operator_seq.lift.t,   operator_seq.lift.p,time_vec,'previous','extrap')*0.45;
turret  = interp1(operator_seq.turret.t, operator_seq.turret.q,time_vec,'previous','extrap')*0.45;
outr    = interp1(operator_seq.outFL.t,  operator_seq.outFL.p,time_vec,'previous','extrap')*0.45;
track   = interp1(operator_seq.TrackL.t, operator_seq.TrackL.p,time_vec,'previous','extrap')*0.45;

plot(0,0); % Placeholder for colors
hold on
plot(time_vec, basketR+10.5, 'LineWidth', 1)
plot(time_vec, jib+9.5, 'LineWidth', 1)
plot(time_vec, extend+8.5, 'LineWidth', 1)
plot(time_vec, tilt+7.5, 'LineWidth', 1)
plot(time_vec, lift+6.5, 'LineWidth', 1)
plot(time_vec, turret+5.5, 'LineWidth', 1)

% Deviator Valves
plot(0,0); % Placeholder for colors
plot(0,0); % Placeholder for colors
plot(0,0); % Placeholder for colors

% Ground Valves
plot(time_vec, outr+1.5, 'LineWidth', 1)
plot(time_vec, track+0.5, 'LineWidth', 1)

set(gca,'YLim',[0 12])
set(gca,'YTick',[0.5:1:11.5])
set(gca,'YTickLabel',{...
    'Track',...
    'Outrigger',...
    ' ',...
    ' ',...
    ' ',... 
    'Turret',...
    'Lift',...
    'Tilt',...
    'Extend',...
    'Jib',...
    'BasketR',...
    ' '})

xlabel('Time (s)');
title(['Operator Sequence: ' operator_seq.name])

% Remove temporary variables
clear simlog_handles
