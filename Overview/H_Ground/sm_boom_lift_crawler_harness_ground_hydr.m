%% Boom Lift Crawler Chassis with Hydraulic Actuation (Test Harness)
%
% This example models the hydraulic actuation system for the chassis of a
% boom lift.  Four actuators extend and contract to position the
% outriggers, and two other actuators control the separation of the two
% tracks.  This model is used to examine the hydraulic system.
%
% This model is a test harness from the main model (see
% <matlab:web('sm_boom_lift_crawler.html'); documentation>).
%
% Copyright 2020-2022 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('ground%20manifold%20hydr'); Open Model>

sm_boom_lift_crawler_harness_open('ground manifold hydr')

set_param(find_system(bdroot,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is a hydraulic actuation system for the chassis
% of a boom lift. This includes the outriggers and track extension
% actuators. 
%

open_system([bdroot '/Ground Manifold'],'force');
%%
%
% Double-acting cylinders with three pilot check valves extend to lower the
% outrigger. The pilot check valves lock the cylinder in place when the
% 4-way valve returns to center, even if a hose upstream bursts so the
% outriggers don’t collapse. Two pilot check valves are on the extend side
% of the cylinder in case one fails while the system is in use.

open_system([bdroot '/Ground Manifold/Ground Valve Block Right'],'force');

%%
%
% The track actuation system inculudes a four-way valve that determines if
% the track separation increases or decreases. There are no valves to lock
% the cylinders mid-stroke.

open_system([bdroot '/Ground Manifold/Ground Valve Block Left'],'force');

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
% Motion of the outrigger actuators along with applied actuator force.
sm_boom_lift_crawler_plot01chassispf_outr

%%
% Hydraulic pressures in the outrigger actuators along with actuator position.

sm_boom_lift_crawler_plot06chassispab_outr

%%
% Motion of the track actuators along with applied actuator force.

sm_boom_lift_crawler_plot02chassispf_track

%%
% Hydraulic pressures in the track actuators along with actuator position.

sm_boom_lift_crawler_plot07chassispab_track


%%
%clear all
%close all
bdclose all
