

function [fmatout,fmat1,fmat2]=Pol_mat_subtr(fmat1,fmat2)


ncol=size(fmat1,2);

fmatout=zeros(1,size(fmat1,2));

cont=1;
cont2=1;


sum_mat=[];

for h=1:size(fmat1,1)
    
    
    for h2=1:size(fmat2,1)
        
      
        
      test= fmat1(h,2:end)==fmat2(h2,2:end);
      
      if sum(test)==size(fmat1,2)-1 % && ismember(h2,sum_mat(2,:))==0
      
      
      coeff=fmat1(h,1)-fmat2(h2,1);
        
        
        fmat1(h,1)=coeff;
        fmat2(h2,1)=0;
        
        %fmatout(cont,2:end)= fmat1(h,2:end);
        
       sum_mat(1,cont2)=h;
       sum_mat(2,cont2)=h2;                       %write down indexes of variables which have been summed
        
       cont=cont+1;  
        cont2=cont2+1;
        
      end
        
        
    end
    
end



%elim zeros

vet=[];
cont=1;
for j=1:size(fmat1,1)
    
    
    if sum(fmat1(j,:)==0)<size(fmat1,2)   && fmat1(j,1)~=0          %eliminates zeros
        
        
        vet(cont)=j;
        
        cont=cont+1;
        
    end
    
end




fmatout1=fmat1(vet,:);


vet2=[];
cont2=1;
for j=1:size(fmat2,1)
    
    
    if sum(fmat2(j,:)==0)<size(fmat2,2)   && fmat2(j,1)~=0          %eliminates zeros
        
        
        vet2(cont2)=j;
        
        cont2=cont2+1;
        
    end
    
end




fmatout2=fmat2(vet2,:);

if size(fmatout2,1)>0
fmatout2(:,1)=fmatout2(:,1)*-1;
end

fmatout=cat(1,fmatout1,fmatout2);

[fmatout]=Pol_lex_order_mat(fmatout);

if numel(fmatout)==0
    
    fmatout=zeros(1,ncol);
    
end




