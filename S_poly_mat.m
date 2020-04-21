function [polydiff,Spoly1,Spoly2,M,Spolymat,cont11]=S_poly_mat(M,Spolymat,cont11)



    polydiff=[];
    cont3=1;
    
    j=1;

    
    
    
    f1=M{j,1};                  % loop needed to select rows ss and ss+1 of M
    f2=M{j+1,1};  
    

    
    
    
    
    
    
    
    [f1]=Pol_mat_simplify(f1);
    [f2]=Pol_mat_simplify(f2);
    
    [f1]=Pol_lex_order_mat(f1);
    [f2]=Pol_lex_order_mat(f2);    
    
    
    cont=1;
    
    
    if size(M,1)>2
    
    for k2=3:size(M,1)
    
        %if k2~=j || k2~=j+1
          %  cont2=1;
            
           
            M1{k2-2,1}=M{k2,1};               % removes the pair of polynomials represented by rows ss and (ss+1)
         
          
        
    end
            
    M=M1;
    
    clear M1
    
    elseif size(M,1)==2  %&& j==1                   % if only a pair is left, it removes it
        
        Mlast=M;
        M={};
        
    end
    
    
    
    
   % M=M{setdiff(1:size(M,1),[j,j2]),:};
    
    
   [J]=Mon_mat_lcm(f1(1,:),f2(1,:));
   
   
   %polya=(fpol1.*LCM)/f1(1,1);
   %polyb=(fpol2.*LCM)/f2(1,1);
   
   %[f1LM]=leading_mon(f1);
   %[f2LM]=leading_mon(f2);
   
   %[JdivLT1]=Mon_array_div4(cell2mat(J),f1LM);
   %[JdivLT2]=Mon_array_div4(cell2mat(J),f2LM);
   
   
   [JdivLT1]=Mon_mat_div(J,f1(1,:));
   [JdivLT2]=Mon_mat_div(J,f2(1,:));
   
   
   
 % Spoly1=[]; 
   %Spoly2=[];
    
          
       
    
       
       [Spoly1]=Pol_mat_mult(JdivLT1,f1);          % Try to solve problems with {}
                                   % [J/LT(f)] *f
       
       
   
   
       
      
       
       [Spoly2]=Pol_mat_mult(JdivLT2,f2);
                                      % [J/LT(g)] *g
       
   
   
   
   [polydiff]=Pol_mat_subtr(Spoly1,Spoly2);
   
   
   
   clear q
    clear r   
   
   Spolymat{cont11,1}=polydiff;              %in position {j,1} you'll find the S-poly   of the Polyn pair M{j,:} and M{j+1,:}
  
    Spolymat{cont11,2}=Spoly1;
   
   Spolymat{cont11,3}=Spoly2;
   
   
   Spolymat{cont11,4}=f1;
   
   Spolymat{cont11,5}=f2;
   
   
   cont11=cont11+1;
   
  % f=polydiff;             %final Spoly result