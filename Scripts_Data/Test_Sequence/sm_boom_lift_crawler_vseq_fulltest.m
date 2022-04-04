function [tVec, oVec] = sm_boom_lift_crawler_vseq_fulltest
%% Specify the break points for the lookup tables in the Valve Commands subsystem block.
% * Times (t) are in seconds. Valve commands (o) are unitless. 
% * Table interpolation is Flat (with Use Input Below rounding). 
% * Table Extrapolation is Clipped.
% * Interpolated values pass through valve actuator blocks with 
% first-order time smoothing.
% * Valve actuator time constants range from a fraction of a second 
% (selector and deviator valves) to 5 s (proportional valves).

% Copyright 2020-2022 The MathWorks, Inc.

%% Valve Operation Commands:
o.fwd = 1; % Command to operate valve in forward direction
o.rwd = -1 ; % Command to operate valve in reverse direction
o.stop = 0; % Command to release valve to closed or centered position

%% Ground function commands --- Forward Operation:
t.start = 0; % Start everything!

% 1. Select outrigger extend valve
t.ground.c1.fwd.go = 1; % Start outriggers
t.ground.c1.fwd.stop = t.ground.c1.fwd.go + 10; %  Stop outriggers
tVec.ground.c1.fwd = [t.start t.ground.c1.fwd.go t.ground.c1.fwd.stop]; 
oVec.ground.c1.fwd = [o.stop o.fwd o.stop];
tVec.ground.c1.name = 'Outrigger';

%2. Select track extend valve
t.ground.c5.fwd.go = t.ground.c1.fwd.stop + 1;
t.ground.c5.fwd.stop = t.ground.c5.fwd.go + 8;
tVec.ground.c5.fwd = [t.start t.ground.c5.fwd.go t.ground.c5.fwd.stop];
oVec.ground.c5.fwd = [o.stop o.fwd o.stop];
tVec.ground.c5.name = 'Track';

% A. Feed right ground valve block
tVec.deviators.sky = [t.start t.ground.c1.fwd.go t.ground.c5.fwd.stop];
oVec.deviators.sky = [o.rwd o.fwd o.rwd];

% B. Feed left ground valve block
tVec.deviators.ground = [t.start t.ground.c5.fwd.stop];
oVec.deviators.ground = [o.fwd o.fwd];

% C. Meter flow to ground manifold
% Close the slower proportional valve early to 
% more gradually stop the chassis functions
tVec.ground.proportional = [t.start t.ground.c1.fwd.go (t.ground.c5.fwd.stop-1.5)];
oVec.ground.proportional = [o.fwd o.stop o.fwd];

%% Sky Function Commands --- Forward Operation:
% 1. Select knuckle boom lift valve
t.sky.c1.fwd.go = t.ground.c5.fwd.stop + 2;  % was 1
t.sky.c1.fwd.stop = t.sky.c1.fwd.go + 46;    % was 46
tVec.sky.c1.fwd = [t.start t.sky.c1.fwd.go t.sky.c1.fwd.stop];
oVec.sky.c1.fwd = [o.stop o.fwd o.stop];
tVec.sky.c1.name = 'Lift';

% 2. Select stick boom tilt valve
t.sky.c2.fwd.go = t.sky.c1.fwd.stop + 1;
t.sky.c2.fwd.stop = t.sky.c2.fwd.go + 39;
tVec.sky.c2.fwd = [t.start t.sky.c2.fwd.go t.sky.c2.fwd.stop];
oVec.sky.c2.fwd = [o.stop o.fwd o.stop];
tVec.sky.c2.name = 'Tilt';

% 3. Select stick boom extend valve
t.sky.c3.fwd.go = t.sky.c2.fwd.stop + 1;
t.sky.c3.fwd.stop = t.sky.c3.fwd.go + 22;
tVec.sky.c3.fwd = [t.start t.sky.c3.fwd.go t.sky.c3.fwd.stop];
oVec.sky.c3.fwd = [o.stop o.fwd o.stop];
tVec.sky.c3.name = 'Extend';

% 4. Select jib extend valve
t.sky.c4.fwd.go = t.sky.c3.fwd.stop + 1; 
t.sky.c4.fwd.stop = t.sky.c4.fwd.go + 9;
tVec.sky.c4.fwd = [t.start t.sky.c4.fwd.go t.sky.c4.fwd.stop];
oVec.sky.c4.fwd = [o.stop o.fwd o.stop];
tVec.sky.c4.name = 'Jib';

% 5. Select turret valve
t.sky.r1.fwd.go = t.sky.c4.fwd.stop + 1; 
t.sky.r1.fwd.stop = t.sky.r1.fwd.go + 25;
tVec.sky.r1.fwd = [t.start t.sky.r1.fwd.go t.sky.r1.fwd.stop];
oVec.sky.r1.fwd = [o.stop o.fwd o.stop];
tVec.sky.r1.name = 'Turret';

% 6. Select BasketR valve
t.sky.r2.fwd.go = t.sky.r1.fwd.stop + 1; 
t.sky.r2.fwd.stop = t.sky.r2.fwd.go + 6;
tVec.sky.r2.fwd = [t.start t.sky.r2.fwd.go t.sky.r2.fwd.stop];
oVec.sky.r2.fwd = [o.stop o.fwd o.stop];
tVec.sky.r2.name = 'BasketR';

%% Sky Function Commands --- Reverse Operation:
% 7. Select basketR valve
t.sky.r2.rwd.go = t.sky.r2.fwd.stop + 1; 
t.sky.r2.rwd.stop = t.sky.r2.rwd.go + 5.25;  % was 5
tVec.sky.r2.rwd = [t.sky.r2.rwd.go (t.sky.r2.rwd.go+1) t.sky.r2.rwd.stop];
oVec.sky.r2.rwd = [o.stop o.rwd o.stop];

% 11. Select stick boom extend valve
t.sky.c3.rwd.go = t.sky.r2.rwd.stop + 1; 
t.sky.c3.rwd.stop = t.sky.c3.rwd.go + 25.8; % was 25
tVec.sky.c3.rwd = [t.sky.c3.rwd.go (t.sky.c3.rwd.go+1) t.sky.c3.rwd.stop];
oVec.sky.c3.rwd = [o.stop o.rwd o.stop];

%8. Select stick boom tilt valve
t.sky.c2.rwd.go = t.sky.c3.rwd.stop + 1;
t.sky.c2.rwd.stop = t.sky.c2.rwd.go + 33;  % was 37
tVec.sky.c2.rwd = [t.sky.c2.rwd.go (t.sky.c2.rwd.go+1) t.sky.c2.rwd.stop];
oVec.sky.c2.rwd = [o.stop o.rwd o.stop];

% 9. Select turret valve
t.sky.r1.rwd.go = t.sky.c2.rwd.stop + 1; 
t.sky.r1.rwd.stop = t.sky.r1.rwd.go + 26;  % was 25
tVec.sky.r1.rwd = [t.sky.r1.rwd.go (t.sky.r1.rwd.go+1) t.sky.r1.rwd.stop];
oVec.sky.r1.rwd = [o.stop o.rwd o.stop];

% 10. Select knuckle boom lift valve
t.sky.c1.rwd.go = t.sky.r1.rwd.stop + 1; 
t.sky.c1.rwd.stop = t.sky.c1.rwd.go + 52; % was 50
tVec.sky.c1.rwd = [t.sky.c1.rwd.go (t.sky.c1.rwd.go+1) t.sky.c1.rwd.stop];
oVec.sky.c1.rwd = [o.stop o.rwd o.stop];

% 12. Select jib extend valve
t.sky.c4.rwd.go = t.sky.c1.rwd.stop + 1; 
t.sky.c4.rwd.stop = t.sky.c4.rwd.go + 9.75; % was 9.5
tVec.sky.c4.rwd = [t.sky.c4.rwd.go (t.sky.c4.rwd.go+1) t.sky.c4.rwd.stop];
oVec.sky.c4.rwd = [o.stop o.rwd o.stop];

%% Ground Function Commands --- Reverse Operation:

% 1. Select track extend valve
t.ground.c5.rwd.go = t.sky.c4.rwd.stop + 1;
t.ground.c5.rwd.stop = t.ground.c5.rwd.go + 8;
tVec.ground.c5.rwd = [t.ground.c5.rwd.go t.ground.c5.rwd.stop];
oVec.ground.c5.rwd = [o.rwd o.stop];

% 2. Select outrigger extend valve
t.ground.c1.rwd.go = t.ground.c5.rwd.stop + 1;
t.ground.c1.rwd.stop = t.ground.c1.rwd.go + 9;
tVec.ground.c1.rwd = [t.ground.c1.rwd.go t.ground.c1.rwd.stop];
oVec.ground.c1.rwd = [o.rwd o.stop];

%% Complete ground function commands:

tVec.ground.c1.all = [tVec.ground.c1.fwd tVec.ground.c1.rwd];
oVec.ground.c1.all = [oVec.ground.c1.fwd oVec.ground.c1.rwd];

tVec.ground.c5.all = [tVec.ground.c5.fwd tVec.ground.c5.rwd];
oVec.ground.c5.all = [oVec.ground.c5.fwd oVec.ground.c5.rwd];

%% Update proportional valve commands for ground functions:

tVec.ground.proportional = [
    tVec.ground.proportional,...
    t.ground.c5.rwd.go t.ground.c5.rwd.stop,...
    t.ground.c1.rwd.go t.ground.c1.rwd.stop];

oVec.ground.proportional = [
    oVec.ground.proportional,...
    o.stop o.fwd,...
    o.stop o.fwd];


%% Complete sky function commands:
tVec.sky.r1.all = [tVec.sky.r1.fwd tVec.sky.r1.rwd];
oVec.sky.r1.all = [oVec.sky.r1.fwd oVec.sky.r1.rwd];

tVec.sky.r2.all = [tVec.sky.r2.fwd tVec.sky.r2.rwd];
oVec.sky.r2.all = [oVec.sky.r2.fwd oVec.sky.r2.rwd];

tVec.sky.c1.all = [tVec.sky.c1.fwd tVec.sky.c1.rwd];
oVec.sky.c1.all = [oVec.sky.c1.fwd oVec.sky.c1.rwd];

tVec.sky.c2.all = [tVec.sky.c2.fwd tVec.sky.c2.rwd];
oVec.sky.c2.all = [oVec.sky.c2.fwd oVec.sky.c2.rwd];

tVec.sky.c3.all = [tVec.sky.c3.fwd tVec.sky.c3.rwd];
oVec.sky.c3.all = [oVec.sky.c3.fwd oVec.sky.c3.rwd];

tVec.sky.c4.all = [tVec.sky.c4.fwd tVec.sky.c4.rwd];
oVec.sky.c4.all = [oVec.sky.c4.fwd oVec.sky.c4.rwd];

%% Proportional and Deviator Valve Commands for Sky Functions:
% A. Meter flow to ground manifold
% Close the slower proportional valves first to more
% gradually stop the boom functions
tVec.sky.proportional = [
    t.start,...
    t.sky.c1.fwd.go (t.sky.c1.fwd.stop-3),...
    (t.sky.c2.fwd.go+0.5) (t.sky.c2.fwd.stop-3),...
    t.sky.c3.fwd.go (t.sky.c3.fwd.stop-3),... 
    t.sky.c4.fwd.go (t.sky.c4.fwd.stop-3),...
    t.sky.r1.fwd.go (t.sky.r1.fwd.stop-3),...
    t.sky.r2.fwd.go (t.sky.r2.fwd.stop-3),...
    t.sky.r2.rwd.go (t.sky.r2.rwd.stop-3),...
    t.sky.c3.rwd.go (t.sky.c3.rwd.stop-3),...
    t.sky.c2.rwd.go (t.sky.c2.rwd.stop-3),...
    t.sky.r1.rwd.go (t.sky.r1.rwd.stop-3),...
    t.sky.c1.rwd.go (t.sky.c1.rwd.stop-3),...
    t.sky.c4.rwd.go (t.sky.c4.rwd.stop-3),...
    ];

oVec.sky.proportional = [
    o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop];

% B. Operate ground deviator to boost flow for the hungriest
% sky manifold functions
tVec.deviators.ground = [
    tVec.deviators.ground,...
    t.sky.c1.fwd.go t.sky.c3.fwd.stop,...
    t.sky.r1.fwd.go t.sky.r1.fwd.stop,...
    t.sky.c3.rwd.go t.sky.c1.rwd.stop];
oVec.deviators.ground = [
    oVec.deviators.ground,...
    o.rwd o.fwd,...
    o.rwd o.fwd,... 
    o.rwd o.fwd];

% Operate the sky deviator to supply the right of the chassis for outrigger
% and track retraction:
tVec.deviators.sky = [
    tVec.deviators.sky,...
    t.ground.c5.rwd.go t.ground.c1.rwd.stop];
oVec.deviators.sky = [
    oVec.deviators.sky,...
    o.fwd o.rwd];

tVec.StopTime = max([...
    tVec.ground.c1.all,...
    tVec.ground.c5.all,...
    tVec.ground.proportional,...
    tVec.sky.c1.all,...
    tVec.sky.c2.all,...
    tVec.sky.c3.all,...
    tVec.sky.c4.all,...
    tVec.sky.r1.all,...
    tVec.sky.r2.all,...
    tVec.sky.proportional,...
    tVec.deviators.ground,...
    tVec.deviators.sky]);

tVec.SeqName = 'Full Test';

    
    