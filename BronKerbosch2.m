function BronKerbosch2(R,P,X)
%BRONKERBOSCH2

  global graph list
  
  if isempty(P) && isempty(X)
    list    = [list; R];
    return
  end % if isempty(P) && isempty(X)
  
  [~, u]    = max(cellfun(@length, graph(union(P,X))));
  u         = arrayaccess(union(P,X), u);
  
  for v=setdiff(P, graph{u})
    BronKerbosch2(union(R,v),intersect(P,graph{v}),intersect(X,graph{v}))
    P       = setdiff(P,v);
    X       = union(X,v);
  end % for v=setdiff(P, graph{u})
end

