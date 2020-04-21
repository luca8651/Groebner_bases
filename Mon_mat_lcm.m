

function [fmatout]=Mon_mat_lcm(fmat1,fmat2)


fmatout=zeros(1,size(fmat1,2));

fmatout(1)=1;

for k=2:size(fmat1,2)
    
    fmatout(k)=max(fmat1(k),fmat2(k));
    
end
