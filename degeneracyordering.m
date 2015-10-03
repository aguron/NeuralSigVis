function [L k] = degeneracyordering(graph)
%DEGENERACYORDERING
% Matula & Beck (1983)
  L                         = [];
  d                         = cellfun(@length, graph);
  D                         = cell(max(d) + 1, 1);
  for i=0:(length(D)-1)
    D{i+1}                  = find(d == i);
  end % for i=0:(length(D)-1)
  k                         = 0;
  n                         = length(d);
  for j=1:n
    i                       = find(~cellfun(@isempty, D), 1) - 1;
    k                       = max(k,i);
    v                       = D{i+1}(1);
    L                       = [L, v]; % later in the ordering (as opposed to earlier) for BronKerbosch algorithm
    D{i+1}                  = setdiff(D{i+1}, v);
    N_v                     = graph{v};
    V_w                     = setdiff(N_v, L);
    d(V_w)                  = d(V_w) - 1;
    for w=V_w
      l                     = find(cellfun(@(x)ismember(w, x), D)) - 1;
      D{l+1}                = setdiff(D{l+1}, w);
      D{l}                  = [D{l}; w];
    end % for w=V_w
  end % for j=1:n
end