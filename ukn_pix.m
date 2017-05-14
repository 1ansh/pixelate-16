function[current]=ukn_pix(pfinal,rgb1,rgb2,node,vid,rect,d,scr,sfactx,sfacty)
current=node;
while(d>4)
    pause(1);
    im=getsnapshot(vid);
    im=imrotate(im,90);
    im=imcrop(im,rect);
    [m,n,~]=size(im);
    bw1=zeros(m,n);
    for i=1:m
        for j=1:n
            if im(i,j,1)<rgb1(1)+20 && im(i,j,1)>rgb1(2)-20 && im(i,j,2)<rgb1(3)+20 && im(i,j,2)>rgb1(4)-20 && im(i,j,3)<rgb1(5)+20 && im(i,j,3)>rgb1(6)-20
                bw1(i,j)=1;
            end
        end
    end
    bw1 = bwmorph(bw1,'erode',2);
    bw1 = bwmorph(bw1,'dilate',5);
    bw1=bwareaopen(bw1,10);
    imtool(bw1)
    
    bw2=zeros(m,n);
    for i=1:m
        for j=1:n
            if im(i,j,1)<rgb2(1)+20 && im(i,j,1)>rgb2(2)-20 && im(i,j,2)<rgb2(3)+20 && im(i,j,2)>rgb2(4)-20 && im(i,j,3)<rgb2(5)+20 && im(i,j,3)>rgb2(6)-20
                bw2(i,j)=1;
            end
        end
    end
    bw2 = bwmorph(bw2,'erode',2);
    bw2 = bwmorph(bw2,'dilate',5);
    bw2=bwareaopen(bw2,10);
    imtool(bw2)
    r1=regionprops(bw1,'Centroid');
    xv(1)=r1(1,1).Centroid(1);
    yv(1)=r1(1,1).Centroid(2);
    
    r2=regionprops(bw2,'Centroid');
    xv(2)=r2(1,1).Centroid(1);
    yv(2)=r2(1,1).Centroid(2);
    x(2)=(xv(1)+xv(2))/2;
    y(2)=(yv(1)+yv(2))/2;
    for i=1:max(size(pfinal))
        v=0;
        for t=1:floor(n/7):7*floor(n/7)-1
            v=v+1;
            u=0;
            for s=1:floor(m/8):8*floor(m/8)-1
                u=u+1;
                [t1,t2]=ind2sub([8,7],node);
                if u==t1 && v==t2
                    x(1)=t+(floor(n/7))/2;
                    y(1)=s+(floor(m/8))/2;
                end
            end
        end
    end
    a=complex(xv(1)-xv(2),yv(1)-yv(2));
    b=complex(x(1)-x(2),y(1)-y(2));
    k=angle(a/b)*180/pi;
    disp(k);
    d=(((x(1)-x(2))*sfactx)^2 + ((y(1)-y(2))*sfacty)^2);
    d = sqrt(d);
    if d<=5
        break;
    end
    orpix(k,d,scr);
end
end