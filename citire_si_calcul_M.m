function [M, N, val1, val2] = citire_si_calcul_M(nume)
  [fid, mesaj] = fopen(nume, "r");
  % programare defensiva (nu exista fisier cu numele dat)
  if fid == -1
    disp(mesaj);
    return;
  endif
  
  % citire nr. de noduri
  N = fscanf(fid, "%d", 1);
  % initializare matrice de adiacenta
  A = zeros(N);

  % citire liste de adiacenta
  for i = [1 : N]
    % nodul curent si numarul de noduri adiacente
    nod_i = fscanf(fid, "%d", 1);
    dim_lista = fscanf(fid, "%d", 1);
    % lista de adiacenta a nodului curent
    for j = [1 : dim_lista]
      lista_nod_i(j) = fscanf(fid, "%d", 1);
    endfor

    % actualizare matrice de adiacenta
    for j = lista_nod_i(1 : dim_lista)
      if i != j % ignoram linkurile catre aceeasi pagina
        A(i, j) = 1;
      endif
    endfor
  endfor

  val1 = fscanf(fid, "%f", 1);
  val2 = fscanf(fid, "%f", 1);

  fclose(fid);

  for i = [1 : N]
    % nr. total de pag. de la care se poate ajunge direct de la pag. de index i
    L(i) = sum(A(i, :));
  endfor

  % calcul matrice M
  for i = [1 : N]
    for j = [1 : N]
      M(i, j) = A(j, i) / L(j); 
    endfor
  endfor
endfunction
