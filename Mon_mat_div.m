

function [fmatout]=Mon_mat_div(fmat1,fmat2)



fmatout=zeros(1,size(fmat1,2));

        
      
        
        coeff=fmat1(1,1)/fmat2(1,1);
        
        
        fmatout(1,1)=coeff;
        
        
        fmatout(1,2:end)= fmat1(1,2:end)-fmat2(1,2:end);
        
        
    
[fmatout]=Pol_lex_order_mat(fmatout);