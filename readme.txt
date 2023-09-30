Name: Manea Dorin-Mihai
Group: 313CA

Homework 1 - Behind a Search Engine

Description:

PageRank is the first algorithm used by Google to assign priority to web
pages in search results. A page's importance increases with the number of
direct links leading to it. The network of web pages can be viewed as a
directed graph.

The algorithm to determine the PageRank index of a page A is:

PR(A) = (1 - d) / N + d * SUM[B in M(A)] (PR(B) / L(B)),

where M(A) is the set of pages adjacent to page A, and L(B) represents the
total number of pages directly reachable from page B. N is the total number
of pages, and d (the "damping factor") represents the probability that a
user will continue browsing (usually, d = 0.85).

The algorithm can be solved both iteratively and algebraically. In the case
of the first method, there is a numerical error that becomes negligible with
more iterations. An initial probability distribution is assumed: 
PR(p_i, 0) = 1 / N.
For the second method, calculating an inverse matrix is required, which is
achieved using the QR factorization with the Gram-Schmidt algorithm. This
leads to solving an upper triangular system (UST).

The third requirement involves ranking the most important pages, where the
position obtained, the page number that achieved that position, and the
degree of belonging of that page to the set of important pages are of
interest. The degree of belonging is calculated using the following
continuous membership function:

u(x) = { 0,                				0 <= x < val1
       { 1 / (val2 - val1) * x - val1 / (val2 - val1),  val1 <= x <= val2
       { 1,                				val2 < x <= 1
where val1 and val2 are input values.

The PageRank algorithm is based on Fuzzy logic, an extension of Boolean logic.


Additional Comments:

I appreciated the given topic because it was a very eloquent example of the
applicability of numerical methods. I also understood how optimizations like
PageRank make a difference and led to Google's supremacy in the search engine
world. Last but not least, I learned new mathematical concepts - Fuzzy logic.


References:

1) https://en.wikipedia.org/wiki/PageRank
2) https://en.wikipedia.org/wiki/Fuzzy_logic
3) https://www.cs.huji.ac.il/w~csip/CSIP2007-intro.pdf
4) Numerical Methods lectures and labs.

