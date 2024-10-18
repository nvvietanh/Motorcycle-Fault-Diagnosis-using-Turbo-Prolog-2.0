predicates
	cha(symbol, symbol)
	
	anhem (string, string)
clauses
	cha (toto, mo).
	cha (toto, man).
	cha (mo, bat).
	cha (mo, dia).
	cha (man, chen).
	/*---- cha cua cha ---*/
	/*---- anh em ----*/

	anhem(X, Y) :- cha(A, X), cha(A, Y), X <> Y.

	anhem (X, Y) :- 
		cha (A, X), cha (B, Y), anhem (A, B).
	