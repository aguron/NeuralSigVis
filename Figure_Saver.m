
% Figure_Saver.m
 
% 2 Inputs: Handle & Case_Num

% First Input:  Handle
%
%       If saving a figure, Handle is the handle of the figure to be saved.
%       If saving a graphic from within a GUI, Handle is the handle of the GUI axes where the graphic to be saved resides.

%Second Input: Case_Num 
%
%       Case_Num is an integer (either 1 or 2) that denotes what type of parent the graphic being saved lies within.  
%       Case_Num should be 1  for saving graphic within a figure.                              
%       Case_Num should be 2  for saving a graphic within an axes.



% Outputs: None

function Figure_Saver(Handle,Case_Num)

if 1==Case_Num
h=findobj(Handle,'type','axes');
FileName=uiputfile('*.','Insert desired filename for the figure.');
saveas(h,FileName(1:end-1),'fig');

elseif 2==Case_Num
% h1=figure;
h=Handle;
Handle;
h1=gca;

f1=figure;
% set(f1,'visible','off')
s=copyobj(gca,f1);


% % set(h1,'Visible','off')
% ha1=findobj(h1,'type','axes')
% h2=get(Handle,'axes');
% copy=copyobj(h2,h1);


whos
    
    
   

% FileName=uiputfile('*.','Insert desired filename for the figure.');
% saveas(h,FileName(1:end-1),'fig');

else 
   fprintf('/n Error with second input into this function:/n')
   fprintf(' Specify the parent type of the graphic numerically: /n')
   fprintf(' 1 for parent figure, or 2 for parent axes./n') 
   
   
end %if isequal('figure',Type_of_Handle_String)

end % function