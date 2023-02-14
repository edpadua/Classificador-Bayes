function M_atributos = get_atributos_bold(bold4D)
% Call: atributos = get_atributos_bold(bold4D)
%
% INPUT
% bold4D: matriz [53 x 63 x 46 x n], onde n eh o numero total de imagens 
%
% OUTPUT
% atributos: matriz [n x m], onde n é o número de amostras (imagens) BOLD e m é o número de atributos.
%            Ou seja, cada linha da matriz deve conter um vetor de
%            atributos, ou ainda, cada coluna deve representar os valores
%            de um atributo.
%            Note que voce eh que vai escolher um numero m de atributos!

%% Inicializacoes e definicoes

bold_part=bold4D;

clear bold4D;

[xdim ydim zdim namostra] = size(bold_part);

nl=namostra;

natributos=60; % NOTA: o numero de atributos depende de sua estrategia!! "5" eh apenas um valor hipotetico!!



%% IMPLEMENTE A SUA ESTRATEGIA DE SELECAO DE ATRIBUTOS



for i=1:xdim
 for j=1:ydim
   for k=1:zdim
        aux=bold_part(i,j,k,:);
 		aux=aux(:);
		bold_part(i,j,k,:)=detrend(aux);
   end 
 end
end

%obter somente os pontos pertencentes ao cerebro

a=zeros(nl,59917);

for i=1:namostra
      
          f=nonzeros(bold_part(:,:,:,i));
          [s d]=size(f);
          f=reshape(f,d,s);
          for j=1:s 
             a(i,j)=f(1,j);
          end
          
end

atribini=a;

atribini=double(atribini);

%Gerar os dados com menos atributos

[B, Z, evals, Xrecon, mu] = pcaPmtk(atribini,natributos);

clear evals;
clear Xrecon;
clear mu;



%discretizar os dados


Z=round(Z);


M_atributos=abs(Z);



end
