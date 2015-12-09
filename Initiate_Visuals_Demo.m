function [fig,axes_Handle]=Initiate_Visuals_Demo(nSeqMax,refState,transientLenThr, maxProbTol,insPenalty,segPenalty, minDistTol,axes_Handle,FileName,Undirected_Tag,Directed_Tag,Save_Tag)

if FileName ~=0
uiopen(FileName,1);
elseif FileName==0
    disp('No File Loaded')
end


loc       = cell(1,1);
grouping  = cell(1,1);
links     = cell(1,1);
seqInfo   = cell(1,1);

[loc, grouping, links, seqInfo] =...
      clusterseq(seq,...
                 'nSeqMax',nSeqMax,...                                 
                 'refState',refState,...                                 
                 'transientLenThr',transientLenThr,...                     
                 'maxProbTol',maxProbTol ,...                               
                 'insPenalty',insPenalty,...                                 
                 'segPenalty',segPenalty,...                               
                 'minDistTol',minDistTol);
             
             
if Undirected_Tag==true && Directed_Tag == false
% Please note that the following is for the UNDIRECTED graph GUI.

graphOpts.undirected.visibility   = false;    % The figure generated should not be visible
graphOpts.undirected.handle       = true;     % The argout (fig) is the number of the figure that you want to copy into your GUI
graphOpts.directed.visibility     = false;
graphOpts.directed.handle         = false;
 
fig=viewclusters(grouping,...
                   'minEdgeCrossings',true,...
                   'txt',cellstr(num2str(labels)),...
                   'graphOpts',graphOpts); 
               

h=findobj(fig, 'type', 'axes');
cla(axes_Handle);
s=copyobj(allchild(h),axes_Handle);
axis([-1 1 -1 1]);
axis equal off

% pos1=getpixelposition(axes_Handle)
setpixelposition(axes_Handle, [400.0000  126.0000  580.0000  580.0000]);



 
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
 
 
fig=viewclusters(grouping,...
                   'minEdgeCrossings',true,...
                   'txt',cellstr(num2str(labels)),...
                   'graphOpts',graphOpts);

  
h=findobj(fig, 'type', 'axes');
cla(axes_Handle);
s=copyobj(allchild(h),axes_Handle);
axis([-1 1 -1 1]);
axis equal off

% pos1=getpixelposition(axes_Handle)
setpixelposition(axes_Handle, [400.0000  126.0000  580.0000  580.0000]);


end %Undirected_Tag==true && Directed_Tag == false
end % function