%
%%  Some correlations for flow along vertical wall
%
function  output = VerticalPlates(name,Ra,Pr,cc,dd)
%
% Ra : Rayleigh number
% Pr : Prandlt number
% cc : cylinder length 
% dd : cylinder diameter

% Logical tests
test_0 = Ra >=1e4 && Ra <=1e9;
test_1 = Ra >1e9; %&& Ra <= 1e12;
test_Elenbaas = 1e-8*(cc/dd) <Ra  &&  Ra <=1e12*(cc/dd);

    switch(name)
        case 'Churchill'
            if test_0
                % Slightly better accuracy may be obtained for laminar flow
                output = 0.68 + (0.670*mpower(Ra,0.25))/mpower(1+...
                         mpower(0.492/Pr,9./16.),4./9.);
            elseif test_1 
                % This correlation is applied over the entire range of Ra has
                % been recommended by Churchill and Chu and is used for
                % turbulent flow
                output = mpower(0.825+(0.387*mpower(Ra,1./6.))/mpower(1+...
                         mpower(0.492/Pr,9./16.),8./27.),2.);
            end
        case 'Mc_Adams'
            if test_0                       % For laminar flow
                output = 0.59 * Ra^(0.25);  
            elseif test_1                   % For turbulent flow
                output = 0.10 * Ra^(1/3);   
            end
		case 'Elenbaas'
            if test_Elenbaas
                output = 0.6*mpower(dd/cc,0.25)*Ra^(0.25);
            end
    end
end

%%
% db-code-rabbit
