function[tnode]=runbotpix()
scr = serial('COM4','BaudRate',9600);
fopen(scr);
pause(2);
vid = videoinput('winvideo', 2, 'MJPG_640x480');
src = getselectedsource(vid);
src.Brightness=53;
src.Contrast=32;
src.Exposure=-6;
src.Gain=64;
src.Sharpness=24;
src.Saturation=32;
src.WhiteBalance=4000;
preview(vid);
im=getsnapshot(vid);
im=imrotate(im,90);
[im,rect]=imcrop(im);
sfactx = 210/rect(1,3);
sfacty = 240/rect(1,4);
im1 = imcrop(im);
rgb1=[0 0 0 0 0 0];
rgb1(1) = max(max(im1(:,:,1)));
rgb1(2) = min(min(im1(:,:,1)));
rgb1(3) = max(max(im1(:,:,2)));
rgb1(4) = min(min(im1(:,:,2)));
rgb1(5) = max(max(im1(:,:,3)));
rgb1(6) = min(min(im1(:,:,3)));

im2 = imcrop(im);
rgb2=[0 0 0 0 0 0];
rgb2(1) = max(max(im2(:,:,1)));
rgb2(2) = min(min(im2(:,:,1)));
rgb2(3) = max(max(im2(:,:,2)));
rgb2(4) = min(min(im2(:,:,2)));
rgb2(5) = max(max(im2(:,:,3)));
rgb2(6) = min(min(im2(:,:,3)));



[tnode,tbase,cnode,l,rgby]=pix1(im);
pause(2);
[z,l]=adjpix(l);
pvar=[];
[pathz]=pathpix(z,8,tnode(1),tnode,tbase,cnode,l);
pvar=[pvar pathz];
[pathz]=pathpix(z,tnode(1),tnode(2),tnode,tbase,cnode,l);
pvar=[pvar pathz];
[pathz]=pathpix(z,tnode(2),tnode(3),tnode,tbase,cnode,l);
pvar=[pvar pathz];
[pathz]=pathpix(z,tnode(3),cnode(1),tnode,tbase,cnode,l);
pvar=[pvar pathz];
[pathz]=pathpix(z,cnode(1),cnode(2),tnode,tbase,cnode,l);
pvar=[pvar pathz];
[pathz]=pathpix(z,cnode(2),cnode(3),tnode,tbase,cnode,l);
pvar=[pvar pathz];
pfinal=[];
for i=1:max(size(pvar))-1
    if pvar(i)~=pvar(i+1)
        pfinal=[pfinal pvar(i)];
    end
end
pfinal=[pfinal pvar(max(size(pvar)))];

for new=2:max(size(pfinal))
    d=30;
    disp(pfinal(new))
    current=ukn_pix(pfinal,rgb1,rgb2,pfinal(new),vid,rect,d,scr,sfactx,sfacty); 
    for i=1:3
        if current==tnode(i)
            fwrite(scr,'g');
        elseif current==cnode(i)
            fwrite(scr,'d');
        end
    end
    mode=rotor(vid,rect,rgby);
    if mode==0
        fwrite(scr,'y');
    end
end
end