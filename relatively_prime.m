function [answer]=relatively_prime(mon1,mon2)



x=find(mon1~=0);

y=find(mon2~=0);



int=intersect(x,y);

int=int(int~=1);


if numel(int)>0                 %if the 2 monomials have no common factors other than the coefficient
    
    answer=0;
    
else
    
    answer=1;
    
    
end

