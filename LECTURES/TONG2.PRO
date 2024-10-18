predicates
	tong (integer, integer)
clauses
	tong (1, 0) :- !.
	tong (N, K) :-  
			N mod 2 = 0,
			N1 = N - 1,
			tong (N1, K1),
			K = K1 + N.
/*	tong (N, K) :- 	
			N1 = N - 1, 
			tong (N1, K1),
			K = K1 + N.		
*/