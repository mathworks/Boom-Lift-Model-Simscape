% Script to create operating point after initial transient dies down
%
% Copyright 2020 The MathWorks, Inc.

cd(fileparts(which(mfilename)))

sm_boom_lift_crawler_harness_open('jib hydr 1d');
sm_boom_lift_crawler_setsolver(bdroot,'variable')

set_param(bdroot,'SimscapeLogType','All')
set_param(bdroot,'ReturnWorkspaceOutputs','off');
set_param(bdroot,'SimscapeUseOperatingPoints','off');

temp_stopTime = get_param(bdroot,'StopTime');
sim(bdroot);
        
set_param(bdroot,'ReturnWorkspaceOutputs','on');
set_param(bdroot,'SimscapeUseOperatingPoints','on');

op_jib_hydr_1D = simscape.op.create(simlog_sm_boom_lift_crawler, 1000);

save('op_jib_hydr_1D.mat','op_jib_hydr_1D','-v7');
