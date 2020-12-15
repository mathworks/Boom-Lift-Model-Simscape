function [tVec, oVec] = sm_boom_lift_crawler_vseq_turret
%% Specify the break points for the lookup tables in the Valve Commands subsystem block.
% * Times (t) are in seconds. Valve commands (o) are unitless. 
% * Table interpolation is Flat (with Use Input Below rounding). 
% * Table Extrapolation is Clipped.
% * Interpolated values pass through valve actuator blocks with 
% first-order time smoothing.
% * Valve actuator time constants range from a fraction of a second 
% (selector and deviator valves) to 5 s (proportional valves).

% Copyright 2020 The MathWorks, Inc.

%% Valve Operation Commands:
o.fwd = 1; % Command to operate valve in forward direction
o.rwd = -1 ; % Command to operate valve in reverse direction
o.stop = 0; % Command to release valve to closed or centered position

t.start = 0; % Start everything!


%% Sky Function Commands --- Forward Operation:

% 5. Select turret valve
t.sky.r1.fwd.go = t.start + 1; 
t.sky.r1.fwd.stop = t.sky.r1.fwd.go + 25;
tVec.sky.r1.fwd = [t.start t.sky.r1.fwd.go t.sky.r1.fwd.stop];
oVec.sky.r1.fwd = [o.stop o.fwd o.stop];
tVec.sky.r1.name = 'Turret';

% 1. Select knuckle boom lift valve
tVec.sky.c1.fwd = [t.start];
oVec.sky.c1.fwd = [o.stop];
tVec.sky.c1.name = 'Lift';

% 2. Select stick boom tilt valve
tVec.sky.c2.fwd = [t.start];
oVec.sky.c2.fwd = [o.stop];
tVec.sky.c2.name = 'Tilt';

% 3. Select stick boom extend valve
tVec.sky.c3.fwd = [t.start];
oVec.sky.c3.fwd = [o.stop];
tVec.sky.c3.name = 'Extend';

% 4. Select jib extend valve
tVec.sky.c4.fwd = [t.start];
oVec.sky.c4.fwd = [o.stop];
tVec.sky.c4.name = 'Jib';

% 6. Select basketR valve
tVec.sky.r2.fwd = [t.start];
oVec.sky.r2.fwd = [o.stop];
tVec.sky.r2.name = 'BasketR';

%% Sky Function Commands --- Reverse Operation:

% 9. Select turret valve
t.sky.r1.rwd.go = t.sky.r1.fwd.stop + 2; 
t.sky.r1.rwd.stop = t.sky.r1.rwd.go + 26;
tVec.sky.r1.rwd = [t.sky.r1.rwd.go (t.sky.r1.rwd.go+1) t.sky.r1.rwd.stop t.sky.r1.rwd.stop+2];
oVec.sky.r1.rwd = [o.stop o.rwd o.stop o.stop];

% 12. Select jib extend valve
tVec.sky.c4.rwd = [tVec.sky.r1.rwd(end)];
oVec.sky.c4.rwd = [o.stop];

% 7. Select basketR valve
tVec.sky.r2.rwd = [tVec.sky.r1.rwd(end)];
oVec.sky.r2.rwd = [o.stop];

% 11. Select stick boom extend valve
tVec.sky.c3.rwd = [tVec.sky.r1.rwd(end)];
oVec.sky.c3.rwd = [o.stop];

% 8. Select stick boom tilt valve
tVec.sky.c2.rwd = [tVec.sky.r1.rwd(end)];
oVec.sky.c2.rwd = [o.stop];


% 10. Select knuckle boom lift valve
tVec.sky.c1.rwd = [tVec.sky.r1.rwd(end)];
oVec.sky.c1.rwd = [o.stop];


%% Ground function commands --- Forward Operation:
% 1. Select outrigger extend valve
tVec.ground.c1.fwd = [t.start]; 
oVec.ground.c1.fwd = [o.stop];
tVec.ground.c1.name = 'Outrigger';

%2. Select track extend valve
tVec.ground.c5.fwd = [t.start]; 
oVec.ground.c5.fwd = [o.stop];
tVec.ground.c5.name = 'Track';

% A. Feed right ground valve block
tVec.deviators.sky = [t.start];
oVec.deviators.sky = [o.rwd];

% B. Feed left ground valve block
tVec.deviators.ground = [t.start];
oVec.deviators.ground = [o.fwd];

% C. Meter flow to ground manifold
% Close the slower proportional valve early to 
% more gradually stop the chassis functions
tVec.ground.proportional = [t.start];
oVec.ground.proportional = [o.fwd];

%% Ground Function Commands --- Reverse Operation:

% 1. Select track extend valve
tVec.ground.c5.rwd = [tVec.sky.r1.rwd(end)];
oVec.ground.c5.rwd = [o.stop];

% 2. Select outrigger extend valve
tVec.ground.c1.rwd = [tVec.sky.r1.rwd(end)];
oVec.ground.c1.rwd = [o.stop];

%% Complete ground function commands:

tVec.ground.c1.all = [tVec.ground.c1.fwd tVec.ground.c1.rwd];
oVec.ground.c1.all = [oVec.ground.c1.fwd oVec.ground.c1.rwd];

tVec.ground.c5.all = [tVec.ground.c5.fwd tVec.ground.c5.rwd];
oVec.ground.c5.all = [oVec.ground.c5.fwd oVec.ground.c5.rwd];

%% Update proportional valve commands for ground functions:

tVec.ground.proportional = [
    tVec.ground.proportional,...
    tVec.sky.r1.rwd(end)];

oVec.ground.proportional = [
    oVec.ground.proportional,...
    o.stop];


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
    t.sky.r1.fwd.go (t.sky.r1.fwd.stop-3),...
    t.sky.r1.rwd.go (t.sky.r1.rwd.stop-3),...
    ];

oVec.sky.proportional = [
    o.stop,...
    o.fwd o.stop,...
    o.fwd o.stop];

% B. Operate ground deviator to boost flow for the hungriest
% sky manifold functions
tVec.deviators.ground = [
    tVec.deviators.ground,...
    tVec.sky.c4.rwd(end)];
oVec.deviators.ground = [
    oVec.deviators.ground,...
    o.fwd];

% Operate the sky deviator to supply the right of the chassis for outrigger
% and track retraction:
tVec.deviators.sky = [
    tVec.deviators.sky,...
    tVec.sky.c4.rwd(end)];
oVec.deviators.sky = [
    oVec.deviators.sky,...
    o.rwd];

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

tVec.SeqName = 'Turret Test';

    
    