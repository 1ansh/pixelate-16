function[]=orpix(k,d,scr)
if k<=6 && k>=-6
    char='s';
    advar=d;
    %forward
elseif k<=90 && k>6
    char='l';
    advar=k;
    %right
elseif k>=-90 && k<-6
    char='r';
    advar=abs(k);
    %left
elseif k<175 && k>90
    char='r';
    advar=k;
    %left
elseif k>-175 && k<-90
    char='l';
    advar=abs(k);
    %right
elseif k>=175 || k<=-175
    char='b';
    advar=d;
    %backward
end
serial_test_pix(char,advar,scr);
end