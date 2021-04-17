%% Boom Lift Crawler Chassis with Ideal Actuation (Test Harness)
%
% This example models the chassis portion of a boom lift with ideal
% actuation. It includes the outriggers and tracks.  The model is used to
% identify requirements for the boom actuators.
%
% This model is a test harness from the main model (see
% <matlab:web('sm_boom_lift_crawler.html'); documentation>).
%
% Copyright 2020-2021 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('chassis%20motion'); Open Model>

sm_boom_lift_crawler_harness_open('chassis motion')

set_param(find_system(bdroot,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is the entire chassis mechanism including the
% outriggers and tracks. All linkages are modeled as well as ground contact for the
% outriggers and the tracks.

%%
open_system([bdroot '/Chassis']);

%%
% Four outriggers extend and contract independently to keep the boom level
% on uneven ground.  They can also be rotated into different positions
% about the vertical axis of the boom.

open_system([bdroot '/Chassis/Outrigger FL']);

%%
% The separation of the tracks is set by the extension of the hydraulic
% cylinders.

open_system([bdroot '/Chassis/Tracks']);

%% Simulation Results: Chassis Sequence
%%
%
% The plot below shows a test sequence designed to actuate the outriggers
% and tracks. Motions of all joints are specified so that this sequence can
% be used on a full model of the boom lift that uses prescribed motion for
% any combination of the actuators.

sm_boom_lift_crawler_settest('chassis test');
sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the outrigger actuators along with applied actuator force.
sm_boom_lift_crawler_plot01chassispf_outr

%%
% Motion of the track extender actuators along with applied actuator force.
sm_boom_lift_crawler_plot02chassispf_track


%%

%clear all
%close all
bdclose all
