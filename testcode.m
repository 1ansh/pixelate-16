function[p]=testcode(q)
[m,n,~]=size(q);
k=zeros(m,n);
im = imcrop(q);
redmax = max(max(im(:,:,1)));
redmin = min(min(im(:,:,1)));
greenmax = max(max(im(:,:,2)));
greenmin = min(min(im(:,:,2)));
bluemax = max(max(im(:,:,3)));
bluemin = min(min(im(:,:,3)));
for i=1:m
    for j=1:n
        if q(i,j,1)<=redmax+25 && q(i,j,1)>=redmin-25 && q(i,j,2)<=greenmax+25 && q(i,j,2)>=greenmin-25 && q(i,j,3)<=bluemax+25 && q(i,j,3)>=bluemin-25
            k(i,j)=1;
        end
    end
end
k=1-k;
k = bwmorph(k,'erode',2);
k = bwmorph(k,'dilate',2);
k=bwlabel(k);
k=bwareaopen(k-bwareaopen(k,3500),2000);
imtool(k)
btri1=bwareaopen(k,700);
btri2=bwareaopen(k,1200);
r1=regionprops(btri1-btri2,'Area','Centroid','BoundingBox');
imtool(btri1-btri2)
bcrc1=bwareaopen(k,1350);
bcrc2=bwareaopen(k,1850);
r2=regionprops(bcrc1-bcrc2,'Area','Centroid','BoundingBox');
imtool(bcrc1-bcrc2)