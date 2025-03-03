distance(a, b, 10).
distance(a, c, 15).
distance(a, d, 20).
distance(b, c, 35).
distance(b, d, 25).
distance(c, d, 30).

dist(X, Y, D) :- distance(X, Y, D).
dist(X, Y, D) :- distance(Y, X, D).

total_cost([_], 0).
total_cost([X, Y | Rest], Cost) :-
    dist(X, Y, D),
    total_cost([Y | Rest], RestCost),
    Cost is D + RestCost.

tsp(Start, Route, Cost) :-
    findall(City, (distance(Start, City, _); distance(City, Start, _)), Cities),
    permutation(Cities, PermutedCities),
    append([Start], PermutedCities, PartialRoute),
    append(PartialRoute, [Start], Route),
    total_cost(Route, Cost).
%tsp(a, Route, Cost).
