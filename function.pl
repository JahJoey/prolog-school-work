% less_than/2 - compares two int and succeeds if the first is less than the second
less_than(0,incr(Y)).
less_than(incr(X),incr(Y)) :- less_than(X,Y).

% evaluate_polynomial/3 - evaluates Polynomial using X value and return answer in Y
evaluate_polynomial_impl([], X, Power, Accum, Accum).
evaluate_polynomial_impl([Head|Tail], X, Power, Accum, Result) :- 
	NewAccum is (Accum + Head*(X ** Power)),
	NewPower is Power + 1,
	evaluate_polynomial_impl(Tail, X, NewPower, NewAccum, Result).

evaluate_polynomial(Polynomial, X, Y) :- evaluate_polynomial_impl(Polynomial, X, 0, 0, Y).

% tower_of_hanoi/1 - print out the moves to solve a Tower of Hanoi of Number disks
tower_of_hanoi(Number) :- tower_of_hanoi_impl(Number, Left, Middle, Right).
tower_of_hanoi_impl(1, Source, Destination, Spare) :-
	write("move("), write(Spare), write(","), write(Destination), write(")"), nl.
tower_of_hanoi_impl(Number, Source, Destination, Spare) :-
	Source = Left,
	Destination = Middle,
	Spare = Left,
	Number > 1,
	New is Number -1,
	tower_of_hanoi_impl(New, Source, Spare, Middle),
	tower_of_hanoi_impl(1, Source, Destination, Spare),
	tower_of_hanoi_impl(New, Spare, Destination, Source).

% tower_of_hanoi/2 - return a list of the moves to solve a Tower of Hanoi of Number disks
%tower_of_hanoi(Number, Result) :- true