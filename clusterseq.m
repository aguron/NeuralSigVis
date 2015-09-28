function [location, grouping, links, seqInfo] = clusterseq(seq, varargin)
%CLUSTERSEQ
%
% Identifies (i) similar sequences and (ii) points of similarity
%
% INPUTS:
%
% seq                   - data structure containing extracted trajectories
%
% OPTIONAL ARGUMENTS:
%
% nSeqMax               - maximum number of state sequences to be included in
%                         clustering analysis (default: 20)
% refState              - (default: 1)
% transientLenThr       - (default: 5)
% maxProbTol            - (default: 5e-2)
% insPenalty            - (default: 1)
% segPenalty            - (default: 10)
% minDistTol            - (default: 0)
%  
% OUTPUTS:
%
% location              - location of similar subsequences
% grouping              - clustering of similar sequences
% links                 - adjacency matrix of sequences
% seqInfo               - sequence information
%
% @ 2015 Akinyinka Omigbodun -- aomigbod@ucsd.edu

  nSeqMax                                   = 20;
  refState                                  = 1;
  transientLenThr                           = 5;
  maxProbTol                                = 5e-2;
  insPenalty                                = 1;
  segPenalty                                = 10;
  minDistTol                                = 0;
  assignopts(who, varargin);


  nSeq                                      = min(length(seq), nSeqMax);
  nStates                                   = 0;
  xspec                                     = {'state', 'p'};
  for i=1:nSeq
    seqInfo(i).state                        = seq(i).(xspec{1});
    seqLen                                  = length(seqInfo(i).state);
    for j=1:seqLen
      if (max(seq(i).(xspec{2})(:,j)) < (1-maxProbTol))
        seqInfo(i).state(j)                 = refState;
      end % if (max(seq(i).(xspec{2})(:,j)) < (1-maxProbTol))
    end % for j=1:seqLen
    r                                       = 0;
    c                                       = refState;
    for j=1:seqLen
      if (seqInfo(i).state(j) ~= refState)
        if ((r > 0) && (seqInfo(i).state(j) ~= c))
          if (r < transientLenThr)
            seqInfo(i).state(j-r:j-1)       = refState;
          end % if (r < transientLenThr)
          c                                 = seqInfo(i).state(j);
          r                                 = 1;
          continue
        end % if ((r > 0) && (seqInfo(i).state(j) ~= c))
        r                                   = r + 1;
        c                                   = seqInfo(i).state(j);
        if (j == seqLen)
          if (r < transientLenThr)
            seqInfo(i).state(j-r:j)         = refState;
          end % if (r < transientLenThr)
        end % if (j == seqLen)
      else % if (seqInfo(i).state(j) == refState)
        if (r > 0)
          if (r < transientLenThr)
            seqInfo(i).state(j-r:j-1)       = refState;
          end % if (r < transientLenThr)
          r                                 = 0;
        end % if (r > 0)
      end % if (seqInfo(i).state(j) ~= refState)
    end % for j=1:seqLen
    nStates                                 = max([nStates seq(i).(xspec{1})]);
  end % for i=1:nSeq


  for i=1:nSeq
    seqInfo(i).segments                     = [];
    c                                       = refState;
    s                                       = 1;
    for j=1:length(seqInfo(i).state)
      if (seqInfo(i).state(j) ~= c)
        seqInfo(i).segments                 = [seqInfo(i).segments; c s (j-1)];
        c                                   = seqInfo(i).state(j);
        s                                   = j;
      elseif (j == length(seqInfo(i).state))
        seqInfo(i).segments                 = [seqInfo(i).segments; c s j];
      end % if (seqInfo(i).state(j) ~= c)
    end % for j=2:length(seqInfo(i).state)
  end % for i=1:nSeq


  seqDist                                   = zeros(nSeq);
  location                                  = cell(nSeq);
  for i=1:nSeq
    for j=(i+1):nSeq
      segs_i                                = seqInfo(i).segments;
      segs_i                                = segs_i(segs_i(:,1) ~= refState,:);
      segs_j                                = seqInfo(j).segments;
      segs_j                                = segs_j(segs_j(:,1) ~= refState,:);

      if isempty(intersect(segs_i(:,1),segs_j(:,1)))
        seqDist(i,j)                        = NaN;
      else % if ~isempty(intersect(segs_i(:,1),segs_j(:,1)))
        len_i                               = size(segs_i,1);
        len_j                               = size(segs_j,1);
        if (len_i > len_j)
          [segs_j, segs_i]                  = deal(segs_i, segs_j);
        end % if (len_i > len_j)
        len                                 = max(len_i, len_j);
        segs_i                              = [segs_i; nan(abs(len_j-len_i),3)];

        seqDist(i,j)                        = Inf;
        for k=0:abs(len_j-len_i)
          segs                              = circshift(segs_i, k);
          sc                                = 0;
          for l=1:len
            if isnan(segs(l,1))
              sc                            = sc + segPenalty;
            elseif (segs(l,1) ~= segs_j(l,1))
              sc                            = sc + 2*segPenalty;
            else
              sc                            = sc + abs(diff([diff(segs(l,2:3)) diff(segs_j(l,2:3))]))*insPenalty;
            end
          end % for l=1:len
          if (sc < seqDist(i,j))
            seqDist(i,j)                    = sc;
            location{i,j}                   = [segs_i(1,2) segs_j(k+1,2)];
          end % if (sc < seqDist(i,j))
        end % for k=0:abs(len_j-len_i)
      end % if isempty(intersect(segs_i(:,1),segs_j(:,1)))
      seqDist(j,i)                          = seqDist(i,j);
      location{j,i}                         = fliplr(location{i,j});
    end % for j=(i+1):nSeq
  end % for i=1:nSeq


  links                             = cell(nSeq, 1);
  for i=1:nSeq
    links{i}                        = minind(seqDist(i,[1:(i-1), (i+1):end]), 'minTol', minDistTol);
    if ~isempty(links{i})
      for j=1:length(links{i})
        if (links{i}(j) >= i)
          links{i}(j)               = links{i}(j) + 1;
        end % if (links{i}(j) >= i)
      end % for j=1:length(links{i})
    end % if ~isempty(links{i})
  end % for i=1:nSeq


  grouping                          = cell(3,1);
  grouping{1}                       = {}; % groups (and cliques)
  grouping{2}                       = {}; % weak links
% grouping{3}                       = []; % no links
  directedSubgraphs                 = {};
  for i=1:nSeq
    if isempty(links{i})
      grouping{3}                   = [grouping{3}, i];
      continue;
    end % if isempty(links{i})

    wl_flag                         = 0;
    for j=links{i}
      if ~ismember(i, links{j}) % connection is one-way
        if (~wl_flag)
          directedSubgraphs{end+1}  = {i, j};
          wl_flag                   = 1;
        else % if (wl_flag)
          directedSubgraphs{end}{2} = [directedSubgraphs{end}{2}, j];
        end % if (~wl_flag)
      end % if ~ismember(i, links{j}) % connection is one-way
    end % for j=links{i}
  end % for i=1:nSeq

  links2                            = links;
  for i=1:length(directedSubgraphs)
    links2{directedSubgraphs{i}{1}} = setdiff(links{directedSubgraphs{i}{1}}, directedSubgraphs{i}{2});
  end % for i=1:length(directedSubgraphs)
  cliques                           = BronKerbosch3(links2);

  temp                              = cellfun(@length, cliques);
  cliques(temp == 1)                = [];
  if ~isempty(cliques)
    g                               = 1;
    grouping{1}{g}{1}               = cliques{1};
    cliques(1)                      = [];
    i                               = 1;
    start                           = 1;
  else % if isempty(cliques)
    start                           = 0;
  end % if ~isempty(cliques)
  while (start)
    if isempty(cliques)
      break;
    end % if isempty(cliques)

    if isempty(intersect(cell2mat(grouping{1}{g}'), cliques{i}))
      if (i == length(cliques))
        g                           = g + 1;
        grouping{1}{g}{1}           = cliques{1};
        cliques(1)                  = [];
        i                           = 1;
      else % if (i < length(cliques))
        i                           = i + 1;
      end % if (i == length(cliques))
    else % if ~isempty(intersect(cell2mat(grouping{1}{g}'), cliques{i}))
      grouping{1}{g}{end+1,:}       = cliques{i};
      cliques(i)                    = [];
      i                             = 1;
    end % if isempty(intersect(cell2mat(grouping{1}{g}'), cliques{i}))
  end % while (start)

  if ~isempty(directedSubgraphs)
    g                               = 1;
    grouping{2}{g}{1}               = directedSubgraphs{1};
    directedSubgraphs(1)            = [];
    i                               = 1;
    start                           = 1;
  else % if isempty(directedSubgraphs)
    start                           = 0;
  end % if ~isempty(directedSubgraphs)
  while (start)
    if isempty(directedSubgraphs)
      break;
    end % if isempty(directedSubgraphs)

    if isempty(intersect(cell2mat(cellfun(@cell2mat,grouping{2}{g},'UniformOutput',false)'), cell2mat(directedSubgraphs{i})))
      if (i == length(directedSubgraphs))
        g                           = g + 1;
        grouping{2}{g}{1}           = directedSubgraphs{1};
        directedSubgraphs(1)        = [];
        i                           = 1;
      else % if (i < length(directedSubgraphs))
        i                           = i + 1;
      end % if (i == length(directedSubgraphs))
    else % if ~isempty(intersect(cell2mat(cellfun(@cell2mat,grouping{2}{g},'UniformOutput',false)'), directedSubgraphs{i}))
      grouping{2}{g}{end+1,:}       = directedSubgraphs{i};
      directedSubgraphs(i)          = [];
      i                             = 1;
    end % if isempty(intersect(cell2mat(cellfun(@cell2mat,grouping{2}{g},'UniformOutput',false)'), directedSubgraphs{i}))
  end % while (start)
end