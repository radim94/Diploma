function varargout = mrtgui2(varargin)
% MRTGUI2 MATLAB code for mrtgui2.fig
%      MRTGUI2, by itself, creates a new MRTGUI2 or raises the existing
%      singleton*.
%
%      H = MRTGUI2 returns the handle to a new MRTGUI2 or the handle to
%      the existing singleton*.
%
%      MRTGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MRTGUI2.M with the given input arguments.
%
%      MRTGUI2('Property','Value',...) creates a new MRTGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mrtgui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mrtgui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mrtgui2

% Last Modified by GUIDE v2.5 24-Jan-2017 15:35:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mrtgui2_OpeningFcn, ...
                   'gui_OutputFcn',  @mrtgui2_OutputFcn, ...
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


% --- Executes just before mrtgui2 is made visible.
function mrtgui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mrtgui2 (see VARARGIN)

% Choose default command line output for mrtgui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mrtgui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mrtgui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit2,'Enable','off');
set(handles.edit3,'Enable','off');
set(handles.edit4,'Enable','off');
set(handles.edit5,'Enable','off');
set(handles.uipushtool1,'enable','off');
set(handles.pushbutton2,'enable','off');
set(handles.pushbutton3,'enable','off');
set(handles.pushbutton4,'enable','off');
set(handles.edit7,'enable','off');

I=handles.I;
imshow(I);

hold on;
[x1,y1]=ginput(1);
plot(x1,y1,'r+'); 
[x2,y2]=ginput(1);
plot(x2,y2,'r+');
A={min(y1,y2),max(y1,y2),min(x1,x2),max(x1,x2)};
x = [A{3},A{4},A{4},A{3},A{3}]; y = [A{1},A{1},A{2},A{2},A{1}]; plot(x,y,'r-');
handles.A=A;

set(handles.uipushtool1,'enable','on');
set(handles.pushbutton2,'enable','on');
set(handles.pushbutton3,'enable','on');
set(handles.edit7,'enable','on');

guidata(gcbo,handles);

% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton3,'enable','off');
set(handles.pushbutton4,'enable','off');
set(handles.edit7,'enable','off');
set(handles.pushbutton2,'enable','off');
[FileName,PathName]=uigetfile('*.tif;*.tiff');
if FileName ~=0
    set(handles.edit7,'String','1');
    set(handles.uipushtool1,'enable','off');
    cla(handles.axes1);
    FullName=[PathName FileName];
    I=imread(FullName);
    imshow(I);
    handles.FullName=FullName;
 hold on;
[x1,y1]=ginput(1);
plot(x1,y1,'r+'); 
[x2,y2]=ginput(1);
plot(x2,y2,'r+');
A={min(y1,y2),max(y1,y2),min(x1,x2),max(x1,x2)};
x = [A{3},A{4},A{4},A{3},A{3}]; y = [A{1},A{1},A{2},A{2},A{1}]; plot(x,y,'r-');

handles.A=A;
handles.I=I;

set(handles.edit2,'Enable','on');
set(handles.edit3,'Enable','on');
set(handles.edit4,'Enable','on');
set(handles.edit5,'Enable','on');
set(handles.uipushtool1,'enable','on');
set(handles.pushbutton2,'enable','on');
set(handles.pushbutton3,'enable','on');

guidata(gcbo,handles);
end

set(handles.edit2,'Enable','on');
set(handles.edit3,'Enable','on');
set(handles.edit4,'Enable','on');
set(handles.edit5,'Enable','on');
set(handles.pushbutton3,'enable','on');
set(handles.edit7,'enable','on');
set(handles.pushbutton2,'enable','on');


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit2,'Enable','off');
set(handles.edit3,'Enable','off');
set(handles.edit4,'Enable','off');
set(handles.edit5,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.edit7,'Enable','off');
set(handles.pushbutton2,'enable','off');
set(handles.pushbutton3,'enable','off');

I=handles.I;
A=handles.A;
FullName=handles.FullName;

input2=get(handles.edit2,'String');
input3=get(handles.edit3,'String');
input4=get(handles.edit4,'String');
input5=get(handles.edit5,'String');
   
if(exist('test.xls','file'))
columnB = xlsread('test.xls','Fractal','K:K');
else
    columnB=[];
    
    xlswrite('test.xls',{'ФИО'},'Patient','A1');
    xlswrite('test.xls',{'Год рождения'},'Patient','B1');
    xlswrite('test.xls',{'Диагноз'},'Patient','C1');
    xlswrite('test.xls',{'Дата съёмки'},'Patient','D1');
    xlswrite('test.xls',{'FD_DBC'},'Fractal','K1');
    xlswrite('test.xls',{'FD_PS'},'Fractal','L1');
    xlswrite('test.xls',{'FD'},'Fractal','I1');
    xlswrite('test.xls',{'SD'},'Fractal','J1');
    xlswrite('test.xls',{'0 deg'},'Contrast','C1');
    xlswrite('test.xls',{'45 deg'},'Contrast','D1');
    xlswrite('test.xls',{'90 deg'},'Contrast','E1');
    xlswrite('test.xls',{'135 deg'},'Contrast','F1');
    xlswrite('test.xls',{'0 deg'},'Correlation','C1');
    xlswrite('test.xls',{'45 deg'},'Correlation','D1');
    xlswrite('test.xls',{'90 deg'},'Correlation','E1');
    xlswrite('test.xls',{'135 deg'},'Correlation','F1');
    xlswrite('test.xls',{'0 deg'},'Energy','C1');
    xlswrite('test.xls',{'45 deg'},'Energy','D1');
    xlswrite('test.xls',{'90 deg'},'Energy','E1');
    xlswrite('test.xls',{'135 deg'},'Energy','F1');
    xlswrite('test.xls',{'0 deg'},'Homogeneity','C1');
    xlswrite('test.xls',{'45 deg'},'Homogeneity','D1');
    xlswrite('test.xls',{'90 deg'},'Homogeneity','E1');
    xlswrite('test.xls',{'135 deg'},'Homogeneity','F1');
    xlswrite('test.xls',{'VarRh'},'MRFvar','C1');
    xlswrite('test.xls',{'VarRv'},'MRFvar','D1');
    xlswrite('test.xls',{'VarRld'},'MRFvar','E1');
    xlswrite('test.xls',{'VarRrd'},'MRFvar','F1');
    xlswrite('test.xls',{'MeanRh'},'MRFmean','C1');
    xlswrite('test.xls',{'MeanRv'},'MRFmean','D1');
    xlswrite('test.xls',{'MeanRld'},'MRFmean','E1');
    xlswrite('test.xls',{'MeanRrd'},'MRFmean','F1');
    xlswrite('test.xls',{'ymin','ymax','xmin','xmax'},'Info','A1');
    xlswrite('test.xls',{'Path'},'Info','E1');
    
end
[m,n]=size(columnB);

Main_gui(I,A,m);

xlswrite('test.xls',{input2},'Patient',strcat('A',num2str(m+2)));
xlswrite('test.xls',{input3},'Patient',strcat('B',num2str(m+2)));
xlswrite('test.xls',{input4},'Patient',strcat('C',num2str(m+2)));
xlswrite('test.xls',{input5},'Patient',strcat('D',num2str(m+2)));
xlswrite('test.xls',A,'Info',strcat('A',num2str(m+2)));
xlswrite('test.xls',{FullName},'Info',strcat('E',num2str(m+2)));

set(handles.edit7,'Enable','on');


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton4,'Enable','on');
% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton4,'Enable','off');
set(handles.edit7,'enable','off');
set(handles.uipushtool1,'enable','off');
set(handles.pushbutton3,'Enable','off');
set(handles.pushbutton2,'enable','off');
set(handles.edit2,'Enable','off');
set(handles.edit3,'Enable','off');
set(handles.edit4,'Enable','off');
set(handles.edit5,'Enable','off');

FullName=handles.FullName;

input2=str2num(get(handles.edit7,'String'));
    cla(handles.axes1);
    I=imread(FullName,input2);
    imshow(I);
 hold on;
[x1,y1]=ginput(1);
plot(x1,y1,'r+'); 
[x2,y2]=ginput(1);
plot(x2,y2,'r+');
A={min(y1,y2),max(y1,y2),min(x1,x2),max(x1,x2)};
x = [A{3},A{4},A{4},A{3},A{3}]; y = [A{1},A{1},A{2},A{2},A{1}]; plot(x,y,'r-');

handles.A=A;
handles.I=I;

set(handles.uipushtool1,'enable','on');
set(handles.pushbutton2,'enable','on');
set(handles.pushbutton3,'enable','on');
set(handles.edit7,'enable','on');
guidata(gcbo,handles);



% --------------------------------------------------------------------
