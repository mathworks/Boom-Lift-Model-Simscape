%% Boom Lift Crawler with Abstract Actuator Models and Controller
%
% This example models a boom lift using abstract models of the actuators.
% The lift has 6 hydraulic actuators in the chassis, 7 hydraulic actuators
% in the boom plus one other passive hydraulic cylinder.  The lift was
% modeled in CAD, imported into Simscape Multibody.  The actuators are
% modeled using prescribed motion with transfer functions to represent the
% delay in the hydraulic system.
%
% The model includes a simple control system which restricts some of the
% movements when the lift is in certain positions.  Simulink dashboard
% blocks permit manual testing of the algorithm
%
% Copyright 2020-2022 The MathWorks, Inc.


%% Model
%
% <matlab:open_system('sm_boom_lift_crawler_abstract'); Open Model>


open_system('sm_boom_lift_crawler_abstract')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Overview of Actuation Systems
%
% The boom lift crawler consists of a chassis and a boom.
%
% The chassis has:
%
% * Four outriggers to level the lift
% * Two tracks so the lift can crawl along the ground
%
% The boom has a number of actuators to position a basket with the operator:
%
% * Turret drive: Orient the boom relative to the chassis
% * Lift cylinder: Raise the boom vertically
% * Tilt cylinder: Adjust the angle of the telescoping boom
% * Master and Slave cylinders: Ensure the basket remains level as the boom
% tilts
% * Extend cylinder: Extend the telescoping boom
% * Jib cylinder: raise and lower the basket
% * Rotate actuator: Orient the basket relative to the boom


%% Mechanical System
%
% The mechanical model was created in CAD software and imported into
% Simscape Multibody.  It includes many closed-loop linkages and models
% ground contact for the outriggers and the tracks.

open_system([bdroot '/Lift']);

%% Abstract Actuators System
%
% The actuator models are abstract. The joints in the model move using
% prescribed motion, and a transfer function models the delay from the
% hydraulic system.  This subsystem converts the on/off signal for the
% actuators to a position.

open_system([bdroot '/Abstract Actuators']);


%% Control System
%
% A very basic control system checks signals from sensors on the boom lift
% and determines if the user inputs should be permitted or overridden.

open_system([bdroot '/Control/Software']);

%% Simulation Results: Full Sequence
%
% The plots below shows the result of a test sequence designed to activate
% all actuators on the boom lift. 
%

sm_boom_lift_crawler_settest('full test');
sm_boom_lift_crawler_plot13operatorseq(operator_seq)
set_param([bdroot '/Operator Inputs'],'LabelModeActiveChoice','Input_Sequence');
set_param([bdroot '/Lift'],'popup_gnd_outr','Force');
sm_boom_lift_crawler_setsolver(bdroot,'variable');

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
