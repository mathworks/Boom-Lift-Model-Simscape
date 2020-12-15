%% Boom Lift Crawler Jib with Hydraulic Actuation (Test Harness)
%
% This example models a hydraulic system that extends a jib for a
% boom lift basket.  A double-acting cylinder can raise or lower the jib.
% Counterbalance valves are used to ensure a controlled descent of the
% basket.
%
% This model is a test harness from the main model (see
% <matlab:web('sm_boom_lift_crawler.html'); documentation>).
%
% Copyright 2020 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('jib%20hydr%203D'); Open Model>

sm_boom_lift_crawler_harness_open('jib hydr 3D')

set_param(find_system(bdroot,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is a hydraulic system to extends an actuator
% that raises a boom lift basket. A double-acting cylinder with two
% counterbalance valves extends to raise the jib. The counterbalance valves
% lock the cylinder in place when the 4-way valve returns to center. The
% lock persists if a hose upstream bursts so the boom does not collapse.
% The counterbalance in the valves keeps the cylinder from running ahead of
% the pump under gravity.  This condition would cause it to ratchet if
% pilot operated check valves were used, as are shown in the outriggers.

open_system([bdroot '/Jib Lift']);

%% Simulation Results: Jib Sequence
%%
%
% The plots below shows the result of a test sequence designed to raise and
% lower the jib.  The test sequence includes signals for all valves so that
% the test sequence can also be run on the full model.
%

sm_boom_lift_crawler_settest('jib test');
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

%% Simulation Results: Extend Sequence
%%
%
% The plots below shows the result of a test sequence designed to raise and
% lower the jib.  In this test sequence, the tilt function is exercised to
% see how it affects jib actuation. The test sequence includes signals for
% all valves so that the test sequence can also be run on the full model.
%

sm_boom_lift_crawler_settest('extend tilt test');
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
