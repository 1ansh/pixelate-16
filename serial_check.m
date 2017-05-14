% scr = serial('COM4','BaudRate',9600);
% fopen(scr);
% pause(2);
fwrite(scr,'s');
pause(1*30/35);
fwrite(scr,'a');