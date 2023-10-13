clear all
close all
clc

%TEST politicacontrollo
maxInv=[50,40,30,50];
prod=[5,5,5,5];
beta=[1,1,1,1]; 
setcost=[0.1,0.1,0.1,0.1];
horizon=14;
        
         
demandProbs=[0.3,0.6, 0.1;
             0.1, 0.6,0.3;
             0.1, 0.6,0.3;
             0.2,0.7,0.1];
                 
         
 
         
         
demandValues=[12,46,60;
              20,41,50;
              28,60,40;
              25,53,70];
             
          

         
       
[valueTable,actionTable, Inv]=politicacontrollo7(maxInv,prod, demandProbs,demandValues, beta,setcost, horizon);

valueTable
actionTable
Inv


