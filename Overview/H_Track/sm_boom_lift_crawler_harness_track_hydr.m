%% Boom Lift Crawler Tracks with Hydraulic Actuation (Test Harness)
%
% This example models a hydraulic system that sets the separation of the
% tracks on a boom lift.  Two hydraulic cylinders extend or retract to set
% the separation. A directional valve controls if they extend or retract.
% No additional valves are needed to lock the tracks in place as they are
% not intended to be used in a situation where gravity can influence their
% position.
%
% This model is a test harness from the main model (see
% <matlab:web('sm_boom_lift_crawler.html'); documentation>).
%
% Copyright 2020 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('track%20hydr'); Open Model>

sm_boom_lift_crawler_harness_open('track hydr')

set_param(find_system(bdroot,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test testing is a hydraulic system sets the
% separation of the tracks on a boom lift. The hydraulic network contains a
% four-way valve that determines if the track separation increases or
% decreases. There are no valves to lock the cylinders mid-stroke. Because
% fluid can move between the cylinders even if the 4-way directional valve
% is closed, the tracks will shift to one side if pushed on the other
% (unless the cylinders are both fully extended or both fully retracted).


open_system([bdroot '/Track Extend']);

%% Simulation Results: Lift Sequence
%%
%
% The plots below shows the result of a test sequence designed to only
% extend or retract the tracks.  The test sequence includes signals for all
% valves so that the test sequence can also be run on the full model.
%

sm_boom_lift_crawler_settest('track test');
sm_boom_lift_crawler_plot11valveseq(tVec,oVec)

%%
%
% Below is the corresponding prescribed motion for the test.  This allows
% testing on a full model that has motion for any combination of the
% actuators.

sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the track cylinders along with applied
% actuator force.
sm_boom_lift_crawler_plot02chassispf_track

%%
% Hydraulic pressures in the actuators along with actuator position.

sm_boom_lift_crawler_plot07chassispab_track

%%

%clear all
%close all
bdclose all
