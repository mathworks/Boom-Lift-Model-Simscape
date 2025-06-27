%% Boom Lift Crawler with Simscape
%
% <<sm_boom_lift_crawler_Demo_Script.png>>
% 
% This example models a boom lift with hydraulic actuators. The lift 
% has 6 hydraulic actuators in the chassis, 7 hydraulic actuators in 
% the boom plus one other passive hydraulic cylinder. The mechanical model
% of the lift was created in CAD software and imported into Simscape Multibody. 
%
% * *CAD geometry* is imported to ensure accurate representation of masses,
% inertias, and joint locations.
% * *Mechanical effects* are incorporated into the design, including ground
% contact, worm gear kinematics, cables, and flexible bodies
% * *Actuator requirements* are refined using dynamic simulation with
% abstract actuator models
% * *Hydraulic components* including valve blocks, pipelines, and actuators
% are integrated with the multibody model of the system.
% * *Modular testing* ensures efficient development, as each actuation
% systemcan be tested in a separate model
% * *Integrated testing of physical system and controller* is supported by
% combining a hydromechanical model with sensors and a logic controller.
% * *Interactive workflows* are shown using dashboard blocks to test
% algorithms
% * *MATLAB Apps* helps you open the model that best matches your needs.
%
% *Model*
%
% # Controls Model: <matlab:web('sm_boom_lift_crawler_abstract.html'); Documentation>, <matlab:open_system('sm_boom_lift_crawler_abstract'); Model>
% # Hydraulics Model: <matlab:web('sm_boom_lift_crawler.html'); Documentation>, <matlab:open_system('sm_boom_lift_crawler'); Model>
% 
% *Test Harnesses: Actuator Requirements*
%
% # Full Lift: <matlab:web('sm_boom_lift_crawler_harness_full_motion.html'); Documentation>, <matlab:sm_boom_lift_crawler_harness_open('full%20motion'); Model>
% # Chassis:   <matlab:web('sm_boom_lift_crawler_harness_chassis_motion.html'); Documentation>, <matlab:sm_boom_lift_crawler_harness_open('chassis%20motion'); Model>
% # Boom:      <matlab:web('sm_boom_lift_crawler_harness_boom_motion.html'); Documentation>, <matlab:sm_boom_lift_crawler_harness_open('boom%20motion'); Model>
% # Basket:    <matlab:web('sm_boom_lift_crawler_harness_basket_motion.html'); Documentation>, <matlab:sm_boom_lift_crawler_harness_open('basket%20motion'); Model>
% 
% *Test Harnesses: Actuator Design*
%
% # Ground Manifold: <matlab:web('sm_boom_lift_crawler_harness_ground_hydr.html'); Documentation>,   <matlab:sm_boom_lift_crawler_harness_open('ground%20manifold%20hydr'); Model>
% # Outrigger:       <matlab:web('sm_boom_lift_crawler_harness_outr_hydr.html'); Documentation>,     <matlab:sm_boom_lift_crawler_harness_open('outrigger%20hydr'); Model>
% # Track Extend:    <matlab:web('sm_boom_lift_crawler_harness_track_hydr.html'); Documentation>,    <matlab:sm_boom_lift_crawler_harness_open('track%20hydr'); Model>
% # Sky Manifold:    <matlab:web('sm_boom_lift_crawler_harness_sky_hydr.html'); Documentation>,     <matlab:sm_boom_lift_crawler_harness_open('sky%20manifold%20hydr'); Model>
% # Turret:          <matlab:web('sm_boom_lift_crawler_harness_turret_hydr.html'); Documentation>,   <matlab:sm_boom_lift_crawler_harness_open('turret%20hydr'); Model>
% # Lift:            <matlab:web('sm_boom_lift_crawler_harness_lift_hydr.html'); Documentation>,     <matlab:sm_boom_lift_crawler_harness_open('lift%20hydr'); Model>
% # Extend:          <matlab:web('sm_boom_lift_crawler_harness_extend_hydr.html'); Documentation>,   <matlab:sm_boom_lift_crawler_harness_open('extend%20hydr'); Model>
% # Jib (3D):        <matlab:web('sm_boom_lift_crawler_harness_jib_hydr_3D.html'); Documentation>,   <matlab:sm_boom_lift_crawler_harness_open('jib%20hydr%203D'); Model>
% # Jib (1D):        <matlab:web('sm_boom_lift_crawler_harness_jib_hydr_1D.html'); Documentation>,   <matlab:sm_boom_lift_crawler_harness_open('jib%20hydr%201D'); Model>
% # Basket Rotate:   <matlab:web('sm_boom_lift_crawler_harness_basket_rotate_hydr.html'); Documentation>, <matlab:sm_boom_lift_crawler_harness_open('basket%20rotate%20hydr'); Model>
% # Basket Level:    <matlab:web('sm_boom_lift_crawler_harness_basket_level_hydr.html'); Documentation>, <matlab:sm_boom_lift_crawler_harness_open('basket%20level%20hydr'); Model>
% # Basket Level Tilt: <matlab:web('sm_boom_lift_crawler_harness_basket_level_tilt_hydr.html'); Documentation>, <matlab:sm_boom_lift_crawler_harness_open('basket%20level%20tilt%20hydr'); Model>
% # Flexible Boom:   <matlab:web('sm_boom_lift_crawler_flex_boom_motion.html'); Documentation>, <matlab:sm_boom_lift_crawler_harness_open('flex%20boom%20motion'); Model>
% 
% *Example Models*
%
% # <matlab:open_system('sm_boom_lift_crawler_contact_foot'); Foot-Ground Contact Model>
% # <matlab:open_system('sm_boom_lift_crawler_valve_sequence_test'); Valve Sequence Timing Model>
% 

% Copyright 2020-2025 The MathWorks(TM), Inc.

