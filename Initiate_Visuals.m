function figures=Initiate_Visuals(nSeqMax,refState,transientLenThr, maxProbTol,insPenalty,segPenalty, minDistTol,axes_Handle,FileName,Undirected_Tag,Directed_Tag,Save_Tag)

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


fig=viewclusters(groupingTrain{pa},...
                   'minEdgeCrossings',true,...
                   'txt',cellstr(num2str(dataInfo{pa})),...
                   'graphOpts',graphOpts); 
    
h=findobj(fig, 'type', 'axes');
cla(axes_Handle);
s=copyobj(allchild(h),axes_Handle);
axis([-1 1 -1 1]);
axis equal off
setpixelposition(axes_Handle, [400.0000  126.0000  580.0000  580.0000]);
delete(fig)


% if Save_Tag==false
% % displays graphic in gui
% viewclusters3(axes_Handle,groupingTrain{pa},...
%                    'minEdgeCrossings',true,...
%                    'txt',cellstr(num2str(dataInfo{pa})),...
%                    'graphOpts',graphOpts);
% end % SaveTag==false

% if Save_Tag==true
%    %generates undirected graphic figure
%    %prompts user to input filename for saving undirected figure as .fig file
%    %figure is invisible to the user
%    figures=save_viewclusters_figure(groupingTrain{pa},...
%                    'minEdgeCrossings',true,...
%                    'txt',cellstr(num2str(dataInfo{pa})),...
%                    'graphOpts',graphOpts); 
%    delete figures
%    
%    %prompts user to input filename for saving .mat file containing selected parameters of graphics figure
%    save_parameters('nSeqMax',nSeqMax,...                                 
%                  'refState',refState,...                                 
%                  'transientLenThr',transientLenThr,...                     
%                  'maxProbTol',maxProbTol ,...                               
%                  'insPenalty',insPenalty,...                                 
%                  'segPenalty',segPenalty,...                               
%                  'minDistTol',minDistTol,...
%                  'Undirected_Tag',Undirected_Tag,...
%                  'Directed_Tag',Directed_Tag,...
%                  'graphOpts',graphOpts);
%                   
% end % if SaveTag==true

elseif Undirected_Tag==false && Directed_Tag==true
 % Please note that the following is for the DIRECTED graph GUI.

graphOpts.undirected.visibility   = false;    % The figure generated should not be visible
graphOpts.undirected.handle       = false;     % The argout (fig) is the number of the figure that you want to copy into your GUI
graphOpts.directed.visibility     = false;
graphOpts.directed.handle         = true;


fig=viewclusters(groupingTrain{pa},...
                   'minEdgeCrossings',true,...
                   'txt',cellstr(num2str(dataInfo{pa})),...
                   'graphOpts',graphOpts); 
    
h=findobj(fig, 'type', 'axes');
cla(axes_Handle);
s=copyobj(allchild(h),axes_Handle);
axis([-1 1 -1 1]);
axis equal off
axis on



% pos1=getpixelposition(axes_Handle)
setpixelposition(axes_Handle, [400.0000  126.0000  580.0000  580.0000]);
delete(fig)

% if Save_Tag==false
% viewclusters3(axes_Handle,groupingTrain{pa},...
%                    'minEdgeCrossings',true,...
%                    'txt',cellstr(num2str(dataInfo{pa})),...
%                    'graphOpts',graphOpts);
% end % if SaveTag==false
% 
% if Save_Tag==true
%    %generates directed graphic figure
%    %prompts user to input filename for saving directed figure as .fig file
%    %figure is invisible to the user
%    figures=save_viewclusters_figure(groupingTrain{pa},...
%                    'minEdgeCrossings',true,...
%                    'txt',cellstr(num2str(dataInfo{pa})),...
%                    'graphOpts',graphOpts); 
%    delete figures %delete invisible figure
%    
%    %prompts user to input filename for saving .mat file containing selected parameters of graphics figure
%    save_parameters('nSeqMax',nSeqMax,...                                 
%                  'refState',refState,...                                 
%                  'transientLenThr',transientLenThr,...                     
%                  'maxProbTol',maxProbTol ,...                               
%                  'insPenalty',insPenalty,...                                 
%                  'segPenalty',segPenalty,...                               
%                  'minDistTol',minDistTol,...
%                  'Undirected_Tag',Undirected_Tag,...
%                  'Directed_Tag',Directed_Tag,...
%                  'graphOpts',graphOpts);
%    
%    
% end % if SaveTag==true
end %if Undirected_Tag==true && Directed_Tag == false
    

end