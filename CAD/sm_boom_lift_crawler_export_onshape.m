% Script to import CAD model from Onshape
% Copyright 2020-2022 The MathWorks, Inc.

% Note: This can take up to 25 minutes depending on your internet connection
smexportonshape('https://cad.onshape.com/documents/2dcd02defcd6a05494e9f500/w/b1be9f7fdac9bcf41b68997c/e/97e29c7f52aae3cb0ba68cf3');

%%
% Note: This takes about 90 seconds
smimport('MachineAssembly.xml')
