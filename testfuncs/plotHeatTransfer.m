%
%%
datasim =nominal;
%
%%
cd('../testfuncs/');
if isfile('datasim')
    delete datasim.mat;
    save datasim datasim;
else
    save datasim datasim;
end
load datasim.mat;

%
%% 
IFmodificationIs =AddedMinorCorrections();

%
%%
figure, plot(datasim.t./60, datasim.XXX,'r', datasim.t./60, datasim.UUU,'b',datasim.t./60, datasim.OOO,'k',...
    datasim.t./60, datasim.TTT,'g', datasim.t./60, datasim.SSS,'y', datasim.t./60, -datasim.RRR,'c'); 
lg =legend('QL_{TOT}','Jtransfer.h','pdV','-QdotLS2', 'QdotWL2',...
    'Jcd.h','Location','northeast'); title(lg,"Heat transfer to liquid phase"); 
ylabel('Heat transfer in LIQUID - ET [Watts]',Fontweight='bold');
xlabel('Time in minutes',Fontweight='bold');grid on; axis on;

if (IFmodificationIs ==true)
    ylim([-2000 8000]);
else
    ylim([-2000 3000]);
end

%
%%
figure, plot(datasim.t./60, datasim.WWW,'r', datasim.t./60, -datasim.OOO,'b',datasim.t./60, datasim.QQQ,'k',...
    datasim.t./60, datasim.NNN,'g', datasim.t./60, datasim.MMM,'y', datasim.t./60, datasim.RRR,'c'); 
lg =legend('QV_{TOT}','pdV','Jvalve.h','- QdotVS2', 'QdotWL2',...
    'Jcd.h','Location','northeast'); title(lg,"Heat transfer to gas phase"); 
ylabel('Heat transfer in VAPOR - ET [Watts]',Fontweight='bold');
xlabel('Time in minutes',Fontweight='bold');grid on; axis on;

if (IFmodificationIs ==true) 
    ylim([-2500 1500]);
else 
    ylim([-1500 1500]);
end
%%
% db-code-rabbit