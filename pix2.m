function[r1,r2,varz,rgby]=pix2(q,turn)
[m,n,~]=size(q);
k=zeros(m,n);
im = imcrop(q);
redmax = max(max(im(:,:,1)));
redmin = min(min(im(:,:,1)));
greenmax = max(max(im(:,:,2)));
greenmin = min(min(im(:,:,2)));
bluemax = max(max(im(:,:,3)));
bluemin = min(min(im(:,:,3)));
if turn~=4
    for i=1:m
        for j=1:n
            if q(i,j,1)<=redmax+28 && q(i,j,1)>=redmin-28 && q(i,j,2)<=greenmax+28 && q(i,j,2)>=greenmin-28 && q(i,j,3)<=bluemax+28 && q(i,j,3)>=bluemin-28
                k(i,j)=1;
            end
        end
    end
    k=1-k;
    k = bwmorph(k,'erode',2);
    k = bwmorph(k,'dilate',2);
    
    k=bwlabel(k);
    imtool(k);
else
    for i=1:m
        for j=1:n
            if q(i,j,1)<=redmax+28 && q(i,j,1)>=redmin-28 && q(i,j,2)<=greenmax+28 && q(i,j,2)>=greenmin-28 && q(i,j,3)<=bluemax+28 && q(i,j,3)>=bluemin-19
                k(i,j)=1;
            end
        end
    end
    k=1-k;
    k = bwmorph(k,'erode',2);
    k = bwmorph(k,'dilate',2);
    k=bwlabel(k);
    imtool(k);
end
l=zeros(8,7);
u=0;
for s=1:floor(m/8):8*floor(m/8)-1
    u=u+1;
    v=0;
    for t=1:floor(n/7):7*floor(n/7)-1
        v=v+1;
        if k(s+15,t+15)==0
            l(u,v)=1;
        end
    end
end

if l(1)==1
    varz=3;
elseif l(3)==1
    varz=2;
elseif l(5)==1
    varz=1;
elseif turn==4;
    varz=4;
end
btri1=bwareaopen(k,700);
btri2=bwareaopen(k,1200);
r1=regionprops(btri1-btri2,'Area','Centroid','BoundingBox');
imtool(btri1-btri2)
bcrc1=bwareaopen(k,1350);
bcrc2=bwareaopen(k,1850);
r2=regionprops(bcrc1-bcrc2,'Area','Centroid','BoundingBox');
imtool(bcrc1-bcrc2)
rgby=[redmax redmin greenmax greenmin bluemax bluemin];
end