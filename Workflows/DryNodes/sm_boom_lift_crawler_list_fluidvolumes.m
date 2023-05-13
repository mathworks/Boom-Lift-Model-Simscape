% Script to list constant volume chamber blocks
% Copyright 2020-2023 The MathWorks, Inc.

f = Simulink.FindOptions('regexp',true,'FollowLinks',true);

node_vols = Simulink.findBlocks(bdroot,'ReferenceBlock','.*/Constant Volume Hydraulic Chamber',f);

for i=1:length(node_vols)
    namestr = get_param((node_vols(i)),'Name');
    namestr = regexprep(namestr,'\n',' ');
    pathstr = get((node_vols(i)),'Path');
    pathstr = regexprep(pathstr,'\n',' ');
    viewStr = ...
	['<a href="matlab:hilite_system(''' pathstr '/' namestr ''');open_system(''' pathstr ''');">view</a>'];
    fprintf('%s : %s\n',namestr,viewStr);
end


%for i=1:length(node_vols)
%    set_param(getfullname(node_vols(i)),'ch_volume','1e-4');
%end