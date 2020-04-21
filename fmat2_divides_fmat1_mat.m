
function [answer]=fmat2_divides_fmat1_mat(fmat1,fmat2)


%[fmatout]=Mon_mat_div(fmat1,fmat2);

if sum(fmat1(1,:)==0)==size(fmat1,2)   ||   sum(fmat2(1,:)==0)==size(fmat2,2) 
    
    answer=0;
    
    return
    
end



test=round(fmat1(1,1)/fmat2(1,1))==fmat1(1,1)/fmat2(1,1);              %coeff2 divides coeff1 ?


[fmatout]=Mon_mat_div(fmat1,fmat2);

s=sum(fmatout(:,2:end)<0);


if test==1 && s==0
    
    answer=1;
    
else
    
    answer=0;
    
end

return

end