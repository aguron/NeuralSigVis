function save_parameters(varargin)

assignopts(who,varagin)


if Undirected_Tag==true && Directed_Tag == false
   clear Undirected_Tag
   clear Directed_Tag
   FileName=uiputfile('*.mat','Insert Desired Filename for the Parameters of the Undirected Figure.');  
end % if Undirected_Tag==true && Directed_Tag == false


if Undirected_Tag == false && Directed_Tag == true 
   clear Undirected_Tag
   clear Directed_Tag
   FileName=uiputfile('*.mat','Insert Desired Filename for the Parameters of the Directed Figure.'');  
end %Undirected_Tag == false && Directed_Tag == true 