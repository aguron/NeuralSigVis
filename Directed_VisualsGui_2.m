function varargout = Directed_VisualsGui_2(varargin)
% DIRECTED_VISUALSGUI_2 MATLAB code for Directed_VisualsGui_2.fig
%      DIRECTED_VISUALSGUI_2, by itself, creates a new DIRECTED_VISUALSGUI_2 or raises the existing
%      singleton*.
%
%      H = DIRECTED_VISUALSGUI_2 returns the handle to a new DIRECTED_VISUALSGUI_2 or the handle to
%      the existing singleton*.
%
%      DIRECTED_VISUALSGUI_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIRECTED_VISUALSGUI_2.M with the given input arguments.
%
%      DIRECTED_VISUALSGUI_2('Property','Value',...) creates a new DIRECTED_VISUALSGUI_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Directed_VisualsGui_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Directed_VisualsGui_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Directed_VisualsGui_2

% Last Modified by GUIDE v2.5 15-Dec-2015 18:57:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Directed_VisualsGui_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Directed_VisualsGui_2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end



% End initialization code - DO NOT EDIT


% --- Executes just before Directed_VisualsGui_2 is made visible.
function Directed_VisualsGui_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Directed_VisualsGui_2 (see VARARGIN)

% Choose default command line output for Directed_VisualsGui_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Directed_VisualsGui_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Directed_VisualsGui_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)
% hObject    handle to CloseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.close_string= 'Gui Closed Properly';
guidata(hObject,handles);
fprintf('\n %s \n',handles.close_string);
close all





% --- Executes on slider movement.
function s_ref_Callback(hObject, eventdata, handles)
% hObject    handle to s_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.refState=floor(get(handles.s_ref,'Value'));
guidata(hObject,handles);
set(handles.disp_ref,'String',num2str(handles.refState));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function s_ref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9])
end



% --- Executes on button press in s_default.

function s_default_Callback(hObject, eventdata, handles)
% hObject    handle to s_default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% refState Slider Setup
set(handles.disp_ref, 'String', num2str(1))
set(handles.s_ref, 'Value', 1)
handles.refState=1;
guidata(hObject,handles)


FileName=handles.FileName;
if FileName==0
disp('Error Loading File')
disp('Please click the "Select File" Button')

%set nStates to 4 if no file has been loaded 
handles.nStates=4;
guidata(hObject,handles)
end
set(handles.max_ref, 'String', num2str(handles.nStates))    
set(handles.s_ref, 'Max' , handles.nStates)
set(handles.s_ref, 'SliderStep' , [1/handles.nStates, 1/handles.nStates])
guidata(hObject,handles)

%end of slider default setup for refState

%% nSeqMax Slider Setup

set(handles.disp_nseq, 'String', num2str(20))
set(handles.s_nseq, 'Value', 20)
handles.nSeqMax=20;
guidata(hObject,handles)


% handles.setup_nseq = SettingsGen(20,0,200,.005,.01,10,55,40,2,.1);
% 
% 
% 
%  % Slider Setup
% set(handles.s_nseq, 'Visible' , 'Off')
% set(handles.s_nseq, 'Value' , handles.setup_nseq{1})
% 
% set(handles.s_nseq, 'Min' , handles.setup_nseq{2})
% set(handles.s_nseq, 'Max' , handles.setup_nseq{3})
% set(handles.s_nseq, 'SliderStep' , [handles.setup_nseq{4}, handles.setup_nseq{5}])
% set(handles.s_nseq, 'Position' , handles.setup_nseq{6})
% set(handles.s_nseq, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % min value display setup 
% set(handles.min_nseq, 'String', num2str(handles.setup_nseq{2}))
% set(handles.min_nseq,'Position', handles.setup_nseq{7})
% set(handles.min_nseq, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % max value display setup 
% set(handles.max_nseq, 'String', num2str(handles.setup_nseq{3}))
% set(handles.max_nseq,'Position', handles.setup_nseq{8})
% set(handles.max_nseq, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % slider varialbe title display setup 
% set(handles.title_nseq, 'String', 'nSeqMax (default:20)') 
% set(handles.title_nseq,'Position', handles.setup_nseq{9})
% set(handles.title_nseq, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% %slider current value display
% set(handles.disp_nseq, 'String', num2str(handles.setup_nseq{1}))
% set(handles.disp_nseq, 'Position', handles.setup_nseq{10})
% set(handles.disp_nseq, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% if handles.setup_nseq{1}== floor(get(handles.s_nseq,'Value'))
%     handles.nSeqMax=handles.setup_nseq{1};
% else 
%     handles.nSeqMax=floor(get(handles.s_nseq,'Value'));
% end
% guidata(hObject,handles)

%end of slider setup for nSeqMax

%% transientLenThr Slider Setup

set(handles.disp_trans, 'String', num2str(5))
set(handles.s_trans, 'Value', 5)
handles.transientLenThr=5;
guidata(hObject,handles)

% handles.setup_trans = SettingsGen(5,1,20,1/20,5/20,10,50,40,2,.1);
% 
% 
% 
%  % Slider Setup
% set(handles.s_trans, 'Visible' , 'Off')
% set(handles.s_trans, 'Value' , handles.setup_trans{1})
% set(handles.s_trans, 'Min' , handles.setup_trans{2})
% set(handles.s_trans, 'Max' , handles.setup_trans{3})
% set(handles.s_trans, 'SliderStep' , [handles.setup_trans{4}, handles.setup_trans{5}])
% set(handles.s_trans, 'Position' , handles.setup_trans{6})
% set(handles.s_trans, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % min value display setup 
% set(handles.min_trans, 'String', num2str(handles.setup_trans{2}))
% set(handles.min_trans,'Position', handles.setup_trans{7})
% set(handles.min_trans, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % max value display setup 
% set(handles.max_trans, 'String', num2str(handles.setup_trans{3}))
% set(handles.max_trans,'Position', handles.setup_trans{8})
% set(handles.max_trans, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % slider varialbe title display setup 
% set(handles.title_trans, 'String', ' transientLenThr (default:5)') 
% set(handles.title_trans,'Position', handles.setup_trans{9})
% set(handles.title_trans, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% %slider current value display
% set(handles.disp_trans, 'String', num2str(handles.setup_trans{1}))
% set(handles.disp_trans, 'Position', handles.setup_trans{10})
% set(handles.disp_trans, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% if handles.setup_trans{1}== floor(get(handles.s_trans,'Value'))
%     handles.transientLenThr=handles.setup_trans{1};
% else 
%     handles.transientLenThr=floor(get(handles.s_trans,'Value'));
% end
% guidata(hObject,handles)

%end of slider setup for transientLenThr
%% maxProbTol Slider Setup

set(handles.disp_maxProb, 'String', num2str(0.05))
set(handles.s_maxProb, 'Value', 0.05)
handles.maxProbTol=0.05;
guidata(hObject,handles)

% handles.setup_maxProb = SettingsGen(5e-2,0,1,10e-4,1e-2,10,45,40,2,.1);
% guidata(hObject,handles)
% 
%  % Slider Setup
% set(handles.s_maxProb, 'Value' , handles.setup_maxProb{1})
% set(handles.s_maxProb, 'Min' , handles.setup_maxProb{2})
% set(handles.s_maxProb, 'Max' , handles.setup_maxProb{3})
% set(handles.s_maxProb, 'SliderStep' , [handles.setup_maxProb{4}, handles.setup_maxProb{5}])
% set(handles.s_maxProb, 'Position' , handles.setup_maxProb{6})
% guidata(hObject,handles)
% 
% % min value display setup 
% set(handles.min_maxProb, 'String', num2str(handles.setup_maxProb{2}))
% set(handles.min_maxProb,'Position', handles.setup_maxProb{7})
% set(handles.min_maxProb, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % max value display setup 
% set(handles.max_maxProb, 'String', num2str(handles.setup_maxProb{3}))
% set(handles.max_maxProb,'Position', handles.setup_maxProb{8})
% guidata(hObject,handles)
% 
% % slider varialbe title display setup 
% set(handles.title_maxProb, 'String', 'maxProbTol (default:5e-2)') 
% set(handles.title_maxProb,'Position', handles.setup_maxProb{9})
% guidata(hObject,handles)
% 
% %slider current value display
% set(handles.disp_maxProb, 'String', num2str(handles.setup_maxProb{1}))
% set(handles.disp_maxProb, 'Position', handles.setup_maxProb{10})
% guidata(hObject,handles)
% 
% if handles.setup_maxProb{1}== get(handles.s_maxProb,'Value')
%     handles.maxProbTol=handles.setup_maxProb{1};
% else 
%     handles.maxProbTol=get(handles.s_maxProb,'Value');
% end
% guidata(hObject,handles)

%end of slider setup for maxProbTol

%% insPenalty Slider Setup

%slider Default Value Reset and display
set(handles.disp_ins, 'String', num2str(1))
set(handles.s_ins, 'Value', 1)
handles.insPenalty=1;
guidata(hObject,handles)

% handles.setup_ins = SettingsGen(1,1,20,1/20,5/20,10,40,40,2,.1);
%  % Slider Setup
% set(handles.s_ins, 'Visible' , 'Off')
% set(handles.s_ins, 'Value' , handles.setup_ins{1})
% set(handles.s_ins, 'Min' , handles.setup_ins{2})
% set(handles.s_ins, 'Max' , handles.setup_ins{3})
% set(handles.s_ins, 'SliderStep' , [handles.setup_ins{4}, handles.setup_ins{5}])
% set(handles.s_ins, 'Position' , handles.setup_ins{6})
% set(handles.s_ins, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % min value display setup 
% set(handles.min_ins, 'Visible' , 'Off')
% set(handles.min_ins, 'String', num2str(handles.setup_ins{2}))
% set(handles.min_ins,'Position', handles.setup_ins{7})
% set(handles.min_ins, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % max value display setup
% set(handles.max_ins, 'Visible' , 'Off')
% set(handles.max_ins, 'String', num2str(handles.setup_ins{3}))
% set(handles.max_ins,'Position', handles.setup_ins{8})
% set(handles.max_ins, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % slider varialbe title display setup 
% set(handles.title_ins, 'Visible' , 'Off')
% set(handles.title_ins, 'String', ' insPenalty (default: 1)') 
% set(handles.title_ins,'Position', handles.setup_ins{9})
% set(handles.title_ins, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% %slider current value display
% set(handles.disp_ins, 'String', num2str(handles.setup_ins{1}))
% set(handles.disp_ins, 'Position', handles.setup_ins{10})
% set(handles.disp_ins, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% if handles.setup_ins{1}== floor(get(handles.s_ins,'Value'))
%     handles.insPenalty=handles.setup_ins{1};
% else 
%     handles.insPenalty=floor(get(handles.s_ins,'Value'));
% end
% guidata(hObject,handles)

%end of slider setup for insPenalty


%% segPenalty Slider Setup
% handles.setup_seg = SettingsGen(10,0,100,1/100,10/100,10,35,40,2,.1);

%slider Default Value Reset and display
set(handles.disp_seg, 'String', num2str(10))
set(handles.s_seg, 'Value', 10)
handles.segPenalty=10;
guidata(hObject,handles)


%  % Slider Setup
% set(handles.s_seg, 'Visible' , 'Off')
% set(handles.s_seg, 'Value' , handles.setup_seg{1})
% set(handles.s_seg, 'Min' , handles.setup_seg{2})
% set(handles.s_seg, 'Max' , handles.setup_seg{3})
% set(handles.s_seg, 'SliderStep' , [handles.setup_seg{4}, handles.setup_seg{5}])
% set(handles.s_seg, 'Position' , handles.setup_seg{6})
% set(handles.s_seg, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % min value display setup 
% set(handles.min_seg, 'Visible' , 'Off')
% set(handles.min_seg, 'String', num2str(handles.setup_seg{2}))
% set(handles.min_seg,'Position', handles.setup_seg{7})
% set(handles.min_seg, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % max value display setup
% set(handles.max_seg, 'Visible' , 'Off')
% set(handles.max_seg, 'String', num2str(handles.setup_seg{3}))
% set(handles.max_seg,'Position', handles.setup_seg{8})
% set(handles.max_seg, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % slider varialbe title display setup 
% set(handles.title_seg, 'Visible' , 'Off')
% set(handles.title_seg, 'String', ' segPenalty (default: 10)') 
% set(handles.title_seg,'Position', handles.setup_seg{9})
% set(handles.title_seg, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% %slider current value display
% set(handles.disp_seg, 'String', num2str(handles.setup_seg{1}))
% set(handles.disp_seg, 'Position', handles.setup_seg{10})
% set(handles.disp_seg, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% if handles.setup_seg{1}== floor(get(handles.s_seg,'Value'))
%     handles.segPenalty=handles.setup_seg{1};
% else 
%     handles.segPenalty=floor(get(handles.s_seg,'Value'));
% end
% guidata(hObject,handles)

%end of slider setup for segPenalty

%% minDistTol Slider Setup
% handles.setup_min = SettingsGen(0,0,40,1/40,5/40,10,30,40,2,.1);
% 
%  % Slider Setup
% set(handles.s_min, 'Visible' , 'Off')
% set(handles.s_min, 'Value' , handles.setup_min{1})
% set(handles.s_min, 'Min' , handles.setup_min{2})
% set(handles.s_min, 'Max' , handles.setup_min{3})
% set(handles.s_min, 'SliderStep' , [handles.setup_min{4}, handles.setup_min{5}])
% set(handles.s_min, 'Position' , handles.setup_min{6})
% set(handles.s_min, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % min value display setup 
% set(handles.min_min, 'Visible' , 'Off')
% set(handles.min_min, 'String', num2str(handles.setup_min{2}))
% set(handles.min_min,'Position', handles.setup_min{7})
% set(handles.min_min, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % max value display setup
% set(handles.max_min, 'Visible' , 'Off')
% set(handles.max_min, 'String', num2str(handles.setup_min{3}))
% set(handles.max_min,'Position', handles.setup_min{8})
% set(handles.max_min, 'Visible' , 'On')
% guidata(hObject,handles)
% 
% % slider varialbe title display setup 
% set(handles.title_min, 'Visible' , 'Off')
% set(handles.title_min, 'String', ' minDistTol (default: 0)') 
% set(handles.title_min,'Position', handles.setup_min{9})
% set(handles.title_min, 'Visible' , 'On')
% guidata(hObject,handles)

%slider Default Value Reset and display
set(handles.disp_min, 'String', num2str(0))
set(handles.s_min, 'Value', 0)
handles.minDistTol=0;
guidata(hObject,handles)

%end of slider setup for minDistTol


%%
% --- Executes on slider movement.
function s_nseq_Callback(hObject, eventdata, handles)
% hObject    handle to s_nseq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.nSeqMax=floor(get(handles.s_nseq,'Value'));
guidata(hObject,handles);
set(handles.disp_nseq,'String',num2str(handles.nSeqMax));
guidata(hObject,handles);




% --- Executes during object creation, after setting all properties.
function s_nseq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_nseq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s_trans_Callback(hObject, eventdata, handles)
% hObject    handle to s_trans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.transientLenThr=floor(get(handles.s_trans,'Value'));
guidata(hObject,handles);
set(handles.disp_trans,'String', num2str(handles.transientLenThr))
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function s_trans_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_trans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s_maxProb_Callback(hObject, eventdata, handles)
% hObject    handle to s_maxProb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider



handles.maxProbTol=get(handles.s_maxProb,'Value');
guidata(hObject,handles)
set(handles.disp_maxProb, 'String', num2str(handles.maxProbTol))
guidata(hObject,handles)




% --- Executes during object creation, after setting all properties.
function s_maxProb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_maxProb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%
%
%

% --- Executes on button press in Generate_Graphics.
function Generate_Graphics_Callback(hObject, eventdata, handles)
% hObject    handle to Generate_Graphics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
refState=floor(get(handles.s_ref,'Value'));
nSeqMax=floor(get(handles.s_nseq,'Value'));
transientLenThr=floor(get(handles.s_trans,'Value'));
maxProbTol=get(handles.s_maxProb,'Value');
insPenalty=floor(get(handles.s_ins,'Value'));
segPenalty=floor(get(handles.s_seg,'Value'));
minDistTol=floor(get(handles.s_min,'Value'));

tempMat=[refState;nSeqMax;...
         transientLenThr;maxProbTol;...
         insPenalty;segPenalty;minDistTol];
    

if handles.firstrun==true
handles.firstrun=false;
guidata(hObject,handles)  
P=struct;
P.refState=floor(get(handles.s_ref,'Value'));
P.nSeqMax=floor(get(handles.s_nseq,'Value'));
P.transientLenThr=floor(get(handles.s_trans,'Value'));
P.maxProbTol=get(handles.s_maxProb,'Value');
P.insPenalty=floor(get(handles.s_ins,'Value'));
P.segPenalty=floor(get(handles.s_seg,'Value'));
P.minDistTol=floor(get(handles.s_min,'Value'));

%adjust the following Tag variables for directed graph
P.Undirected_Tag=false;
P.Directed_Tag =true;
P.Save_Tag= false;

generate=true;

elseif handles.firstrun==false
P=handles.P;
PMat=[P.refState;P.nSeqMax;...
         P.transientLenThr;P.maxProbTol;...
         P.insPenalty;P.segPenalty; P.minDistTol];
     if ~isequal(PMat,tempMat)
         generate=true;
         P.refState=refState;
         P.nSeqMax=nSeqMax;
         P.transientLenThr=transientLenThr;
         P.maxProbTol = maxProbTol;
         P.insPenalty = insPenalty;
         P.segPenalty = segPenalty;
         P.minDistTol = minDistTol; 
     elseif isequal(PMat,tempMat)
         generate=false;
     end % if ~isequal(PMat,tempMat)
end % if handles.firstrun==true
 
if generate

disp('Generating Graphics...')
set(handles.textBox,'visible','off')
set(handles.textBox,'string','Generating Graphics...')
set(handles.textBox,'visible','on')
guidata(hObject,handles)

handles.P=P;
guidata(hObject,handles)

ref_str=strcat('refState=',num2str(P.refState));
set(handles.text_ref, 'String', ref_str)

nSeq_str=strcat('nSeqMax=',num2str(P.nSeqMax));
set(handles.text_nSeq, 'String', nSeq_str)

trans_str=strcat('transientLenThr=',num2str(P.transientLenThr));
set(handles.text_trans, 'String', trans_str)


maxProb_str=strcat('maxProbTol=',num2str(P.maxProbTol));
set(handles.text_maxProb, 'String', maxProb_str)

insPen_str=strcat('insPenalty=',num2str(P.insPenalty));
set(handles.text_insPen, 'String', insPen_str)

segPen_str=strcat('segPenalty=',num2str(P.segPenalty));
set(handles.text_segPen, 'String', segPen_str)

minDist_str=strcat('minDistTol=',num2str(P.minDistTol));
set(handles.text_minDist, 'String', minDist_str)

[Current_fig,handles.axes_VisualsGui]=Initiate_Visuals_Demo(P.nSeqMax,P.refState,...
    P.transientLenThr,P.maxProbTol,...
    P.insPenalty,P.segPenalty,...
    P.minDistTol,handles.axes_VisualsGui,...
    handles.FileName,P.Undirected_Tag,...
    P.Directed_Tag,P.Save_Tag);


disp('Graphics Generated.')
set(handles.textBox,'string',' ')
end % if generate


guidata(hObject,handles)



% --- Executes on slider movement.
function s_ins_Callback(hObject, eventdata, handles)
% hObject    handle to s_ins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.insPenalty=floor(get(handles.s_ins,'Value'));
guidata(hObject,handles)
set(handles.disp_ins,'String',num2str(handles.insPenalty))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function s_ins_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_ins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s_seg_Callback(hObject, eventdata, handles)
% hObject    handle to s_seg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.segPenalty=floor(get(handles.s_seg,'Value'));
guidata(hObject,handles)
set(handles.disp_seg,'String',num2str(handles.segPenalty))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function s_seg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_seg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s_min_Callback(hObject, eventdata, handles)
% hObject    handle to s_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.minDistTol=floor(get(handles.s_min,'Value'));
guidata(hObject,handles)
set(handles.disp_min,'String',num2str(handles.minDistTol))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function s_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Select_File.
function Select_File_Callback(hObject, eventdata, handles)
% hObject    handle to Select_File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Loading file...')
[FileName,PathName] = uigetfile('*.mat','Select the desired MATLAB .mat file');

if FileName ~=0
uiopen(FileName,1);
handles.FileName=FileName;

handles.firstrun=true;

handles.nStates=numstates(seq);

guidata(hObject,handles)

%Setup nStates as max value for refState Slider
set(handles.s_ref, 'Max' , handles.nStates)
set(handles.s_ref, 'SliderStep' , [1/handles.nStates, 1/handles.nStates])
set(handles.max_ref, 'String', num2str(handles.nStates))

guidata(hObject,handles)


elseif FileName==0
    disp('No file Loaded')
end


% --- Executes on button press in Save_Graphic.
function Save_Graphic_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Graphic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

P=handles.P;

%adjust the following Tag variables for directed graph
P.Undirected_Tag=false;
P.Directed_Tag =true;


%%
fighandle=(findobj('type','figure'))' ;
sortedhandles=sort(fighandle);
numfigs=max(size(sortedhandles))-1;
%handle of the current graphics figure (hidden, but still exists)
current_handle = sortedhandles(end-1);

%Saving Current Graphic as a figure
FileName=uiputfile('*.','Insert desired filename for the figure.');
figure(current_handle)
set(current_handle,'visible','on')
saveas(current_handle,FileName(1:end-1),'fig');
set(current_handle,'visible','off')


save_parameters('refState',P.refState,...
                'nSeqMax',P.nSeqMax,...
                'transientLenThr',P.transientLenThr,...
                'maxProbTol',P.maxProbTol,...
                'insPenalty',P.insPenalty,...
                'segPenalty',P.segPenalty,...
                'minDistTol',P.minDistTol,...
                'Undirected_Tag',false,...
                'Directed_Tag',true)
            






