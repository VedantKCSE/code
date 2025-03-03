edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(g, h).
edge(g, i).
edge(h, j).
edge(h, k).
edge(j, l).
edge(l, m).
edge(l, n).

bfs(Start, Target, Path) :-
    travel(Start, Target, [Start], Path).

travel(Target, Target, Visited, Path) :-
    reverse(Visited, Path).

travel(Start, Target, Visited, Path) :-
    edge(Start, Next),\+ member(Next, Visited),
    travel(Next, Target, [Next|Visited], Path).
%bfs(b,k,Path).
