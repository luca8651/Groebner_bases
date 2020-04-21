

function [fmatout]=Pol_mat_mult(fmat1,fmat2)



fmatout=zeros(size(fmat1,1)*size(fmat2,1),size(fmat1,2));

cont=0;

for h=1:size(fmat1,1)
    
    
    for h2=1:size(fmat2,1)
        
      cont=cont+1;  
        
        coeff=fmat1(h,1)*fmat2(h2,1);
        
        
        fmatout(cont,1)=coeff;
        
        
        fmatout(cont,2:end)= fmat1(h,2:end)+fmat2(h2,2:end);
        
        
    end
    
end


[fmatout]=Pol_lex_order_mat(fmatout);
        
        
