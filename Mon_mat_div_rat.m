

function [fmatout,n,d]=Mon_mat_div_rat(fmat1,fmat2)


n=1;

d=1;

fmatout=zeros(1,size(fmat1,2));

        
      
        
        coeff=fmat1(1,1)/fmat2(1,1);
        
        if round(coeff)==coeff
        
        fmatout(1,1)=coeff;
        
        else
            
        [n,d]=rat(fmat1(1,1)/fmat2(1,1));    
        
        
        fmatout(1,1)=1;
        
        
        end
        
        fmatout(1,2:end)= fmat1(1,2:end)-fmat2(1,2:end);
        
        
    
[fmatout]=Pol_lex_order_mat(fmatout);