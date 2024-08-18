%% Boom Lift with Hydraulic Actuation (Test Harness)
%
% This example models the hydraulic system that raises and lowers a boom.
% A double-acting cylinder raises and lowers the boom, and counterbalance
% valves ensure a controlled descent.
%
% This model is a test harness from the main model (see <matlab:web('sm_boom_lift_crawler.html'); documentation>)
%
% Copyright 2020-2024 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('lift%20hydr'); Open Model>

sm_boom_lift_crawler_harness_open('lift hydr')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component we are testing is a hydraulic system that raises and lowers
% a boom. The hydraulic network contains a four-way valve to control
% actuation direction and two counterbalance valves. The counterbalance
% valves prevent runaway loads by creating additional pressure in the
% discharge line of a hydraulic actuator. One double-acting cylinder
% actuates the unit.

open_system([bdroot '/Tower Lift']);

%% Simulation Results: Lift Sequence
%%
%
% The plots below shows the result of a test sequence designed to only lift
% the boom.  The test sequence includes signals for all valves so that the
% test sequence can also be run on the full model.
%

sm_boom_lift_crawler_settest('lift test');
sm_boom_lift_crawler_plot11valveseq(tVec,oVec)

%%
%
% Below is the corresponding prescribed motion for the test.  This allows
% testing on a full model that has motion for any combination of the
% actuators.

sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the lift, extend, and jib cylinders along with applied
% actuator force.
sm_boom_lift_crawler_plot03boompf_lift

%%
% Hydraulic pressures in the actuators along with actuator position.

sm_boom_lift_crawler_plot08boompab_lift

%%

%clear all
%close all
bdclose all
