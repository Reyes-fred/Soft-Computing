function varargout = svm(varargin)
% SVM MATLAB code for svm.fig
%      SVM, by itself, creates a new SVM or raises the existing
%      singleton*.
%
%      H = SVM returns the handle to a new SVM or the handle to
%      the existing singleton*.
%
%      SVM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SVM.M with the given input arguments.
%
%      SVM('Property','Value',...) creates a new SVM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before svm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to svm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help svm

% Last Modified by GUIDE v2.5 12-Sep-2014 04:50:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @svm_OpeningFcn, ...
                   'gui_OutputFcn',  @svm_OutputFcn, ...
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


% --- Executes just before svm is made visible.
function svm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to svm (see VARARGIN)

% Choose default command line output for svm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes svm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = svm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Kernel.
function Kernel_Callback(hObject, eventdata, handles)
% hObject    handle to Kernel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Kernel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Kernel


% --- Executes during object creation, after setting all properties.
function Kernel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kernel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Entrenar.
function Entrenar_Callback(hObject, eventdata, handles)

Iris=load ('svmglass1');
global maquina1;global maquina2;global maquina3;
global maquina5;global maquina6;global maquina7;

Condicion=0;

kernel = get(handles.Kernel,'Value');
switch kernel
    case 1
        set(handles.Efectividad, 'String', 'Elige una opci?n valida');
        Condicion=1;
    case 2
        opcKernel = 'linear';
    case 3
        opcKernel = 'quadratic';
    case 4
        opcKernel = 'polynomial';
    case 5
        opcKernel = 'rbf';
    case 6
        opcKernel = 'mlp';
end

if Condicion==0
maquina1 = svmtrain(Iris.Datos',Iris.class1, 'kernel_func', opcKernel);
maquina2 = svmtrain(Iris.Datos',Iris.class2, 'kernel_func', opcKernel);
maquina3 = svmtrain(Iris.Datos',Iris.class3, 'kernel_func', opcKernel);
maquina5 = svmtrain(Iris.Datos',Iris.class5, 'kernel_func', opcKernel);
maquina6 = svmtrain(Iris.Datos',Iris.class6, 'kernel_func', opcKernel);
maquina7 = svmtrain(Iris.Datos',Iris.class7, 'kernel_func', opcKernel);
set(handles.Efectividad,'String','La efectividad es:');

correcto = 0;incorrectos = 0;
for i = 1:214
    classe(1)= svmclassify(maquina1, Iris.Datos(i,:));
    classe(2) = svmclassify(maquina2, Iris.Datos(i,:));
    classe(3) = svmclassify(maquina3, Iris.Datos(i,:));
    classe(4) = svmclassify(maquina5, Iris.Datos(i,:));
    classe(5) = svmclassify(maquina6, Iris.Datos(i,:));
    classe(6) = svmclassify(maquina7, Iris.Datos(i,:));
   
    if classe == Iris.salida(i,:)
        correcto = correcto + 1;
    else
        incorrectos = incorrectos + 1;
    end
    
end
D1=get(handles.G1,'Value');

svmtrain(Iris.Datos(1:142,D1-1:D1)',Iris.class1(1:142,1),'kernel_func', opcKernel, 'ShowPlot',true);
hold on
svmtrain(Iris.Datos(71:214,D1-1:D1)',Iris.class2(71:214,1),'kernel_func', opcKernel, 'ShowPlot',true);
hold off

porcentaje = (correcto*100)/214;
set(handles.Efectividad1, 'String', sprintf('%.4f %d', porcentaje));
end


% --- Executes on selection change in G1.
function G1_Callback(hObject, eventdata, handles)
% hObject    handle to G1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns G1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from G1


% --- Executes during object creation, after setting all properties.
function G1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in G2.
function G2_Callback(hObject, eventdata, handles)
% hObject    handle to G2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns G2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from G2


% --- Executes during object creation, after setting all properties.
function G2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
