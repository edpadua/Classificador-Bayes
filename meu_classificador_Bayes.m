function [prev_train prev_test] = meu_classificador_Bayes(M_atributos_train,onset_train,M_atributos_test)

% Call: [prev_train prev_test] = meu_classificador_Bayes(M_atributos_train,onset_train,M_atributos_test)
%
% INPUT
% - M_atributos_train: matriz [n x m], onde n é o número de amostras (imagens) BOLD e m é o número de atributos.
%                    Ou seja, cada linha da matriz deve conter um vetor de atributos, e n=580.
% - onset_train: vetor coluna [n x 1], para treinamento supervisionado
% - M_atributos_test: matriz [n x m], onde n é o número de amostras (imagens) BOLD e m é o número de atributos.
%                   Conjunto de dados para teste.
%
% OUTPUT
% - prev_train: vetor coluna [n x 1], com a previsao para os dados de treinamento, de acordo com o classificador
% - prev_test:  vetor coluna [n x 1], com a previsao para os dados de teste, de acordo com o classificador


%% Inicializacoes e definicoes
[n_train m_train] = size(M_atributos_train);
[n_test m_test] = size(M_atributos_test);

prev_train = zeros(n_train,1);
prev_test  = zeros(n_test,1);

%% IMPLEMENTE O SEU CLASSIFICADOR
%...



[lin nl]=size(M_atributos_train);

desv=zeros(lin);
med=zeros(lin);



%inicializar as tabelas da rede bayesiana


tam=n_train;
tam2=n_test;
natributos=60;

for i=1:natributos
 tabela(i).c1=100000*ones(tam,1);
 tabela(i).c2=100000*ones(tam,1);
 tabela(i).c3=100000*ones(tam,1);
 tabela(i).c4=100000*ones(tam,1);
end



 
 
for i=1:tam
  if (onset_train(i)==1) 
    for j=1:natributos
      tabela(j).c1(i)=M_atributos_train(i,j);
    end
  end
end




for i=1:tam
  if (onset_train(i)==2)  
    for j=1:natributos
      tabela(j).c2(i)=M_atributos_train(i,j);
    end
  end
end


for i=1:tam
  if (onset_train(i)==3)  
    for j=1:natributos
      tabela(j).c3(i)=M_atributos_train(i,j);
    end
  end
end

for i=1:tam
  if (onset_train(i)==4)  
    for j=1:natributos
      tabela(j).c4(i)=M_atributos_train(i,j);
    end
  end
end   
     
%realizar a previsao para os dados de treinamento
	 
for i=1:tam
      p(1)=1;
      p(2)=1;
      p(3)=1;
      p(4)=1;
      for j=1:natributos
               p(1)=p(1)*prob(M_atributos_train(i,j),tabela(j).c1); 
               p(2)=p(2)*prob(M_atributos_train(i,j),tabela(j).c2); 
               p(3)=p(3)*prob(M_atributos_train(i,j),tabela(j).c3); 
               p(4)=p(4)*prob(M_atributos_train(i,j),tabela(j).c4); 
      end    
     

      prev_train(i)=maxi(p);    
      
  end

%realizar a previsao para os dados de teste
   
   for i=1:tam2
      p(1)=1;
      p(2)=1;
      p(3)=1;
      p(4)=1;
      for j=1:natributos
           
               p(1)=p(1)*prob(M_atributos_test(i,j),tabela(j).c1); 
               p(2)=p(2)*prob(M_atributos_test(i,j),tabela(j).c2); 
               p(3)=p(3)*prob(M_atributos_test(i,j),tabela(j).c3); 
               p(4)=p(4)*prob(M_atributos_test(i,j),tabela(j).c4); 
      end    
      
      prev_test(i)=maxi(p);      
   end

  
   
   save prev_test.mat prev_test
    
   

   
end
