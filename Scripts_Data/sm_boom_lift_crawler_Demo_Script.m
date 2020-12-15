%% Boom Lift Crawler Demo Script
%
% <html>
% <span style="font-family:Arial">
% <span style="font-size:10pt">
% <tr><b><u>Model</u></b><br>
% <tr>Controls Model: <a href="matlab:web('sm_boom_lift_crawler_abstract.html');">Documentation</a>, <a href="matlab:open_system('sm_boom_lift_crawler_abstract');">Model</a><br>
% <tr>Hydraulics Model: <a href="matlab:web('sm_boom_lift_crawler.html');">Documentation</a>, <a href="matlab:sm_boom_lift_crawler_harness_open('main model');">Model</a><br>
% <br>
% <tr><b><u>Test Harnesses: Actuator Requirements</u></b><br>
% <tr>1.   Full Lift: <a href="matlab:web('sm_boom_lift_crawler_harness_full_motion.html');">Documentation</a>, <a href="matlab:sm_boom_lift_crawler_harness_open('full motion');">Model</a><br>
% <tr>2.   Chassis:   <a href="matlab:web('sm_boom_lift_crawler_harness_chassis_motion.html');">Documentation</a>, <a href="matlab:sm_boom_lift_crawler_harness_open('chassis motion');">Model</a><br>
% <tr>3.   Boom:      <a href="matlab:web('sm_boom_lift_crawler_harness_boom_motion.html');">Documentation</a>, <a href="matlab:sm_boom_lift_crawler_harness_open('boom motion');">Model</a><br>
% <tr>4.   Basket:    <a href="matlab:web('sm_boom_lift_crawler_harness_basket_motion.html');">Documentation</a>, <a href="matlab:sm_boom_lift_crawler_harness_open('basket motion');">Model</a><br>
% <br>
% <tr><b><u>Test Harnesses: Actuator Design</u></b><br>
% <tr>5.   Ground Manifold: <a href="matlab:web('sm_boom_lift_crawler_harness_ground_hydr.html');">Documentation</a>,   <a href="matlab:sm_boom_lift_crawler_harness_open('ground manifold hydr');">Model</a><br>
% <tr>6.   Outrigger:       <a href="matlab:web('sm_boom_lift_crawler_harness_outr_hydr.html');">Documentation</a>,     <a href="matlab:sm_boom_lift_crawler_harness_open('outrigger hydr');">Model</a><br>
% <tr>7.   Track Extend:    <a href="matlab:web('sm_boom_lift_crawler_harness_track_hydr.html');">Documentation</a>,    <a href="matlab:sm_boom_lift_crawler_harness_open('track hydr');">Model</a><br>
% <tr>8.   Sky Manifold:    <a href="matlab:web('sm_boom_lift_crawler_harness_sky_hydr.html');">Documentation</a>,     <a href="matlab:sm_boom_lift_crawler_harness_open('sky manifold hydr');">Model</a><br>
% <tr>9.   Turret:          <a href="matlab:web('sm_boom_lift_crawler_harness_turret_hydr.html');">Documentation</a>,   <a href="matlab:sm_boom_lift_crawler_harness_open('turret hydr');">Model</a><br>
% <tr>10.  Lift:            <a href="matlab:web('sm_boom_lift_crawler_harness_lift_hydr.html');">Documentation</a>,     <a href="matlab:sm_boom_lift_crawler_harness_open('lift hydr');">Model</a><br>
% <tr>11.  Extend:          <a href="matlab:web('sm_boom_lift_crawler_harness_extend_hydr.html');">Documentation</a>,   <a href="matlab:sm_boom_lift_crawler_harness_open('extend hydr');">Model</a><br>
% <tr>12.  Jib (3D):        <a href="matlab:web('sm_boom_lift_crawler_harness_jib_hydr_3D.html');">Documentation</a>,   <a href="matlab:sm_boom_lift_crawler_harness_open('jib hydr 3D');">Model</a><br>
% <tr>13.  Jib (1D):        <a href="matlab:web('sm_boom_lift_crawler_harness_jib_hydr_1D.html');">Documentation</a>,   <a href="matlab:sm_boom_lift_crawler_harness_open('jib hydr 1D');">Model</a><br>
% <tr>14.  Basket Rotate:   <a href="matlab:web('sm_boom_lift_crawler_harness_basket_rotate_hydr.html');">Documentation</a>, <a href="matlab:sm_boom_lift_crawler_harness_open('basket rotate hydr');">Model</a><br>
% <tr>15.  Basket Level:    <a href="matlab:web('sm_boom_lift_crawler_harness_basket_level_hydr.html');">Documentation</a>, <a href="matlab:sm_boom_lift_crawler_harness_open('basket level hydr');">Model</a><br>
% <tr>16.  Basket Level Tilt: <a href="matlab:web('sm_boom_lift_crawler_harness_basket_level_tilt_hydr.html');">Documentation</a>, <a href="matlab:sm_boom_lift_crawler_harness_open('basket level tilt hydr');">Model</a><br>
% <tr>17.  Flexible Boom:   <a href="matlab:web('sm_boom_lift_crawler_flex_boom_motion.html');">Documentation</a>, <a href="matlab:sm_boom_lift_crawler_harness_open('flex boom motion');">Model</a><br>
% <br>
% <tr><b><u>Example Models</u></b><br>
% <tr>1.   <a href="matlab:open_system('sm_boom_lift_crawler_contact_foot');">Foot-Ground Contact Model</a><br>
% <tr>2.   <a href="matlab:open_system('sm_boom_lift_crawler_valve_sequence_test');">Valve Sequence Timing Model</a><br>
% <br>
% </style>
% </style>
% </html>
% 

% Copyright 2020 The MathWorks(TM), Inc.

