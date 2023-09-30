function [R1 R2] = PageRank(nume, d, eps)
  % Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa
  % continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritmul iterativ
	% Iesiri:
	%	-> R1: vectorul de PageRank-uri cu metoda iterativa
  % -> R2: vectorul de PageRank-uri cu metoda algebrica
  [M, N, val1, val2] = citire_si_calcul_M(nume);

  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);

  % se va printa intr-un fisier de forma <nume>.out
  nume_out = [nume ".out"];
  fid = fopen(nume_out, "w");

  % afisare nr. de pagini, respectiv R1 si R2 cu precizie de 6 zecimale
  fprintf(fid, "%d\n", N);
  fprintf(fid, "%.6f\n", R1);
  fprintf(fid, "\n");
  fprintf(fid, "%.6f\n", R2);
  fprintf(fid, "\n");

  % mai jos se va face un clasament al celor mai importante pagini, clasament
  % in care intereseaza locul obtinut (adica numarul i), numarul paginii care a
  % obtinut acest loc si gradul de apartenenta a acestei pagini la multimea
  % paginilor importante
  
  % vectorul coloana cu indicii tuturor paginilor (de la 1 la N)
  i_vector = [1 : N]';

  % PR1 este egal cu vectorul R2 sortat descrescator
  % j_vector contine indicii elementelor din PR1 asa cum erau pozitionate in R2
  [PR1 j_vector] = sort(R2, "descend");

  % F = u(PR1(i)) -> functie descrisa in programul Apartenenta.m
  F = Apartenenta(PR1, val1, val2);

  for i = [1 : N]
    fprintf(fid, "%d %d %.6f\n", i_vector(i), j_vector(i), F(i));
  endfor

  fclose(fid);
endfunction
