function [Mout]=dupl_comp_elim(M)


s=1:size(M,1);

s=s(rem(s,2)==1);

cont=1;
cont2=1;

elimvet=[];

for j=s
    
    if size(M{j,1},1)==size(M{j+1,1},1) &&    size(M{j,1},2)==size(M{j+1,1},2) 
    
    test=M{j,1}==M{j+1,1};
    
    if  sum(test(:))==size(M{j,1},1)*size(M{j,1},2)
        
        elimvet(cont)=j;
         elimvet(cont+1)=j+1;
         
         cont=cont+2;
         
    end
    
    end
    
end


Mout={};

newvet=setdiff(1:size(M,1),elimvet);

if size(newvet,2)>0

for k=newvet
    
    Mout{cont2,1}=M{k,1};
    
    cont2=cont2+1;
    
end

else
    
    Mout=M;
    
end
    
    


