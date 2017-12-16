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
data = load('iris_data.dat');

% Normaliza
data = [normaliza(data(:,1:end-1)) data(:,end)];

m = size(data,1);
soma_mat_conf = [0 0;0 0];

% Realizações
n = 20;

for i=1:n
  % Embaralha as linhas da matriz
  data = data(randperm(m),:);
  % Separação de dados de treino/teste
  [dadosTreino,dadosTeste] = separaDados(data,0.8);
  % Treinamento do algoritmo com dados de traino
  [w] = funcTreino(dadosTreino,0.1,-1);
  % Teste 
  [vetor_medias(i),mat_conf] = funcTeste(dadosTeste,-1,w);
  % Soma das matrizes de confusão
  soma_mat_conf += mat_conf; 
end

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
 
  
  