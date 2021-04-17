%% Boom Turret with Hydraulic Actuation (Test Harness)
%
% This example models the hydraulic actuator for the turret of a boom lift.
% A worm drive boosts the torque provided by the rotational actuator so
% that it can rotate the entire boom into position.  
%
% This model is a test harness from the main model (see <matlab:web('sm_boom_lift_crawler.html'); documentation>)
%
% Copyright 2020-2021 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('turret%20hydr'); Open Model>

sm_boom_lift_crawler_harness_open('turret hydr')

set_param(find_system(bdroot,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is a hydraulic actuation system to rotate the
% turret of a boom lift.  A slew drive with self-locking worm and gear
% turns to swivel the boom on the chassis. A relief valve on each side
% bleeds pressure to tank. The pressure relief valves allow the slew drive
% to spool down after the 4-way valve closes to avoid pressure spikes.
% 
open_system([bdroot '/Turret Rotate']);

%% Simulation Results: Turret Sequence
%%
%
% The plots below shows the result of a test sequence designed to actuate
% only the rotational actuator for the turret.  The test sequence includes
% signals for all valves so that the test sequence can also be run on the
% full model.
%
sm_boom_lift_crawler_settest('turret test');
sm_boom_lift_crawler_plot11valveseq(tVec,oVec)

%%
%
% Below is the corresponding prescribed motion for the test.  This allows
% testing on a full model that has motion for any combination of the
% actuators.

sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the turret along with applied actuator force.
sm_boom_lift_crawler_plot05boompf_rotate

%%
% Hydraulic pressures in the actuators along with actuator position.

sm_boom_lift_crawler_plot10boompab_rotate

%%
%clear all
%close all
bdclose all
