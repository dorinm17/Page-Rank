function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza
  % valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1.
  
  % u(t) =
  % -> 0,         0 <= t < val1
  % -> a * t + b, val1 < t < val2
  % -> 1,         val2 < t <= 1
  
  % a si b se calculeaza, astfel incat functia u sa fie continua pe [0, 1]
  % punctele de interes pentru studiul continuitatii sunt t = val1 si t = val2
  % se obtine urmatorul sistem:
  % -> a * val1 + b = 0
  % -> a * val2 + b = 1,
  % din care aflam a si b

  % initializari
  N = length(x);
  y = zeros(N, 1);
  % a si b, astfel incat u continua in t = val1 si t = val2
  a = 1.0 / (val2 - val1);
  b = -val1 * a;
  
  % calcularea imaginii functiei u (Im(u) = y)
	for i = [1 : N]
    if x(i) > val2
      y(1) = 1;
    endif
    if x(i) >= val1 && x(i) <= val2
      y(i) = a * x(i) + b;
    endif
  endfor
endfunction
