
% Figure_Saver.m
 
% Inputs: Figure_Handle
% If saving a figure, Figure_Handle is the handle of the figure to be saved.
% If saving a graphic from within a GUI, Figure_Handle is the handle of the GUI axes where the graphic to be saved resides.

% Outputs: None

function Figure_Saver(Figure_Handle)

h=findobj(Figure_Handle,'type','axes');
FileName=uiputfile('*.','Insert desired filename for the figure.');
saveas(h,FileName(1:end-1),'fig');
 