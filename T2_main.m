%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% T2 - Decodificao cerebral a partir de sinais BOLD 
% (AMRP 2sem 2012)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nome: (SEU NOME)
%
clear all
tic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1) Criar seu vetor de atributos a partir dos sinais BOLD
load bold_train;

% (IMPLEMENTE A SUA FUNCAO)
M_atributos_train = get_atributos_bold(bold_train);  

clear bold_train; % apaga variavel para economizar memoria..
load bold_test;
M_atributos_test = get_atributos_bold(bold_test);
clear bold_test; % apaga variavel para economizar memoria..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2) Treinar o seu classificador Naive Bayes ou TAN Bayes
%      e calcular as previsoes para os dados de treino e de teste!
% Carregar seu vetor de labels para o aprendizado supervisionado
load onset_train;
size(onset_train);

% (IMPLEMENTE A SUA FUNCAO)
[prev_train prev_test] = meu_classificador_Bayes(M_atributos_train,onset_train,M_atributos_test);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3) Taxa de acerto do seu classificador para Stop trials

i3c = find(prev_train==3);
i4c = find(prev_train==4);
FalsePositiveRate = mean(prev_train([i3c;i4c]) ~= onset_train([i3c;i4c]));
fprintf('Taxa de acerto (treino): %.2f%%\n',100*(1-FalsePositiveRate));
t = toc; 
fprintf('Total Time: %.2f seconds\n',t);

% % NAO APAGAR!
% load onset_test;
% i3cc = find(prev_test==3);
% i4cc = find(prev_test==4);
% FalsePositiveRatec = mean(prev_test([i3cc;i4cc]) ~= onset_test([i3cc;i4cc]));
% fprintf('Taxa de acerto (TESTE): %.2f%%\n',100*(1-FalsePositiveRatec));

