

function [fmatout]=Pol_mat_sum(fmat1,fmat2)



fmatout=zeros(1,size(fmat1,2));

cont=1;
cont2=1;


sum_mat=[];

for h=1:size(fmat1,1)
    
    
    for h2=1:size(fmat2,1)
        
      
        
      test= fmat1(h,2:end)==fmat2(h2,2:end);
      
      if sum(test)==size(fmat1,2)-1
      
      
      coeff=fmat1(h,1)+fmat2(h2,1);
        
        
        fmatout(cont,1)=coeff;
        
        
        fmatout(cont,2:end)= fmat1(h,2:end);
        
       sum_mat(1,cont2)=h;
       sum_mat(2,cont2)=h2;                   %write down indexes of variables which have been summed
        
       cont=cont+1;  
        cont2=cont2+1;
        
      end
        
        
    end
    
end



if size(sum_mat,1)==0
    
    
    fmatout=cat(1,fmat1,fmat2);            %nothing to sum
    
    
else
    


ind1=unique(sum_mat(1,:));


ind1=setdiff(1:size(fmat1,1),ind1);

ind2=unique(sum_mat(2,:));

ind2=setdiff(1:size(fmat2,1),ind2);



for j=ind1
    
    
    fmatout=cat(1,fmatout,fmat1(j,:));
    
end



for jj=ind2
    
    
    fmatout=cat(1,fmatout,fmat2(jj,:));
    
end

end


%%%%%%eliminate zero monomials (i.e. with 1st col==0)


vet=[];
cont=1;

for h=1:size(fmatout,1)
    
    
    if fmatout(h,1)~=0
        
        vet(cont)=h;
        
        cont=cont+1;
        
    end
    
end
        
        
if size(vet,1)==0
    
    fmatout=fmat1(1,:).*0;
    
else
    
    fmatout=fmatout(vet,:);
    
    [fmatout]=Pol_lex_order_mat(fmatout);
end












