    function varargout = CaperucitaRoja(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CaperucitaRoja_OpeningFcn, ...
                   'gui_OutputFcn',  @CaperucitaRoja_OutputFcn, ...
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


% --- Executes just before CaperucitaRoja is made visible.
function CaperucitaRoja_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CaperucitaRoja (see VARARGIN)

% Choose default command line output for CaperucitaRoja
handles.output = hObject;
axes(handles.axes1)
imshow('')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CaperucitaRoja wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CaperucitaRoja_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(get(handles.pushbutton1,'String'),'SI'))
    set(handles.pushbutton1,'String','NO');
    set(handles.pushbutton1,'ForegroundColor','k');
else
    set(handles.pushbutton1,'String','SI');
    set(handles.pushbutton1,'ForegroundColor','k');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(get(handles.pushbutton2,'String'),'SI'))
    set(handles.pushbutton2,'String','NO');
    set(handles.pushbutton2,'ForegroundColor','k');
else
    set(handles.pushbutton2,'String','SI');
    set(handles.pushbutton2,'ForegroundColor','k');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(get(handles.pushbutton3,'String'),'SI'))
    set(handles.pushbutton3,'String','NO');
    set(handles.pushbutton3,'ForegroundColor','k');
else
    set(handles.pushbutton3,'String','SI');
    set(handles.pushbutton3,'ForegroundColor','k');
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(get(handles.pushbutton4,'String'),'SI'))
    set(handles.pushbutton4,'String','NO');
    set(handles.pushbutton4,'ForegroundColor','k');
else
    set(handles.pushbutton4,'String','SI');
    set(handles.pushbutton4,'ForegroundColor','k');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(get(handles.pushbutton5,'String'),'SI'))
    set(handles.pushbutton5,'String','NO');
    set(handles.pushbutton5,'ForegroundColor','k');
else
    set(handles.pushbutton5,'String','SI');
    set(handles.pushbutton5,'ForegroundColor','k');
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(get(handles.pushbutton6,'String'),'SI'))
    set(handles.pushbutton6,'String','NO');
    set(handles.pushbutton6,'ForegroundColor','k');
else
    set(handles.pushbutton6,'String','SI');
    set(handles.pushbutton6,'ForegroundColor','k');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% aqui se entrena al perceptron
global W1;
global W2;
set(handles.edit3,'String','Procesando');
coefApre = rand;
input = [ 1, 1, 1, 0, 0, 0;
    1, 0, 0, 1, 0, 1;
    0, 0, 1, 0, 1, 1];
output = [1, 1, 1, 0, 0, 0, 0;
    0, 0, 0, 1, 1, 0, 1;
    0, 0, 0, 1, 0, 1, 1];
out1 = [0, 0, 0, 0, 0, 0, 0];
out2 = [0, 0, 0, 0, 0, 0, 0];
E = [0, 0, 0, 0, 0, 0, 0];
A = [0, 0, 0, 0, 0, 0, 0];
W1 = rand(6,7);
W2 = rand(7);
error = 1;
while error > 0.08%cada ciclo es una etapa
    error = 0;
    for e =1:1:3% cada ciclo es el calculo de una entrada
        %calcula salidas de capa oculta
        for i = 1:1:7
            in = input(e,:) * W1(:,i);
            out1(i) = 1 / (1 + exp(-1*in));
        end
        %calcula salida de utlima capa
        for i = 1:1:7
            in = out1 * W2(:,i);
            out2(i) = 1 / (1 + exp(-1*in));
        end
        %AJUSTE DE PESOS
        %pesos de la ultima capa
        for i = 1:1:7
            E(i) = output(e,i) - out2(i);       %error
        end
        errorSuma = 0;
        for i = 1:1:7
            errorSuma = errorSuma + abs(E(i));       %error
        end
        if error < errorSuma;
            error = errorSuma;
        end
        for i = 1:1:7
            A(i) = E(i) * out2(i) * (1 - out2(i));  %calculo de retropropagacion
            for j = 1:1:7
                W2(j,i) = W2(j,i) + (coefApre * out1(j) * A(i));
            end
        end
        %pesos para la capa oculta
        for i = 1:1:7
            delta = 0;
            for k = 1:1:7
                delta = delta + W2(k,i)*A(k);
            end
            delta = out1(i) * (1 - out1(i)) * (delta);    %calculo de retropropagacion
            for j = 1:1:6
                W1(j,i) = W1(j,i) + (coefApre * input(e,j) * delta);
            end
        end
    end
end
set(handles.edit3,'String','Finalizo Entrenamiento');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%aqui evalua a las entradas
global W1;
global W2;
set(handles.edit1,'String','');

input = [0, 0, 0, 0, 0, 0];
if(strcmp(get(handles.pushbutton1,'String'),'SI'))
    input(1) = 1;
else
    input(1) = 0;
end
if(strcmp(get(handles.pushbutton2,'String'),'SI'))
    input(2) = 1;
else
    input(2) = 0;
end
if(strcmp(get(handles.pushbutton3,'String'),'SI'))
    input(3) = 1;
else
    input(3) = 0;
end
if(strcmp(get(handles.pushbutton4,'String'),'SI'))
    input(4) = 1;
else
    input(4) = 0;
end
if(strcmp(get(handles.pushbutton5,'String'),'SI'))
    input(5) = 1;
else
    input(5) = 0;
end
if(strcmp(get(handles.pushbutton6,'String'),'SI'))
    input(6) = 1;
else
    input(6) = 0;
end
out1 = [0, 0, 0, 0, 0, 0, 0];
out2 = [0, 0, 0, 0, 0, 0, 0];
for i = 1:1:7
    in = input * W1(:,i);
    out1(i) = 1 / (1 + exp(-1*in));
end
for i = 1:1:7
    in = out1 * W2(:,i);
    out2(i) = round(1 / (1 + exp(-1*in)));
end
if(out2(1)==1)
    set(handles.text9,'Visible','on');
else
    set(handles.text9,'Visible','off');
end
if(out2(2)==1)
    set(handles.text10,'Visible','on');
else
    set(handles.text10,'Visible','off');
end
if(out2(3)==1)
    set(handles.text11,'Visible','on');
else
    set(handles.text11,'Visible','off');
end
if(out2(4)==1)
    set(handles.text12,'Visible','on');
else
    set(handles.text12,'Visible','off');
end
if(out2(5)==1)
    set(handles.text13,'Visible','on');
else
    set(handles.text13,'Visible','off');
end
if(out2(6)==1)
    set(handles.text14,'Visible','on');
else
    set(handles.text14,'Visible','off');
end
if(out2(7)==1)
    set(handles.text15,'Visible','on');
else
    set(handles.text15,'Visible','off');
end
lobo = [1, 1, 1, 0, 0, 0, 0];
abuelita = [0, 0, 0, 1, 1, 0, 1];
lenador = [0, 0, 0, 1, 0, 1, 1];

axes(handles.axes1)

if out2 == lobo
    set(handles.edit1,'String','Es el Lobo');
    imshow('lobo.png')
end
if out2 == abuelita
    set(handles.edit1,'String','Es la Abuelita');
    imshow('abuelita.jpg')
end
if out2 == lenador
    set(handles.edit1,'String','Es el Lenador');
    imshow('lenador.jpg')
end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
