%% Boom Lift Crawler Jib with Hydraulic Actuation 1D Load (Test Harness)
%
% This example models a hydraulic system that extends a jib for a
% boom lift basket.  In this test harness, the load is approximated as a
% inertia of constant value. It ignores the changes that take place as the
% parallelogram mechanism expands and assumes the actuator is always acting
% exactly opposite the direction of gravity.
%
% This model is a test harness from the main model (see
% <matlab:web('sm_boom_lift_crawler.html'); documentation>).
%
% Copyright 2020-2023 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('jib%20hydr%201D'); Open Model>

sm_boom_lift_crawler_harness_open('jib hydr 1D')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is a hydraulic system to extends a an actuator
% that raises a boom lift basket. A double-acting cylinder with two
% counterbalance valves extends to open the raise the jib. The
% counterbalance valves lock the cylinder in place when the 4-way valve
% returns to center. The lock persists if a hose upstream bursts so the
% boom does not collapse. The "counterbalance" in the valves keeps the
% cylinder from running ahead of the pump under gravity.  This condition
% would cause it to ratchet were it fitted with the pilot check valves of
% the outriggers.

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

%clear all
%close all
bdclose all
