
function [answer]=Pol_is_integer(fmat)



if size(fmat,2)==0
    
    answer=0;
    
    return
    
end



if iscell(fmat)==0
    
    fmatt{1,1}=fmat;
    fmat=fmatt;
    clear fmatt
    
    
end

s=0;





for d=1:size(fmat,2)

    %cont=1;
    
   % while cont<=numel(fmat{1,d})
    
s=s+sum(fmat{1,d}(:)~=0);

end


n1=size(fmat{1,d},1);


coeff=fmat{1,1}(n1)~=0;



if s==1 && coeff
    
    answer=1;
else
    
    answer=0;
    
end

return

end




