clc ;
close all;
Ks = 0:1:60 ; 

P_e = [] ; 
for Kb = [1,5,10,20] 
    P_e(end+1,:) = 0.5 + (-igamma(Ks./log(1 + Ks/Kb), Kb) + igamma(Ks./log(1 + Ks/Kb), Kb + Ks))./(2*gamma(Ks./log(1 + Ks/Kb)));
    plot(Ks,P_e(end,:),'DisplayName', ['K_b = ' num2str(Kb)])
    hold on
end
plot(Ks,0.0001*ones(length(Ks),1), 'DisplayName','P_e = 0.0001')
ylim([0,0.001])
ylabel('P_e')
xlabel('K_s')
title('Error Probability based on K_s')
grid on
legend

export_fig(gcf,'1-Kb_all_matlab_final.pdf')
