function sm_boom_lift_crawler_flex_boom_bodeplot(modelname,beamtype,doSweep)
%% Obtain Frequency Response Using Linearization
% This example script shows how you can view the small-signal frequency
% response of a Simscape(TM) model by using linearization.
%
% As an alternate workflow if you have Simulink Control Design, on the Apps
% tab, under Control Systems, click Model Linearizer. In the Linear
% Analysis Tool, on the Linear Analysis tab, in the Linearize section,
% click Bode.

% Copyright 2020-2022 The MathWorks, Inc.

%% Open the model and set circuit parameters
open_system(modelname)
set_param([modelname '/Telescoping Boom Flex'],'popup_flexType',beamtype);

% Only sweep percent retracted for Classical beam and if sweep is requested
if(strcmp(beamtype,'Classical')&& doSweep)
    % Amount boom is retracted
    retr_vec = [0.05:0.05:0.35]; 
    set_param([modelname '/Telescoping Boom Flex'],'overlap_pcnt','ret_val');
    
    % Enable fast restart for linear analysis
    fastRestartForLinearAnalysis(modelname,'on');
else
    % Flag indicating use value from model
    retr_vec = -1;
end

% Prepare figure and handle
fig_handle_name =   'h1_sm_boom_lift_crawler_flex_boom';

handle_var = evalin('base',['who(''' fig_handle_name ''')']);
if(isempty(handle_var))
    evalin('base',[fig_handle_name ' = figure(''Name'', ''' fig_handle_name ''');']);
elseif ~isgraphics(evalin('base',handle_var{:}))
    evalin('base',[fig_handle_name ' = figure(''Name'', ''' fig_handle_name ''');']);
end
figure(evalin('base',fig_handle_name))
clf(evalin('base',fig_handle_name))

% Sweep over percent retracted
for rveci=1:length(retr_vec)
    
    if(retr_vec(rveci)~=-1)
        % If sweeping, set parameter
        assignin('base','ret_val',retr_vec(rveci));
        % Update values for Simscape parameters.
        % Required for fastRestartForLinearAnalysis()
        set_param(modelname,'SimulationCommand','update');
    else
        % If not sweeping, get parameter value for legend
        retr_vec(rveci) = str2num(get_param([modelname '/Telescoping Boom Flex'],'overlap_pcnt'));
    end
    
    disp(['Extension level ' num2str(rveci), ': ' num2str(retr_vec(rveci))]);
    
    %% Linearize
    linsys=linearize(modelname);
    linA = linsys.A;linB = linsys.B;linC = linsys.C;linD = linsys.D;
    
    %% Generate data for Bode plot
    linC = -linC; linD = -linD; % Negative feedback convention
    npts = 200; f = logspace(-1,1,npts); G = zeros(1,npts);
    for i=1:npts
        G(i) = linC*(2*pi*1i*f(i)*eye(size(linA))-linA)^-1*linB +linD;
    end
    
    % Create Bode plot
    ah(1) = subplot(2,1,1);
    temp_magline_h=semilogx(f,20*log10(abs(G)));
    grid on
    ylabel('Magnitude (dB)');
    xlabel('Frequency (Hz)');
    title('Frequency Response Telescoping Boom');
    hold on
    
    ah(2) = subplot(2,1,2);
    temp_phsline_h=semilogx(f,180/pi*unwrap(angle(G)));
    set([temp_magline_h,temp_phsline_h],'LineWidth',1);
    ylabel('Phase (deg)');
    xlabel('Frequency (Hz)');
    grid on
    hold on
    
    % Prepare legend string
    if(strcmp(beamtype,'Classical'))
        legendstr{rveci} = [num2str(retr_vec(rveci)*100) '%']; %#ok<AGROW>
    else
        legendstr = 'ROM';
    end
end

linkaxes(ah,'x');
subplot(2,1,1), hold off
if(strcmp(beamtype,'Classical'))
    text(0.98,0.94,'Percent Retracted','HorizontalAlignment','right','Units','Normalized');
end
legend(legendstr,'Location','SouthEast');
subplot(2,1,2), hold off

if(strcmp(beamtype,'Classical')&& doSweep)
    fastRestartForLinearAnalysis(modelname,'off')
    set_param([modelname '/Telescoping Boom Flex'],'overlap_pcnt','0.2');
end
