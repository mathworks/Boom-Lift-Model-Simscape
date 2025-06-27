% Code to load parameters for sm_boom_lift_crawler
%
% Copyright 2020-2022 The MathWorks, Inc.

%% Line Sizes:
% Line Diameters:
d1 = 1/4; % in
d2 = 3/8; % in
d3 = 1/2; % in 

% Flow Areas:
s1 = pi/4 * d1^2; % in^2
s2 = pi/4 * d2^2; % in^2
s3 = pi/4 * d3^2; % in^2

%% Compliance volumes:
chamber.v = 0.01; % in^3

%% Valves:
% Pilot-Operated Check Valves:
%valves.pilot.p.crack = 25; % psi
%valves.pilot.p.max = 2000; % psi
%valves.pilot.p.r = 3; % --
valves.pilot.p.crack = 50; % psi
valves.pilot.p.max = 1000;
valves.pilot.p.r = 4; % psi
valves.pilot.tau = 0.1;% 025; % s

% Pressure Relief Valves:
valves.relief.p.main = 2900; % psi
valves.relief.p.r1 = 1450; % psi
valves.relief.dp = 50; % psi

% Controlled Valves, Orifices:
valves.control.l.max = 1; % in
valves.control.tau.a = 0.025; % s
valves.control.tau.b = 0.1; % s
valves.control.tau.c = 1.5; % s
valves.control.tau.d = 3; % s

% Check Valves:
valves.check.p.crack = 15; % psi
valves.check.p.max = 35; % psi

%% Counterbalance Valves:
% Common Parameters:
valves.counterbalance.common.tau = 1e-2; % s
valves.counterbalance.common.pc = 25; % psi
valves.counterbalance.common.pm = 50; % psi

% Knuckle Boom Lift Cylinder (c1):
valves.counterbalance.c1.pr.i = 5; % --
valves.counterbalance.c1.pr.ii = 1; % --
valves.counterbalance.c1.pbr = 1; % --
valves.counterbalance.c1.ps.i = 2500; % psi
valves.counterbalance.c1.ps.ii = 4000; % psi
valves.counterbalance.c1.k = 1250 / valves.control.l.max; % psi

% Stick Boom Tilt Cylinder (c2):
valves.counterbalance.c2.pr.i = 1; % --
valves.counterbalance.c2.pr.ii = 1; % --
valves.counterbalance.c2.pbr = 4; % --
valves.counterbalance.c2.ps.i = 5250; % psi
valves.counterbalance.c2.ps.ii = 5250; % psi
valves.counterbalance.c2.k = 1250 / valves.control.l.max; % psi/in

% Stick Boom Extend Cylinder (c3):
valves.counterbalance.c3.pr = 1; % --
valves.counterbalance.c3.pbr = 0.001; % --
valves.counterbalance.c3.ps = 3500; % psi
valves.counterbalance.c3.k = 1250 / valves.control.l.max; % psi; % psi

% Jib Extend Cylinder (c4):
valves.counterbalance.c4.pr.i = 1; % --
valves.counterbalance.c4.pr.ii = 1; % --
valves.counterbalance.c4.pbr = 0.001; % --
valves.counterbalance.c4.ps.i = 4000; % psi
valves.counterbalance.c4.ps.ii = 4000; % psi
valves.counterbalance.c4.k = 1250 / valves.control.l.max; % psi; % psi

% Turret Rotary Actuator (r2):
valves.counterbalance.r2.pr.i = 1; % --
valves.counterbalance.r2.pr.ii = 1; % --
valves.counterbalance.r2.pbr = 3; % --
valves.counterbalance.r2.ps.i = 3000; % psi
valves.counterbalance.r2.ps.ii = 3000; % psi
valves.counterbalance.r2.k = 1750 / valves.control.l.max; % psi; % psi

% Basket Leveling Cylinder, Master (c5):
valves.counterbalance.c5.pr.i = 5; % --
valves.counterbalance.c5.pr.ii = 10; % --
valves.counterbalance.c5.pbr = 0.001; % --
valves.counterbalance.c5.ps.i = 2000; % psi
valves.counterbalance.c5.ps.ii = 750; % psi
valves.counterbalance.c5.k = 750 / valves.control.l.max; % psi; % psi

% Basket Leveling Cylinder, Slave (c6):
valves.counterbalance.c6.pr.i = 5; % --
valves.counterbalance.c6.pr.ii = 10; % --
valves.counterbalance.c6.pbr = 0.001; % --
valves.counterbalance.c6.ps.i = 2000; % psi
valves.counterbalance.c6.ps.ii = 750; % psi
valves.counterbalance.c6.k = 750 / valves.control.l.max; % psi; % psi

%% Orifices:
orifices.sky.d1.d = (0.75/25.4); % in
orifices.sky.d1.s = pi/4 * orifices.sky.d1.d^2; % in^2
orifices.sky.r2.d = (0.3/25.4); % in
orifices.sky.r2.s = pi/4 * orifices.sky.r2.d^2; % in^2
orifices.sky.rg.d = (1/25.4); % in
orifices.sky.rg.s = pi/4 * orifices.sky.rg.d^2; % in^2
 
%% Ground Manifold Lines:
% Main:
lines.ground.main.d.p = d2; % in
lines.ground.main.d.t = d3; % in
lines.ground.main.l = 0.5; % ft
lines.ground.main.lr = 1/10 * lines.ground.main.l; % ft
lines.ground.main.s.p = s2; % in^2
lines.ground.main.s.t = s3; % in^2
lines.ground.main.s.AT = s3*0.01; % in^2
lines.ground.main.p0 = 0; % psi

% Outrigger c1:
lines.ground.c1.d = d1; % in
lines.ground.c1.s = s1; % in^2
lines.ground.c1.l = 5; % ft
lines.ground.c1.lr = 1/10 * lines.ground.c1.l; % ft
lines.ground.c1.p0.a = 2825; % psi
lines.ground.c1.p0.b = 225; % psi

% Outriggers c2:
lines.ground.c2.d = d1; % in
lines.ground.c2.s = s1; % in^2
lines.ground.c2.l = 5; % ft
lines.ground.c2.lr = 1/10 * lines.ground.c2.l; % ft
lines.ground.c2.p0.a = 2900; %psi
lines.ground.c2.p0.b = 0; % psi

% Outriggers c3:
lines.ground.c3.d = d1; % in
lines.ground.c3.s = s1; % in^2
lines.ground.c3.l = 5; % ft
lines.ground.c3.lr = 1/10 * lines.ground.c3.l; % ft
lines.ground.c3.p0.a = 2900; %psi
lines.ground.c3.p0.b = 0; % psi

% Outriggers c4:
lines.ground.c4.d = d1; % in
lines.ground.c4.s = s1; % in^2
lines.ground.c4.l = 5; % ft
lines.ground.c4.lr = 1/10 * lines.ground.c4.l; % ft
lines.ground.c4.p0.a = 2900; %psi
lines.ground.c4.p0.b = 0; % psi

% Track c5:
lines.ground.c5.d = d1; % in
lines.ground.c5.s = s1; % in^2
lines.ground.c5.l = 5; % ft
lines.ground.c5.lr = 1/10 * lines.ground.c5.l; % ft
lines.ground.c5.p0.a = 550; % psi
lines.ground.c5.p0.b = 550; % psi



% Track c6:
lines.ground.c6.d = d1; % in
lines.ground.c6.s = s1; % in^2
lines.ground.c6.l = 5; % ft
lines.ground.c6.lr = 1/10 * lines.ground.c6.l; % ft
lines.ground.c6.p0.a = 550;
lines.ground.c6.p0.b = 550;


%% Sky Manifold Lines:
% Main
lines.sky.main.d.p = d2; % in
lines.sky.main.d.t = d3; % in
lines.sky.main.s.p = s2; % in^2
lines.sky.main.s.t = s3; % in^2
lines.sky.main.l = 0.5; % ft
lines.sky.main.lr = 1/10 * lines.sky.main.l; % ft
lines.sky.main.p0 = 0; % psi

% Boom Swivel r1:
lines.sky.r1.d = d2; % in
lines.sky.r1.s = s2; % in^2
lines.sky.r1.l = 5; % ft
lines.sky.r1.lr = 1/5 * lines.sky.r1.l; % ft
lines.sky.r1.p0.a = 0; % psi
lines.sky.r1.p0.b = 0; % psi

% Knuckle Boom Lift c1:
lines.sky.c1.d = d2; % in
lines.sky.c1.s = s2; % in^2
lines.sky.c1.l = 20; % ft
lines.sky.c1.lr = 1/5 * lines.sky.c1.l; % ft
lines.sky.c1.p0.a = 750; % psi
lines.sky.c1.p0.b = 0; % psi

% Stick Boom Tilt c2:
lines.sky.c2.d = d2; % in
lines.sky.c2.s = s2; % in^2
lines.sky.c2.l = 40; % ft
lines.sky.c2.lr = 1/5 * lines.sky.c2.l; % ft
lines.sky.c2.p0.a = 450;
lines.sky.c2.p0.b = 100; % psi

% Stick Boom Extend c3:
lines.sky.c3.d.a = d3; % in
lines.sky.c3.d.b = d2; % in
lines.sky.c3.s.a = s3; % in^2
lines.sky.c3.s.b = s2; % in^2
lines.sky.c3.l = 65; % ft
lines.sky.c3.lr = 1/5 * lines.sky.c3.l; % ft
lines.sky.c3.p0.a = 200; % psi
lines.sky.c3.p0.b = 200; % psi

% Jib Extend c4:
lines.sky.c4.d = d1; % in
lines.sky.c4.s = s1; % in^2
lines.sky.c4.l = 70; % ft
lines.sky.c4.lr = 1/5 * lines.sky.c4.l; % ft
lines.sky.c4.p0.a = 100.6;
lines.sky.c4.p0.b = 90.6;

% Turret Swivel r2:
lines.sky.r2.d = d1; % in
lines.sky.r2.s = s1; % in^2
lines.sky.r2.l = 75; % ft
lines.sky.r2.lr = 1/5 * lines.sky.r2.l; % ft
lines.sky.r2.p0.a = 0; % psi
lines.sky.r2.p0.b = 0; % psi

% Basket Level c5:
lines.sky.c5.d = d1; % in
lines.sky.c5.s = s1; % in^2
lines.sky.c5.l = 40; % ft
lines.sky.c5.lr = 1/5 * lines.sky.c5.l; % ft
lines.sky.c5.p0.a = 250; % psi
lines.sky.c5.p0.b = 375; % psi

% Basket Level c6:
lines.sky.c6.d = d1; % in
lines.sky.c6.s = s1; % in^2
lines.sky.c6.l = 40; % ft
lines.sky.c6.lr = 1/5 * lines.sky.c6.l; % ft
lines.sky.c6.p0.a = 250; % psi
lines.sky.c6.p0.b = 375; % psi

%% Ground Cylinders
% Outrigger c1:
cylinders.ground.c1.d.piston = 3.3; % in
cylinders.ground.c1.d.rod = 1.65; % in
cylinders.ground.c1.s.a = pi/4 * cylinders.ground.c1.d.piston^2; % in^2
cylinders.ground.c1.s.b = pi/4 * ( cylinders.ground.c1.d.piston^2 - cylinders.ground.c1.d.rod^2); % in^2
cylinders.ground.c1.stops.a = 5; % in
cylinders.ground.cl.stops.b = 15.2; % in
cylinders.ground.c1.stops.kc = 1e6; % N/m
cylinders.ground.c1.stops.bc = 1e3; % N/(m/s)
cylinders.ground.c1.stroke = cylinders.ground.cl.stops.b - cylinders.ground.c1.stops.a; % in
cylinders.ground.c1.v.dead = 1/10 * cylinders.ground.c1.s.a * cylinders.ground.c1.stroke; % in^3
cylinders.ground.c1.pz0.sh = cylinders.ground.c1.stroke - 2; % in
cylinders.ground.c1.pz0.sm = cylinders.ground.c1.pz0.sh + cylinders.ground.c1.stops.a; % in
cylinders.ground.c1.b = 100;  % N/(m/s)

% Outrigger c2:
cylinders.ground.c2.d.piston = 3.3; % in
cylinders.ground.c2.d.rod = 1.65; % in
cylinders.ground.c2.s.a = pi/4 * cylinders.ground.c2.d.piston^2; % in^2
cylinders.ground.c2.s.b = pi/4 * ( cylinders.ground.c2.d.piston^2 - cylinders.ground.c2.d.rod^2); % in^2
cylinders.ground.c2.stops.a = 5; % in
cylinders.ground.c2.stops.b = 15.2; % in
cylinders.ground.c2.stops.kc = 1e6; % N/m
cylinders.ground.c2.stops.bc = 1e3; % N/(m/s)
cylinders.ground.c2.stroke = cylinders.ground.c2.stops.b - cylinders.ground.c2.stops.a; % in
cylinders.ground.c2.v.dead = 1/10 * cylinders.ground.c2.s.a * cylinders.ground.c2.stroke; % in^3
cylinders.ground.c2.pz0.sh = cylinders.ground.c2.stroke - 2; % in
cylinders.ground.c2.pz0.sm = cylinders.ground.c2.pz0.sh + cylinders.ground.c2.stops.a; % in

% Outrigger c3:
cylinders.ground.c3.d.piston = 3.3; % in
cylinders.ground.c3.d.rod = 1.65; % in
cylinders.ground.c3.s.a = pi/4 * cylinders.ground.c3.d.piston^2; % in^2
cylinders.ground.c3.s.b = pi/4 * ( cylinders.ground.c3.d.piston^2 - cylinders.ground.c3.d.rod^2); % in^2
cylinders.ground.c3.stops.a = 5; % in
cylinders.ground.c3.stops.b = 15.2; % in
cylinders.ground.c3.stops.kc = 1e6; % N/m
cylinders.ground.c3.stops.bc = 1e3; % N/(m/s)
cylinders.ground.c3.stroke = cylinders.ground.c3.stops.b - cylinders.ground.c3.stops.a; % in
cylinders.ground.c3.v.dead = 1/10 * cylinders.ground.c3.s.a * cylinders.ground.c3.stroke; % in^3
cylinders.ground.c3.pz0.sh = cylinders.ground.c3.stroke - 2; % in
cylinders.ground.c3.pz0.sm = cylinders.ground.c3.pz0.sh + cylinders.ground.c3.stops.a; % in

% Outrigger c4:
cylinders.ground.c4.d.piston = 3.3; % in
cylinders.ground.c4.d.rod = 1.65; % in
cylinders.ground.c4.s.a = pi/4 * cylinders.ground.c4.d.piston^2; % in^2
cylinders.ground.c4.s.b = pi/4 * ( cylinders.ground.c4.d.piston^2 - cylinders.ground.c4.d.rod^2); % in^2
cylinders.ground.c4.stops.a = 5; % in
cylinders.ground.c4.stops.b = 15.2; % in
cylinders.ground.c4.stops.kc = 1e6; % N/m
cylinders.ground.c4.stops.bc = 1e3; % N/(m/s)
cylinders.ground.c4.stroke = cylinders.ground.c4.stops.b - cylinders.ground.c4.stops.a; % in
cylinders.ground.c4.v.dead = 1/10 * cylinders.ground.c4.s.a * cylinders.ground.c4.stroke; % in^3
cylinders.ground.c4.pz0.sh = cylinders.ground.c4.stroke - 2; % in
cylinders.ground.c4.pz0.sm = cylinders.ground.c4.pz0.sh + cylinders.ground.c4.stops.a; % in

% Track c5:
cylinders.ground.c5.d.piston = 3; % in
cylinders.ground.c5.d.rod = 1.5; % in
cylinders.ground.c5.s.a = pi/4 * cylinders.ground.c5.d.piston^2; % in^2
cylinders.ground.c5.s.b = pi/4 * ( cylinders.ground.c5.d.piston^2 - cylinders.ground.c5.d.rod^2 ); %in^2
cylinders.ground.c5.stops.a = 0; % in
cylinders.ground.c5.stops.b = 12; % in
cylinders.ground.c5.stops.kc = 3e6; % N/m
cylinders.ground.c5.stops.bc = 1e3; % N/(m/s)
cylinders.ground.c5.stroke = cylinders.ground.c5.stops.b - cylinders.ground.c5.stops.a; % in
cylinders.ground.c5.v.dead = 1/10 * (cylinders.ground.c5.s.a * cylinders.ground.c5.stroke); % in^3

% Track c6:
cylinders.ground.c6.d.piston = 3; % in
cylinders.ground.c6.d.rod = 1.5; % in
cylinders.ground.c6.s.a = pi/4 * cylinders.ground.c6.d.piston^2; % in^2
cylinders.ground.c6.s.b = pi/4 * ( cylinders.ground.c6.d.piston^2 - cylinders.ground.c6.d.rod^2 ); %in^2
cylinders.ground.c6.stops.a = 0; % in
cylinders.ground.c6.stops.b = 12; % in
cylinders.ground.c6.stops.kc = 3e6; % N/m
cylinders.ground.c6.stops.bc = 1e3; % N/(m/s)
cylinders.ground.c6.stroke = cylinders.ground.c6.stops.b - cylinders.ground.c6.stops.a; % in
cylinders.ground.c6.v.dead = 1/10 * (cylinders.ground.c6.s.a * cylinders.ground.c6.stroke); % in^3

%% Sky Cylinders and Rotary Actuators
% Slew Drive Swivel r1:
actuators.sky.r1.v = 465; % cm^3
actuators.sky.r1.p = [500; 1000; 1500; 2000]; % psi
actuators.sky.r1.w = [9; 17; 33; 49; 66; 82; 98; 115; 131; 147]; % rpm
actuators.sky.r1.ev = [
        [5;5;5;4]/9,...
        [14;13;13;12]/17,...
        [30;28;28;26]/33,...
        [47;44;44;41]/49,...
        [63;60;60;57]/66,...
        [80;78;78;75]/82,...
        [97;94;93;90]/98,...
        [113;112;111;108]/115,...
        [130;129;127;123]/131,...
        [146;145;145;142]/147,...
        ]; % --
actuators.sky.r1.em = [
    [1794,1845,1774,1704,1587,1455,1248,1006,736,497]/2253;...
    [3618,3851,3932,3880,3752,3597,3350,3094,2846,2434]/4506;...
    [5402,5836,5829,5955,5863,5550,5575,5133,4819,4657]/6760;...
    [7209,7563,7836,7715,7586,7533,7363,7101,7040,6519]/9013;...
    ]; % --

    
% Knuckle boom 	 c1:
cylinders.sky.c1.d.piston = 5.1; % in
cylinders.sky.c1.d.rod = 4; % in
cylinders.sky.c1.s.a = pi/4 * cylinders.sky.c1.d.piston^2; % in^2
cylinders.sky.c1.s.b = pi/4 * ( cylinders.sky.c1.d.piston^2 - cylinders.sky.c1.d.rod^2 ); %in^2
cylinders.sky.c1.stops.a = 0; % in
cylinders.sky.c1.stops.b = 22.75; % in
cylinders.sky.c1.stops.kc = 3e6; % N/m
cylinders.sky.c1.stops.bc = 1e4; % N/(m/s)
cylinders.sky.c1.stroke = cylinders.sky.c1.stops.b - cylinders.sky.c1.stops.a; % in
cylinders.sky.c1.v.dead = 1/10 * (cylinders.sky.c1.s.a * cylinders.ground.c1.stroke); % in^3

% Stick boom tilt c2:
cylinders.sky.c2.d.piston = 5.1; % in
cylinders.sky.c2.d.rod = 1.7; % in
cylinders.sky.c2.s.a = pi/4 * cylinders.sky.c2.d.piston^2; % in^2
cylinders.sky.c2.s.b = pi/4 * ( cylinders.sky.c2.d.piston^2 - cylinders.sky.c2.d.rod^2 ); %in^2
cylinders.sky.c2.stops.a = 0; % in
cylinders.sky.c2.stops.b = 23; % in
cylinders.sky.c2.stops.kc = 3e6; % N/m
cylinders.sky.c2.stops.bc = 1e4; % N/(m/s)
cylinders.sky.c2.stops.x0 = 0.1; % in
cylinders.sky.c2.stroke = cylinders.sky.c2.stops.b - cylinders.sky.c2.stops.a; % in
cylinders.sky.c2.v.dead = 1/10 * (cylinders.sky.c2.s.a * cylinders.ground.c2.stroke); % in^3

% Stick Boom Extend c3:
cylinders.sky.c3.d.piston = 4; % in
cylinders.sky.c3.d.rod = 2.75; % in
cylinders.sky.c3.s.a = pi/4 * cylinders.sky.c3.d.piston^2; % in^2
cylinders.sky.c3.s.b = pi/4 * ( cylinders.sky.c3.d.piston^2 - cylinders.sky.c3.d.rod^2 ); %in^2
cylinders.sky.c3.stops.a = 0.75; % in
cylinders.sky.c3.stops.b = 150; % in
cylinders.sky.c3.stops.kc = 1e6; % N/m
cylinders.sky.c3.stops.bc = 1e3; % N/(m/s)
cylinders.sky.c3.stroke = cylinders.sky.c3.stops.b - cylinders.sky.c3.stops.a; % in
cylinders.sky.c3.v.dead = 1/10 * (cylinders.sky.c3.s.a * cylinders.sky.c3.stroke); % in^3

% Jib Extend c4:
cylinders.sky.c4.d.piston = 3; % in
cylinders.sky.c4.d.rod = 1; % in
cylinders.sky.c4.s.a = pi/4 * cylinders.sky.c4.d.piston^2; % in^2
cylinders.sky.c4.s.b = pi/4 * ( cylinders.sky.c4.d.piston^2 - cylinders.sky.c4.d.rod^2 ); %in^2
cylinders.sky.c4.stops.a = 0; % in
cylinders.sky.c4.stops.b = 15.5; % in
cylinders.sky.c4.stops.kc = 3e6; % N/m
cylinders.sky.c4.stops.bc = 1e4; % N/(m/s)
cylinders.sky.c4.stroke = cylinders.sky.c4.stops.b - cylinders.sky.c4.stops.a; % in
cylinders.sky.c4.v.dead = 1/10 * (cylinders.sky.c4.s.a * cylinders.ground.c4.stroke); % in^3

% Turret Swivel r2:
actuators.sky.r2.displacement = 81; % cm^3/rev
actuators.sky.r2.stops.a = -62; % deg
actuators.sky.r2.stops.b = +62; % deg
actuators.sky.r2.stops.kc = 1e4; % N*m/rad
actuators.sky.r2.stops.bc = 1e2; % N*m/(rad/s)
actuators.sky.r2.stroke = actuators.sky.r2.stops.b - actuators.sky.r2.stops.a; % deg
actuators.sky.r2.q0 = actuators.sky.r2.stroke / 2; % deg
actuators.sky.r2.v.dead = 1/10 * actuators.sky.r2.displacement; % cm^3

% Basket Level c5:
cylinders.sky.c5.d.piston = 2.4; % in
cylinders.sky.c5.d.rod = 1.2; % in
cylinders.sky.c5.s.a = pi/4 * cylinders.sky.c5.d.piston^2; % in^2
cylinders.sky.c5.s.b = pi/4 * ( cylinders.sky.c5.d.piston^2 - cylinders.sky.c5.d.rod^2 ); %in^2
cylinders.sky.c5.stops.a = 0; % in
cylinders.sky.c5.stops.b = 10; % in
cylinders.sky.c5.stops.kc = 1e5; % N/m
cylinders.sky.c5.stops.bc = 1e3; % N/(m/s)
cylinders.sky.c5.stroke = cylinders.sky.c5.stops.b - cylinders.sky.c5.stops.a; % in
cylinders.sky.c5.v.dead = 1/10 * (cylinders.sky.c5.s.a * cylinders.ground.c5.stroke); % in^3

% Basket Level c6:
cylinders.sky.c6.d.piston = 2; % in
cylinders.sky.c6.d.rod = 1; % in
cylinders.sky.c6.s.a = pi/4 * cylinders.sky.c6.d.piston^2; % in^2
cylinders.sky.c6.s.b = pi/4 * ( cylinders.sky.c6.d.piston^2 - cylinders.sky.c6.d.rod^2 ); %in^2
cylinders.sky.c6.stops.a = 0; % in
cylinders.sky.c6.stops.b = 8.75; % in
cylinders.sky.c6.stops.kc = 1e5; % N/m
cylinders.sky.c6.stops.bc = 1e3; % N/(m/s)
cylinders.sky.c6.stroke = cylinders.sky.c6.stops.b - cylinders.sky.c6.stops.a; % in
cylinders.sky.c6.v.dead = 1/10 * (cylinders.sky.c6.s.a * cylinders.ground.c6.stroke); % in^3
cylinders.sky.c6.p0.b = lines.sky.c6.p0.b + 325; % psi

% Additional parameters
ratio_dissolved_air = 0.05; % ratio


