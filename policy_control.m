%POLITICA CONTROLLO DP SU 4 Prodotti

function [valueTable, actionTable, Inv] = politicacontrollo7(maxInv, prod, demandProbs, demandValues, beta,setcost, horizon)

valueTable = zeros(4,horizon+4);
actionTable = zeros(4,horizon+4);
Inv=zeros(4,horizon+4);

%iterazione stati da horizon+2 a 3  (i primi due e gli ultimi due
 %servono solo per ciclare)
 for i=1:+1:4
     if maxInv(i)>=prod(i)*(horizon)-prod(i)
        Inv(i,horizon+2)=(horizon)*prod(i)-prod(i);
     else
         Inv(i,horizon+2)=floor(maxInv(i)/prod(i))*prod(i)-prod(i);
     end     
 end
 
 valuefunc=zeros(4,3);
 t=horizon+2;
 
 while t>=3
        
       
      %primo prodotto 
       a=1;
        for m=0:+prod(1):Inv(1,t)
            
           
                  valuefunc(1,1)=dot(demandProbs(1,:),beta(1)*((m-demandValues(1,:)).^2));%+valueTable(1,t+1));
                  valuefunc(1,2)=dot(demandProbs(1,:),beta(1)*((m-demandValues(1,:)+prod(:,1)).^2));%+valueTable(1,t+1));
                  valuefunc(1,3)=dot(demandProbs(1,:),beta(1)*((m-demandValues(1,:)+prod(:,1)).^2) +setcost(:,1)); %+valueTable(1,t+1);
            
                         stock1(1,a)=valuefunc(1,1);
                         stock1(2,a)=valuefunc(1,2);
                         stock1(3,a)=valuefunc(1,3);
                 
                  a=a+1;
     
        end
           
        valueopt(1,1)=min(stock1(1,:));
        valueopt(1,2)=min(stock1(2,:));
        valueopt(1,3)=min(stock1(3,:));
                         
        valueTable(1,t)=min(valueopt(1,1),valueopt(1,2));
        valueTable(1,t)=min(valueTable(1,t),valueopt(1,3));
        
        if  valueTable(1,t)==valueopt(1,1)
            actionTable(1,t)=1;
        elseif valueTable(1,t)==valueopt(1,2)
            actionTable(1,t)=2;
        elseif valueTable(1,t)==valueopt(1,3)
            actionTable(1,t)=3;    
        end
        
       
       %secondo prodotto
       a=1;
        for m=0:+prod(2):Inv(2,t)
            
           
                  valuefunc(2,1)=dot(demandProbs(2,:),beta(2)*((m-demandValues(2,:)).^2));%+valueTable(2,t+1));
                  valuefunc(2,2)=dot(demandProbs(2,:),beta(2)*((m-demandValues(2,:)+prod(:,2)).^2));%+valueTable(2,t+1));
                  valuefunc(2,3)=dot(demandProbs(2,:),beta(2)*((m-demandValues(2,:)+prod(:,2)).^2) +setcost(:,2));%+ valueTable(2,t+1));
            
                         stock2(1,a)=valuefunc(2,1); 
                         stock2(2,a)=valuefunc(2,2);
                         stock2(3,a)=valuefunc(2,3);
                 
                  a=a+1;
     
        end
           
        valueopt(2,1)=min(stock2(1,:));
        valueopt(2,2)=min(stock2(2,:));
        valueopt(2,3)=min(stock2(3,:));
                         
        valueTable(2,t)=min(valueopt(2,1),valueopt(2,2));
        valueTable(2,t)=min(valueTable(2,t),valueopt(2,3));
        
        if  valueTable(2,t)==valueopt(2,1)
            actionTable(2,t)=1;   
        elseif valueTable(2,t)==valueopt(2,2) 
            actionTable(2,t)=2;      
        elseif valueTable(2,t)==valueopt(2,3)
            actionTable(2,t)=3; 
        end
       
       %terzo prodotto
         a=1;
        for m=0:+prod(3):Inv(3,t)
            
                  valuefunc(3,1)=dot(demandProbs(3,:),beta(3)*((m-demandValues(3,:)).^2));%+valueTable(3,t+1));
                  valuefunc(3,2)=dot(demandProbs(3,:),beta(3)*((m-demandValues(3,:)+prod(:,3)).^2));%+valueTable(3,t+1));
                  valuefunc(3,3)=dot(demandProbs(3,:),beta(3)*((m-demandValues(3,:)+prod(:,3)).^2) +setcost(:,3));% + valueTable(3,t+1));
            
                         stock3(1,a)=valuefunc(3,1); 
                         stock3(2,a)=valuefunc(3,2);
                         stock3(3,a)=valuefunc(3,3);
                 
                  a=a+1;
     
        end
           
        valueopt(3,1)=min(stock3(1,:));
        valueopt(3,2)=min(stock3(2,:));
        valueopt(3,3)=min(stock3(3,:));
                         
        valueTable(3,t)=min(valueopt(3,1),valueopt(3,2));
        valueTable(3,t)=min(valueTable(3,t),valueopt(3,3));
        
        if   valueTable(3,t)==valueopt(3,1)
             actionTable(3,t)=1;
       elseif valueTable(3,t)==valueopt(3,2)
               actionTable(3,t)=2;
        elseif valueTable(3,t)==valueopt(3,3)
               actionTable(3,t)=3;  
        end
     
       
       %quarto prodotto
         a=1;
        for m=0:+prod(4):Inv(4,t)
            
           
                  valuefunc(4,1)=dot(demandProbs(4,:),beta(4)*((m-demandValues(4,:)).^2));%+valueTable(4,t+1));
                  valuefunc(4,2)=dot(demandProbs(4,:),beta(4)*((m-demandValues(4,:)+prod(:,4)).^2));%+valueTable(4,t+1));
                  valuefunc(4,3)=dot(demandProbs(4,:),beta(4)*((m-demandValues(4,:)+prod(:,4)).^2) +setcost(:,4));% + valueTable(4,t+1));
            
                         stock4(1,a)=valuefunc(4,1); 
                         stock4(2,a)=valuefunc(4,2);
                         stock4(3,a)=valuefunc(4,3);
                 
                  a=a+1;
     
        end
           
        valueopt(4,1)=min(stock4(1,:));
        valueopt(4,2)=min(stock4(2,:));
        valueopt(4,3)=min(stock4(3,:));
                         
        valueTable(4,t)=min(valueopt(4,1),valueopt(4,2));
        valueTable(4,t)=min(valueTable(4,t),valueopt(4,3));
       
        if  valueTable(4,t)==valueopt(4,1) 
            actionTable(4,t)=1;
        elseif valueTable(4,t)==valueopt(4,2)
            actionTable(4,t)=2;
        elseif valueTable(4,t)==valueopt(4,3)
            actionTable(4,t)=3;           
        end
         
               
       %scelta azioni: 0=niente, 1=termina di produrre quel prodotto,
       %2=produco, 3=setto la macchina per produrre un prodotto di un'altra
       %famiglia.
       
          r=find(valueTable(:,t)==min(valueTable(:,t)));
         
         for i=1:+1:4 
             if r~=i
                 actionTable(i,t)=0;
             end
         end
          
        if actionTable(r,t)==1
            
             if       actionTable(r,t+1)==0  
                  if     r==1
                     Inv(r,t)=prod(r)*(find(stock1(1,:)==min(stock1(1,:)))-1);
                  elseif r==2
                     Inv(r,t)=prod(r)*(find(stock2(1,:)==min(stock2(1,:)))-1);
                  elseif r==3
                     Inv(r,t)=prod(r)*(find(stock3(1,:)==min(stock3(1,:)))-1);
                  elseif r==4
                     Inv(r,t)=prod(r)*(find(stock4(1,:)==min(stock4(1,:)))-1); 
                  end   
                       Inv(r,t+1)=Inv(r,t);
                       Inv(r,t-1)=Inv(r,t)- prod(r);
            elseif actionTable(r,t+1)==1 
                       Inv(r,t)=Inv(r,t+1);
                       Inv(r,t-1)=Inv(r,t)-prod(r);
            elseif actionTable(r,t+1)==2
                       Inv(r,t)=inv(r,t+1);
                       Inv(r,t-1)=Inv(r,t)-prod(r);
              end
                
                 for i=1:+1:4
                     if actionTable(i,t)==0 
                      Inv(i,t-1)=Inv(i,t);
                     end
                 end
                        
               t=t-1;
               stock1(:,end)=[];
               stock2(:,end)=[];
               stock3(:,end)=[];
               stock4(:,end)=[];
               
               
              
                      
        elseif actionTable(r,t)==2
             
            if ((r==1 || r==2) && (actionTable(3,t+1)==2 || actionTable(4,t+1)==2)) || ((r==3 || r==4) && (actionTable(1,t+1)==2 || actionTable(2,t+1)==2))
                  actionTable(r,t)=0;
            else    
                   if   actionTable(r,t+1)==0
                        if     r==1
                            Inv(r,t)=prod(r)*(find(stock1(2,:)==min(stock1(2,:)))-1);
                       elseif r==2
                             Inv(r,t)=prod(r)*(find(stock2(2,:)==min(stock2(2,:)))-1);
                      elseif r==3
                             Inv(r,t)=prod(r)*(find(stock3(2,:)==min(stock3(2,:)))-1);
                      elseif r==4
                          Inv(r,t)=prod(r)*(find(stock4(2,:)==min(stock4(2,:)))-1); 
                       end
                       Inv(r,t+1)=Inv(r,t)+prod(r);
                       Inv(r,t-1)=Inv(r,t)- prod(r);           
                elseif actionTable(r,t+1)==1 || actionTable(r,t+1)==2                  
                        Inv(r,t-1)=Inv(r,t)-prod(r);
                        Inv(r,t)= Inv(r,t+1)-prod(r);           
                   end
            end
                   
                 for i=1:+1:4
                     if actionTable(i,t)==0 
                       Inv(i,t-1)=Inv(i,t);
                     end
                 end
                
               t=t-1;
               stock1(:,end)=[];
               stock2(:,end)=[];
               stock3(:,end)=[];
               stock4(:,end)=[];
               
               
               
        
      elseif actionTable(r,t)==3
            
               actionTable(r,t)=2;
               actionTable(r,t-1)=3;
             
          if   actionTable(r,t+1)==0  
               if     r==1
                     Inv(r,t)=prod(r)*(find(stock1(3,:)==min(stock1(3,:)))-1);
               elseif r==2
                     Inv(r,t)=prod(r)*(find(stock2(3,:)==min(stock2(3,:)))-1);
               elseif r==3
                     Inv(r,t)=prod(r)*(find(stock3(3,:)==min(stock3(3,:)))-1);
               elseif r==4
                     Inv(r,t)=prod(r)*(find(stock4(3,:)==min(stock4(3,:)))-1); 
               end                       
                     Inv(r,t+1)=Inv(r,t)+prod(r);
                     Inv(r,t-1)=Inv(r,t);
                     Inv(r,t-2)=Inv(r,t)- prod(r);
         elseif actionTable(r,t+1)==1 || actionTable(r,t)==2
                     Inv(r,t)= Inv(r,t+1)-prod(r);
                     Inv(r,t-1)=Inv(r,t);
                     Inv(r,t-2)=Inv(r,t-1)- prod(r);
          end
               
                 for i=1:+1:4
                     if actionTable(i,t)==0 
                       Inv(i,t-2)=Inv(i,t);
                     end
                 end
             
               t=t-2;
               stock1=stock1(:,1:end-2);
               stock2=stock2(:,1:end-2);
               stock3=stock3(:,1:end-2);
               stock4=stock4(:,1:end-2);    
               
        end
       
        
  end
         
    %Istruzioni aggiuntive
    
    
      
    %Istruzione 1: forza la produzione di prodotti inutilizzati
     for t=horizon+2:-1:3
                 if    actionTable(1,t)==1 && sum(actionTable(2,t+1:horizon+2))==0 && actionTable(3,t+1)~=2 && actionTable(4,t+1)~=2
                       actionTable(2,t)=2;
                       Inv(2,t+1)=Inv(2,t)+prod(2);
                       valueTable(2,t:horzion+2)=dot(demandProbs(2,:),beta(2)*((Inv(2,t)-demandValues(2,:)+prod(:,2)).^2));
                elseif actionTable(1,t)==1 && actionTable(1,t-1)~=2 && actionTable(2,t-1)~=2 && sum(actionTable(3,t+1:horizon+2))==0 && actionTable(1,t+1)~=2 && actionTable(2,t+1)~=2
                       actionTable(3,t)=2;
                       Inv(3,t+1)=Inv(3,t)+prod(3);
                       valueTable(3,t:horizon+2)=dot(demandProbs(3,:),beta(3)*((Inv(3,t)-demandValues(3,:)+prod(:,3)).^2));   
                elseif actionTable(1,t)==1 && actionTable(1,t-1)~=2 && actionTable(2,t-1)~=2 && sum(actionTable(4,t+1:horizon+2))==0 &&  actionTable(1,t+1)~=2 && actionTable(2,t+1)~=2
                       actionTable(4,t)=2;
                       Inv(4,t+1)=Inv(4,t)+prod(4);
                       valueTable(4,t:horizon+2)=dot(demandProbs(4,:),beta(4)*((Inv(4,t)-demandValues(4,:)+prod(:,4)).^2));      
                elseif actionTable(2,t)==1  && sum(actionTable(1,t+1:horizon+2))==0 && actionTable(3,t+1)~=2 && actionTable(4,t+1)~=2
                       actionTable(1,t)=2;
                       Inv(1,t+1)=Inv(1,t)+prod(1);
                       valueTable(1,t:horizon+2)=dot(demandProbs(1,:),beta(1)*((Inv(1,t)-demandValues(1,:)+prod(:,1)).^2)); 
                elseif actionTable(2,t)==1  && actionTable(2,t-1)~=2 && actionTable(1,t-1)~=2 && sum(actionTable(3,t+1:horizon+2))==0 && actionTable(1,t+1)~=2 && actionTable(2,t+1)~=2
                       actionTable(3,t)=2;
                       Inv(3,t+1)=Inv(3,t)+prod(3);
                       valueTable(3,t:horizon+2)=dot(demandProbs(3,:),beta(3)*((Inv(3,t)-demandValues(3,:)+prod(:,3)).^2)); 
                elseif actionTable(2,t)==1 && actionTable(2,t-1)~=2 && actionTable(1,t-1)~=2 && sum(actionTable(4,t+1:horizon+2))==0  && actionTable(1,t+1)~=2 && actionTable(2,t+1)~=2
                       actionTable(4,t)=2;
                       Inv(4,t+1)=Inv(4,t)+prod(4);
                       valueTable(4,t:horizon+2)=dot(demandProbs(4,:),beta(4)*((Inv(4,t)-demandValues(4,:)+prod(:,4)).^2));        
                elseif actionTable(3,t)==1 && actionTable(3,t-1)~=2 && actionTable(4,t-1)~=2 && sum(actionTable(1,t+1:horizon+2))==0  && actionTable(3,t+1)~=2 && actionTable(4,t+1)~=2
                       actionTable(1,t)=2;
                       Inv(1,t+1)=Inv(1,t)+prod(1);
                       valueTable(1,t:horizon+2)=dot(demandProbs(1,:),beta(1)*((Inv(1,t)-demandValues(1,:)+prod(:,1)).^2));         
                elseif actionTable(3,t)==1 && actionTable(3,t-1)~=2 && actionTable(4,t-1)~=2 && sum(actionTable(2,t+1:horizon+2))==0 && actionTable(3,t+1)~=2 && actionTable(4,t+1)~=2
                       actionTable(2,t)=2;
                       Inv(2,t+1)=Inv(2,t)+prod(2);
                       valueTable(2,t:horzion+2)=dot(demandProbs(2,:),beta(2)*((Inv(2,t)-demandValues(2,:)+prod(:,2)).^2));        
                elseif actionTable(3,t)==1  && sum(actionTable(4,t+1:horizon+2))==0  && actionTable(1,t+1)~=2 && actionTable(2,t+1)~=2
                       actionTable(4,t)=2;
                       Inv(4,t+1)=Inv(4,t)+prod(4);
                       valueTable(4,t:horizon+2)=dot(demandProbs(4,:),beta(4)*((Inv(4,t)-demandValues(4,:)+prod(:,4)).^2));                     
                elseif actionTable(4,t)==1 && actionTable(4,t-1)~=2 && actionTable(3,t-1)~=2 && sum(actionTable(1,t+1:horizon+2))==0  && actionTable(3,t+1)~=2 && actionTable(4,t+1)~=2
                       actionTable(1,t)=2;
                       Inv(1,t+1)=Inv(1,t)+prod(1);
                       valueTable(1,t:horizon+2)=dot(demandProbs(1,:),beta(1)*((Inv(1,t)-demandValues(1,:)+prod(:,1)).^2));          
                elseif actionTable(4,t)==1 && actionTable(4,t-1)~=2 && actionTable(3,t-1)~=2 && sum(actionTable(2,t+1:horizon+2))==0  && actionTable(3,t+1)~=2 && actionTable(4,t+1)~=2
                       actionTable(2,t)=2;
                       Inv(2,t+1)=Inv(2,t)+prod(2);
                       valueTable(2,t:horzion+2)=dot(demandProbs(2,:),beta(2)*((Inv(2,t)-demandValues(2,:)+prod(:,2)).^2));                
                elseif actionTable(4,t)==1  && sum(actionTable(3,t+1:horizon+2))==0  && actionTable(1,t+1)~=2 && actionTable(2,t+1)~=2
                       actionTable(3,t)=2;
                       Inv(3,t+1)=Inv(3,t)+prod(3);
                       valueTable(3,t:horizon+2)=dot(demandProbs(3,:),beta(3)*((Inv(3,t)-demandValues(3,:)+prod(:,3)).^2));            
                 end
     end
     
       %Istruzione 2: settaggi macchine  
          for t=horizon+2:-1:3
                      if ((actionTable(1,t)==0 || actionTable(1,t)==1) && (actionTable(1,t-1)==2 && actionTable(3,t+1)==2)) ||((actionTable(2,t)==0 || actionTable(2,t)==1) && (actionTable(2,t-1)==2 && actionTable(3,t+1)==2))                                       
                           actionTable(3,t)=3; 
                           valueTable(3,t+1:horizon+2)=valueTable(3,t+1:horizon+2)+setcost(3);
                   elseif((actionTable(1,t)==0 || actionTable(1,t)==1) && (actionTable(1,t-1)==2 && actionTable(4,t+1)==2))||((actionTable(2,t)==0 || actionTable(2,t)==1) && (actionTable(2,t-1)==2  && actionTable(4,t+1)==2))
                            actionTable(4,t)=3;
                            valueTable(4,t+1:horizon+2)=valueTable(4,t+1:horizon+2)+setcost(4);
                 elseif  ((actionTable(3,t)==0 || actionTable(3,t)==1) && (actionTable(3,t-1)==2 && actionTable(1,t+1)==2))||((actionTable(4,t)==0 || actionTable(4,t)==1) && (actionTable(4,t-1)==2 && actionTable(1,t+1)==2))
                          actionTable(1,t)=3;
                          valueTable(1,t+1:horizon+2)=valueTable(1,t+1:horizon+2)+setcost(1);
                 elseif  ((actionTable(3,t)==0 || actionTable(3,t)==1) && (actionTable(3,t-1)==2 && actionTable(2,t+1)==2))||((actionTable(4,t)==0 || actionTable(4,t)==1) && (actionTable(4,t-1)==2 && actionTable(2,t+1)==2))
                            actionTable(2,t)=3;
                            valueTable(2,t+1:horizon+2)=valueTable(2,t+1:horizon+2)+setcost(2);
                      end
          end
          
     %Istruzione 3: spegnimento macchine
          for t=horizon+2:-1:3
              for i=1:+1:4 
                  if actionTable(i,t)==2 && actionTable (i,t+1)==0
                     actionTable(i,t+1)=1;
                  end
              end
          end

       
       %Istruzione 4: magazzino
            for t=horizon+3:-1:1
                 for i=1:+1:4
                     if actionTable(i,t)==0 || actionTable(i,t)==3 
                         Inv(i,t)=0;
                     end
                 end
            end
 
       
end                 
                   
         
                   
     

                    
                    
