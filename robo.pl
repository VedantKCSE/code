grid_size(4, 4).
obstacle(2, 2).
move(up, (X, Y), (X, Y1)) :- Y1 is Y - 1, Y1 > 0.
move(down, (X, Y), (X, Y1)) :- Y1 is Y + 1, grid_size(_, MaxY), Y1 =< MaxY.
move(left, (X, Y), (X1, Y)) :- X1 is X - 1, X1 > 0.
move(right, (X, Y), (X1, Y)) :- X1 is X + 1, grid_size(MaxX, _), X1 =< MaxX.

valid_position((X, Y)) :- \+ obstacle(X, Y).

means_end(Start, Goal, Path) :-
    means_end_helper(Start, Goal, [Start], Path).

means_end_helper(Goal, Goal, Visited, Path) :-
    reverse(Visited, Path).

means_end_helper(Current, Goal, Visited, Path) :-
    move(Direction, Current, Next),
    valid_position(Next),
    \+ member(Next, Visited),
    write('Moving '), write(Direction), write(' to '), write(Next), nl,
    means_end_helper(Next, Goal, [Next|Visited], Path).
%means_end((1,1), (4,4), Path).
