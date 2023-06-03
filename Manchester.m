clc ;
close all;
m = 0:100 ; 

P_e = [] ; 
for Kb = [1,5,10,20] 
    for Ks = 0:1:40
        P_e(min(4,ceil(Kb/4.5)),Ks+1) = 0.5 + sum( exp(-Kb)*Kb.^m .* igamma(m+1, Kb+Ks)/2./(gamma(m+1)).^2 + ...
                        -exp(-Kb-Ks)*(Kb+Ks).^m .* igamma(m+1,Kb)/2./(gamma(m+1)).^2 ,'all');
    end
     plot(0:40,P_e(min(4,ceil(Kb/4.5)),:),'DisplayName', ['K_b = ' num2str(Kb)])
    hold on
end
plot(0:40,0.0001*ones(41,1), 'DisplayName','P_e = 0.0001')
ylim([0,0.001])
ylabel('P_e')
xlabel('K_s')
title('Error Probability based on K_s')
grid on
legend

export_fig(gcf,'2-Kb_all_matlab_final.pdf')
