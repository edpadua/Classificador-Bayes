function p = prob(valor,tabela)
       
        a=find(tabela~=100000);
        b=find(tabela==valor);
        [si di]=size(a);
        [s d]=size(b);
        p=s/si;
end
