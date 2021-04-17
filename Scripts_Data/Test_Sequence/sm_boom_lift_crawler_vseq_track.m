function [tVec, oVec] = sm_boom_lift_crawler_vseq_track
%% Specify the break points for the lookup tables in the Valve Commands subsystem block.
% * Times (t) are in seconds. Valve commands (o) are unitless. 
% * Table interpolation is Flat (with Use Input Below rounding). 
% * Table Extrapolation is Clipped.
% * Interpolated values pass through valve actuator blocks with 
% first-order time smoothing.
% * Valve actuator time constants range from a fraction of a second 
% (selector and deviator valves) to 5 s (proportional valves).

% Copyright 2020-2021 The MathWorks, Inc.

%% Valve Operation Commands:
o.fwd = 1; % Command to operate valve in forward direction
o.rwd = -1 ; % Command to operate valve in reverse direction
o.stop = 0; % Command to release valve to closed or centered position

%% Ground function commands --- Forward Operation:
t.start = 0; % Start everything!

tVec.ground.c1.fwd = [t.start]; 
oVec.ground.c1.fwd = [o.stop];
tVec.ground.c1.name = 'Outrigger';

%2. Select track extend valve
t.ground.c5.fwd.go = t.start + 1;
t.ground.c5.fwd.stop = t.ground.c5.fwd.go + 8;
tVec.ground.c5.fwd = [t.start t.ground.c5.fwd.go t.ground.c5.fwd.stop];
oVec.ground.c5.fwd = [o.stop o.fwd o.stop];
tVec.ground.c5.name = 'Track';

% A. Feed right ground valve block
tVec.deviators.sky = [t.start t.ground.c5.fwd.go-0.5 t.ground.c5.fwd.stop+0.5];
oVec.deviators.sky = [o.rwd o.fwd o.fwd];

% B. Feed left ground valve block
tVec.deviators.ground = [t.start t.ground.c5.fwd.stop];
oVec.deviators.ground = [o.fwd o.fwd];

% C. Meter flow to ground manifold
% Close the slower proportional valve early to 
% more gradually stop the chassis functions
tVec.ground.proportional = [t.start t.ground.c5.fwd.go-0.5 (t.ground.c5.fwd.stop-1.5) t.ground.c5.fwd.stop];
oVec.ground.proportional = [o.fwd o.stop o.fwd o.fwd];

%% Ground Function Commands --- Reverse Operation:

% 1. Select track extend valve
t.ground.c5.rwd.go   = t.ground.c5.fwd.stop + 3;
t.ground.c5.rwd.stop = t.ground.c5.rwd.go + 8;
tVec.ground.c5.rwd   = [t.ground.c5.rwd.go t.ground.c5.rwd.stop t.ground.c5.rwd.stop+1];
oVec.ground.c5.rwd   = [o.rwd o.stop o.stop];

% 2. Select outrigger extend valve
tVec.ground.c1.rwd   = [tVec.ground.c5.rwd(end)];
oVec.ground.c1.rwd   = [o.stop];

%% Complete ground function commands:

tVec.ground.c1.all = [tVec.ground.c1.fwd tVec.ground.c1.rwd tVec.ground.c1.rwd(end)+1];
oVec.ground.c1.all = [oVec.ground.c1.fwd oVec.ground.c1.rwd o.stop];

tVec.ground.c5.all = [tVec.ground.c5.fwd tVec.ground.c5.rwd tVec.ground.c1.rwd(end)+1];
oVec.ground.c5.all = [oVec.ground.c5.fwd oVec.ground.c5.rwd o.stop];

%% Update proportional valve commands for ground functions:
%  Commands for rwd ground functions

tVec.ground.proportional = [
    tVec.ground.proportional,...
    t.ground.c5.rwd.go t.ground.c5.rwd.stop];

oVec.ground.proportional = [
    oVec.ground.proportional,...
    o.stop o.fwd];

%% Sky Function Commands --- Forward Operation:
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

% 5. Select turret valve
tVec.sky.r1.fwd = [t.start];
oVec.sky.r1.fwd = [o.stop];
tVec.sky.r1.name = 'Turret';

% 6. Select basketR valve
tVec.sky.r2.fwd = [t.start];
oVec.sky.r2.fwd = [o.stop];
tVec.sky.r2.name = 'BasketR';

%% Sky Function Commands --- Reverse Operation:
% 7. Select turret valve
tVec.sky.r2.rwd = [tVec.ground.c1.all(end)];
oVec.sky.r2.rwd = [o.stop];

% 11. Select stick boom extend valve
tVec.sky.c3.rwd = [tVec.ground.c1.all(end)];
oVec.sky.c3.rwd = [o.stop];

%8. Select stick boom tilt valve
tVec.sky.c2.rwd = [tVec.ground.c1.all(end)];
oVec.sky.c2.rwd = [o.stop];

% 9. Select slew drive valve
tVec.sky.r1.rwd = [tVec.ground.c1.all(end)];
oVec.sky.r1.rwd = [o.stop];

% 10. Select knuckle boom lift valve
tVec.sky.c1.rwd = [tVec.ground.c1.all(end)];
oVec.sky.c1.rwd = [o.stop];

% 12. Select jib extend valve
tVec.sky.c4.rwd = [tVec.ground.c1.all(end)];
oVec.sky.c4.rwd = [o.stop];

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
    tVec.ground.c5.all(end)];

oVec.sky.proportional = [
    o.stop,...
    o.stop];

% B. Operate ground deviator to boost flow for the hungriest
% sky manifold functions
tVec.deviators.ground = [
    tVec.deviators.ground];
oVec.deviators.ground = [
    oVec.deviators.ground];

% Operate the sky deviator to supply the right of the chassis for outrigger
% and track retraction:
tVec.deviators.sky = [
    tVec.deviators.sky,...
    tVec.ground.c5.all(end)];
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

tVec.SeqName = 'Track Test';