function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa
  % continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

  [M, N, val1, val2] = citire_si_calcul_M(nume);
  
  % initializare R(t) (R_prev in program) si R(t + 1) (R in program)
  % R(t) = PR(p_t, t) -> pagina p_t la momentul t
  R_prev = R = zeros(N, 1);
  R_prev(:) = 1.0 / N; % R(0)

  % calcul eroare numerica
  err = abs(norm(R - R_prev));

  % algoritmul continua pana cand eroarea devine infima (err < eps)
  while err >= eps
    % R(t + 1) = d * M * R(t) + (1 - d) / N * I
    % I = vector coloana de dimensiune 1 cu toate elementele 1
    R = d * M * R_prev + (1 - d) / N * ones(N, 1);
    % actualizare eroare si R_prev
    err = abs(norm(R - R_prev));
    R_prev = R;
  endwhile
endfunction
