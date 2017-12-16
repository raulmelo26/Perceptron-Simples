function [w_vetor] = funcTreino(conjTreino, taxa, teta)
  x_vetor = [];
  erro_vetor = [];
  teta_vetor = teta*ones(size(conjTreino,1),1); 
  conjTreino = [teta_vetor conjTreino];
  
  w_vetor = rand(1,size(conjTreino,2)-1)-0.5;
  
  m = size(conjTreino,1);
  
  for epoca = 1 : 100
    % Embaralha as linhas da matriz
    base = conjTreino(randperm(m),:);
    % Vetor apenas com as entradas
    x_vetor = base(:,1:end-1);
    % Vetor apenas com os rótulos
    rotulos_vetor = base(:,end); 
    for i = 1 : m
      y = funcDegrau(w_vetor*x_vetor(i,:)');
      erro_vetor(i) = rotulos_vetor(i) - y;
      % Atualização do vetor w
      w_vetor = w_vetor + taxa*erro_vetor(i)*x_vetor(i,:);
      
    end  
  end
  
end
      
  