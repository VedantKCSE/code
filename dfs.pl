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

de(Start, Target, Path) :-
    dfs(Start, Target, [Start], Path).

dfs(Target, Target, Visited, Path) :-
    reverse(Visited, Path).

dfs(Start, Target, Visited, Path) :-
    edge(Start, Next),
    \+ member(Next, Visited), % Ensure we don't revisit nodes
    dfs(Next, Target, [Next|Visited], Path).

find_all_paths(Root, AllPaths) :-
    findall(Path, (edge(Root, Node), de(Root, Node, Path)), AllPaths).
%de(a,n,Path).
