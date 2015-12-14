
% Figure_Saver_Script.m
 
%figure understanding edit
disp('current figure handles:')
fighandle=(findobj('type','figure'))' 
sortedhandles=sort(fighandle)
numfigs=max(size(sortedhandles))
%handle of the current graphics figure (hidden, but still exists)
current_handle = sortedhandles(end-1)

%Saving Current Graphic as a figure
FileName=uiputfile('*.','Insert desired filename for the figure.');
figure(current_handle)
set(current_handle,'visible','on')
saveas(current_handle,FileName(1:end-1),'fig');
set(current_handle,'visible','off')
 function