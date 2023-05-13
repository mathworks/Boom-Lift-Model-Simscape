% Script to list pipeline blocks
% Copyright 2020-2023 The MathWorks, Inc.

f = Simulink.FindOptions('regexp',true,'IncludeCommented',false);
pipe_h = Simulink.findBlocks([bdroot '/Actuators'],'ReferenceBlock','.*Hydraulic Pipeline',f);

if(pipe_h>0)
for i=1:length(pipe_h)
    namestr = get_param((pipe_h(i)),'Name');
    namestr = regexprep(namestr,'\n',' ');
    pathstr = get((pipe_h(i)),'Path');
    pathstr = regexprep(pathstr,'\n',' ');
    viewStr = ...
	['<a href="matlab:hilite_system(''' pathstr '/' namestr ''');open_system(''' pathstr ''');">view</a>'];
    fprintf('%s : %s\n',namestr,viewStr);
end
else
    disp('No pipeline blocks');
end


    
%for i = 1:length(pipe_h)
%    bname = getfullname(pipe_h(i));
%    bname = regexprep(bname,'\n','_');

%    wt_setting = get_param(getfullname(pipe_h(i)),'wall_type');
%    disp([bname ' ' wt_setting]);
%    set_param(getfullname(pipe_h(i)),'wall_type','1')
%end
