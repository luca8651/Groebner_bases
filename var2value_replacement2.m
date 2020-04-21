function [G_out]=var2value_replacement2(G)


    
cont=1;

for j=1:size(G,1)
    
    dim(cont)=size(G{j,1},1);
    
    cont=cont+1;
    
end


dimmat1=max(dim(:));

no_var=0;

cont3=1;


while  no_var==0


  for kk=1:size(G,1)
      
      G{kk,1}=Pol_mat_simplify(G{kk,1});
      
  end
  
Gvet1=zeros(size(G,1),dimmat1);
Gvet2=zeros(size(G,1),dimmat1);


for h=1:size(G,1)
    
    for h2=1:size(G{h,1},1)
        
        
        if Mon_is_integer(G{h,1}(h2,:) )==1
            
            
            Gvet1(h,h2)=1;                                           %vect of integers positions
            
        end
        
        if Mon_is_integer(G{h,1}(h2,:) )==0  &&   size(Mat2char(G{h,1}(h2,:)),1)~=0    %monomial positions
            
            
          Gvet2(h,h2)=1;                           %monomial positions
           
        end
        
    end
    
end


%if sum(Gvet4(:)==0)==size(Gvet4,1)*size(Gvet4,2)           %????????????????
    
   % no_var=1;
    
   % break
    
%end


cont1=1;
cont2=1;

Gvet3=[];
Gvet4=[];


for h1=1:size(Gvet1,1)
    
    if sum(Gvet1(h1,:))==1
        
        
        Gvet3(cont1)=h1;                           %vector indicating which polynomials have a number
        
        cont1=cont1+1;
        
    end
        
        if sum(Gvet2(h1,:))==1
        
        
        Gvet4(cont2)=h1;                                   %vector indicating which polynomials have only 1 var
        
        cont2=cont2+1;
        
        end 
        
end  
 



if sum(Gvet4(:)==0)==size(Gvet4,1)*size(Gvet4,2)
    
    no_var=1;
    
    break
    
end



        
 %
  
 Gvet55=setdiff(Gvet4,Gvet3);                                 %these are the equations with 1 var and no numbers (i.e. the set of var equal to zero!)
 
 
 G_in=G; 
 
 
 for jj=1:size(Gvet55,2)                     %eliminates variable equal to zero
     
     
     varzero=G{Gvet55(jj),1}(1,:);
     
     
     for jj2=1:size(G,1)
         
         for jj3=1:size(G{jj2,1},1)
             
             
             if sum(G{jj2,1}(jj3,:)==varzero)==size(varzero,2)
                 
                 G{jj2,1}(jj3,:)=zeros(1,size(varzero,2));
                 
             end
             
         end
 
         G{jj2,1}=Pol_mat_simplify(G{jj2,1});
         
     end
     
 end
 
 
 %%%%%%search for var and numbers again!
 
Gvet1=zeros(size(G,1),dimmat1);
Gvet2=zeros(size(G,1),dimmat1);


for h=1:size(G,1)
    
    for h2=1:size(G{h,1},1)
        
        
        if Mon_is_integer(G{h,1}(h2,:) )==1
            
            
            Gvet1(h,h2)=1;                                           %vect of integers positions
            
        end
        
        if Mon_is_integer(G{h,1}(h2,:) )==0  &&   size(Mat2char(G{h,1}(h2,:)),1)~=0    %monomial positions
            
            
          Gvet2(h,h2)=1;                           %monomial positions
           
        end
        
    end
    
end
 
cont1=1;
cont2=1;

Gvet3=[];
Gvet4=[];


for h1=1:size(Gvet1,1)
    
    if sum(Gvet1(h1,:))==1
        
        
        Gvet3(cont1)=h1;                           %vector indicating which polynomials have a number
        
        cont1=cont1+1;
        
    end
        
        if sum(Gvet2(h1,:))==1
        
        
        Gvet4(cont2)=h1;                                   %vector indicating which polynomials have only 1 var
        
        cont2=cont2+1;
        
        end 
        
end  
 



if sum(Gvet4(:)==0)==size(Gvet4,1)*size(Gvet4,2)
    
    no_var=1;
    
    break
    
end


 
 
 
       %%%%%%
       
    Gvet5=intersect(Gvet3,Gvet4);                           %equations with only 1 variable and a number   
       
       
  
 clear h1
 
 for h1=1:size(Gvet5,2)
        
        
        %number=G{Gvet5(h),   find(Gvet1(Gvet5(h),:),1) };
        
        
        %var=G{Gvet5(h),   find(Gvet2(Gvet5(h),:),1) };                          %var array
        
        
        %varcoeff=var(size(var,1));
        
        %varnegvalue=number(size(var,1))/varcoeff;  
        
        %varvalue=varnegvalue*(-1);
        
       %var(size(var,1))=1;       
        
        %varneg=var;
        
        %varneg(size(var,1))=varneg(size(var,1))*-1;
        
        
        %number=number.*-1;
        
        
        %%%%%%
        varcoeff=G{Gvet5(h1),1}  ( find(Gvet2(Gvet5(h1),:),1),1 );  
        number=G{Gvet5(h1),1} (   find(Gvet1(Gvet5(h1),:),1),1 );
        numbdivcoeff=number/varcoeff;
        
        %%%%%
        
        
        
        %%%simplify equation        from  [ n*x  -p ]   to    [ x   -p/n  ]
        
      %  G{Gvet5(h),   find(Gvet1(Gvet5(h),:),1) }=G{Gvet5(h),   find(Gvet1(Gvet5(h),:),1) }.*0;             %writes empty array
        
        G{Gvet5(h1),1}  ( find(Gvet1(Gvet5(h1),:),1),1 )=numbdivcoeff;      
        
       % G{Gvet5(h),   find(Gvet1(Gvet5(h),:),1) }(size(var,1))=varnegvalue;                %writes negative variable value
        
      % G{Gvet5(h),1} (  find(Gvet1(Gvet5(h),:),1) , (size(var,1))  =varnegvalue; 
        
        %G{Gvet5(h),   find(Gvet2(Gvet5(h),:),1) }=var;
        G{Gvet5(h1),1} (  find(Gvet2(Gvet5(h1),:),1),1 ) =1;                                       %coeff of the var is now 1
        
        varmat=G{Gvet5(h1),1} (  find(Gvet2(Gvet5(h1),:),1) ,:) ;     % this is the matrix form of the variable 
        varmatneg=varmat;
        varmatneg(1)=-1;
        varvalue=-1*numbdivcoeff;         %this is the value of the variable
        varnegvalue=-1*varvalue;
        
        
        
        varmat_tot_unique{cont3,1}=varmat;
        varmat_tot_unique{cont3,2}=varvalue; 
        
        
        
       for k=1:size(G,1)
             
        for  k2=1:size(G{k,1},1)
            
            if     fmat2_divides_fmat1_mat(G{k,1}(k2,:),varmat) % sum(G{k,1}(k2,:)==varmat(1,:))==size(varmat,2)  %strcmp(Mat2char(G{k,1}(k2,:)),Mat2char(varmat))
            
               gg=Mon_mat_div(G{k,1}(k2,:),varmat);
                
               gg(1)=gg(1)*varvalue;                              %div by the var and multiply by the var value
               
               G{k,1}(k2,:)=gg;
                %G{k,1}(k2,:)=G{k,1}(k2,:).*0;
            
            %G{k,1}(k2,1)=varvalue;
            
           % elseif   %sum(G{k,1}(k2,:)==varmatneg(1,:))==size(varmatneg,2) %strcmp(Mat2char(G{k,1}(k2,:)),Mat2char(varmatneg))
            
          
            %  gg=Mon_mat_div(G{k,1}(k2,:),varmat);
                
             %  gg(1)=gg(1)*varnegvalue;
               
             %  G{k,1}(k2,:)=gg;
            
            
            end
            
        end
        
       end
       
       
 end
            
            
end            %while
 


 for j=1:size(G,1)
 
     G1=[];
     
        for j2=1:size(G{j,1},1)
            
            cc=Mat2char(G{j,1}(j2,:));
            
            if size(cc,1)~=0
                
                G1(j2,:)=G{j,1}(j2,:);
                
            end
            
        end
        
        
              
        
        G1=Pol_mat_simplify(G1);
        
      
      if size(G1,1)>0   && ( size(G1,1)==1 && sum(G1(1,:)==0)==size(G1,2) )==0   
        
        
        
            
            G_out{j,1}=G1;
            
      %else
        
         % G_out{j,1}=0;
          
      end
        
        
 end
        
           