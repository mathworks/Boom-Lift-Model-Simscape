% Script to create operating point after initial transient dies down
%
% Copyright 2020-2025 The MathWorks, Inc.

cd(fileparts(which(mfilename)))

sm_boom_lift_crawler_harness_open('lift hydr');
sm_boom_lift_crawler_setsolver(bdroot,'variable')

set_param(bdroot,'SimscapeLogType','All')
set_param(bdroot,'ReturnWorkspaceOutputs','off');
set_param(bdroot,'SimscapeUseOperatingPoints','off');

temp_stopTime = get_param(bdroot,'StopTime');
sim(bdroot);
        
set_param(bdroot,'ReturnWorkspaceOutputs','on');
set_param(bdroot,'SimscapeUseOperatingPoints','on');

op_lift_hydr = simscape.op.create(simlog_sm_boom_lift_crawler, 1000);

save('op_lift_hydr.mat','op_lift_hydr','-v7');
