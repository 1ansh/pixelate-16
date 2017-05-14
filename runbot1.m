function[]=runbot1()
scr = serial('COM3','BaudRate',9600);
fopen(scr);
pause(2);
vid = videoinput('winvideo', 2, 'MJPG_1280x720');
preview(vid);
im=getsnapshot(vid);
im=imrotate(im,180);
[im,rect]=imcrop(im);
sfactx = 150/rect(1,3);
sfacty = 150/rect(1,4);
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


% 
% [tnode,tbase,cnode,l]=tech1(im);
% pause(2);
% l(1)=1;
% [z]=atech(l);
% pvar=[];
% [pathz]=pathtech(z,1,tnode(1),tnode,tbase,cnode);
% pvar=[pvar pathz];
% [pathz]=pathtech(z,tnode(1),tnode(2),tnode,tbase,cnode);
% pvar=[pvar pathz];
% [pathz]=pathtech(z,tnode(2),cnode(1),tnode,tbase,cnode);
% pvar=[pvar pathz];
% [pathz]=pathtech(z,cnode(1),cnode(2),tnode,tbase,cnode);
% pvar=[pvar pathz];
% pfinal=[];
% for i=1:max(size(pvar))-2
%     if pvar(i)~=pvar(i+1)
%         pfinal=[pfinal pvar(i)];
%     end
% end
% pfinal=[pfinal pvar(max(size(pvar)))];

pfinal=[1 2 3 8 13 18 19];
for new=2:max(size(pfinal))
    d=30;
    disp(pfinal(new))
    ukn(pfinal,rgb1,rgb2,pfinal(new),vid,rect,d,scr,sfactx,sfacty);
    
end
end