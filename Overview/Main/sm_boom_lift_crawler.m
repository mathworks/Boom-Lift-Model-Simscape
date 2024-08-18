%% Boom Lift Crawler with Hydraulic Actuation
%
% This example models a boom lift with hydraulic actuation. The lift has 6
% hydraulic actuators in the chassis, 7 hydraulic actuators in the boom
% plus one other passive hydraulic cylinder.  The hydraulic network
% includes directional valves to select the direction of actuation
% (extend/contract), counterbalance valves to avoid runaway loads, and
% pilot operated check valves to lock actuators in place.  The lift was
% modeled in CAD, imported into Simscape Multibody, and integrated with the
% hydraulic model from Simscape Fluids.
%
% A set of test harnesses were created to enable unit testing of the
% individual actuation systems.  Some test models use inverse dynamics to
% refine the requirements for the actuators.
%
% Copyright 2020-2024 The MathWorks, Inc.


%% Model
%
% <matlab:open_system('sm_boom_lift_crawler'); Open Model>


open_system('sm_boom_lift_crawler')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Mechanical System
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

%% Hydraulic System
%
% The hydraulic system was modeled based on publicly available schematics
% of the hydraulic network.  It includes 12 hydraulic cylinders, 2 rotary
% actuators, and 53 valves.
%
% The ground manifold includes the actuators for the chassis (outriggers
% and track extension). The sky manifold includes the actuators for the
% boom and basket. The deviator valves route additional hydraulic fluid to
% either the ground or sky manifolds depending on which functions are
% activated.

open_system([bdroot '/Actuators']);

%% Simulation Results: Full Sequence
%
% The plots below shows the result of a test sequence designed to activate
% all actuators on the boom lift. 
%

sm_boom_lift_crawler_settest('full test');
sm_boom_lift_crawler_plot11valveseq(tVec,oVec)

out = sim(bdroot);

%%
% Motion of the outriggers along with applied actuator force.
sm_boom_lift_crawler_plot01chassispf_outr


%%
% Pressures of the outriggers along with actuator position.
sm_boom_lift_crawler_plot06chassispab_outr

%%
% Motion of the tracks along with applied actuator force.
sm_boom_lift_crawler_plot02chassispf_track

%%
% Pressures of the track actuators along with actuator position.
sm_boom_lift_crawler_plot07chassispab_track

%%
% Motion of the lift, extend, and jib actuators along with applied actuator force.
sm_boom_lift_crawler_plot03boompf_lift

%%
% Pressures of the lift, extend, and jib actuators along with actuator position.
sm_boom_lift_crawler_plot08boompab_lift

%%
% Motion of the tilt, and basket leveling actuators along with applied actuator force.
sm_boom_lift_crawler_plot04boompf_tilt

%%
% Pressures of the tilt, and basket leveling actuators along with actuator position.
sm_boom_lift_crawler_plot09boompab_tilt

%%
% Motion of the turret and basket rotation actuators along with applied actuator torques.
sm_boom_lift_crawler_plot05boompf_rotate

%%
% Pressures of the turret and basket rotation actuators along with actuator position.
sm_boom_lift_crawler_plot10boompab_rotate

%%

%clear all
%close all
bdclose all
