

function [Gmat]=Groebner_mat_construct(inmat,nvar)


%inmat is a cell array. In each row: [coeff,varname,power]

for h=1:size(inmat,1)
    
    
    
    Gmat{h,1}=zeros(size(inmat{h,1},1),nvar+1);
    
    %Gmat{h,1}(1:end,1)=1;
    
    
for h2=1:size(inmat{h,1},1)
    
    
    Gmat{h,1}(h2,1)=inmat{h,1}(h2,1);        %coeff
    
    if  inmat{h,1}(h2,2)~=0
        
        
   Gmat{h,1}(h2,inmat{h,1}(h2,2)+1)=inmat{h,1}(h2,3);         %write the power in the right column    

    end
   
end


end

