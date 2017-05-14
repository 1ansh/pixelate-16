function[mode]=rotor(vid,rect,rgby)
v1=getsnapshot(vid);
v1=imrotate(v1,90);
v1=imcrop(v1,rect);
[m,n,~]=size(v1);
k0=zeros(m,n);
for i=1:m
    for j=1:n
        if v1(i,j,1)<=rgby(1)+25 && v1(i,j,1)>=rgby(2)-25 && v1(i,j,2)<=rgby(3)+25 && v1(i,j,2)>=rgby(4)-25 && v1(i,j,3)<=rgby(5)+25 && v1(i,j,3)>=rgby(6)-19
            k0(i,j)=1;
        end
    end
end
k0=1-k0;
k0 = bwmorph(k0,'erode',2);
k0 = bwmorph(k0,'dilate',2);
k0=bwlabel(k0);
k0=bwareaopen(k0-bwareaopen(k0,3500),2000);
imtool(k0);

pause(1);

v2=getsnapshot(vid);
v2=imrotate(v2,90);
v2=imcrop(v2,rect);
[m,n,~]=size(v2);
k1=zeros(m,n);
for i=1:m
    for j=1:n
        if v2(i,j,1)<=rgby(1)+25 && v2(i,j,1)>=rgby(2)-25 && v2(i,j,2)<=rgby(3)+25 && v2(i,j,2)>=rgby(4)-25 && v2(i,j,3)<=rgby(5)+25 && v2(i,j,3)>=rgby(6)-19
            k1(i,j)=1;
        end
    end
end
k1=1-k1;
k1 = bwmorph(k1,'erode',2);
k1 = bwmorph(k1,'dilate',2);
k1=bwlabel(k1);
k1=bwareaopen(k1-bwareaopen(k1,3500),2000);
imtool(k1);


p=size(find((k1-k0)==1));
if p(1)<500
    mode=0;
else
    mode=1;
end
end