
%choose_poly


%from the index of all polys having only 2 variables, I choose the poly
%whose LT comes before all other LTs in lex order


function[Gvet66,var1,indvar1]=choose_poly(G,Gvet6)


hvet=[];
indvet=[];
cont=1;

for h=1:size(Gvet6,2)
    
    
    if sum(G{Gvet6(h),1}(1,2:end))==1                     %simple var, not a multiplication

            hvet(cont)=Gvet6(h);
            
           indvet(cont)=find(G{Gvet6(h),1}(1,2:end)==1);        %varnames
           
           cont=cont+1;
           
    end
    
end



var1=min(indvet);

indvar1=find(indvet==var1);


Gvet66=hvet(indvar1);



end






