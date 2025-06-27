function sm_boom_lift_crawler_settest(testname)
% Code to load test sequence for sm_boom_lift_crawler
% Valve, motion, and operator sequence

% Copyright 2020-2025 The MathWorks, Inc.

switch lower(testname)
    case 'full test'
        valveseq = 'sm_boom_lift_crawler_vseq_fulltest';
        motionseq = 'full';
    case 'chassis test'
        valveseq = 'sm_boom_lift_crawler_vseq_chassis';
        motionseq = 'chassis';
    case 'jib test'
        valveseq = 'sm_boom_lift_crawler_vseq_jib';
        motionseq = 'jib';
    case 'track test'
        valveseq = 'sm_boom_lift_crawler_vseq_track';
        motionseq = 'track';
    case 'basket rotate test'
        valveseq = 'sm_boom_lift_crawler_vseq_basketr';
        motionseq = 'basketr';
    case {'extend & tilt test', 'extend tilt test'}
        valveseq = 'sm_boom_lift_crawler_vseq_extend_tilt';
        motionseq = 'extend_tilt';
    case {'extend only test', 'extend test'}
        valveseq = 'sm_boom_lift_crawler_vseq_extend_only';
        motionseq = 'extend_only';
    case 'turret test'
        valveseq = 'sm_boom_lift_crawler_vseq_turret';
        motionseq = 'turret';
    case 'tilt test'
        valveseq = 'sm_boom_lift_crawler_vseq_tilt';
        motionseq = 'tilt';
    case 'lift test'
        valveseq = 'sm_boom_lift_crawler_vseq_lift';
        motionseq = 'lift';
    otherwise
        valveseq = 'not found';
end

if(~strcmp(valveseq,'not found'))
    if(~strcmp(valveseq,'none'))
        str = ['[tVec, oVec] = ' valveseq ';'];
        %disp(str);
        evalin('base',str);
    end
    str = ['motion = MDatabase.' motionseq ';'];
    %disp(str);
    evalin('base',str);
    str = ['operator_seq = ODatabase.' motionseq ';'];
    %disp(str);
    evalin('base',str);
end


