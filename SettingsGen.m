
function Settings=SettingsGen(default,min,max,minstep,majorstep,LS,BS,WS,HS,gf)
%SettingsGen will create a structure that contains settings for setting up Sliders and labels in the GUI


PosMat=PosVecGen(LS,BS,WS,HS,gf);
Settings = {};
Settings{1} = default; 
Settings{2} = min ;
Settings{3} = max ;
Settings{4} = minstep;
Settings{5} = majorstep;
Settings{6} = PosMat(1,:); %Slider Position Vec
Settings{7} = PosMat(2,:); %Min value display box position vec
Settings{8} = PosMat(3,:); %Max value display box position vec
Settings{9} = PosMat(4,:); %Title of slider display box position vec
Settings{10} = PosMat(5,:); %Current slider value display box position vec
end