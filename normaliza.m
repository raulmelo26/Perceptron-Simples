% Raul Melo
% Função para normalizar os dados entre 0 e 1.

function [dados_normalizados] = normaliza(data)
  _maior = max(max(data));
  _menor = min(min(data));
  
  for i = 1 : size(data,1)
    for j = 1 : size(data,2)
      dados_normalizados(i,j) = (data(i,j) - _menor)/(_maior - _menor);
    end
  end
end