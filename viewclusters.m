function figures = viewclusters(grouping, varargin)
%VIEWCLUSTERS

  PoincareHypDisks          = true; % default: true
  minEdgeCrossings          = true; % default: true
  txt                       = [];
  assignopts(who, varargin);

  % plot cliques
  %
  % number of cliques
  nCliques                  = cellfun(@length,grouping{1});

  % assign a different color and/or shade to each clique
  colorSet                  = 'rbgmyck';
  colors                    = colorSet(mod(0:length(nCliques)-1, length(colorSet))+1);
  nShades                   = min(length(colors), length(colorSet));
  for i=1:length(nShades)
    nShades(i)              = sum(colors == colorSet(i));
  end % for i=1:length(nShades)
  
  % number of nodes in graph
  nodesClique               = cell2mat(cellfun(@(v)cell2mat(v'), grouping{1},'UniformOutput',false));
  nodesDirGraph             = cell2mat(cellfun(@(u)cell2mat(cellfun(@(v)cell2mat(v),u,'UniformOutput',false)'),grouping{2},'UniformOutput',false));
  nodesSingleton            = grouping{3};
  N                         = length(unique([nodesClique nodesDirGraph nodesSingleton]));

  % plot nodes
  theta                     = linspace(0,2*pi,N+1);
  theta                     = theta(1:end-1);
  [x,y]                     = pol2cart(theta,1); % rho = 1;
  figures                   = [];
  figures                   = [figures, show];
  plot(x,y,'.k','MarkerSize',10);
  axis([-1 1 -1 1]);
  axis equal off
  if isempty(txt)
    txt                     = cellstr(num2str((1:N)',['% ', num2str(ceil(log10(N+1))), 'd']));
  end % if isempty(txt)
  textSize                  = 10;
  if (~minEdgeCrossings)
    h                       = text(x*1.05, y*1.05, txt, 'FontSize',textSize);
    set(h, {'Rotation'}, num2cell(theta*180/pi)');
  end
  if (minEdgeCrossings)
    adjacencyMatrix         = zeros(N);
  end % if (minEdgeCrossings)

  hold on
  % plot cliques
  for i=1:length(nCliques)
    for j=1:nCliques(i)
      n                     = length(grouping{1}{i}{j});
      edges                 = [];
      for idx1=1:(n-1)
        v1                  = grouping{1}{i}{j}(idx1);
        for idx2=(idx1+1):n
          v2                = grouping{1}{i}{j}(idx2);
          edges             = [edges; [v1 v2]];
        end % for idx2=(idx1+1):n
      end % for idx1=1:(n-1)

      if (minEdgeCrossings)
        for k=1:size(edges,1)
          adjacencyMatrix(edges(k,1),edges(k,2))    = 1;
          adjacencyMatrix(edges(k,2),edges(k,1))    = 1;
        end % for k=1:size(edges,1)
      else % if (~minEdgeCrossings)
        offset              = ((2*floor((i-1)/length(colorSet))+1-(nCliques(i)-j+1)/nCliques(i))/(2*(nShades(1)-1)+1))*0.5;
        switch(colors(i))
          case 'r'
            cliqueColor     = (1-offset)*[1 0 0];
          case 'b'
            cliqueColor     = (1-offset)*[0 0 1];
          case 'g'
            cliqueColor     = (1-offset)*[0 1 0];
          case 'm'
            cliqueColor     = (1-offset)*[1 0 1];
          case 'y'
            cliqueColor     = (1-offset)*[1 1 0];
          case 'c'
            cliqueColor     = (1-offset)*[0 1 1];
          case 'k'
            cliqueColor     = offset*[1 1 1];
        end % switch(colors(i))
        if (~PoincareHypDisks)
          plot(x(edges)', y(edges)', 'Color', cliqueColor);
        else % if (PoincareHypDisks)
          for k=1:size(edges,1)
            % u and v are points on the boundary
            u               = [x(edges(k,1)) y(edges(k,1))];
            v               = [x(edges(k,2)) y(edges(k,2))];
            if (abs(diff(edges(k,:))) == N/2)
              line([u(1); v(1)], [u(2); v(2)], 'Color', cliqueColor);
            else % if ~(abs(diff(edges(k,:))) == N/2)
              x0            = -(u(2) - v(2))/(u(1)*v(2) - u(2)*v(1));
              y0            = (u(1) - v(1))/(u(1)*v(2) - u(2)*v(1));
              r             = sqrt(x0^2 + y0^2 - 1);
              thetaLim      = atan2([u(2) v(2)] - y0, [u(1) v(1)] - x0);
              if (u(1) >= 0) && (v(1) >= 0)
                % ensure the arc is within the unit disk
                t           = [linspace(max(thetaLim),pi,50), linspace(-pi,min(thetaLim),50)]';
              else
                t           = linspace(thetaLim(1), thetaLim(2))';
              end
              line(r*cos(t)+x0, r*sin(t)+y0, 'Color', cliqueColor);
            end % if (abs(diff(edges(k,:))) == N/2)
          end % for k=1:size(edges,1)
        end % if (~PoincareHypDisks)
      end % if (minEdgeCrossings)
    end % for j=1:nCliques(i)
  end % for i=1:length(nCliques)

  if (minEdgeCrossings)
    ord                     = symrcm(adjacencyMatrix);
    pos                     = zeros(1, length(ord));
    for i=1:length(ord)
      pos(i)                  = find(ord == i);
    end % for i=1:length(ord)
    
    % label nodes
    txt                     = txt(ord);
    h                       = text(x*1.05, y*1.05, txt, 'FontSize',textSize);
    set(h, {'Rotation'}, num2cell(theta*180/pi)');
    
    % plot cliques
    for i=1:length(nCliques)
      for j=1:nCliques(i)
        n                   = length(grouping{1}{i}{j});
        edges               = [];
        for idx1=1:(n-1)
          v1                = grouping{1}{i}{j}(idx1);
          for idx2=(idx1+1):n
            v2              = grouping{1}{i}{j}(idx2);
            edges           = [edges; [v1 v2]];
          end % for idx2=(idx1+1):n
        end % for idx1=1:(n-1)

        edges               = pos(edges);
        offset              = ((2*floor((i-1)/length(colorSet))+1-(nCliques(i)-j+1)/nCliques(i))/(2*(nShades(1)-1)+1))*0.5;
        switch(colors(i))
          case 'r'
            cliqueColor     = (1-offset)*[1 0 0];
          case 'b'
            cliqueColor     = (1-offset)*[0 0 1];
          case 'g'
            cliqueColor     = (1-offset)*[0 1 0];
          case 'm'
            cliqueColor     = (1-offset)*[1 0 1];
          case 'y'
            cliqueColor     = (1-offset)*[1 1 0];
          case 'c'
            cliqueColor     = (1-offset)*[0 1 1];
          case 'k'
            cliqueColor     = offset*[1 1 1];
        end % switch(colors(i))
        if (~PoincareHypDisks)
          plot(x(edges)', y(edges)', 'Color', cliqueColor);
        else % if (PoincareHypDisks)
          for k=1:size(edges,1)
            % u and v are points on the boundary
            u               = [x(edges(k,1)) y(edges(k,1))];
            v               = [x(edges(k,2)) y(edges(k,2))];
            if (abs(diff(edges(k,:))) == N/2)
              line([u(1); v(1)], [u(2); v(2)], 'Color', cliqueColor);
            else % if ~(abs(diff(edges(k,:))) == N/2)
              x0            = -(u(2) - v(2))/(u(1)*v(2) - u(2)*v(1));
              y0            = (u(1) - v(1))/(u(1)*v(2) - u(2)*v(1));
              r             = sqrt(x0^2 + y0^2 - 1);
              thetaLim      = atan2([u(2) v(2)] - y0, [u(1) v(1)] - x0);
              if (u(1) >= 0) && (v(1) >= 0)
                % ensure the arc is within the unit disk
                t           = [linspace(max(thetaLim),pi,50), linspace(-pi,min(thetaLim),50)]';
              else
                t           = linspace(thetaLim(1), thetaLim(2))';
              end
              line(r*cos(t)+x0, r*sin(t)+y0, 'Color', cliqueColor);
            end % if (abs(diff(edges(k,:))) == N/2)
          end % for k=1:size(edges,1)
        end % if (~PoincareHypDisks)
      end % for j=1:nCliques(i)
    end % for i=1:length(nCliques)
  end % if (minEdgeCrossings)

  hold off

  % plot directed subgraphs
  %
  % number of directed graphs
  nDirGraphs                = cellfun(@length,grouping{2});

  % assign a different color and/or shade to each clique
  colors                    = colorSet(mod(0:length(nDirGraphs)-1, length(colorSet))+1);
  nShades                   = min(length(colors), length(colorSet));
  for i=1:length(nShades)
    nShades(i)              = sum(colors == colorSet(i));
  end % for i=1:length(nShades)
  
  % plot nodes
  figures                   = [figures, show];
  plot(x,y,'.k','MarkerSize',10);
  axis([-1 1 -1 1]);
  axis equal off
  if isempty(txt)
    txt                     = cellstr(num2str((1:N)',['% ', num2str(ceil(log10(N+1))), 'd']));
  end % if isempty(txt)
  if (~minEdgeCrossings)
    h                       = text(x*1.05, y*1.05, txt, 'FontSize',textSize);
    set(h, {'Rotation'}, num2cell(theta*180/pi)');
  end
  if (minEdgeCrossings)
    adjacencyMatrix         = zeros(N);
  end % if (minEdgeCrossings)

  hold on
  % plot directed graphs
  for i=1:length(nDirGraphs)
    for j=1:nDirGraphs(i)
      l                     = length(grouping{2}{i}{j}{2});
      edges                 = [grouping{2}{i}{j}{1}*ones(l,1), grouping{2}{i}{j}{2}'];
      if (minEdgeCrossings)
        for k=1:size(edges,1)
          adjacencyMatrix(edges(k,1),edges(k,2))    = 1;
          adjacencyMatrix(edges(k,2),edges(k,1))    = 1;
        end % for k=1:size(edges,1)
      else % if (~minEdgeCrossings)
        offset              = ((2*floor((i-1)/length(colorSet))+1-(nDirGraphs(i)-j+1)/nDirGraphs(i))/(2*(nShades(1)-1)+1))*0.5;
        switch(colors(i))
          case 'r'
            cliqueColor     = (1-offset)*[1 0 0];
          case 'b'
            cliqueColor     = (1-offset)*[0 0 1];
          case 'g'
            cliqueColor     = (1-offset)*[0 1 0];
          case 'm'
            cliqueColor     = (1-offset)*[1 0 1];
          case 'y'
            cliqueColor     = (1-offset)*[1 1 0];
          case 'c'
            cliqueColor     = (1-offset)*[0 1 1];
          case 'k'
            cliqueColor     = offset*[1 1 1];
        end % switch(colors(i))
        if (~PoincareHypDisks)
          plot(x(edges)', y(edges)', 'Color', cliqueColor);
        else % if (PoincareHypDisks)
          for k=1:size(edges,1)
            % u and v are points on the boundary
            u               = [x(edges(k,1)) y(edges(k,1))];
            v               = [x(edges(k,2)) y(edges(k,2))];
            if (abs(diff(edges(k,:))) == N/2)
              line([u(1); v(1)], [u(2); v(2)], 'Color', cliqueColor);
            else % if ~(abs(diff(edges(k,:))) == N/2)
              x0            = -(u(2) - v(2))/(u(1)*v(2) - u(2)*v(1));
              y0            = (u(1) - v(1))/(u(1)*v(2) - u(2)*v(1));
              r             = sqrt(x0^2 + y0^2 - 1);
              thetaLim      = atan2([u(2) v(2)] - y0, [u(1) v(1)] - x0);
              if (u(1) >= 0) && (v(1) >= 0)
                % ensure the arc is within the unit disk
                t           = [linspace(max(thetaLim),pi,50), linspace(-pi,min(thetaLim),50)]';
              else
                t           = linspace(thetaLim(1), thetaLim(2))';
              end
              line(r*cos(t)+x0, r*sin(t)+y0, 'Color', cliqueColor);
            end % if (abs(diff(edges(k,:))) == N/2)
          end % for k=1:size(edges,1)
        end % if (~PoincareHypDisks)
      end % if (minEdgeCrossings)
    end % for j=1:nDirGraphs(i)
  end % for i=1:length(nDirGraphs)
  
  if (minEdgeCrossings)
    ord                     = symrcm(adjacencyMatrix);
    pos                     = zeros(1, length(ord));
    for i=1:length(ord)
      pos(i)                  = find(ord == i);
    end % for i=1:length(ord)

    % label nodes
    txt                     = txt(ord);
    h                       = text(x*1.05, y*1.05, txt, 'FontSize',textSize);
    set(h, {'Rotation'}, num2cell(theta*180/pi)');
    
    % plot cliques
    for i=1:length(nDirGraphs)
      for j=1:nDirGraphs(i)
        l                   = length(grouping{2}{i}{j}{2});
        edges               = [grouping{2}{i}{j}{1}*ones(l,1), grouping{2}{i}{j}{2}'];
        edges               = pos(edges);
        offset              = ((2*floor((i-1)/length(colorSet))+1-(nDirGraphs(i)-j+1)/nDirGraphs(i))/(2*(nShades(1)-1)+1))*0.5;
        switch(colors(i))
          case 'r'
            cliqueColor     = (1-offset)*[1 0 0];
          case 'b'
            cliqueColor     = (1-offset)*[0 0 1];
          case 'g'
            cliqueColor     = (1-offset)*[0 1 0];
          case 'm'
            cliqueColor     = (1-offset)*[1 0 1];
          case 'y'
            cliqueColor     = (1-offset)*[1 1 0];
          case 'c'
            cliqueColor     = (1-offset)*[0 1 1];
          case 'k'
            cliqueColor     = offset*[1 1 1];
        end % switch(colors(i))
        if (~PoincareHypDisks)
          plot(x(edges)', y(edges)', 'Color', cliqueColor);
        else % if (PoincareHypDisks)
          for k=1:size(edges,1)
            % u and v are points on the boundary
            u               = [x(edges(k,1)) y(edges(k,1))];
            v               = [x(edges(k,2)) y(edges(k,2))];
            if (abs(diff(edges(k,:))) == N/2)
              line([u(1); v(1)], [u(2); v(2)], 'Color', cliqueColor);
            else % if ~(abs(diff(edges(k,:))) == N/2)
              x0            = -(u(2) - v(2))/(u(1)*v(2) - u(2)*v(1));
              y0            = (u(1) - v(1))/(u(1)*v(2) - u(2)*v(1));
              r             = sqrt(x0^2 + y0^2 - 1);
              thetaLim      = atan2([u(2) v(2)] - y0, [u(1) v(1)] - x0);
              if (u(1) >= 0) && (v(1) >= 0)
                % ensure the arc is within the unit disk
                t           = [linspace(max(thetaLim),pi,50), linspace(-pi,min(thetaLim),50)]';
              else
                t           = linspace(thetaLim(1), thetaLim(2))';
              end
              line(r*cos(t)+x0, r*sin(t)+y0, 'Color', cliqueColor);
            end % if (abs(diff(edges(k,:))) == N/2)
          end % for k=1:size(edges,1)
        end % if (~PoincareHypDisks)
      end % for j=1:nDirGraphs(i)
    end % for i=1:length(nDirGraphs)
  end % if (minEdgeCrossings)
  hold off
end

