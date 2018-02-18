function varargout = arbol_decision(varargin)
% ARBOL_DECISION MATLAB code for arbol_decision.fig
%      ARBOL_DECISION, by itself, creates a new ARBOL_DECISION or raises the existing
%      singleton*.
%
%      H = ARBOL_DECISION returns the handle to a new ARBOL_DECISION or the handle to
%      the existing singleton*.
%
%      ARBOL_DECISION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARBOL_DECISION.M with the given input arguments.
%
%      ARBOL_DECISION('Property','Value',...) creates a new ARBOL_DECISION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before arbol_decision_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to arbol_decision_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help arbol_decision

% Last Modified by GUIDE v2.5 06-Nov-2016 00:00:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @arbol_decision_OpeningFcn, ...
                   'gui_OutputFcn',  @arbol_decision_OutputFcn, ...
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


% --- Executes just before arbol_decision is made visible.
function arbol_decision_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to arbol_decision (see VARARGIN)

% Choose default command line output for arbol_decision
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes arbol_decision wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = arbol_decision_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iris = get(handles.irisdata,'Value');
ecoli = get(handles.ecoli,'Value');
glass = get(handles.glass,'Value');

if iris == 1
    load fisheriris;
    %Entrenamiento arbol
    t = classregtree(meas, species, 'names', {'SL', 'SW', 'PL', 'PW'});
    view (t);
    %Prueba
    tresultado = eval(t,meas);
    cm = confusionmat(species,tresultado);
    N = sum(cm(:));
    err = (N-sum(diag(cm)) )/N
    set(handles.error,'String',err);
    %Prune arbol
    t2 = prune(t, 'level', 1);
    view (t2);
    %predicci?n
    inst = [4.90000000000000,2.40000000000000,3.30000000000000,1];
    prediction = eval(t2,inst)
else
    if ecoli == 1
        load svmecoli;
    %Entrenamiento arbol
    t = classregtree(meas, species, 'names', {'mcg', 'gvh', 'lip', 'chg', 'acc', 'alm1' ,'alm2'});
    view (t);
    %Prueba
    tresultado = eval(t,meas);
    cm = confusionmat(species,tresultado);
    N = sum(cm(:));
    err = (N-sum(diag(cm)) )/N
    set(handles.error,'String',err);
    %Prune arbol
    t2 = prune(t, 'level', 1);
    view (t2);
    %predicci?n
    inst = [0.490000000000000,0.290000000000000,0.480000000000000,0.500000000000000,0.560000000000000,0.240000000000000,0.350000000000000];
    prediction = eval(t2,inst)
        
    else
        if glass == 1         
     load svmglass1;
    %Entrenamiento arbol
    t = classregtree(meas, species, 'names', {'Ri', 'Na', 'Mg', 'Al', 'Si','K','Ca','Ba','Fe'});
    view (t);
    %Prueba
    tresultado = eval(t,meas);
    cm = confusionmat(species,tresultado);
    N = sum(cm(:));
    err = (N-sum(diag(cm)) )/N
    set(handles.error,'String',err);
    %Prune arbol
    t2 = prune(t, 'level', 1);
    view (t2);
    %predicci?n
    inst = [1.51613000000000,13.8800000000000,1.78000000000000,1.79000000000000,73.1000000000000,0,8.67000000000000,0.760000000000000,0];
    prediction = eval(t2,inst)
        end;
    end;

end;
