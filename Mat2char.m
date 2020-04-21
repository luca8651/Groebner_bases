
function [varmat_tot]=Mat2char(fmat1)




if iscell(fmat1)==0  && size(fmat1,1)>0   && sum(fmat1(:)==0)~=size(fmat1,1)*size(fmat1,2)              %non empty or all zeros matrix
    
    fmat1={fmat1};

elseif iscell(fmat1)==0  
    if size(fmat1,1)==0  ||  sum(fmat1(:)==0)==size(fmat1,1)*size(fmat1,2)
    
    varmat_tot=[];
    
    return
    end
end


for h3=1:size(fmat1,1)


fmat11=fmat1{h3,1};
    

fmat11=Pol_mat_simplify(fmat11);





if size(fmat11,1)==0
    
    varmat2{1,1}=num2str(0);
    
    return
end




varmat=cellstr({});



for  h=1:size(fmat11,1)

     coeff=num2str(fmat11(h,1));
         
    
     varmat(h,1)=cellstr(coeff);
     
end




for  h=1:size(fmat11,1)
  
    cont=2;
    
   for        h2=2:size(fmat11,2)
           
       
       if fmat11(h,h2)~=0    
       
           if strcmp('1',num2str(fmat11(h,h2)))==0 
           
           varmat(h,cont)=cellstr( strcat('x',num2str(h2-1),'^',num2str(fmat11(h,h2)))  );
           
           else
               
           varmat(h,cont)=cellstr( strcat('x',num2str(h2-1)  ));    
           
           end
           
           cont=cont+1;
       end
       
           
   end

end


%if size(varmat,1)==1 
    
   % c=num2str(fmat11(1,1));
   % varmat2{1,1}=c;
    
   % return
    
%end




varmat2=varmat(:,1);

%varmat2=[];

for  h=1:size(varmat,1)
    
   
    %%%%%
    
   for        h2=2:size(varmat,2)
           
       if cellfun('isempty',varmat(h,h2))==0
         if h2<size(varmat,2)    
              
       
           %varmat2(h,1)=cellstr( strcat(2,char(varmat2(h,1)),'*',char(varmat(h,h2)),'*')  );
           varmat2(h,1)=cellstr( strcat(char(varmat2(h,1)),'*',char(varmat(h,h2)),'*')  );
         
         
         else
           
            %varmat2(h,1)=cellstr( strcat(2,char(varmat2(h,1)),char(varmat(h,h2)))  );
            varmat2(h,1)=cellstr( strcat(char(varmat2(h,1)),char(varmat(h,h2)))  );
         end
       end
       
   end

   
   
end


%

%for  h=1:size(fmat11,1)

   
%  coeff=num2str(fmat11(h,1));
         
    
   
%  varmat2(h,1)=cellstr(strcat(2,coeff,char(varmat2(h,1))));
     

%end




for  h=1:size(varmat2,1)
    
    
    if strcmp(varmat2{h,1}(end),'*')
        
        varmat2(h,1)=cellstr(varmat2{h,1}(1:end-1));
        
    end
    
end




 %%%
 for hh=1:size(varmat2,1)
     
    if size(varmat2{hh,1},2)>1
        
    if strcmp(varmat2{hh,1}(1),'1')  
        
        varmat2{hh,1}=varmat2{hh,1}(2:end);
        
    elseif  strcmp(varmat2{hh,1}(1:2),'-1') &&  size(varmat2{hh,1},2)>2
        
        varmat2{hh,1}=varmat2{hh,1}(setdiff(1:size(varmat2{hh,1},2), 2 ) );
        
    end

    end
    
 end

%%%%
for hh=1:size(varmat2,1)
     
    if size(varmat2{hh,1},2)>1
       
    if  strcmp(varmat2{hh,1}(1:2),'-*') &&  size(varmat2{hh,1},2)>2
        
        varmat2{hh,1}=varmat2{hh,1}(setdiff(1:size(varmat2{hh,1},2), 2 ) );
        
    end   
    
        
    if strcmp(varmat2{hh,1}(1),'*')  
        
        varmat2{hh,1}=varmat2{hh,1}(2:end);
       
    end
    
    end
           
 end

    
    
 


varmat_tot{h3,1}=varmat2;





end






