%% Basket with Ideal Actuation (Test Harness)
%
% This example shows the basket portion of a boom lift with ideal
% actuation. The mechanism can raise and orient the basket relative to the
% boom. The model is used to identify requirements for the actuators.
%
% This model is a test harness from the main model (see <matlab:web('sm_boom_lift_crawler.html'); documentation>)
%
% Copyright 2020-2024 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('basket%motion'); Open Model>

sm_boom_lift_crawler_harness_open('basket motion')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is the mechanism for lifting and rotating the
% basket of a boom lift.

%%
open_system([bdroot '/Basket']);

%%
% The jib is a four-bar linkage that can raised or lowered for fine
% positioning of the jib.

open_system([bdroot '/Basket/Jib']);

%%
% A rotational actuator allows the basket to rotate about the end of the
% boom.

open_system([bdroot '/Basket/Basket Rotate']);

%% Simulation Results: Jib Sequence
%%
%
% The plot below shows a test sequence designed to extend the jib.
% Motions of all joints are specified so that this sequence can be used on
% a full model of the boom lift that uses prescribed motion for any
% combination of the actuators.

sm_boom_lift_crawler_settest('jib test');
sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the lift, extend, and jib actuators along with applied
% actuator force.
sm_boom_lift_crawler_plot03boompf_lift

%% Simulation Results: Tilt Sequence
%%
%
% The plot below shows a test sequence designed to tilt the boom. The
% extension of the slave cylinder is controlled by a master cylinder (not
% modeled) to keep the basket level. Motions of all joints are specified so
% that this sequence can be used on a full model of the boom lift that uses
% prescribed motion for any combination of the actuators.

sm_boom_lift_crawler_settest('tilt test');
sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the lift, extend, and jib actuators along with applied
% actuator force.
sm_boom_lift_crawler_plot03boompf_lift

%% Simulation Results: Rotate Sequence
%%
%
% The plot below shows a test sequence designed to rotate the basket.
% Motions of all joints are specified so that this sequence can be used on
% a full model of the boom lift that uses prescribed motion for any
% combination of the actuators.

sm_boom_lift_crawler_settest('basket rotate test');
sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of actuators along with applied actuator force.
sm_boom_lift_crawler_plot05boompf_rotate

%%

%clear all
%close all
bdclose all
