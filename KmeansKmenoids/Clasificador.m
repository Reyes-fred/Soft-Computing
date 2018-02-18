function varargout = Clasificador(varargin)
% CLASIFICADOR MATLAB code for Clasificador.fig
%      CLASIFICADOR, by itself, creates a new CLASIFICADOR or raises the existing
%      singleton*.
%
%      H = CLASIFICADOR returns the handle to a new CLASIFICADOR or the handle to
%      the existing singleton*.
%
%      CLASIFICADOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLASIFICADOR.M with the given input arguments.
%
%      CLASIFICADOR('Property','Value',...) creates a new CLASIFICADOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Clasificador_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Clasificador_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Clasificador


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Clasificador_OpeningFcn, ...
                   'gui_OutputFcn',  @Clasificador_OutputFcn, ...
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


% --- Executes just before Clasificador is made visible.
function Clasificador_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Clasificador (see VARARGIN)

% Choose default command line output for Clasificador
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Clasificador wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Clasificador_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Cluster.
function Cluster_Callback(hObject, eventdata, handles)
% hObject    handle to Cluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Cluster contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Cluster


% --- Executes during object creation, after setting all properties.
function Cluster_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Next.
function Next_Callback(hObject, eventdata, handles)
% hObject    handle to Next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Cluster = get(handles.Cluster,'Value');
switch Cluster
    case 1
        funcionError(hObject, eventdata, handles,'Cluster');
    case 2
        funcionKmeans(hObject, eventdata, handles);
    case 3
        funcionKmedoids(hObject, eventdata, handles);
end

function funcionError(hObject, eventdata, handles, Msj)
Mensaje=strcat('Error, Elige una opci?n de: ',Msj);
set(handles.Msj, 'String', Mensaje);

function funcionKmeans(hObject, eventdata, handles)
cla;
Datas = get(handles.dataset,'Value');
Condicion1=0;
switch Datas
    case 1
        funcionError(hObject, eventdata, handles,'Dataset');
        Condicion1=1;
    case 2
        DataSet=load ('irisdataset');
    case 3
        DataSet=load ('ecolidataset');
    case 4
        DataSet=load ('glassdataset');
end
Dista = get(handles.Distancia,'Value');
Condicion2=0;
switch Dista
    case 1
        funcionError(hObject, eventdata, handles,'Distancia');
        Condicion2=1;
    case 2
        Distancia='sqEuclidean';
    case 3
        Distancia='cityblock';
    case 4
        Distancia='cosine';
    case 5
        Distancia='correlation';

end
 Condicion3=0;
No = str2num(get(handles.No,'String'));
if ~isnan(No) set(handles.Msj, 'String', 'Calculado');
else funcionError(hObject, eventdata, handles,'No-grupos');Condicion3=1;
end

if Condicion1==0 && Condicion2==0 && Condicion3==0
    opts = statset('Display','final');
    [idx,ctrs]= kmeans(DataSet.Datos(:,:),No,'distance',Distancia,'Options',opts);
    No_datos=size(idx);

    Colores={'y.','m.','c.','r.','g.','b.','w.','k.','y.','m.','c.','r.','g.','b.','w.','k.'};
    %%%selecciona a que clase pertenece cada punto
    for i=1:No_datos(1)
hold on
plot(DataSet.Datos(i,1),DataSet.Datos(i,2),Colores{idx(i)},'MarkerSize',12);
hold off
    %silhouette(DataSet.Datos,IDX);
    end
    
hold on
%%%Imprime los centroides
plot(ctrs(:,1),ctrs(:,2),'kx',...
     'MarkerSize',7,'LineWidth',2)
plot(ctrs(:,1),ctrs(:,2),'ko',...
     'MarkerSize',7,'LineWidth',2)
hold off   
    
end
    
    
function funcionKmedoids(hObject, eventdata, handles)
set(handles.Msj, 'String', 'Medoids');



% --- Executes on selection change in dataset.
function dataset_Callback(hObject, eventdata, handles)
% hObject    handle to dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dataset contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dataset


% --- Executes during object creation, after setting all properties.
function dataset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Distancia.
function Distancia_Callback(hObject, eventdata, handles)
% hObject    handle to Distancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Distancia contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Distancia


% --- Executes during object creation, after setting all properties.
function Distancia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Distancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function No_Callback(hObject, eventdata, handles)
% hObject    handle to No (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of No as text
%        str2double(get(hObject,'String')) returns contents of No as a double


% --- Executes during object creation, after setting all properties.
function No_CreateFcn(hObject, eventdata, handles)
% hObject    handle to No (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
