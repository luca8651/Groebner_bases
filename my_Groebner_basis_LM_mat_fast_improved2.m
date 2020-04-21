

function [Gfilt,G]= my_Groebner_basis_LM_mat_fast_improved2(Gmat)



for h3=1:size(Gmat,1)
    
    Gmat{h3,1}=Pol_lex_order_mat(Gmat{h3,1});
    
end



 G=Gmat;

  %cont=1;

%cont=1;
%cont7=1;
%cont8=1;
%cont10=1;
%cont11=1;
%cont12=1;
%cont13=1;

%pmat=[];
%rmat=[];
%check_bug={};

% find all pairs of polynomials 
   
cont=1;

 for j11=1:size(Gmat,1)-1
     for j2=j11+1:size(Gmat,1) 
         
         
        
         
         M{cont,1}=Gmat{j11,1};
         
     
                                                                             % pairs are rows (1,2), (3,4) , (5,6) , ... of M
     
    
        M{cont+1,1}=Gmat{j2,1};
         
         
         
       cont=cont+2;  
       
       
        
        
        
         
    end
    
 end
 
  




 
Mnew=[]; 
contM=1; 
 j=1; 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







while  ( size(M,1)==0  && size (Mnew,1)==0  )==0                       

 
 %ss=1:size(M,1);
 
% ss=ss(rem(ss,2)==1);         % ss should be 1,3,5,7,...
    
    %%%%%%%%%%%%%%%%%%
    
    
    
    
 
 
 
 
 %%%%%%%%%%%%%%
    
  %for j=ss                               %%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%while j<=ss
      
    
    
    polydiff=[];
    cont3=1;
    
    
    
    
    
    
    
    f1=M{j,1};                  % loop needed to select rows ss and ss+1 of M
    f2=M{j+1,1};  
    

    
    
    [f1]=Pol_mat_simplify(f1);
    [f2]=Pol_mat_simplify(f2);
    
    [f1]=Pol_lex_order_mat(f1);
    [f2]=Pol_lex_order_mat(f2);    
    
    
    
    
    
         
         mon1=f1(1,:);
         
         
         mon2=f2(1,:);
         
         %answer=0;
         
         answer_prime=relatively_prime(mon1,mon2);
         
    
    
    
       
    %cont=1;
    
    
    if size(M,1)>2
    
    for k2=3:size(M,1)
    
        %if k2~=j || k2~=j+1
          %  cont2=1;
            
           
            M1{k2-2,1}=M{k2,1};               % removes the pair of polynomials represented by rows ss and (ss+1)
         
          
        
    end
            
    M=M1;
    
    clear M1
    
    elseif size(M,1)==2  && j==1                   % if only a pair is left, it removes it
        
        Mlast=M;
        M={};
        
    end
    
    
    
     %%%%%%%
         
     %    kvet=(j11+1):(j2-1);
         
     %    test1=0;
         
    %     for k=kvet
         
         
    %     lcm1=Mon_mat_lcm(Gmat{j2,1},Gmat{j11,1});
             
       %    test1=fmat2_divides_fmat1_mat(lcm1, Leading_monomial(Gmat{k,1}) );   
             
                  
           
     %    end
         
         
      %    kvet=1:(j11-1);
          
       %    for k=kvet
         
         
      %   lcm1=Mon_mat_lcm(Gmat{j2,1},Gmat{j11,1});
             
      %     test1=fmat2_divides_fmat1_mat(lcm1, Leading_monomial(Gmat{k,1}) );   
             
                        
      %   end
          
         %%%%%
         
    
    
    
    
    if answer_prime==0                  %not rel prime
    
    
    
    
   % M=M{setdiff(1:size(M,1),[j,j2]),:};
    
    
   [J]=Mon_mat_lcm(f1(1,:),f2(1,:));
   
   
   %polya=(fpol1.*LCM)/f1(1,1);
   %polyb=(fpol2.*LCM)/f2(1,1);
   
   % [f1LM]=Leading_monomial(f1);
  %  [f2LM]=Leading_monomial(f2);
   
   
   
  %  [JdivLT1]=Mon_mat_div(J,f1LM);
 %   [JdivLT2]=Mon_mat_div(J,f2LM);
   
   
   %[JdivLT1]=Mon_mat_div(J,f1(1,:));
   %[JdivLT2]=Mon_mat_div(J,f2(1,:));
   
   
   [JdivLT1]=Mon_mat_div(J,f1(1,:));                %used to get a possibly not integral coefficient
   [JdivLT2]=Mon_mat_div(J,f2(1,:));
   
   
   
   
   
   %JdivLT1(1)=JdivLT1(1)*d2;
   %JdivLT2(1)=JdivLT2(1)*d1;
   
   
   
    
  Spoly1=[]; 
   Spoly2=[];
    
          
       
    
       
       [Spoly1]=Pol_mat_mult(JdivLT1,f1);          % Try to solve problems with {}
                                   % [J/LT(f)] *f
       
       
   
   
       
      
       
       [Spoly2]=Pol_mat_mult(JdivLT2,f2);
                                      % [J/LT(g)] *g
       
   
   
   
   [polydiff]=Pol_mat_subtr(Spoly1,Spoly2);
   
   
   
   clear q
    clear r   
   
   %Spolymat{cont11,1}=polydiff;              %in position {j,1} you'll find the S-poly   of the Polyn pair M{j,:} and M{j+1,:}
  
    %Spolymat{cont11,2}=Spoly1;
   
   %Spolymat{cont11,3}=Spoly2;
   
   
   %Spolymat{cont11,4}=f1;
   
   %Spolymat{cont11,5}=f2;
   
   
   %cont11=cont11+1;
   
   
   %[polydiff]=Natural_num_simplify(polydiff);
   
   f=polydiff;             %final Spoly result
   
 %%%%%%%%%%%%%%  
  
 
  
   i=1;
   
   cont5=1;
   
   cont10=1;
   
   s=size(G,1);
   
   for z=1:s
       
   q{z,1}= G{1,1}(1,:).*0;
   
   end
   
   
   
   p=f; 
   %rmat=[];      %p=f=polydiff
   
   r(1,:)=q{1,1}(1,:);                     %  r is a zero array
   cont9=1;
   
%while size(p,2)~=0 &&  ( size(p,2)==1 && strcmp(Mat2char(p),'0')  )==0
while ( size(p,1)==1 && sum(p(:)==0)==size(p,2)  )==0

i=1; 
  dividing=true(1,1);
  answervet=[];
  
 while i<=s  && dividing==1
 
 
 
% [answer]=fmat2_divides_fmat1(p(1,:),G{i,1});  
 
%[answer]=fmat2_divides_fmat1(p(1,:),G{i,1}(1,:)  );  

[answer]=fmat2_divides_fmat1_mat(Leading_term(p),Leading_term(G{i,1})  );  


 answervet(i)=answer;
 
 
    if answer==1
   
   %u=LT(p)/LT(fi);
   %u=p(1,1)/G(i,1);
   
   
   [u]=Mon_mat_div(p(1,:), G{i,1} (1,:)  );       % output is an array, not a cell

   
   %umat{1,cont12}=u;
   %umat{2,cont12}=p;
   %umat{3,cont12}=G{i,1};
   %umat{4,cont12}=G;
   %q(i,1:size(q,2)+1)= cat(2,q(i,:),u);   
   
   %q{1,i}=q{1,i}+u;
   
   q{i,1}=Pol_mat_sum(q{i,1},u);
   
   
   
   
   
 if size(p,1)>1                       % doesn't make sense to select LT if p is a monomial
     
 ind=2:size(p,1);
 
 cont2=1;
 
 p1=p(2:end,:);
 
   %for ii=ind
   %p1{1,cont2}=p{1,ii};         % p := p- LT(p)
   %cont2=cont2+1;
   %end
 
   
 
  
 
 elseif size(p,1)==1
 
     p1=p.*0;
 
 end    
 
 
 
 
 cont2=1;
  
 G1=G{i,1}(2:end,:);         %remove LT
 
  % for ii=2:size(G,2)
   %G1{1,cont2}=G{i,ii};         
   %cont2=cont2+1;
   %end
 if size(G1,1)==0
     
     G1=zeros(1,size(Gmat{1,1},2));
     
 end
     
     
  [G1]=Pol_mat_simplify(G1); 
   
 %LTpdivLTGi=Mon_mat_div(p(1,:),G{i,1}(1,:)  );
 
 %subtrandum=Pol_mat_mult(LTpdivLTGi,G1);
 subtrandum=Pol_mat_mult(u,G1);
   
 
 [p]=Pol_mat_subtr(p1,subtrandum);
 
 [p]=Pol_mat_simplify(p);  
   
   
 %umat{5,cont12}=p;
 
  % cont12=cont12+1;
 
 %pmat{cont12,cont10}=p;
 
  %cont10=cont10+1; 
   
   dividing=0;
   
    
    
    
    
    else
   i=i+1;
   end
  
  
%%%%%%%%%%%%%%%%

 if   i>s  || dividing==0  
     
 %answermat{cont5,cont13}=answervet;
 cont5=cont5+1;
    break
end

end
   
   
   
   
   %%%%%%%%%%%%%%%
   
 

 %if sum(answervet==0)==s    % where s is the n of L.Terms in G
 
 if dividing==1
 
   %  check_bug{1,cont9}=p;
    % check_bug{2,cont9}=G;
    % check_bug{3,cont9}=polydiff;
     
     
     
 if  ( size(p,1)==1 && sum(p(:)==0)==size(p,2) )==0 %size(Pol_mat_simplify(p),1)>0    
     
 r(cont9,:)=p(1,:);
 
 cont9=cont9+1;
 %p= p(1,setdiff(1:size(p,2),i));          % f(1,1)==LT(p)
 
[r]=Pol_mat_simplify(r);

 [r]=Pol_lex_order_mat(r);  
 
   %rmat{cont8,cont7}=r;
        
      %   cont7=cont7+1;
 
 
 end
 
 if size(p,1)>1                       % doesn't make sense to select LT if p is a monomial
     
 
 
 cont2=1;
 
 
 
  % for ii=2:size(p,2)
  % p1{1,cont2}=p{1,ii};         % p := p- LT(p)
 %  cont2=cont2+1;
  % end
 %p=p1;
 %clear p1
  
 p=p(2:end,:);
 
 elseif size(p,1)==1  || size(p,1)==0                               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
     p=zeros(1,size(Gmat{1,1},2));
 
 end    
 
 
 
 %pmat{cont12,cont10}=p;
 %cont10=cont10+1;
 
 
 end
 
 
 

%if size(p,1)==0  ||   size(Pol_mat_simplify(p),1)==0  %  ||  size(p,2)==1 && strcmp(Mat2char(p),'0')

if size(p,1)==1 && sum(p(:)==0)==size(p,2)

   % cont7=1;
   % cont8=cont8+1;
    
    break
else
    continue
end

end

  
  
  %cont13=cont13+1;
  
  
  
  
  
  %%%%%%%%%%%%%
  
  

%cont7=1;
    




%cont8=cont8+1;



   
   h=r;
   
  
  
   
   
 % if size(hchar,2)==1 && strcmp(hchar(1,1),'0')==0   ||  size(hchar,2)>1 && size(empty_arr_elim(h),2)>0                %  hchar will be size one if it is zero
      
  % if size(Pol_mat_simplify(h),1)>0
    
  if ( size(h,1)==1 && sum(h(:)==0)==size(h,2) )==0
  
      
       [h]=Pol_lex_order_mat(h);  
         
      % newG=[];
        %Z=[];
        
     %   for d=1:size(G,2)
            
            
        %    Z{1,d}=G{1,d}.*0;
        
                
        %end
       
        
      %  for d=1:size(h,2)
            
         %   Z{1,d}=h{1,d};
        %end
        
        
       G{end+1,1}=h; 
        
        
     
        
  %  [G]=Array_dupl_rows_elim(G); 
     
    %%%%%%%%%%%%%%%%% 
   %%%%%%%%%%%%%%%%%%%%%%%%%%
       
       
       
% find all pairs of polynomials 
   




 for j4=1:size(G,1)
     
     %for j22=(j4+1):size(G,1) 
      
         
         pol1=G{j4,1};
         
     
         
         
         
         
         
     %   if     sum(strcmp(Array2char(pol1),'0'))<size(pol1,2)                    %   if the poly has some non zero entries
         
        if size(Pol_mat_simplify(pol1),1)>0 
         
    % for h2=1:size(G,2)
         
         Mnew{contM,1}=G{j4,1};
                  
    
                                                                                % pairs are rows (1,2), (3,4) , (5,6) , ... of M
   
     
         
         Mnew{contM+1,1}=h;
                  
    
                                                                                
        contM=contM+2;                                                                        
                                                                                
        end
        
    
     
 end
 
 
    
    
   end
   
    
   [Mnew]=dupl_comp_elim(Mnew);
   
   
  
    end
   
   
   
 if size(M,1)==0  && size (Mnew,1)>0                                  %once I have used all couples of M, I need to use the comparisons with all non-zero remainders, contained in Mnew 
    M=Mnew;  
   Mnew=[];
  contM=1;
  continue

 elseif size(M,1)==0  && size (Mnew,1)==0
  
  break

end

end



%filter output

jvet=[];

for j=1:size(G,1)-1
    
    for j2=(j+1):size(G,1)
        
        
        answer1=fmat2_divides_fmat1_mat(Leading_term(G{j,1}),Leading_term(G{j2,1})  ); 

        answer2=fmat2_divides_fmat1_mat(Leading_term(G{j2,1}),Leading_term(G{j,1})  ); 
        

if answer1
    
    jvet(end+1)=j;
    
end


if answer2
    
    jvet(end+1)=j2;
    
    
end


    end
    
    
end
    
    
jfilt=setdiff(1:size(G,1),jvet);



Gfilt=[];


for h=1:size(jfilt,2)


    Gfilt{end+1,1}=G{jfilt(h),1};
    
end




%G=Gfilt;







return

end