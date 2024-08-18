%% Boom with Ideal Actuation (Test Harness)
%
% This example shows the boom portion of a boom lift with ideal actuation.
% It includes mechanisms to orient, raise, and position a basket where the
% operator can stand.  The model is used to identify requirements for the boom
% actuators.
%
% This model is a test harness from the main model (see <matlab:web('sm_boom_lift_crawler.html'); documentation>)
%
% Copyright 2020-2024 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('boom%20motion'); Open Model>

sm_boom_lift_crawler_harness_open('boom motion')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is the entire boom mechanism for lifting,
% tilting, extending, and rotating the boom and basket of a boom lift.

%%
open_system([bdroot '/Boom']);

%%
% The tower portion can raise and tilt the telescoping arm.  A linear
% actuator and pulleys to extend and retract the arm.

open_system([bdroot '/Boom/Arms']);

%%
% Two opposing pulley systems (retract and extend) are on the telescoping
% arm, each with two cables.

open_system([bdroot '/Boom/Arms/Telescope/Pulley System']);

%%
% The extension pulley system has two cables that wrap around the same pulley.

open_system([bdroot '/Boom/Arms/Telescope/Pulley System/Extension']);

%%
% The retraction pulley system has two cables that wrap around two separate
% pulleys. They also each have a pulley constraint that represents a fixed
% pulley that acts as a guide near the attachment point to the base beam.

open_system([bdroot '/Boom/Arms/Telescope/Pulley System/Retraction']);


%%
% Actuators can raise the basket and orient it with respect to the boom.

open_system([bdroot '/Boom/Basket']);

%% Simulation Results: Turret Sequence
%%
%
% The plot below shows a test sequence designed to rotate the boom.
% Motions of all joints are specified so that this sequence can be used on
% a full model of the boom lift that uses prescribed motion for any
% combination of the actuators.

sm_boom_lift_crawler_settest('turret test');
sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the turret and basket rotation actuators along with applied
% actuator torque.
sm_boom_lift_crawler_plot05boompf_rotate

%% Simulation Results: Lift Sequence
%%
%
% The plot below shows a test sequence designed to lift the boom.
% Motions of all joints are specified so that this sequence can be used on
% a full model of the boom lift that uses prescribed motion for any
% combination of the actuators.

sm_boom_lift_crawler_settest('lift test');
sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the lift, extend, and jib actuators along with applied
% actuator force.
sm_boom_lift_crawler_plot03boompf_lift

%% Simulation Results: Tilt Sequence
%%
%
% The plot below shows a test sequence designed to tilt and extend the boom.
% Motions of all joints are specified so that this sequence can be used on
% a full model of the boom lift that uses prescribed motion for any
% combination of the actuators.

sm_boom_lift_crawler_settest('tilt test');
sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of actuators along with applied actuator force.
sm_boom_lift_crawler_plot04boompf_tilt

%%

%clear all
%close all
bdclose all
