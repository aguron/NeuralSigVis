function save_parameters(varargin)
%Inputs: varargin
% 
% 
       
  nSeqMax                                   = 20;
  refState                                  = 1;
  transientLenThr                           = 5;
  maxProbTol                                = 5e-2;
  insPenalty                                = 1;
  segPenalty                                = 10;
  minDistTol                                = 0; 
  Undirected_Tag = true ; 
  Directed_Tag =false ;
  assignopts(who, varargin);

%Create Structure P (P for "Parameters") containing the parameter variable values
P.nSeqMax = nSeqMax ;
P.refState = refState ; 
P.transientLenThr = transientLenThr ;
P.maxProbTol = maxProbTol ;
P.insPenalty = insPenalty ;
P.segPenalty = segPenalty ;
P.minDistTol = minDistTol ;
P.Undirected_Tag = Undirected_Tag ;
P.Directed_Tag = Directed_Tag ;

P.Save_Tag = true;
  
  

if Undirected_Tag==true && Directed_Tag == false

   FileName=uiputfile('*.','Insert desired filename for the parameters of the undirected figure.');  
end % if Undirected_Tag==true && Directed_Tag == false


if Undirected_Tag == false && Directed_Tag == true 

FileName=uiputfile('*.','Insert desired filename for the parameters of the directed figure.');  
end %Undirected_Tag == false && Directed_Tag == true 
 

uisave('P',FileName(1:end-1));
%P will be a structure that is saved into the .mat file
%type P(:) into the command line (and hit enter) to see the contents of P
  
end


