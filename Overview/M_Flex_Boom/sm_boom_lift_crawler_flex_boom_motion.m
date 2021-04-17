%% Flexible Telescoping Boom
%
% This example models the telescoping boom of a boom lift with flexible
% bodies. The flexible bodies are modeled both using classical beam theory
% and reduced order models as exported from finite element tools. The model
% is used to identify natural frequencies at different levels of boom
% extension.
%
% Copyright 2020-2021 The MathWorks, Inc.


%% Model
% <matlab:sm_boom_lift_crawler_harness_open('flex%20boom%20motion'); Open Model>

sm_boom_lift_crawler_harness_open('flex boom motion')
set_param([bdroot '/Rate Transition'],'Commented','off');
set_param([bdroot '/Spectrum Analyzer'],'Commented','off');
close_system([bdroot '/Spectrum Analyzer'])

set_param(find_system(bdroot,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')


%% Telescoping Flexible Boom
%
% The flexible boom is modeled using two methods - classical beam theory
% and reduced order models.

%%
open_system([bdroot '/Telescoping Boom Flex'],'force');

%%
% The beam has three nested segments.

open_system([bdroot '/Telescoping Boom Flex/Classical'],'force');

%%
% The Flexible Rectangular Beam Block ("Mid Beam" block in this image) uses
% classical beam theory to model the flexible portion of the beam.  The
% overlapping section of the nested beams is assumed to be rigid.
%
% In the ROM variant, the "Mid Beam" block is replaced with a Reduced Order
% Flexible Solid block which uses stiffness and damping matrices to model
% the flexible body behavior

open_system([bdroot '/Telescoping Boom Flex/Classical/Mid Beam']);

%% Simulation Results: Tilt Sequence
%%
%
% The plot below shows a test sequence designed to tilt the boom.

sm_boom_lift_crawler_settest('Tilt test');
sm_boom_lift_crawler_plot12motionseq(motion)
open_system([bdroot '/Boom Deflection'])
open_system([bdroot '/Spectrum Analyzer'])
out = sim(bdroot);

%%
% Motion of the lift, extend, and jib actuators along with applied
% actuator force.
sm_boom_lift_crawler_plot03boompf_lift

%% Simulation Results: Frequency Response, Varying Extension
%%
%
% The plot below shows the variation in frequency response.

close_system([bdroot '/Spectrum Analyzer'])
close_system([bdroot '/Boom Deflection'])
sm_boom_lift_crawler_settest('chassis test');
sm_boom_lift_crawler_flex_boom_bodeplot(bdroot,'Classical',true)
close_system([bdroot '/Spectrum Analyzer'])
close_system([bdroot '/Boom Deflection'])

%%

%clear all
%close all
bdclose all
