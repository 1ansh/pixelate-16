function[z,l]=adjpix(l)
z=zeros(56,56);
i1=1;m=0;
for j=1:7
    for i=1:8
        if l(i,j)==1
            if j+1~=8 && l(i,j)==l(i,j+1)
                z(i1,8*m+8+i)=l(i,j+1);
            end
            if j-1~=0&& l(i,j)==l(i,j-1)
                z(i1,8*m-8+i)=l(i,j-1);
            end
            if i-1~=0 && l(i,j)==l(i-1,j)
                z(i1,8*m-1+i)=l(i-1,j);
            end
            if i+1~=9 && l(i,j)==l(i+1,j)
                z(i1,8*m+1+i)=l(i+1,j);
            end
        end
    i1=i1+1;    
    end
m=m+1;
end
end