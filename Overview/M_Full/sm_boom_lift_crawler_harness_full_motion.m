%% Boom Lift Crawler with Ideal Actuation (Test Harness)
%
% This example models a boom lift and its chassis with ideal actuators. The
% model is used to identify requirements for the actuators. The lift has 6
% actuators in the chassis, 7 actuators in the boom, and one other passive
% hydraulic cylinder.
%
% This model is a test harness from the main model (see <matlab:web('sm_boom_lift_crawler.html'); documentation>)
%
% Copyright 2020-2025 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('full%20motion') Open Model>

sm_boom_lift_crawler_harness_open('full motion')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is the entire boom lift mechanism (chassis and
% boom). All linkages are modeled as well as ground contact for the
% outriggers and the tracks.

%%
open_system([bdroot '/Lift']);

%%
% This system models the chassis with the outriggers to keep the boom
% level and the tracks for moving the entire boom lift.

open_system([bdroot '/Lift/Chassis']);

%%
% This system models the boom with linkages and a telescoping beam to raise
% and position the basket.

open_system([bdroot '/Lift/Boom']);

%% Simulation Results: Full Sequence
%%
%
% The plot below shows a test sequence designed to rotate the boom.
% Motions of all joints are specified so that this sequence can be used on
% a full model of the boom lift that uses prescribed motion for any
% combination of the actuators.

sm_boom_lift_crawler_settest('full test');
sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the outriggers along with applied actuator force.
sm_boom_lift_crawler_plot01chassispf_outr

%%
% Motion of the tracks along with applied actuator force.
sm_boom_lift_crawler_plot02chassispf_track

%%
% Motion of the lift, extend, and jib actuators along with applied actuator force.
sm_boom_lift_crawler_plot03boompf_lift

%%
% Motion of the tilt, and basket leveling actuators along with applied actuator force.
sm_boom_lift_crawler_plot04boompf_tilt

%%
% Motion of the turret and basket rotation actuators along with applied actuator torques.
sm_boom_lift_crawler_plot05boompf_rotate


%%

%clear all
%close all
bdclose all
