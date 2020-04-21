


function [fmatout]=Pol_mat_simplify_no_lex(fmat1)

ncol=size(fmat1,2);

cont=1;

vet=[];


if size(fmat1,1)==0                  %%%%%%%%%%%%%%%%%%%%%%%%
    
    fmatout=fmat1;
    
    return
    
end



for j=1:size(fmat1,1)
    
    
    if sum(fmat1(j,:)==0)<size(fmat1,2)   && fmat1(j,1)~=0          %eliminates zeros
        
        
        vet(cont)=j;
        
        cont=cont+1;
        
    end
    
end


fmatout=zeros(1,size(fmat1,2));

if size(vet,2)>0


fmat1=fmat1(vet,:);

else
    
    fmatout=fmat1(1,:).*0;
    return
    
end
  
  
  





cont=1;
cont2=1;


sum_mat=[];

for h=1:size(fmat1,1)-1
    
    
    for h2=(h+1):size(fmat1,1)
        
      
        
      test= fmat1(h,2:end)==fmat1(h2,2:end);
      
      if sum(test)==size(fmat1,2)-1   && ismember(h2,sum_mat)==0
      
      
      coeff=fmat1(h,1)+fmat1(h2,1);
        
      
        %fmatout(cont,1)=coeff;
        
        
        %fmatout(cont,2:end)= fmat1(h,2:end);
        fmat1(h,1)=coeff;
        fmat1(h2,1)=0;
        
       sum_mat(1,cont2:cont2+1)=[h,h2];
       %sum_mat(cont2)=h2; 
       %write down indexes of variables which have been summed
        
         cont=cont+1;
        cont2=cont2+2;
      
           
       
       
      end
        
        
    end
    sum_mat(1,cont2)=h;
    cont2=cont2+1;
    
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


%fmatout=zeros(1,size(fmat1,2));

%if size(vet,2)>0


fmatout=fmat1(vet,:);


if  numel(fmatout)==0
    
    fmatout=zeros(1,ncol);
    
end


return

end
%else
    
   % fmatout=fmat1(1,:).*0;
 %   return
    
%end
  





%%%%%%%%%%%%%%%%%%%%%%%%%%%
%if size(sum_mat,1)==0
    
    
 %   fmatout=fmat1;            %nothing to sum
    
    
%else
    


%ind1=unique(sum_mat(1,:));


%ind1=setdiff(1:size(fmat1,1),ind1);


%if size(ind1,1)>0

%for j=ind1
    
    
%    fmatout=cat(1,fmatout,fmat1(j,:));
    
%end

%end


%end

%cont=1;
%hvet=[];

%for h=1:size(fmatout,1)
    
 %   if fmatout(h,1)>0 ||  fmatout(h,1)<0
        
        
 %       hvet(cont)=h;
  %      cont=cont+1;
        
   % end
    
%end

%

%if size(hvet,1)==0
    
    
%    fmatout=fmat1(1,:).*0;
    
%else
    
 %   fmatout=fmatout(hvet,:);
    
%end
    
    


%[fmatout]=Pol_lex_order_mat(fmatout);









