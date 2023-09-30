function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari
  % Gram-Schmidt

  % A * (A ^ (-1)) = I_n
  % notam x_i coloana i a matricei inverse si e_i coloana i a matricei unitate
  % obtinem A * [x_1 x_2 ... x_n] = [e_1 e_2 ... e_n], adica A * x_i = e_i

  % factorizam matricea A folosind algoritmul cu G-S si obtinem A = Q * R,
  % deci Q * R * x_i = e_i

  % inmultim la stanga cu Q ^ (-1), iar matricea Q este ortogonala, asadar
  % R * x_i = Q_transp * e_i

  % matricea R este superior triunghiulara, deci se ajunge la rezolvarea unui
  % sistem superior triunghiular (SST)

	[Q R] = Gram_Schmidt(A);

  n = size(A);
  I_n = eye(n);
  B = [];

  for i = [1 : n]
    e_i = I_n(:, i);
    x_i = SST(R, Q' * e_i);
    B = [B x_i];
  endfor
endfunction
