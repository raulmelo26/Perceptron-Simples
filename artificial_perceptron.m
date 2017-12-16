% Autor: Raul Melo
% Curso: Ciência da Computação
% Disciplina: Redes Neurais Artificiais
% Prof.: Ajalmar Rego da Rocha Neto

clc; clear;

fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                           REDES NEURAIS ARTIFICIAIS                    |\n');
fprintf('|                              PERCEPTRON SIMPLES                        |\n');
fprintf('|                         (Prof. Ajalmar Rego da Rocha Neto)             |\n');
fprintf('|                     Acadêmico: Raul Gabriel Carvalho de Melo           |\n');
fprintf('|                                IFCE - Maracanaú                        |\n');
fprintf('+------------------------------------------------------------------------+\n');

% Carrega os dados
data = load('artificialData1.dat');

% Normaliza
data = [normaliza(data(:,1:end-1)) data(:,end)];

graficoData = figure(1); hold on;
scatter(data(1:200,1),data(1:200,2),'b',"filled");
scatter(data(201:400,1),data(201:400,2),'r',"filled");
title ("Classificação",'fontsize',18);
legend_h = legend('Classe 1','Classe 2','location','northwest','orientation','horizontal');

m = size(data,1);

% Realizações
n = 20;

soma_mat_conf = [0 0;0 0];

for i=1:n
  data = data(randperm(m),:);
  [dadosTreino,dadosTeste] = separaDados(data,0.8);
  
  [w] = funcTreino(dadosTreino,0.1,-1);
  
  [vetor_medias(i),mat_conf] = funcTeste(dadosTeste,-1,w);
  soma_mat_conf += mat_conf;
 
end

% Plotagem do vetor w
x1 = linspace(0,1,10);
% Formula do livro
x2 = -(w(2)/w(3))*x1+(w(1)/w(3));
plot(x1,x2);

% Acurácia, desvio padrão e matriz de confusão
_acuracia = mean(vetor_medias);
d_padrao = std(vetor_medias);
mat_conf_final = soma_mat_conf/n;

fprintf('               +---------------------------------------+\n');
fprintf('               |       MATRIZ DE CONFUSÃO MÉDIA        |\n');
fprintf('               |---------------------------------------|\n');
fprintf('               |     d|y     |     ZERO    |     UM    |\n');
fprintf('               |-------------|-------------|-----------|\n');
fprintf('               |     ZERO    |     %.2f   |    %.2f   |\n',mat_conf_final(1,1),mat_conf_final(1,2));
fprintf('               |-------------|-------------|-----------|\n');
fprintf('               |      UM     |      %.2f   |   %.2f   |\n',mat_conf_final(2,1),mat_conf_final(2,2));
fprintf('               +---------------------------------------+\n');

fprintf('               +---------------------------------------+\n');
fprintf('               |               ACURÁCIA                |\n');
fprintf('               |---------------------------------------|\n');
fprintf('               |                %.2f%%                 |\n',_acuracia*100);
fprintf('               +---------------------------------------+\n');

fprintf('               +=======================================+\n');
fprintf('               |             DESVIO PADRÃO             |\n');
fprintf('               |---------------------------------------|\n');
fprintf('               |                %.6f               |\n',d_padrao);
fprintf('               +=======================================|\n');
