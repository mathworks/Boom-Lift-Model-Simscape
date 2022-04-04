%% Basket Rotation with Hydraulic Actuation (Test Harness)
%
% This example models the hydraulic actuator to orient a boom lift basket.
% A double-acting rotational actuator rotates the basket into position.
% Counterbalance valves ensure the system stays locked in place.
%
% This model is a test harness from the main model (see
% <matlab:web('sm_boom_lift_crawler.html'); documentation>).
%
% Copyright 2020-2022 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('basket%20rotate%20hydr'); Open Model>

sm_boom_lift_crawler_harness_open('basket rotate hydr')

set_param(find_system(bdroot,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is a hydraulic rotary actuator.  The hydraulic
% network contains a four-way valve to control the rotation direction and
% two counterbalance valves. The counterbalance valves lock the actuator in
% place when the 4-way valve returns to center. The lock persists if
% pressure upstream drops so the basket doesn’t begin to drift while the
% crew is still at work.

open_system([bdroot '/Basket Rotate']);

%% Simulation Results: Basket Rotate Sequence
%%
%
% The plots below shows the result of a test sequence designed to actuate
% only the rotational actuator for the basket.  The test sequence includes
% signals for all valves so that the test sequence can also be run on the
% full model.
%
sm_boom_lift_crawler_settest('basket rotate test');
sm_boom_lift_crawler_plot11valveseq(tVec,oVec)

%%
%
% Below is the corresponding prescribed motion for the test.  This allows
% testing on a full model that has motion for any combination of the
% actuators.

sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the basket (and turret) along with applied actuator force.
sm_boom_lift_crawler_plot05boompf_rotate

%%
% Hydraulic pressures in the actuators along with actuator position.

sm_boom_lift_crawler_plot10boompab_rotate

%%
%clear all
%close all
bdclose all
