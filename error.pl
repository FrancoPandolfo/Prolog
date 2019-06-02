	 
div(X, 0, D):- throw('arithmetic').
div(X, Y, D):- D is X/Y. 


infVal(inf).
handleDiv0(S) :- infVal(S).

tryDiv(A,B, Y):- catch(
               div(A,B, Y),    
               'arithmetic',   
               handleDiv0(Y) ).
