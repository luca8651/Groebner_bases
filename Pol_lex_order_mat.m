function [fmatout]=Pol_lex_order_mat(fmat1)



if size(fmat1,1)==0 ||  size(fmat1,1)==1
    
    fmatout=fmat1;
    
    return
    
end
    
    


[fmat1]=Pol_mat_simplify_no_lex(fmat1);             %sums rows with the same term

fmat1copy=fmat1;

fmatout=zeros(size(fmat1,1),size(fmat1,2));


cont2=1;

writtenrows=[];

while size(writtenrows,2)~=size(fmat1,1)


for k=1:size(fmat1,1)
    
    cont=1;
    answer=[];
    
    for k2=setdiff(1:size(fmat1,1),k)
        
    if ismember(k2,writtenrows)==0 && ismember(k,writtenrows)==0
        
        
        diff=fmat1(k,2:end)-fmat1(k2,2:end);
        
        diff=diff(diff~=0);
        
       
        
        
        if diff(1)>0
            
            answer(cont)=1;
        
            cont=cont+1;
        else
            
            
            answer(cont)=0;
        
            cont=cont+1;
            
        end
        
        
    
    end
    end
    
    if ismember(k,writtenrows)==0 && sum(answer)==size(answer,2) && size(answer,2)== size(fmat1,1)-1-(size(writtenrows,2))
        
        fmatout(cont2,:)=fmat1(k,:);
        
        writtenrows(cont2)=k;
        
        writtenrows=unique(writtenrows);
        
        cont2=cont2+1;
        
        %fmat1=fmat1(setdiff(1:size(fmat1,1),k),:);
        
        
        
    
    end

 end
    
    if size(writtenrows,2)==size(fmat1,1)
        
       % fmatout=cat(1,fmatout,fmat1(setdiff(1:size(fmat1,1),writtenrows),:));
        
        break
    else
        continue
    end
    
end
        
        
        
        
    
    
    