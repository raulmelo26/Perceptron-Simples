function [media,mat_conf] = funcTeste(conjTeste,teta,w_vetor)
  d_vetor = [];
  x_vetor = [];
  y       = [];
  % Vetor de -1
  teta_vetor = teta*ones(size(conjTeste,1),1);
  % Agrega o Vetor de -1 com o ConjTeste
  conjTeste = [teta_vetor conjTeste];
  % vetor x
  x_vetor = conjTeste(:,1:end-1);
  % Vetor de rôtulos
  d_vetor = conjTeste(:,end);
  
  
  for i = 1: size(conjTeste,1)
    y_vetor(i) = funcDegrau(w_vetor*x_vetor(i,:)');
  end
  % Cálculo da média
  media = mean(y_vetor' == d_vetor);
  mat_conf = confusionmat(d_vetor,y_vetor');
  
end
    