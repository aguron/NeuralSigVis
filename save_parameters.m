function save_parameters(varargin)
  nSeqMax                                   = 20;
  refState                                  = 1;
  transientLenThr                           = 5;
  maxProbTol                                = 5e-2;
  insPenalty                                = 1;
  segPenalty                                = 10;
  minDistTol                                = 0;
  assignopts(who, varargin);



if Undirected_Tag==true && Directed_Tag == false
   clear Undirected_Tag
   clear Directed_Tag
   FileName=uiputfile('*.mat','Insert Desired Filename for the Parameters of the Undirected Figure.');  
end % if Undirected_Tag==true && Directed_Tag == false


if Undirected_Tag == false && Directed_Tag == true 
   clear Undirected_Tag
   clear Directed_Tag
   FileName=uiputfile('*.mat','Insert Desired Filename for the Parameters of the Directed Figure.');  
end %Undirected_Tag == false && Directed_Tag == true 