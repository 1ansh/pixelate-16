function[tnode,tbase,cnode,l,rgby]=pix1(im)
[m,n,~]=size(im);
ct=[0 0;0 0;0 0;0 0];
cc=[0 0;0 0;0 0;0 0];
tnode=[0 0 0 0];
cnode=[0 0 0 0];
tbase=[0 0 0 0];
for turn=1:4
    [r1,r2,varz,rgby]=pix2(im,turn);
    ct(varz,1)=r1(1,1).Centroid(1);
    ct(varz,2)=r1(1,1).Centroid(2);
    cc(varz,1)=r2(1,1).Centroid(1);
    cc(varz,2)=r2(1,1).Centroid(2);
    a1=r1(1,1).BoundingBox(1);
    a2=r1(1,1).BoundingBox(2);
    a3=r1(1,1).BoundingBox(3);
    a4=r1(1,1).BoundingBox(4);
    v=0;
    for t=1:floor(n/7):7*floor(n/7)-1
       v=v+1;
       u=0;
       for s=1:floor(m/8):8*floor(m/8)-1
           u=u+1;
           if ct(varz,2)>s && ct(varz,2)<s+floor(m/8) && ct(varz,1)>t && ct(varz,1)<t+floor(n/7)
                tnode(varz)=(sub2ind([8,7],u,v));
           end
       end
    end
    v=0;
    for t=1:floor(n/7):7*floor(n/7)-1
       v=v+1;
       u=0;
       for s=1:floor(m/8):8*floor(m/8)-1
           u=u+1;
           if cc(varz,2)>s && cc(varz,2)<s+floor(m/8) && cc(varz,1)>t && cc(varz,1)<t+floor(n/7)
               cnode(varz)=(sub2ind([8,7],u,v));
           end
       end
    end
d1=distance(ct(varz,1),ct(varz,2),a1+(a3/2),a2);
d2=distance(ct(varz,1),ct(varz,2),a1,a2+(a4/2));
d3=distance(ct(varz,1),ct(varz,2),a1+(a3/2),a2+a4);
d4=distance(ct(varz,1),ct(varz,2),a1+a3,a2+(a4/2));

if d1<d3+3 && d1>d3-3
    if d2<d4
        tbase(varz)=tnode(varz)-8;
    else
        tbase(varz)=tnode(varz)+8;
    end
elseif  d2<d4+3 && d2>d4-3
    if d1<d3
        tbase(varz)=tnode(varz)-1;
    else
        tbase(varz)=tnode(varz)+1;
    end
end
end
imvar=zeros(m,n);
alpha=imcrop(im);
redmax = max(max(alpha(:,:,1)));
redmin = min(min(alpha(:,:,1)));
greenmax = max(max(alpha(:,:,2)));
greenmin = min(min(alpha(:,:,2)));
bluemax = max(max(alpha(:,:,3)));
bluemin = min(min(alpha(:,:,3)));
for i=1:m
    for j=1:n
        if im(i,j,1)<=redmax+10 && im(i,j,1)>=redmin-10 && im(i,j,2)<=greenmax+10 && im(i,j,2)>=greenmin-10 && im(i,j,3)<=bluemax+10 && im(i,j,3)>=bluemin-10
            imvar(i,j)=1;
        end
    end
end
imvar=bwareaopen(imvar,10000);
imvar=1-imvar;
imvar=bwareaopen(imvar,10000);
imtool(imvar);

l=zeros(8,7);
u=0;
for s=1:floor(m/8):8*floor(m/8)-1
    u=u+1;
    v=0;
    for t=1:floor(n/7):7*floor(n/7)-1
        v=v+1;
        if imvar(s+30,t+30)==0
            l(u,v)=1;
        end
    end
end
end