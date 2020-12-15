%% Boom Extend with Hydraulic Actuation (Test Harness)
%
% This example models the hydraulic system that extends and contracts the
% telescoping arm of a boom. A double-acting hydraulic cylinder along with
% a pulley system controls arm extension.  A regenerative valve aids
% extension and ensure a controlled retraction of the arm.
%
% This model is a test harness from the main model (see
% <matlab:web('sm_boom_lift_crawler.html'); documentation>).
%
% Copyright 2020 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('extend%20hydr'); Open Model>

sm_boom_lift_crawler_harness_open('extend hydr')

set_param(find_system(bdroot,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component we are testing is a hydraulic system that extends a boom. A
% double-acting cylinder with a regenerative valve assembly extends a
% telescoping boom. The regenerative valve works on the extension stroke to
% block the return path of the rod end flow. The rod end flow, trapped,
% diverts to the blank end, where it adds to the pump flow to speed up the
% extension stroke.  This also lowers the extension force and slows down
% the retraction stroke.

open_system([bdroot '/Boom Extend']);

%% Simulation Results: Extend Sequence
%%
%
% The plots below shows the result of a test sequence designed to extend
% the boom.  Tilt and jib extend functions are also activated to see the
% effect on the extend actuation system. The test sequence includes signals
% for all valves so that the test sequence can also be run on the full
% model.
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
