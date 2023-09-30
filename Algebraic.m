function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari:
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o
  % pagina urmatoare
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

  [M, N, val1, val2] = citire_si_calcul_M(nume);

  % R(t + 1) = d * M * R + (1 - d) / N * I
  % I = vector coloana de dimensiune 1 cu toate elementele 1

  % se aduce primul termen al sumei in stanga si se da R factor comun
  % (I_n - d * M) * R = (1 - d) / N * I

  % se inmulteste la stanga cu inversa
  % R = (I_n - d * M) ^ (-1) * (1 - d) / N * I 

  inv = PR_Inv(eye(N) - d * M);

  R = inv * (1 - d) / N * ones(N, 1);
endfunction
