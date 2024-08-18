% Script to create operating point after initial transient dies down
%
% Copyright 2020-2024 The MathWorks, Inc.

cd(fileparts(which(mfilename)))

sm_boom_lift_crawler_harness_open('sky manifold hydr');
sm_boom_lift_crawler_setsolver(bdroot,'variable')
sm_boom_lift_crawler_settest('extend tilt test');

set_param(bdroot,'SimscapeLogType','All')
set_param(bdroot,'ReturnWorkspaceOutputs','off');
set_param(bdroot,'SimscapeUseOperatingPoints','off');

temp_stopTime = get_param(bdroot,'StopTime');
sim(bdroot);
        
set_param(bdroot,'ReturnWorkspaceOutputs','on');
set_param(bdroot,'SimscapeUseOperatingPoints','on');

op_sky_manifold_hydr = simscape.op.create(simlog_sm_boom_lift_crawler, 1000);

save('op_sky_manifold_hydr.mat','op_sky_manifold_hydr','-v7');
