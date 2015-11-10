function nStates = numstates(seq)
%NUMSTATES
  global nStates

  nSeq              = length(seq);
  nStates           = 0;
  for i=1:nSeq
    nStates         = max([nStates seq(i).state]);
  end % for i=1:nSeq
  
end

