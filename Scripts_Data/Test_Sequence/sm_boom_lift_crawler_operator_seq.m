function operator_seq = sm_boom_lift_crawler_operator_seq
% Function to define motion profiles for testing
% Copyright 2020-2025 The MathWorks, Inc.

turret.t  = [0 25.5];
turret.q  = [0 -158.9];
lift.t    = [0 47.4];
lift.p    = [0 0.57];
tilt.t    = [0 40.9];
tilt.p    = [0 0.57];
jib.t     = [0 9.6];
jib.p     = [0 0.358];
extend.t  = [0 39.4];
extend.p  = [0.25*2.54/100 3.86];
basketR.t = [0 2];
basketR.q = [0 1.09];
master.t  = [0 39.4];
master.p  = [0.258445 0.12865];     % Note, linked to slave
slave.t   = [0 39.4];
slave.p   = [0.0126513 0.2-(8e-3)]; % Note, linked to master
outfl.t   = [0 5.8];
outfl.p   = [13.4279 15.07125];
outfr.t   = [0 5.8];
outfr.p   = [13.24404 14.69659];
outrl.t   = [0 5.8];
outrl.p   = [13.24404 14.69659];
outrr.t   = [0 5.8];
outrr.p   = [13.27128 14.89625];
track.t   = [0 7];
track.p   = [0 0.305];

%% Operator Sequence 1: All Functions, Simple
operator_temp.name = 'Full Test';
operator_temp.StopTime = 357;
operator_temp.turret.t = [0 142 167.5 246 270.3 operator_temp.StopTime];
operator_temp.turret.q = [0 -1   0    1   0     0];

operator_temp.lift.t = [0 21 68.4 272 321.5 operator_temp.StopTime];
operator_temp.lift.p = [0 1 0 -1 0 0];

% Tilt needs extra time coming down if assuming same extend/retract speeds
operator_temp.tilt.t =[0 67.5 108.4 208.1 249 operator_temp.StopTime];  
operator_temp.tilt.p =[0 1 0 -1 0 0];
%operator_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

operator_temp.jib.t = [0 131.8 141.4 323 332.2 operator_temp.StopTime];
operator_temp.jib.p = [0 1 0 -1 0 0];

operator_temp.extend.t = [0 109 131 181 206 operator_temp.StopTime];
operator_temp.extend.p = [0 1 0 -1 0 0];

operator_temp.basketR.t = [0 172 174 178.4 181.5 operator_temp.StopTime];
operator_temp.basketR.q = [0 1 0 -1 0 0];

operator_temp.outRL.t = [0 5.7 11.5 341 355 operator_temp.StopTime];
operator_temp.outRL.p = [0 1 0 -1 0 0];

operator_temp.outFL.t = [0 5.7 11.5 341 355 operator_temp.StopTime];
operator_temp.outFL.p = [0 1 0 -1 0 0];

operator_temp.outRR.t = [0 5.7 11.5 341 355 operator_temp.StopTime];
operator_temp.outRR.p = [0 1 0 -1 0 0];

operator_temp.outFR.t = [0 5.7 11.5 341 355 operator_temp.StopTime];
operator_temp.outFR.p = [0 1 0 -1 0 0];

operator_temp.TrackL.t = [0 12 19 332.5 340.7 operator_temp.StopTime];
operator_temp.TrackL.p = [0 1 0 -1 0 0];

operator_temp.TrackR.t = [0 12 19 332.5 340.7 operator_temp.StopTime];
operator_temp.TrackR.p = [0 1 0 -1 0 0];
operator_seq.full = operator_temp;

%% Motion Sequence 2: Extend Test
operator_temp.name = 'Extend & Tilt Test';
operator_temp.StopTime = 153.55;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t =[0 1 40   103.8 142.8 operator_temp.StopTime];
operator_temp.tilt.p =[0 1 0 -1 0 0];
%operator_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

operator_temp.jib.t = [0 64 73    143.8 152.8 operator_temp.StopTime];
operator_temp.jib.p = [0 1 0 -1 0 0];

extp0 = 0.25*2.54/100;
operator_temp.extend.t = [0      41    63   83   84   108.8000 110.8000350 operator_temp.StopTime] ;
operator_temp.extend.p = [0      1     0    0    -1   0        0           0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0 0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0 0];
operator_seq.extend_tilt = operator_temp;

%% Motion Sequence 3: Turret Test
operator_temp.name = 'Turret Test';
operator_temp.StopTime = 56;
operator_temp.turret.t = [0 1 26 28 54 operator_temp.StopTime];
operator_temp.turret.q = [0 -1   0    1   0     0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0 0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
operator_temp.extend.t = [0      operator_temp.StopTime] ;
operator_temp.extend.p = [0  0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0 0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0 0];
operator_seq.turret = operator_temp;

%% Motion Sequence 4: Tilt Test
operator_temp.name = 'Tilt Test';
operator_temp.StopTime = 76;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t =[0 1 33 42 74 operator_temp.StopTime];
operator_temp.tilt.p =[0 1 0 -1 0 0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0 0];

operator_temp.extend.t = [0 operator_temp.StopTime] ;
operator_temp.extend.p = [0 0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0 0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0 0];
operator_seq.tilt = operator_temp;

%% Motion Sequence 5: Chassis Test
operator_temp.name = 'Chassis Test';
operator_temp.StopTime = 46;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0 0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0 0];

operator_temp.extend.t = [0     operator_temp.StopTime] ;
operator_temp.extend.p = [0 0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 1 11 32 41 46];
operator_temp.outRL.p = [0 1 0 -1 0 0];

operator_temp.outFL.t = [0 1 11 32 41 46];
operator_temp.outFL.p = [0 1 0 -1 0 0];

operator_temp.outRR.t = [0 1 11 32 41 46];
operator_temp.outRR.p = [0 1 0 -1 0 0];

operator_temp.outFR.t = [0 1 11 32 41 46];
operator_temp.outFR.p = [0 1 0 -1 0 0];

operator_temp.TrackL.t = [0 12 20 23 31 46];
operator_temp.TrackL.p = [0 1 0 -1 0 0];

operator_temp.TrackR.t = [0 12 20 23 31 46];
operator_temp.TrackR.p = [0 1 0 -1 0 0];

operator_seq.chassis = operator_temp;

%% Motion Sequence 6: Jib Test
operator_temp.name = 'Jib Test';
operator_temp.StopTime = 26.75;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0 0];
%operator_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

operator_temp.jib.t = [0 2 11 14 23.75 operator_temp.StopTime];
operator_temp.jib.p = [0 1 0 -1 0 0];

operator_temp.extend.t = [0      operator_temp.StopTime] ;
operator_temp.extend.p = [0  0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0 0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0 0];
operator_seq.jib = operator_temp;

%% Motion Sequence 7: Basket Rotate
operator_temp.name = 'Basket Rotate Test';
operator_temp.StopTime = 19.25;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t = [0 operator_temp.StopTime];
operator_temp.tilt.p = [0  0];
%operator_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0  0];

operator_temp.extend.t = [0 operator_temp.StopTime];
operator_temp.extend.p = [0 0];

operator_temp.basketR.t = [0 2 8 9 10 14.25  operator_temp.StopTime];
operator_temp.basketR.q = [0 1 0 0 -1 0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0  0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0  0];
operator_seq.basketr = operator_temp;

%% Motion Sequence 8: Lift
operator_temp.name = 'Lift Test';
operator_temp.StopTime = 103;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 2 48 49 50 101 operator_temp.StopTime];
operator_temp.lift.p = [0 1 0 0 -1 0 0];

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0 0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0  0];

operator_temp.extend.t = [0 operator_temp.StopTime];
operator_temp.extend.p = [0 0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0  0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0  0];
operator_seq.lift = operator_temp;

%% Motion Sequence 5: Chassis Test
operator_temp.name = 'Track Test';
operator_temp.StopTime = 22;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0 0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0 0];

operator_temp.extend.t = [0 operator_temp.StopTime] ;
operator_temp.extend.p = [0 0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 1 9 12 20 21 operator_temp.StopTime];
operator_temp.TrackL.p = [0 1 0 -1 0 0 0];

operator_temp.TrackR.t = [0 1 9 12 20 21 operator_temp.StopTime];
operator_temp.TrackR.p = [0 1 0 -1 0 0 0];

operator_seq.track = operator_temp;

%% ---- Animations ---- %%%

%% Motion Sequence 5: Outrigger Animation
operator_temp.name = 'Outrigger Animation';
operator_temp.StopTime = 27;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0 0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0 0];

operator_temp.extend.t = [0 operator_temp.StopTime] ;
operator_temp.extend.p = [0 0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 1 11 13 22 operator_temp.StopTime];
operator_temp.outRL.p = [0 1 0 -1 0 0];

operator_temp.outFL.t = [0 1 11 13 22 operator_temp.StopTime];
operator_temp.outFL.p = [0 1 0 -1 0 0];

operator_temp.outRR.t = [0 1 11 13 22 operator_temp.StopTime];
operator_temp.outRR.p = [0 1 0 -1 0 0];

operator_temp.outFR.t = [0 1 11 13 22 operator_temp.StopTime];
operator_temp.outFR.p = [0 1 0 -1 0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0  0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0  0];

operator_seq.anim_outr = operator_temp;
%% Motion Sequence 3: Turret Animation
operator_temp.name = 'Turret Animation';
operator_temp.StopTime = 56;
operator_temp.turret.t = [0 1 26 28 54 operator_temp.StopTime];
operator_temp.turret.q = [0 -1 0 1 0 0];

operator_temp.lift.t = [0 0.5 operator_temp.StopTime];
operator_temp.lift.p = [1 0 0];  % Needed to clear outriggers

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0 0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0 0];

operator_temp.extend.t = [0  operator_temp.StopTime] ;
operator_temp.extend.p = [0  0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0 0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0 0];
operator_seq.anim_turret = operator_temp;

%% Motion Sequence 2: Animation Extend
operator_temp.name = 'Extend Test';
operator_temp.StopTime = 53;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0 0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0 0];

operator_temp.extend.t = [0      1    24   25   26   49 53];
operator_temp.extend.p = [0   1    0    0    -1   0  0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0 0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0 0];
operator_seq.extend_only = operator_temp;

%% Motion Sequence 8: Lift
operator_temp.name = 'Lift Test';
operator_temp.StopTime = 103;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 2 48 49 50 101 operator_temp.StopTime];
operator_temp.lift.p = [0 1 0 0  -1 0 0];

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0  0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0  0];

operator_temp.extend.t = [0 operator_temp.StopTime];
operator_temp.extend.p = [0  0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0  0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0  0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0  0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0  0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0  0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0  0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0  0];
operator_seq.anim_lift = operator_temp;

%% Motion Sequence 1: All Functions, Animation
operator_temp.name = 'Animation Full';
operator_temp.StopTime = 350;
operator_temp.turret.t = [0 142 167.5 246 270.3 350];
operator_temp.turret.q = [0 -1 0 1 0 0];

operator_temp.lift.t = [0 21 68.4 272 321.5 350];
operator_temp.lift.p = [0 1 0 -1 0 0];

operator_temp.tilt.t =[0 67.5 108.4 208.1 243.5 350];
operator_temp.tilt.p =[0 1 0 -1 0 0];

operator_temp.jib.t = [0 131.8 141.4 323 332.2 350];
operator_temp.jib.p = [0 1 0 -1 0 0];

operator_temp.extend.t = [0 109 131 181 206 350];
operator_temp.extend.p = [0 1 0 -1 0 0];

operator_temp.basketR.t = [0 172 174 178.4 181.5 350];
operator_temp.basketR.q = [0 1 0 -1 0 0];

operator_temp.outRL.t = [0 5.7 11.5 341 349 350];
operator_temp.outRL.p = [0 1 0 -1 0 0];

operator_temp.outFL.t = [0 5.7 11.5 341 349 350];
operator_temp.outFL.p = [0 1 0 -1 0 0];

operator_temp.outRR.t = [0 5.7 11.5 341 349 350];
operator_temp.outRR.p = [0 1 0 -1 0 0];

operator_temp.outFR.t = [0 5.7 11.5 341 349 350];
operator_temp.outFR.p = [0 1 0 -1 0 0];

operator_temp.TrackL.t = [0 12 19 332.5 340.7 350];
operator_temp.TrackL.p = [0 1 0 -1 0 0];

operator_temp.TrackR.t = [0 12 19 332.5 340.7 350];
operator_temp.TrackR.p = [0 1 0 -1 0 0];
operator_seq.anim_full = operator_temp;


%% Motion Sequence 2: Animation Extend
operator_temp.name = 'Animation Extend Oscillate';
operator_temp.StopTime = 21;
operator_temp.turret.t = [0 operator_temp.StopTime];
operator_temp.turret.q = [0 0];

operator_temp.lift.t = [0 operator_temp.StopTime];
operator_temp.lift.p = [0 0];

operator_temp.tilt.t =[0 operator_temp.StopTime];
operator_temp.tilt.p =[0 0];

operator_temp.jib.t = [0 operator_temp.StopTime];
operator_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
operator_temp.extend.t = [0 1 5   6   10 11 15  16  20 21] ;
operator_temp.extend.p = [0 1 0 -1 0  1  0 -1 0  0];

operator_temp.basketR.t = [0 operator_temp.StopTime];
operator_temp.basketR.q = [0 0];

operator_temp.outRL.t = [0 operator_temp.StopTime];
operator_temp.outRL.p = [0 0];

operator_temp.outFL.t = [0 operator_temp.StopTime];
operator_temp.outFL.p = [0 0];

operator_temp.outRR.t = [0 operator_temp.StopTime];
operator_temp.outRR.p = [0 0];

operator_temp.outFR.t = [0 operator_temp.StopTime];
operator_temp.outFR.p = [0 0];

operator_temp.TrackL.t = [0 operator_temp.StopTime];
operator_temp.TrackL.p = [0 0];

operator_temp.TrackR.t = [0 operator_temp.StopTime];
operator_temp.TrackR.p = [0 0];
operator_seq.anim_extend_osc = operator_temp;


