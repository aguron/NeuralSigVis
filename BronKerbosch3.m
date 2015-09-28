function cliques = BronKerbosch3(links)
%BRONKERBOSCH3

  adj = adjL2adj(links);
  
  if (sum(sum(adj-adj')) ~= 0)
    error('Adjacency matrix is not undirected (symmetric).');
  end % if (sum(sum(adj-adj')) ~= 0)
  
  if (sum(diag(adj)) > 0)
    error('Adjacency matrix contains self-edges (check your diagonal).');
  end % if (sum(diag(adj)) > 0)

  global graph list
  graph                 = links;
  list                  = {};
  
  R                     = [];
  P                     = 1:length(graph);
  X                     = [];
  for v=degeneracyordering(graph)
    BronKerbosch2(union(R,v),intersect(P,graph{v}),intersect(X,graph{v}));
    P                   = setdiff(P,v);
    X                   = union(X,v);
  end % for v=degeneracyordering(graph)
  
  cliques               = list;
end

