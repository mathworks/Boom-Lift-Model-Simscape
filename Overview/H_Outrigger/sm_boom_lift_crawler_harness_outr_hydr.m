%% Boom Lift Crawler Outrigger with Hydraulic Actuation (Test Harness)
%
% This example models the hydraulic actuation system for one outrigger of a
% boom lift. A double-acting cylinder extends or contracts to raise and
% lower the chassis.  Pilot-operated check valves lock the cylinder in
% place. In the boom lift, four outriggers move independently to keep the
% boom level and to distribute the load.
%
% This model is a test harness from the main model (see
% <matlab:web('sm_boom_lift_crawler.html'); documentation>).
%
% Copyright 2020-2022 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('outrigger%20hydr'); Open Model>

sm_boom_lift_crawler_harness_open('outrigger hydr')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is a hydraulic actuation system for the
% outriggers of a boom lift. A double-acting cylinder with three pilot
% check valves extends to lower the outrigger. The pilot check valves lock
% the cylinder in place when the 4-way valve returns to center, even if a
% hose upstream bursts so the outriggers don’t collapse. Two pilot check
% valves are on the extend side of the cylinder in case one fails while the
% system is in use.

open_system([bdroot '/Outrigger FL'],'force');

%% Simulation Results: Chassis Sequence
%%
%
% The plots below shows the result of a test sequence that extends and
% retracts all actuators in the chassis (outriggers and tracks).  The test
% sequence includes signals for all valves so that the test sequence can
% also be run on the full model.
%

sm_boom_lift_crawler_settest('chassis test');
sm_boom_lift_crawler_plot11valveseq(tVec,oVec)

%%
%
% Below is the corresponding prescribed motion for the test.  This allows
% testing on a full model that has motion for any combination of the
% actuators.

sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the actuators along with applied actuator force.
sm_boom_lift_crawler_plot01chassispf_outr

%%
% Hydraulic pressures in the actuators along with actuator position.

sm_boom_lift_crawler_plot06chassispab_outr

%%

%clear all
%close all
bdclose all
