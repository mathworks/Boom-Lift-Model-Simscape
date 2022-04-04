function motion = sm_boom_lift_crawler_motion
% Function to define motion profiles for testing
% Copyright 2020-2022 The MathWorks, Inc.

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

%% Motion Sequence 1: All Functions, Simple
motion_temp.name = 'Full Test';
motion_temp.StopTime = 350;
motion_temp.turret.t = [0 142 167.5 246 270.3 350];
motion_temp.turret.q = [0 0 -158.9 -158.9 0 0];

motion_temp.lift.t = [0 21 68.4 272 321.5 350];
motion_temp.lift.p = [0 0 0.57 0.57 0.0268 0.0268];

motion_temp.tilt.t =[0 67.5 108.4 208.1 243.5 350];
motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 131.8 141.4 323 332.2 350];
motion_temp.jib.p = [0  0    0.358   0.358 0.0175 0.0175];

motion_temp.extend.t = [0 109 131 181 206 350];
motion_temp.extend.p = [0.25*2.54/100  0.25*2.54/100    3.86   3.86 -0.0139 -0.0139];

motion_temp.basketR.t = [0 172 174 178.4 181.5 350];
motion_temp.basketR.q = [0 0 1.09 1.09 0 0];

motion_temp.master.t = [0 69 108.4 208 243.7 350];
motion_temp.master.p = [0.258445  0.258445    0.12865   0.12865 0.2852 0.2852];
motion_temp.master.p = [1 1 1 1 1 1]*0.258445;

motion_temp.slave.t = [0 69 108.4 208 243.7 350];
motion_temp.slave.p = [0.0126513  0.0126513    0.2-(8e-3)   0.2-(8e-3) 0.01265125 0.01265125];
%motion_temp.slave.p = [1 1 1 1 1 1]*0.0126513;

motion_temp.outRL.t = [0 5.7 11.5 341 349 350];
motion_temp.outRL.p = [13.24404  13.24404    14.69659   14.69659 13.24404 13.24404];
motion_temp.outRL.p = [13.004645669291337  13.004645669291337    14.69659   14.69659 13.004645669291337 13.004645669291337];

motion_temp.outFL.t = [0 5.7 11.5 341 349 350];
motion_temp.outFL.p = [13.4279  13.4279    15.07125   15.07125 13.4279 13.4279];
motion_temp.outFL.p = [13.359685039370081  13.359685039370081    15.07125   15.07125 13.359685039370081 13.359685039370081];

motion_temp.outRR.t = [0 5.7 11.5 341 349 350];
motion_temp.outRR.p = [13.27128  13.27128    14.89625   14.89625 13.27128 13.27128];
motion_temp.outRR.p = [13.207637795275589  13.207637795275589    14.89625   14.89625 13.207637795275589 13.207637795275589];

motion_temp.outFR.t = [0 5.7 11.5 341 349 350];
motion_temp.outFR.p = [13.252606  13.252606  15.075878   15.075878 13.252606 13.252606];
motion_temp.outFR.p = [13.359685039370081  13.3596850393700811    15.07125   15.07125 13.359685039370081 13.359685039370081];

motion_temp.TrackL.t = [0 12 19 332.5 340.7 350];
motion_temp.TrackL.p = [0  0    0.305   0.305 0 0];

motion_temp.TrackR.t = [0 12 19 332.5 340.7 350];
motion_temp.TrackR.p = [0  0    0.305   0.305 0 0];
motion.full = motion_temp;

%% Motion Sequence 2: Extend Test
motion_temp.name = 'Extend & Tilt Test';
motion_temp.StopTime = 153.55;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t =[0 1 40   110.8 142.8 motion_temp.StopTime];
motion_temp.tilt.p =[0 0 0.57 0.57  0    0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 64 73    143.8 152.8 motion_temp.StopTime];
motion_temp.jib.p = [0  0  0.358 0.358 0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0      41    63   83   84   108.8000 110.8000350 motion_temp.StopTime] ;
motion_temp.extend.p = [extp0  extp0 3.86 3.86 3.86 -0.0139 -0.0139 -0.0139];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 1 40   110.8 142.8 motion_temp.StopTime];
motion_temp.master.p = [0.258445  0.258445    0.12865   0.12865 0.2852 0.2852];
motion_temp.master.p = [1 1 1 1 1 1]*0.258445;

motion_temp.slave.t = [0 1 40   110.8 142.8 motion_temp.StopTime];
motion_temp.slave.p = [0.0126513  0.0126513    0.2-(8e-3)   0.2-(8e-3) 0.01265125 0.01265125];
%motion_temp.slave.p = [1 1 1 1 1 1]*0.0126513;

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [13.24404  13.24404];

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [13.4279  13.4279];

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [13.27128  13.27128];

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [13.252606  13.252606];

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0 0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0 0];
motion.extend_tilt = motion_temp;

%% Motion Sequence 3: Turret Test
motion_temp.name = 'Turret Test';
motion_temp.StopTime = 56;
motion_temp.turret.t = [0 1 26 28 54 motion_temp.StopTime];
motion_temp.turret.q = [0 0 -158.9 -158.9 0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0 0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0      motion_temp.StopTime] ;
motion_temp.extend.p = [extp0  extp0];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
motion_temp.master.p = [0.258445  0.258445];
motion_temp.master.p = [1 1 1 1 1 1]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
motion_temp.slave.p = [0.0126513  0.0126513];

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [13.24404  13.24404];

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [13.4279  13.4279];

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [13.27128  13.27128];

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [13.252606  13.252606];

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0 0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0 0];
motion.turret = motion_temp;

%% Motion Sequence 4: Tilt Test
motion_temp.name = 'Tilt Test';
motion_temp.StopTime = 76;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t =[0 1 40 42 74 motion_temp.StopTime];
motion_temp.tilt.p =[0 0 0.57 0.57  0    0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0     motion_temp.StopTime] ;
motion_temp.extend.p = [extp0 extp0];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 1 40 42 74 motion_temp.StopTime];
motion_temp.master.p = [0.258445  0.258445    0.12865   0.12865 0.2852 0.2852];
motion_temp.master.p = [1 1 1 1 1 1]*0.258445;

motion_temp.slave.t = [0 1 40 42 74 motion_temp.StopTime];
motion_temp.slave.p = [0.0126513  0.0126513    0.2-(8e-3)   0.2-(8e-3) 0.01265125 0.01265125];
%motion_temp.slave.p = [1 1 1 1 1 1]*0.0126513;

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [13.24404  13.24404];

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [13.4279  13.4279];

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [13.27128  13.27128];

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [13.252606  13.252606];

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0 0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0 0];
motion.tilt = motion_temp;

%% Motion Sequence 5: Chassis Test
motion_temp.name = 'Chassis Test';
motion_temp.StopTime = 46;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0 0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0     motion_temp.StopTime] ;
motion_temp.extend.p = [extp0 extp0];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
%motion_temp.master.p = [0.258445  0.258445    0.12865   0.12865 0.2852 0.2852];
motion_temp.master.p = [1 1 ]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
%motion_temp.slave.p = [0.0126513  0.0126513    0.2-(8e-3)   0.2-(8e-3) 0.01265125 0.01265125];
motion_temp.slave.p = [1 1 ]*0.0126513;

motion_temp.outRL.t = [0 1 11 32 41 46];
motion_temp.outRL.p = [13.0061  13.0061    14.69659   14.69659 10 10];

motion_temp.outFL.t = [0 1 11 32 41 46];
motion_temp.outFL.p = [13.3611  13.3611    15.07125   15.07125 10 10];

motion_temp.outRR.t = [0 1 11 32 41 46];
motion_temp.outRR.p = [13.2091  13.2091    14.89625   14.89625 10 10];

motion_temp.outFR.t = [0 1 11 32 41 46];
motion_temp.outFR.p = [13.3611  13.3611    15.07125   15.07125 10 10];

motion_temp.TrackL.t = [0 12 20 23 31 46];
motion_temp.TrackL.p = [0  0    0.305   0.305 0 0];

motion_temp.TrackR.t = [0 12 20 23 31 46];
motion_temp.TrackR.p = [0  0    0.305   0.305 0 0];

motion.chassis = motion_temp;

%% Motion Sequence 6: Jib Test
motion_temp.name = 'Jib Test';
motion_temp.StopTime = 26.75;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0 0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 2 11 14 23.75 motion_temp.StopTime];
motion_temp.jib.p = [0  0  0.358 0.358 0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0      motion_temp.StopTime] ;
motion_temp.extend.p = [extp0  extp0];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
motion_temp.master.p = [1 1]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
motion_temp.slave.p = [1 1]*0.0126513;

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [13.24404  13.24404];

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [13.4279  13.4279];

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [13.27128  13.27128];

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [13.252606  13.252606];

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0 0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0 0];
motion.jib = motion_temp;

%% Motion Sequence 7: Basket Rotate
motion_temp.name = 'Basket Rotate Test';
motion_temp.StopTime = 19.25;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t = [0 motion_temp.StopTime];
motion_temp.tilt.p = [0  0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0  0];

motion_temp.extend.t = [0 motion_temp.StopTime];
motion_temp.extend.p = [1 1]*0.25*2.54/100;

motion_temp.basketR.t = [0 2 8 9 10 14.25  motion_temp.StopTime];
motion_temp.basketR.q = [0 0 1.09 1.09 1.09 0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
motion_temp.master.p = [1 1]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
motion_temp.slave.p = [1 1 ]*0.0126513;
%motion_temp.slave.p = [1 1 1 1 1 1]*0.0126513;

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [13.0061  13.0061];

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [13.3611  13.3611];

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [13.2091  13.2091];

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [13.3611  13.3611];

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0  0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0  0];
motion.basketr = motion_temp;

%% Motion Sequence 8: Lift
motion_temp.name = 'Lift Test';
motion_temp.StopTime = 103;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 2 48 49 50 101 motion_temp.StopTime];
motion_temp.lift.p = [0 0 0.57 0.57  0.57 0 0];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0  0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0  0];

motion_temp.extend.t = [0 motion_temp.StopTime];
motion_temp.extend.p = [0.25*2.54/100  0.25*2.54/100];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
motion_temp.master.p = [1 1]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
motion_temp.slave.p = [1 1]*0.0126513;

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [1 1]*13.0061;

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [1 1]*13.3611;

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [1 1]*13.2091;

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [1 1]*13.3611;

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0  0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0  0];
motion.lift = motion_temp;

%% Motion Sequence 5: Chassis Test
motion_temp.name = 'Track Test';
motion_temp.StopTime = 22;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0 0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0 motion_temp.StopTime] ;
motion_temp.extend.p = [extp0 extp0];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
%motion_temp.master.p = [0.258445  0.258445    0.12865   0.12865 0.2852 0.2852];
motion_temp.master.p = [1 1 ]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
%motion_temp.slave.p = [0.0126513  0.0126513    0.2-(8e-3)   0.2-(8e-3) 0.01265125 0.01265125];
motion_temp.slave.p = [1 1 ]*0.0126513;

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [13.0061  13.0061];

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [13.3611  13.3611];

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [13.2091  13.2091];

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [13.3611  13.3611];

motion_temp.TrackL.t = [0 1 9 12 20 21 motion_temp.StopTime];
motion_temp.TrackL.p = [0  0  0.305   0.305 0 0 0];

motion_temp.TrackR.t = [0 1 9 12 20 21 motion_temp.StopTime];
motion_temp.TrackR.p = [0  0  0.305   0.305 0 0 0];

motion.track = motion_temp;

%% ---- Animations ---- %%%

%% Motion Sequence 5: Outrigger Animation
motion_temp.name = 'Outrigger Animation';
motion_temp.StopTime = 27;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0 0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0     motion_temp.StopTime] ;
motion_temp.extend.p = [extp0 extp0];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
%motion_temp.master.p = [0.258445  0.258445    0.12865   0.12865 0.2852 0.2852];
motion_temp.master.p = [1 1 ]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
%motion_temp.slave.p = [0.0126513  0.0126513    0.2-(8e-3)   0.2-(8e-3) 0.01265125 0.01265125];
motion_temp.slave.p = [1 1 ]*0.0126513;

motion_temp.outRL.t = [0 1 11 13 22 motion_temp.StopTime];
motion_temp.outRL.p = [13.0061  13.0061    14.69659   14.69659 10 10];

motion_temp.outFL.t = [0 1 11 13 22 motion_temp.StopTime];
motion_temp.outFL.p = [13.3611  13.3611    15.07125   15.07125 10 10];

motion_temp.outRR.t = [0 1 11 13 22 motion_temp.StopTime];
motion_temp.outRR.p = [13.2091  13.2091    14.89625   14.89625 10 10];

motion_temp.outFR.t = [0 1 11 13 22 motion_temp.StopTime];
motion_temp.outFR.p = [13.3611  13.3611    15.07125   15.07125 10 10];

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0  0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0  0];

motion.anim_outr = motion_temp;
%% Motion Sequence 3: Turret Animation
motion_temp.name = 'Turret Animation';
motion_temp.StopTime = 56;
motion_temp.turret.t = [0 1 26 28 54 motion_temp.StopTime];
motion_temp.turret.q = [0 0 -158.9 -158.9 0 0];

motion_temp.lift.t = [0 0.5 motion_temp.StopTime];
motion_temp.lift.p = [0 0.025 0.025];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0 0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0      motion_temp.StopTime] ;
motion_temp.extend.p = [extp0  extp0];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
motion_temp.master.p = [0.258445  0.258445];
motion_temp.master.p = [1 1 1 1 1 1]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
motion_temp.slave.p = [0.0126513  0.0126513];

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [13.24404  13.24404];

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [13.4279  13.4279];

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [13.27128  13.27128];

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [13.252606  13.252606];

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0 0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0 0];
motion.anim_turret = motion_temp;


%% Motion Sequence 2: Animation Extend
motion_temp.name = 'Extend Test';
motion_temp.StopTime = 53;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0 0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0      1    24   25   26   49 53];
motion_temp.extend.p = [extp0  extp0 3.86 3.86 3.86 -0.0139 -0.0139];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
motion_temp.master.p = [1 1]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
motion_temp.slave.p = [1 1 ]*0.0126513;

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [13.24404  13.24404];

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [13.4279  13.4279];

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [13.27128  13.27128];

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [13.252606  13.252606];

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0 0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0 0];
motion.extend_only = motion_temp;

%% Motion Sequence 8: Lift
motion_temp.name = 'Lift Test';
motion_temp.StopTime = 103;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 2 48 49 50 101 motion_temp.StopTime];
motion_temp.lift.p = [0 0 0.4 0.4  0.4 0 0];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0  0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0  0];

motion_temp.extend.t = [0 motion_temp.StopTime];
motion_temp.extend.p = [0.25*2.54/100  0.25*2.54/100];

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
motion_temp.master.p = [1 1]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
motion_temp.slave.p = [1 1]*0.0126513;

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [1 1]*13.0061;

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [1 1]*13.3611;

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [1 1]*13.2091;

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [1 1]*13.3611;

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0  0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0  0];
motion.anim_lift = motion_temp;

%% Motion Sequence 1: All Functions, Animation
motion_temp.name = 'Animation Full';
motion_temp.StopTime = 350;
motion_temp.turret.t = [0 142 167.5 246 270.3 350];
motion_temp.turret.q = [0 0 -158.9 -158.9 0 0];

motion_temp.lift.t = [0 21 68.4 272 321.5 350];
motion_temp.lift.p = [0 0 0.57 0.57 0.0268 0.0268];

motion_temp.tilt.t =[0 67.5 108.4 208.1 243.5 350];
motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 131.8 141.4 323 332.2 350];
motion_temp.jib.p = [0  0    0.358   0.358 0.0175 0.0175];

motion_temp.extend.t = [0 109 131 181 206 350];
motion_temp.extend.p = [0.25*2.54/100  0.25*2.54/100    3.86   3.86 -0.0139 -0.0139];

motion_temp.basketR.t = [0 172 174 178.4 181.5 350];
motion_temp.basketR.q = [0 0 1.09 1.09 0 0];

motion_temp.master.t = [0 69 108.4 208 243.7 350];
motion_temp.master.p = [0.258445  0.258445    0.12865   0.12865 0.2852 0.2852];
motion_temp.master.p = [1 1 1 1 1 1]*0.258445;

motion_temp.slave.t = [0 69 108.4 208 243.7 350];
motion_temp.slave.p = [0.0126513  0.0126513    0.2-(8e-3)   0.2-(8e-3) 0.01265125 0.01265125];
%motion_temp.slave.p = [1 1 1 1 1 1]*0.0126513;

motion_temp.outRL.t = [0 5.7 11.5 341 349 350];
motion_temp.outRL.p = [13.24404  13.24404    14.69659   14.69659 13.24404 13.24404];
motion_temp.outRL.p = [13.0061  13.0061    14.69659   14.69659 10 10];

motion_temp.outFL.t = [0 5.7 11.5 341 349 350];
motion_temp.outFL.p = [13.4279  13.4279    15.07125   15.07125 13.4279 13.4279];
motion_temp.outFL.p = [13.3611  13.3611    15.07125   15.07125 10 10];

motion_temp.outRR.t = [0 5.7 11.5 341 349 350];
motion_temp.outRR.p = [13.27128  13.27128    14.89625   14.89625 13.27128 13.27128];
motion_temp.outRR.p = [13.2091  13.2091    14.89625   14.89625 10 10];

motion_temp.outFR.t = [0 5.7 11.5 341 349 350];
motion_temp.outFR.p = [13.252606  13.252606  15.075878   15.075878 13.252606 13.252606];
motion_temp.outFR.p = [13.3611  13.3611    15.07125   15.07125 10 10];

motion_temp.TrackL.t = [0 12 19 332.5 340.7 350];
motion_temp.TrackL.p = [0  0    0.305   0.305 0 0];

motion_temp.TrackR.t = [0 12 19 332.5 340.7 350];
motion_temp.TrackR.p = [0  0    0.305   0.305 0 0];
motion.anim_full = motion_temp;


%% Motion Sequence 2: Animation Extend
motion_temp.name = 'Animation Extend Oscillate';
motion_temp.StopTime = 21;
motion_temp.turret.t = [0 motion_temp.StopTime];
motion_temp.turret.q = [0 0];

motion_temp.lift.t = [0 motion_temp.StopTime];
motion_temp.lift.p = [0 0];

motion_temp.tilt.t =[0 motion_temp.StopTime];
motion_temp.tilt.p =[0 0];
%motion_temp.tilt.p =[0  0    0.57   0.57 -0.01 -0.01]*0;

motion_temp.jib.t = [0 motion_temp.StopTime];
motion_temp.jib.p = [0 0];

extp0 = 0.25*2.54/100;
motion_temp.extend.t = [0 1 5   6   10 11 15  16  20 21] ;
motion_temp.extend.p = [1 1 60 60 1  1  60 60 1  1]*extp0;

motion_temp.basketR.t = [0 motion_temp.StopTime];
motion_temp.basketR.q = [0 0];

motion_temp.master.t = [0 motion_temp.StopTime];
motion_temp.master.p = [1 1]*0.258445;

motion_temp.slave.t = [0 motion_temp.StopTime];
motion_temp.slave.p = [1 1 ]*0.0126513;

motion_temp.outRL.t = [0 motion_temp.StopTime];
motion_temp.outRL.p = [13.24404  13.24404];

motion_temp.outFL.t = [0 motion_temp.StopTime];
motion_temp.outFL.p = [13.4279  13.4279];

motion_temp.outRR.t = [0 motion_temp.StopTime];
motion_temp.outRR.p = [13.27128  13.27128];

motion_temp.outFR.t = [0 motion_temp.StopTime];
motion_temp.outFR.p = [13.252606  13.252606];

motion_temp.TrackL.t = [0 motion_temp.StopTime];
motion_temp.TrackL.p = [0 0];

motion_temp.TrackR.t = [0 motion_temp.StopTime];
motion_temp.TrackR.p = [0 0];
motion.anim_extend_osc = motion_temp;


