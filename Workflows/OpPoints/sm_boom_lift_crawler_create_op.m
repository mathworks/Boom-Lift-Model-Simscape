% Script to create operating point after initial transient dies down
%
% Copyright 2020-2022 The MathWorks, Inc.

cd(fileparts(which(mfilename)))

sm_boom_lift_crawler_harness_open('hydr model');
sm_boom_lift_crawler_setsolver(bdroot,'variable')

set_param(bdroot,'SimscapeLogType','All')
set_param([bdroot '/Control'],'LabelModeActiveChoice','Hold');
set_param(bdroot,'ReturnWorkspaceOutputs','off');
set_param(bdroot,'SimscapeUseOperatingPoints','off');

temp_stopTime = get_param(bdroot,'StopTime');
set_param(bdroot,'StopTime','15');
sim(bdroot);
set_param(bdroot,'StopTime',temp_stopTime);
        
set_param(bdroot,'ReturnWorkspaceOutputs','on');
set_param([bdroot '/Control'],'LabelModeActiveChoice','Valve_Sequence');
set_param(bdroot,'SimscapeUseOperatingPoints','on');

op_hold15Sec_FULL = ...
    simscape.op.create(simlog_sm_boom_lift_crawler, 1000);
op_hold15Sec_hydr = remove(op_hold15Sec_FULL,'Lift');

save('op_hold15Sec_FULL.mat','op_hold15Sec_FULL','-v7');
save('op_hold15Sec_hydr.mat','op_hold15Sec_hydr','-v7');

%set_param(bdroot,'SimscapeLogType','Local')
