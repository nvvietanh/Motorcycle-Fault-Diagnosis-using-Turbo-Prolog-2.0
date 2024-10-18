predicates
	cha(symbol, symbol)
	ong (string, string)
clauses
	cha (toto, mo).
	cha (toto, man).
	cha (mo, bat).
	cha (mo, dia).
	cha (man, chen).
	/*---- cha cua cha ---*/
	ong (X, Y) :- cha (X, Z),
			cha (Z, Y).