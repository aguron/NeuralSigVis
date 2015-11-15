function [s_out,min_out,max_out,title_out,disp_out]=SliderSetup()

global Initial_Setup
if isempty(Initial_Setup) || Initial_Setup  
   %% Load data

load data_clusterseq

% numStates USAGE
pa                      = 1;
m                       = 1;
nStates                 = numstates(seqTest{pa}{m});

%% refState Slider Setup

setup_ref = SettingsGen(1,0,nStates,1/nStates,1/nStates,10,60,40,2,.1);
 % Slider Setup
s_ref{1}={'Value' ,setup_ref{1}};
s_ref{2}={'Min' , setup_ref{2}};
s_ref{3}={'Max' , setup_ref{3}};
s_ref{4}={'SliderStep' , [setup_ref{4}, setup_ref{5}]};
s_ref{5}={'Position' , setup_ref{6}};


% min value display setup 
min_ref{1}={'String', num2str(setup_ref{2})};
min_ref{2}={'Position', setup_ref{7}};


% max value display setup
max_ref{1}={'String', num2str(setup_ref{3})};
max_ref{2}={'Position', setup_ref{8}};


% slider varialbe title display setup 
title_ref{1}={'String', 'refState (default:1)'};
title_ref{2}={'Position', setup_ref{9}};

%slider current value display
disp_ref{1}={'String', num2str(setup_ref{1})};
disp_ref{2}={'Position', setup_ref{10}};

%end of slider setup for refState

%% nSeqMax Slider Setup

setup_nseq = SettingsGen(20,0,200,.005,.01,10,55,40,2,.1);
 % Slider Setup
s_nseq{1}={'Value' ,setup_nseq{1}};
s_nseq{2}={'Min' , setup_nseq{2}};
s_nseq{3}={'Max' , setup_nseq{3}};
s_nseq{4}={'SliderStep' , [setup_nseq{4}, setup_nseq{5}]};
s_nseq{5}={'Position' , setup_nseq{6}};


% min value display setup 
min_nseq{1}={'String', num2str(setup_nseq{2})};
min_nseq{2}={'Position', setup_nseq{7}};


% max value display setup
max_nseq{1}={'String', num2str(setup_nseq{3})};
max_nseq{2}={'Position', setup_nseq{8}};


% slider varialbe title display setup 
title_nseq{1}={'String', ' nSeqMax (default:20)'};
title_nseq{2}={'Position', setup_nseq{9}};

%slider current value display
disp_nseq{1}={'String', num2str(setup_nseq{1})};
disp_nseq{2}={'Position', setup_nseq{10}};


%end of slider setup for nSeqMax

%% transientLenThr Slider Setup


setup_trans = SettingsGen(5,1,20,1/20,5/20,10,50,40,2,.1);
 % Slider Setup
s_trans{1}={'Value' ,setup_trans{1}};
s_trans{2}={'Min' , setup_trans{2}};
s_trans{3}={'Max' , setup_trans{3}};
s_trans{4}={'SliderStep' , [setup_trans{4}, setup_trans{5}]};
s_trans{5}={'Position' , setup_trans{6}};


% min value display setup 
min_trans{1}={'String', num2str(setup_trans{2})};
min_trans{2}={'Position', setup_trans{7}};


% max value display setup
max_trans{1}={'String', num2str(setup_trans{3})};
max_trans{2}={'Position', setup_trans{8}};


% slider varialbe title display setup 
title_trans{1}={'String', 'transientLenThr (default:5)'};
title_trans{2}={'Position', setup_trans{9}};

%slider current value display
disp_trans{1}={'String', num2str(setup_trans{1})};
disp_trans{2}={'Position', setup_trans{10}};


%end of slider setup for transientLenThr
%% maxProbTol Slider Setup


setup_maxProb = SettingsGen(5e-2,0,1,10e-4,1e-2,10,45,40,2,.1);
 % Slider Setup
s_maxProb{1}={'Value' ,setup_maxProb{1}};
s_maxProb{2}={'Min' , setup_maxProb{2}};
s_maxProb{3}={'Max' , setup_maxProb{3}};
s_maxProb{4}={'SliderStep' , [setup_maxProb{4}, setup_maxProb{5}]};
s_maxProb{5}={'Position' , setup_maxProb{6}};


% min value display setup 
min_maxProb{1}={'String', num2str(setup_maxProb{2})};
min_maxProb{2}={'Position', setup_maxProb{7}};


% max value display setup
max_maxProb{1}={'String', num2str(setup_maxProb{3})};
max_maxProb{2}={'Position', setup_maxProb{8}};


% slider varialbe title display setup 
title_maxProb{1}={'String', 'maxProbTol(default: 5e-2)'};
title_maxProb{2}={'Position', setup_maxProb{9}};

%slider current value display
disp_maxProb{1}={'String', num2str(setup_maxProb{1})};
disp_maxProb{2}={'Position', setup_maxProb{10}};
%end of slider setup for maxProbTol

%% insPenalty Slider Setup
setup_ins= SettingsGen(1,1,20,1/20,5/20,10,40,40,2,.1);

 % Slider Setup
s_ins{1}={'Value' ,setup_ins{1}};
s_ins{2}={'Min' , setup_ins{2}};
s_ins{3}={'Max' , setup_ins{3}};
s_ins{4}={'SliderStep' , [setup_ins{4}, setup_ins{5}]};
s_ins{5}={'Position' , setup_ins{6}};


% min value display setup 
min_ins{1}={'String', num2str(setup_ins{2})};
min_ins{2}={'Position', setup_ins{7}};


% max value display setup
max_ins{1}={'String', num2str(setup_ins{3})};
max_ins{2}={'Position', setup_ins{8}};


% slider varialbe title display setup 
title_ins{1}={'String', ' insPenalty (default: 1)'};
title_ins{2}={'Position', setup_ins{9}};

%slider current value display
disp_ins{1}={'String', num2str(setup_ins{1})};
disp_ins{2}={'Position', setup_ins{10}};

%end of slider setup for insPenalty


%% segPenalty Slider Setup
setup_seg = SettingsGen(10,0,100,1/100,10/100,10,35,40,2,.1);
 % Slider Setup
s_seg{1}={'Value' ,setup_seg{1}};
s_seg{2}={'Min' , setup_seg{2}};
s_seg{3}={'Max' , setup_seg{3}};
s_seg{4}={'SliderStep' , [setup_seg{4}, setup_seg{5}]};
s_seg{5}={'Position' , setup_seg{6}};


% min value display setup 
min_seg{1}={'String', num2str(setup_seg{2})};
min_seg{2}={'Position', setup_seg{7}};


% max value display setup
max_seg{1}={'String', num2str(setup_seg{3})};
max_seg{2}={'Position', setup_seg{8}};


% slider varialbe title display setup 
title_seg{1}={'String', ' segPenalty (default: 10)'};
title_seg{2}={'Position', setup_seg{9}};

%slider current value display
disp_seg{1}={'String', num2str(setup_seg{1})};
disp_seg{2}={'Position', setup_seg{10}};

%end of slider setup for segPenalty

%% minDistTol Slider Setup

setup_min = SettingsGen(0,0,40,1/40,5/40,10,30,40,2,.1);
 % Slider Setup
s_min{1}={'Value' ,setup_min{1}};
s_min{2}={'Min' , setup_min{2}};
s_min{3}={'Max' , setup_min{3}};
s_min{4}={'SliderStep' , [setup_min{4}, setup_min{5}]};
s_min{5}={'Position' , setup_min{6}};

% min value display setup 
min_min{1}={'String', num2str(setup_min{2})};
min_min{2}={'Position', setup_min{7}};


% max value display setup
max_min{1}={'String', num2str(setup_min{3})};
max_min{2}={'Position', setup_min{8}};


% slider varialbe title display setup 
title_min{1}={'String', ' minDistTol (default: 0)'};
title_min{2}={'Position', setup_min{9}};

%slider current value display
disp_min{1}={'String', num2str(setup_min{1})};
disp_min{2}={'Position', setup_min{10}};

%end of slider setup for minDistTol
   
   
%end of setting up sliders

%formatting output

% varargout{1}=s_ref;
% varargout{2}=s_nseq;
% varargout{3}=s_trans;
% varargout{4}=s_maxProb;
% varargout{5}=s_ins;
% varargout{6}=s_seg;
% varargout{7}=s_min;
%     
% varargout{8}=min_ref;
% varargout{9}=min_nseq;
% varargout{10}=min_trans;
% varargout{11}=min_maxProb;
% varargout{12}=min_ins;
% varargout{13}=min_seg;
% varargout{14}=min_min;
% 
% varargout{15}=max_ref;
% varargout{16}=max_nseq;
% varargout{17}=max_trans;
% varargout{18}=max_maxProb;
% varargout{19}=max_ins;
% varargout{20}=max_seg;
% varargout{21}=max_min;
% 
% varargout{22}=title_ref;
% varargout{23}=title_nseq;
% varargout{24}=title_trans;
% varargout{25}=title_maxProb;
% varargout{26}=title_ins;
% varargout{27}=title_seg;
% varargout{28}=title_min;
% 
% varargout{29}=disp_ref;
% varargout{30}=disp_nseq;
% varargout{31}=disp_trans;
% varargout{32}=disp_maxProb;
% varargout{33}=disp_ins;
% varargout{34}=disp_seg;
% varargout{35}=disp_min;


s_out{1}=s_ref;
s_out{2}=s_nseq;
s_out{3}=s_trans;
s_out{4}=s_maxProb;
s_out{5}=s_ins;
s_out{6}=s_seg;
s_out{7}=s_min;


min_out{1}=min_ref;
min_out{2}=min_nseq;
min_out{3}=min_trans;
min_out{4}=min_maxProb;
min_out{5}=min_ins;
min_out{6}=min_seg;
min_out{7}=min_min;

max_out{1}=max_ref;
max_out{2}=max_nseq;
max_out{3}=max_trans;
max_out{4}=max_maxProb;
max_out{5}=max_ins;
max_out{6}=max_seg;
max_out{7}=max_min;

title_out{1}=title_ref;
title_out{2}=title_nseq;
title_out{3}=title_trans;
title_out{4}=title_maxProb;
title_out{5}=title_ins;
title_out{6}=title_seg;
title_out{7}=title_min;

disp_out{1}=disp_ref;
disp_out{2}=disp_nseq;
disp_out{3}=disp_trans;
disp_out{4}=disp_maxProb;
disp_out{5}=disp_ins;
disp_out{6}=disp_seg;
disp_out{7}=disp_min;





% Temp={s_ref,s_nseq,s_trans,s_maxProb,s_ins,s_seg,s_min; % row of all adjusted slider handle strings
%         min_ref,min_nseq,min_trans,min_maxProb,min_ins,min_seg,min_min; % row of all adjusted min handle strings
%         max_ref,max_nseq,max_trans,max_maxProb,max_ins,max_seg,max_min; % row of all adjusted max handle strings
%         title_ref,title_nseq,title_trans,title_maxProb,title_ins,title_seg,title_min; % row of all adjusted title handle strings
%         disp_ref,disp_nseq,disp_trans,disp_maxProb,disp_ins,disp_seg,disp_min}; % row of all adjusted display current value handle strings
% 
%    
% varargout=Temp';

Initial_Setup=false;
  
elseif ~Initial_Setup 
       return
    
end



