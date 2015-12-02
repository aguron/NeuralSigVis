function figures=parameter_setup3(nSeqMax,refState,transientLenThr, maxProbTol,insPenalty,segPenalty, minDistTol,axes_Handle,FileName,Undirected_Tag,Directed_Tag)
       
FileName=FileName;
%%
if FileName ~=0
uiopen(FileName,1);
elseif FileName==0
    disp('No File Loaded')
end

locTrain                = cell(nPatients,1);
locTest                 = cell(nPatients,1);
groupingTrain           = cell(nPatients,1);
groupingTest            = cell(nPatients,1);
linksTrain              = cell(nPatients,1);
linksTest               = cell(nPatients,1);
seqInfoTrain            = cell(nPatients,1);
seqInfoTest             = cell(nPatients,1);

% numStates USAGE
pa                      = 1;
m                       = 1;
nStates                 = numstates(seqTest{pa}{m});
% disp(nStates)
%%


for pa=pa_select
  for m=1:nGroups
    % Train data
    [locTrain{pa}, groupingTrain{pa}, linksTrain{pa}, seqInfoTrain{pa}] =...
      clusterseq(sqTrain{pa}{m},...
                 'nSeqMax',nSeqMax,...                                 
                 'refState',refState,...                                 
                 'transientLenThr',transientLenThr,...                     
                 'maxProbTol',maxProbTol ,...                               
                 'insPenalty',insPenalty,...                                 
                 'segPenalty',segPenalty,...                               
                 'minDistTol',minDistTol);
  
    % Test data
    [locTest{pa}, groupingTest{pa}, linksTest{pa}, seqInfoTest{pa}] =...
      clusterseq(seqTest{pa}{m},...
                 'nSeqMax',nSeqMax,...                                 
                 'refState',refState,...                                 
                 'transientLenThr',transientLenThr,...                     
                 'maxProbTol',maxProbTol ,...                               
                 'insPenalty',insPenalty,...                                 
                 'segPenalty',segPenalty,...                               
                 'minDistTol',minDistTol);
  end % for m=1:nGroups
end % for pa=pa_select


pa                          = 1;




if Undirected_Tag==true && Directed_Tag == false
% Please note that the following is for the UNDIRECTED graph GUI.

graphOpts.undirected.visibility   = false;    % The figure generated should not be visible
graphOpts.undirected.handle       = true;     % The argout (fig) is the number of the figure that you want to copy into your GUI
graphOpts.directed.visibility     = false;
graphOpts.directed.handle         = false;
viewclusters3(axes_Handle,groupingTrain{pa},...
                   'minEdgeCrossings',true,...
                   'txt',cellstr(num2str(dataInfo{pa})),...
                   'graphOpts',graphOpts);



elseif Undirected_Tag==false && Directed_Tag==true
 % Please note that the following is for the DIRECTED graph GUI.


graphOpts.undirected.visibility   = false;    % The figure generated should not be visible
graphOpts.undirected.handle       = false;     % The argout (fig) is the number of the figure that you want to copy into your GUI
graphOpts.directed.visibility     = false;
graphOpts.directed.handle         = true;
viewclusters3(axes_Handle,groupingTrain{pa},...
                   'minEdgeCrossings',true,...
                   'txt',cellstr(num2str(dataInfo{pa})),...
                   'graphOpts',graphOpts);
        

end
    

end