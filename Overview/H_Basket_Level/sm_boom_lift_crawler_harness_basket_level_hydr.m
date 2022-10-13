%% Basket Level with Hydraulic Actuation (Test Harness)
%
% This example models a closed hydraulic system that keeps a boom lift
% basket level as the boom tilts up and down.  In this harness, the tilt
% actuator is actuated using prescribed motion.  Two double-acting
% hydraulic cylinders are connected in a closed circuit in a master-slave
% arrangement.
%
% This model is a test harness from the main model (see
% <matlab:web('sm_boom_lift_crawler.html'); documentation>).
%
% Copyright 2020-2022 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('basket%20level%20hydr'); Open Model>

sm_boom_lift_crawler_harness_open('basket level hydr')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Component Under Test
%
% The component under test is a hydraulic system that holds the basket
% level as the boom tilts up and down.  A double-sided cylinder (Cylinder
% Slave) with two counterbalance valves extends to tilt the crew basket.
% Another double-sided cylinder (Cylinder Master), also with two
% counterbalance valves, retract/extends as the boom tilts. It is
% connected in a closed hydraulic circuit with the slave cylinder and
% forces the slave to extend/retract to offset the tilt from the boom.

open_system([bdroot '/Basket Level']);

%% Simulation Results: Tilt Sequence
%%
%
% The plots below shows the result of a test sequence designed to only tilt
% the boom.  The test sequence includes signals for all valves so that the
% test sequence can also be run on the full model.
%

sm_boom_lift_crawler_settest('tilt test');
sm_boom_lift_crawler_plot11valveseq(tVec,oVec)

%%
%
% Below is the corresponding prescribed motion for the test.  This allows
% testing on a full model that has motion for any combination of the
% actuators.

sm_boom_lift_crawler_plot12motionseq(motion)
out = sim(bdroot);

%%
% Motion of the tilt, master, and slave cylinders along with applied
% actuator force.
sm_boom_lift_crawler_plot04boompf_tilt

%%
% Hydraulic pressures in the actuators along with actuator position.

sm_boom_lift_crawler_plot09boompab_tilt

%%
%clear all
%close all
bdclose all
