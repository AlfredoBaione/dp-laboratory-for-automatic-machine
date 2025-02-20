
%SIMULAZIONE MONTECARLO DEL CASO IN CUI ABBIAMO 14 TIME BUCKETS

function costScenarios=Simulatepolitica7(Inv, setcost, beta, numScenarios)

costScenarios=zeros(1,4);

%primo prodotto
probs1=zeros(1,60);
probs1(1,12)=0.3;
probs1(1,46)=0.6;
probs1(1,60)=0.1;

pd=makedist('Multinomial','probabilities', probs1);
demandScenarios=random(pd,numScenarios,1);
costScenarios1=zeros(numScenarios,1);


for k=1:+1:numScenarios  
    costScenarios1(k)=beta(1)*(Inv(1,5)-demandScenarios(k,1))^2;
end
costScenarios(1,1)=mean(costScenarios1);
        
%secondo prodotto
probs2=zeros(1,50);
probs2(1,20)=0.1;
probs2(1,41)=0.6;
probs2(1,50)=0.3;
 
pd=makedist('Multinomial','probabilities', probs2);
demandScenarios=random(pd,numScenarios,1);
costScenarios2=zeros(numScenarios,1);  

for k=1:+1:numScenarios
 costScenarios2(k)=beta(2)*((Inv(2,17)-demandScenarios(k))^2)+2*setcost(2);
end
 costScenarios(1,2)=mean(costScenarios2);
 
 %terzo prodotto
probs3=zeros(1,40);
probs3(1,28)=0.1;
probs3(1,60)=0.6;
probs3(1,40)=0.3;
pd=makedist('Multinomial','probabilities', probs3);
demandScenarios=random(pd,numScenarios,1);
costScenarios3=zeros(numScenarios,1);  
 
 for k=1:+1:numScenarios
 costScenarios3(k)=beta(3)*(Inv(3,7)-demandScenarios(k)+prod(3))^2;
end
costScenarios(1,3)=mean(costScenarios3);

%quarto prodotto
probs4=zeros(1,70);
probs4(1,25)=0.2;
probs4(1,53)=0.7;
probs4(1,70)=0.1;
pd=makedist('Multinomial','probabilities', probs4);
demandScenarios=random(pd,numScenarios,1);
costScenarios4=zeros(numScenarios,1);  
 
 for k=1:+1:numScenarios
 costScenarios4(k,1)=beta(4)*(Inv(4,14)-demandScenarios(k))^2 + setcost(4);
end
costScenarios(1,4)=mean(costScenarios4);

 
   
end 

