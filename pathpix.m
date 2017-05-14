function[pathz]=pathpix(adj,suru,ant,tnode,tbase,cnode,l)
adjc=adj;
d=Inf(8,7);
dup=Inf(8,7);
v=zeros(8,7);
p=Inf(8,7);
d(suru)=0;
dup(suru)=0;
p(suru)=0;

for i=1:4
    if ant==tnode(i) || suru==tnode(i)
        adjc(tnode(i),tbase(i))=1;
        adjc(tbase(i),tnode(i))=1;
    end
    if ant==cnode(i) || suru==cnode(i)
        if tnode(i)~=cnode(i)+1 && cnode(i)+1<=56 && l(cnode(i)+1)==1
            adjc(cnode(i),cnode(i)+1)=1;
            adjc(cnode(i)+1,cnode(i))=1;
        end
        if tnode(i)~=cnode(i)-1 && cnode(i)-1<=56 && l(cnode(i)-1)==1
            adjc(cnode(i),cnode(i)-1)=1;
            adjc(cnode(i)-1,cnode(i))=1;
        end
        if tnode(i)~=cnode(i)+8 && cnode(i)+8<=56 && l(cnode(i)+8)==1
            adjc(cnode(i),cnode(i)+8)=1;
            adjc(cnode(i)+8,cnode(i))=1;
        end
        if tnode(i)~=cnode(i)-8 && cnode(i)-8<=56 && l(cnode(i)-8)==1
            adjc(cnode(i),cnode(i)-8)=1;
            adjc(cnode(i)-8,cnode(i))=1;
        end
    end
end


while(suru~=ant)
    for j=1:56
        if adjc(suru,j)==1 && d(j)>d(suru)+1 && v(j)==0
                d(j)=d(suru)+1;
                dup(j) = d(suru) + 1;
                p(j)=suru;
        end
    end
    v(suru)=1;
    dup(suru)=Inf;
    suru= find(dup==min(min(dup)), 1 );
    
end
pathz = ant;
while(p(ant)~=0)
    pathz = [p(ant),pathz];
    ant = p(ant);
end

end