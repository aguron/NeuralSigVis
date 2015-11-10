function varargout=SliderSetup(varargin)

assignopts(who,varargin);
global Initial_Setup

if isempty(Initial_Setup)
   Initial_Setup=true;
   
   
   
   
   %% Load data

load data_clusterseq

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

%% refState Slider Setup

setup_ref = SettingsGen(1,0,nStates,1/nStates,1/nStates,10,60,40,2,.1);
 % Slider Setup
set(s_ref, 'Value' ,setup_ref{1})
set(s_ref, 'Min' , setup_ref{2})
set(s_ref, 'Max' , setup_ref{3})
set(s_ref, 'SliderStep' , [setup_ref{4}, setup_ref{5}])
set(s_ref, 'Position' , setup_ref{6})


% min value display setup 
set(min_ref, 'String', num2str(setup_ref{2}))
set(min_ref,'Position', setup_ref{7})


% max value display setup
set(max_ref, 'String', num2str(setup_ref{3}))
set(max_ref,'Position', setup_ref{8})


% slider varialbe title display setup 

set(title_ref, 'String', 'refState (default:1)') 
set(title_ref,'Position', setup_ref{9})

%slider current value display
set(disp_ref, 'String', num2str(setup_ref{1}))
set(disp_ref, 'Position', setup_ref{10})

%end of slider setup for refState

%% nSeqMax Slider Setup


setup_nseq = SettingsGen(20,0,200,.005,.01,10,55,40,2,.1);

 % Slider Setup
set(s_nseq, 'Value' ,setup_nseq{1})
set(s_nseq, 'Min' , setup_nseq{2})
set(s_nseq, 'Max' , setup_nseq{3})
set(s_nseq, 'SliderStep' , [setup_nseq{4}, setup_nseq{5}])
set(s_nseq, 'Position' , setup_nseq{6})


% min value display setup 
set(min_nseq, 'String', num2str(setup_nseq{2}))
set(min_nseq,'Position', setup_nseq{7})


% max value display setup
set(max_nseq, 'String', num2str(setup_nseq{3}))
set(max_nseq,'Position', setup_nseq{8})


% slider varialbe title display setup 

set(title_nseq, 'String', ' nSeqMax (default:20)') 
set(title_nseq,'Position', setup_nseq{9})

%slider current value display
set(disp_nseq, 'String', num2str(setup_nseq{1}))
set(disp_nseq, 'Position', setup_nseq{10})


%end of slider setup for nSeqMax

%% transientLenThr Slider Setup


setup_trans = SettingsGen(5,1,20,1/20,5/20,10,50,40,2,.1);

 % Slider Setup
set(s_trans, 'Value' ,setup_trans{1})
set(s_trans, 'Min' , setup_trans{2})
set(s_trans, 'Max' , setup_trans{3})
set(s_trans, 'SliderStep' , [setup_trans{4}, setup_trans{5}])
set(s_trans, 'Position' , setup_trans{6})


% min value display setup 
set(min_trans, 'String', num2str(setup_trans{2}))
set(min_trans,'Position', setup_trans{7})


% max value display setup
set(max_trans, 'String', num2str(setup_trans{3}))
set(max_trans,'Position', setup_trans{8})


% slider varialbe title display setup 

set(title_trans, 'String', ' transientLenThr (default:5)') 
set(title_trans,'Position', setup_trans{9})

%slider current value display
set(disp_trans, 'String', num2str(setup_trans{1}))
set(disp_trans, 'Position', setup_trans{10})


%end of slider setup for transientLenThr
%% maxProbTol Slider Setup


setup_maxProb = SettingsGen(5e-2,0,1,10e-4,1e-2,10,45,40,2,.1);

 % Slider Setup
set(s_maxProb, 'Value' ,setup_maxProb{1})
set(s_maxProb, 'Min' , setup_maxProb{2})
set(s_maxProb, 'Max' , setup_maxProb{3})
set(s_maxProb, 'SliderStep' , [setup_maxProb{4}, setup_maxProb{5}])
set(s_maxProb, 'Position' , setup_maxProb{6})


% min value display setup 
set(min_maxProb, 'String', num2str(setup_maxProb{2}))
set(min_maxProb,'Position', setup_maxProb{7})


% max value display setup
set(max_maxProb, 'String', num2str(setup_maxProb{3}))
set(max_maxProb,'Position', setup_maxProb{8})


% slider varialbe title display setup 

set(title_maxProb, 'String', ' maxProbTol(default: 5e-2)') 
set(title_maxProb,'Position', setup_maxProb{9})

%slider current value display
set(disp_maxProb, 'String', num2str(setup_maxProb{1}))
set(disp_maxProb, 'Position', setup_maxProb{10})

%end of slider setup for maxProbTol

%% insPenalty Slider Setup
setup_ins= SettingsGen(1,1,20,1/20,5/20,10,40,40,2,.1);

 % Slider Setup
set(s_ins, 'Value' ,setup_ins{1})
set(s_ins, 'Min' , setup_ins{2})
set(s_ins, 'Max' , setup_ins{3})
set(s_ins, 'SliderStep' , [setup_ins{4}, setup_ins{5}])
set(s_ins, 'Position' , setup_ins{6})


% min value display setup 
set(min_ins, 'String', num2str(setup_ins{2}))
set(min_ins,'Position', setup_ins{7})


% max value display setup
set(max_ins, 'String', num2str(setup_ins{3}))
set(max_ins,'Position', setup_ins{8})


% slider varialbe title display setup 

set(title_ins, 'String', ' insPenalty (default: 1)') 
set(title_ins,'Position', setup_ins{9})

%slider current value display
set(disp_ins, 'String', num2str(setup_ins{1}))
set(disp_ins, 'Position', setup_ins{10})

%end of slider setup for insPenalty


%% segPenalty Slider Setup
setup_seg = SettingsGen(10,0,100,1/100,10/100,10,35,40,2,.1);


 % Slider Setup
set(s_seg, 'Value' ,setup_seg{1})
set(s_seg, 'Min' , setup_seg{2})
set(s_seg, 'Max' , setup_seg{3})
set(s_seg, 'SliderStep' , [setup_seg{4}, setup_seg{5}])
set(s_seg, 'Position' , setup_seg{6})


% min value display setup 
set(min_seg, 'String', num2str(setup_seg{2}))
set(min_seg,'Position', setup_seg{7})


% max value display setup
set(max_seg, 'String', num2str(setup_seg{3}))
set(max_seg,'Position', setup_seg{8})


% slider varialbe title display setup 

set(title_seg, 'String', ' segPenalty (default: 10)') 
set(title_seg,'Position', setup_seg{9})

%slider current value display
set(disp_seg, 'String', num2str(setup_seg{1}))
set(disp_seg, 'Position', setup_seg{10})

%end of slider setup for segPenalty

%% minDistTol Slider Setup
setup_min = SettingsGen(0,0,40,1/40,5/40,10,30,40,2,.1);

 % Slider Setup
set(s_min, 'Value' ,setup_min{1})
set(s_min, 'Min' , setup_min{2})
set(s_min, 'Max' , setup_min{3})
set(s_min, 'SliderStep' , [setup_min{4}, setup_min{5}])
set(s_min, 'Position' , setup_min{6})


% min value display setup 
set(min_min, 'String', num2str(setup_min{2}))
set(min_min,'Position', setup_min{7})


% max value display setup
set(max_min, 'String', num2str(setup_min{3}))
set(max_min,'Position', setup_min{8})


% slider varialbe title display setup 

set(title_min, 'String', ' minDistTol (default: 0)') 
set(title_min,'Position', setup_min{9})

%slider current value display
set(disp_min, 'String', num2str(setup_min{1}))
set(disp_min, 'Position', setup_min{10})

%end of slider setup for minDistTol
   
   
   
   
   %end of setting up sliders
   
   SliderSetup(1,'s_ref',s_ref,'s_nseq',s_nseq,'s_trans',s_trans,'s_maxProb',s_maxProb,'s_ins',s_ins,'s_seg',s_seg,'s_min',s_min,...
                'min_ref',min_ref,'min_nseq',min_nseq,'min_trans',min_trans,'min_maxProb',min_maxProb,'min_ins',min_ins,'min_seg',min_seg,'min_min',min_min,...
                'max_ref',s_ref,'max_nseq',max_nseq,'max_trans',max_trans,'max_maxProb',max_maxProb,'max_ins',max_ins,'max_seg',max_seg,'max_min',max_min,...
                'title_ref',title_ref,'title_nseq',title_nseq,'title_trans',title_trans,'title_maxProb',title_maxProb,'title_ins',title_ins,'title_seg',title_seg,'title_min',title_min,...
                'disp_ref',s_ref,'disp_nseq',disp_nseq,'disp_trans',disp_trans,'disp_maxProb',disp_maxProb,'disp_ins',disp_ins,'disp_seg',s_seg,'disp_min',disp_min);
                
  
elseif Initial_Setup
        
        varargout{1,1:7}={s_ref,s_nseq,s_trans,s_maxProb,s_ins,s_seg,s_min}; % row of all adjusted slider handles
        varargout{2,1:7}={min_ref,min_nseq,min_trans,min_maxProb,min_ins,min_seg,min_min}; % row of all adjusted min handles
        varargout{3,1:7}={max_ref,max_nseq,max_trans,max_maxProb,max_ins,max_seg,max_min}; % row of all adjusted max handles
        varargout{4,1:7}={title_ref,title_nseq,title_trans,title_maxProb,title_ins,title_seg,title_min}; % row of all adjusted title handles
        varargout{5,1:7}={disp_ref,disp_nseq,disp_trans,disp_maxProb,disp_ins,disp_seg,disp_min}; % row of all adjusted display current value handles
    
end

