function script_clusterseq2(nSeqMax,refState,transientLenThr, maxProbTol,insPenalty,segPenalty, minDistTol)
                             
%%
load data_clusterseq

%%
disp('**********');
disp('... Clustering factor analyzer state sequences ...');
%
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
disp(nStates)
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
  
%     % Test data
%     [locTest{pa}, groupingTest{pa}, linksTest{pa}, seqInfoTest{pa}] =...
%       clusterseq(seqTest{pa}{m},...
%                  'nSeqMax', Inf,...
%                  'minDistTol', minDistTol);
  end % for m=1:nGroups
end % for pa=pa_select
%
disp('Complete');
disp('**********');
%%
disp('**********');
disp('... View clustered factor analyzer state sequences ...');
%
pa                          = 1;
viewclusters2(groupingTrain{pa},'minEdgeCrossings',true,'txt',cellstr(num2str(dataInfo{pa})));
% viewclusters(groupingTrain{pa},'minEdgeCrossings',true,'txt',[]);
%
disp('Complete');
disp('**********');
end