% Code to load parameters for sm_boom_lift_crawler
%
% Copyright 2020-2025 The MathWorks, Inc.

%% Multibody Parameters
% 0. Outrigger Swivel Positions
% 1. Contact Damping and Stiffness
% 2. Joint damping
% 3. Joint Targets
% 4. Solid density
% 5. Solid color

%% 0. Outrigger Positions
% Set to +24 or +58 deg
q.outriggers.c1 = 58; % deg
q.outriggers.c2 = 58; % deg
q.outriggers.c3 = 58; % deg
q.outriggers.c4 = 58; % deg

%% 1. Joint damping

b.r.joint = 1e2; % N*m/(rad/s)
b.p.joint.i = 2e4; % N/(m/s)
b.p.joint.ii = 3e4; % N/(m/s)
b.p.joint.iii = 5e4; % N/(m/s)

%% 2. Contact Stiffness and Damping
k.p.ground = 8e5; %N/(m/s)
b.p.ground = 2e5; %N*m/(rad/s)

%% 3. Joint Targets
% pz0.outrigger.extend = 13; % in, 5--15.2 rom
pz0.outrigger.swivel = 58; % deg, 0/28/56 positions
pz0.stickboom.extend = 0.25; % in, 0.75-160 rom

%% 4. Density (lbm/ft^3):
rho.steel = 500;
rho.aluminum = 168;
rho.rubber = 94;
rho.plastic = 60;

%% 5. Major Part Masses (lbm)
m.slewingArm = 480;
m.beam1A = 430;
m.beam1B = 310;
m.lowerKnuckle = 280;
m.coupler = 60;
m.beam2B = 625;
m.beam2A = 450/2;
m.upperKnuckle = 185;
m.stickBase = 200;
m.stickMiddle = 165;
m.stickFly = 115;
m.turretFrame = 35;
m.basketMount = 65;
m.basket = 95;

%% 6. Color ([R G B]):
%% Livery colors:
% Main tones:
orange = [1 0.47 0.16]; % Set as livery tone *a* for standard color scheme
beige = [0.95 0.91 0.75]; % Set as livery tone *b* for standard color scheme
green = [0.5 0.93 0.29]; % Set as livery tones *a* and *b* for alternative color scheme

rgb.livery.a.diffuse = orange;
rgb.livery.a.specular = [0.5 0.5 0.5];
rgb.livery.a.ambient = rgb.livery.a.diffuse * 1/2 - [0.05 0.05 0.05];
rgb.livery.a.emissive = [0 0 0];
rgb.livery.a.shininess = 80;

rgb.livery.b.diffuse = beige;
rgb.livery.b.specular = [0.4 0.4 0.4];
rgb.livery.b.ambient = rgb.livery.b.diffuse * 2/5 + [0.05 0.05 0.05]; 
rgb.livery.b.emissive = [0 0 0];
rgb.livery.b.shininess = 75;

% Metallic Tones:
rgb.metallic.a.diffuse = [0.22 0.25 0.29 1];
rgb.metallic.a.specular = [0.3 0.3 0.3];
rgb.metallic.a.ambient = [0.1 0.1 0.1];
rgb.metallic.a.emissive = [0 0 0];
rgb.metallic.a.shininess = 30;

rgb.metallic.b.diffuse = [0.55 0.59 0.65];
rgb.metallic.b.specular = [0.4 0.4 0.4];
rgb.metallic.b.ambient = [0.1 0.1 0.1];
rgb.metallic.b.emissive = [0 0 0];
rgb.metallic.b.shininess = 20;

rgb.metallic.c.diffuse = [0.6 0.6 0.6];
rgb.metallic.c.specular = [0.7 0.7 0.7];
rgb.metallic.c.ambient = [0.2 0.2 0.2];
rgb.metallic.c.emissive = [0 0 0];
rgb.metallic.c.shininess = 8;

rgb.metallic.d.diffuse = [0.9 0.88 0.82];
rgb.metallic.d.specular = rgb.metallic.d.diffuse * 1.1;
rgb.metallic.d.ambient = rgb.metallic.d.diffuse * 1/5;
rgb.metallic.d.emissive = [0 0 0];
rgb.metallic.d.shininess = 20;

rgb.metallic.e.diffuse = [0.7 0.7 0.7];
rgb.metallic.e.specular = [0.8 0.8 0.8];
rgb.metallic.e.ambient = [0.4 0.4 0.4];
rgb.metallic.e.emissive = [0 0 0];
rgb.metallic.e.shininess = 20;

rgb.metallic.f.diffuse = [0.5 0.5 0.5];
rgb.metallic.f.specular = [0.89 0.88 0.87];
rgb.metallic.f.ambient = [0.2 0.18 0.17];
rgb.metallic.f.emissive = [0 0 0];
rgb.metallic.f.shininess = 10;

rgb.metallic.g.diffuse = [0.5 0.5 0.5].*[0.7 0.7 1.5];
rgb.metallic.g.specular = [0.89 0.88 0.87].*[1 1 1];
rgb.metallic.g.ambient = [0.2 0.18 0.17];
rgb.metallic.g.emissive = [0 0 0];
rgb.metallic.g.shininess = 10;


% Grays
rgb.gray.a.diffuse = [0.4 0.4 0.4];
rgb.gray.a.specular = [0.5 0.5 0.5];
rgb.gray.a.ambient = [0.1 0.1 0.1];
rgb.gray.a.emissive = [0 0 0];
rgb.gray.a.shininess = 75;

rgb.gray.b.diffuse = [0.7 0.7 0.7];
rgb.gray.b.specular = [0.8 0.8 0.8];
rgb.gray.b.ambient = [0.1 0.1 0.1];
rgb.gray.b.emissive = [0 0 0];
rgb.gray.b.shininess = 30;

rgb.gray.c.diffuse = [0.61 0.64 0.65];
rgb.gray.c.specular = [0.7 0.7 0.7];
rgb.gray.c.ambient = [0.2 0.2 0.2];
rgb.gray.c.emissive = [0 0 0];
rgb.gray.c.shininess = 75;

rgb.gray.e.diffuse = [0.15 0.15 0.15];
rgb.gray.e.specular = [0.4 0.4 0.4];
rgb.gray.e.ambient = [0.1 0.1 0.1];
rgb.gray.e.emissive = [0 0 0];
rgb.gray.e.shininess = 60;

% Caution colors:
rgb.caution.white.diffuse = [1 0.97 0.9];
rgb.caution.white.specular = [1 0.97 0.9];
rgb.caution.white.ambient = [0.5 0.48 0.45];
rgb.caution.white.emissive = [0.1 0.1 0.1];
rgb.caution.white.shininess = 6;

rgb.caution.red.diffuse = [0.4 0 0];
rgb.caution.red.specular = [1 0 0];
rgb.caution.red.ambient = [0.1 0.1 0.1];
rgb.caution.red.emissive = [0.1 0 0];
rgb.caution.red.shininess = 5;

rgb.caution.orange.diffuse = [1 0.6 0 0.5];
rgb.caution.orange.specular = [0.4 0.4 0.4];
rgb.caution.orange.ambient = [0.1 0.1 0.1];
rgb.caution.orange.emissive = [0.6 0.4 0];
rgb.caution.orange.shininess = 2;

rgb.caution.yellow.diffuse = [1 0.8 0];
rgb.caution.yellow.specular = [0.5 0.5 0.5];
rgb.caution.yellow.ambient = [1 0.8 0];
rgb.caution.yellow.emissive = [0 0 0];
rgb.caution.yellow.shininess = 10;

% Miscellaneous bright colors:
rgb.brights.blue.diffuse = [0.18 0.43 0.68];
rgb.brights.blue.specular = [0.5 0.5 0.5];
rgb.brights.blue.ambient = rgb.brights.blue.diffuse * 2/5;
rgb.brights.blue.emissive = [0 0 0];
rgb.brights.blue.shininess = 75;

rgb.brights.red.diffuse = [0.78 0.20 0];
rgb.brights.red.specular = [0.5 0.5 0.5];
rgb.brights.red.ambient = rgb.brights.red.diffuse * 2/5;
rgb.brights.red.emissive = [0 0 0];
rgb.brights.red.shininess = 100;
