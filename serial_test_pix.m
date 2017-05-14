function[]=serial_test_pix(char,advar,scr)
if char=='s'
    fwrite(scr,'s');
    pause(1*advar/50);
    fwrite(scr,'a');
    pause(0.15);
elseif char=='b'
    fwrite(scr,'b');
    pause(1*advar/50);
    fwrite(scr,'a');
    pause(0.15);
elseif char=='l'
    fwrite(scr,'l');
    pause(0.35*advar/100);
    fwrite(scr,'a');
    pause(0.15);
elseif char=='r'
    fwrite(scr,'r');
    pause(0.15*advar/100);
    fwrite(scr,'a');
    pause(0.15);
end
end