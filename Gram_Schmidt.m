function [Q, R] = Gram_Schmidt(A)
  % functie realizata in cadrul laboratorului
  [m, n] = size(A);
  Q = [];
  
  for i = [1 : n] 
    q = A(1 : n, i);
    aux = q;
    
    for j = [1 : (i - 1)]
      suma = sum(aux .* Q(:, j));
      q = q - suma * Q(1 : m, j);
    endfor
    
    q = q / norm(q);
    Q = [Q, q];
  endfor
  
  R = Q' * A;
endfunction
