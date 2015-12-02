function save_parameters(varargin)

assignopts(who,varagin)


if Undirected_Tag==true && Directed_Tag == false
   uisave({'nSeqMax','refState','transientLenThr','maxProbTol','insPenalty','segPenalty','minDistTol','graphOpts'},...
          'Parameters_Undirected_Identifier.mat');  
end % if Undirected_Tag==true && Directed_Tag == false


if Undirected_Tag == false && Directed_Tag == true 
    uisave({'nSeqMax','refState','transientLenThr','maxProbTol','insPenalty','segPenalty','minDistTol','graphOpts'},...
          'Parameters_Directed_Identifier.mat');   
end %Undirected_Tag == false && Directed_Tag == true 