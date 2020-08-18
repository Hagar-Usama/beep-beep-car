function varargout = beep_beep_visualizer(varargin)
% BEEP_BEEP_VISUALIZER MATLAB code for beep_beep_visualizer.fig
%      BEEP_BEEP_VISUALIZER, by itself, creates a new BEEP_BEEP_VISUALIZER or raises the existing
%      singleton*.
%
%      H = BEEP_BEEP_VISUALIZER returns the handle to a new BEEP_BEEP_VISUALIZER or the handle to
%      the existing singleton*.
%
%      BEEP_BEEP_VISUALIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEEP_BEEP_VISUALIZER.M with the given input arguments.
%
%      BEEP_BEEP_VISUALIZER('Property','Value',...) creates a new BEEP_BEEP_VISUALIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before beep_beep_visualizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to beep_beep_visualizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help beep_beep_visualizer

% Last Modified by GUIDE v2.5 18-Aug-2020 06:49:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @beep_beep_visualizer_OpeningFcn, ...
                   'gui_OutputFcn',  @beep_beep_visualizer_OutputFcn, ...
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

global s
global flag

global y1 y2 y3 y4 t1 t2 t3 t4



% --- Executes just before beep_beep_visualizer is made visible.
function beep_beep_visualizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to beep_beep_visualizer (see VARARGIN)

% Choose default command line output for beep_beep_visualizer

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using beep_beep_visualizer.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes beep_beep_visualizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = beep_beep_visualizer_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

function SelectPath_Callback(handles)
global y1 y2 y3 y4 t1 
legend1 = get(handles.legend1_value,'String');
legend2 = get(handles.legend2_value,'String');
legend3 = get(handles.legend3_value,'String');
legend4 = get(handles.legend4_value,'String');
legends = {legend1; legend2; legend3; legend4; 'time'};
selpath = uigetdir;
file_name = get(handles.csv_value,'String');
file_name = strcat(file_name, '.csv');
file_path = fullfile(selpath, file_name);
fid = fopen(file_path, 'w');
for i=1: length(legends)
    fprintf(fid, '%s\t',legends{i});
end
    fprintf(fid, '\n');

for j=1:length(y1)
        fprintf(fid, '%g\t%g\t%g\t%g\t%g\n',y1(j),y2(j), y3(j), y4(j), t1(j));
end    
fclose(fid);
%writematrix([y1;y2;y3;y4]', file_path)
% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});



function legend1_value_Callback(hObject, eventdata, handles)
% hObject    handle to legend1_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of legend1_value as text
%        str2double(get(hObject,'String')) returns contents of legend1_value as a double


% --- Executes during object creation, after setting all properties.
function legend1_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to legend1_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function legend2_value_Callback(hObject, eventdata, handles)
% hObject    handle to legend2_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of legend2_value as text
%        str2double(get(hObject,'String')) returns contents of legend2_value as a double


% --- Executes during object creation, after setting all properties.
function legend2_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to legend2_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function legend3_value_Callback(hObject, eventdata, handles)
% hObject    handle to legend3_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of legend3_value as text
%        str2double(get(hObject,'String')) returns contents of legend3_value as a double


% --- Executes during object creation, after setting all properties.
function legend3_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to legend3_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function legend4_value_Callback(hObject, eventdata, handles)
% hObject    handle to legend4_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of legend4_value as text
%        str2double(get(hObject,'String')) returns contents of legend4_value as a double


% --- Executes during object creation, after setting all properties.
function legend4_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to legend4_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function csv_value_Callback(hObject, eventdata, handles)
% hObject    handle to csv_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of csv_value as text
%        str2double(get(hObject,'String')) returns contents of csv_value as a double


% --- Executes during object creation, after setting all properties.
function csv_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to csv_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in csv_btn.
function csv_btn_Callback(hObject, eventdata, handles)
% hObject    handle to csv_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SelectPath_Callback(handles);

% --- Executes on selection change in port_menu.
function port_menu_Callback(hObject, eventdata, handles)
% hObject    handle to port_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns port_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from port_menu
set(handles.port_menu,'String', seriallist);


% --- Executes during object creation, after setting all properties.
function port_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to port_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    %add available serial ports
end



function baud_rate_Callback(hObject, eventdata, handles)
% hObject    handle to baud_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of baud_rate as text
%        str2double(get(hObject,'String')) returns contents of baud_rate as a double



% --- Executes during object creation, after setting all properties.
function baud_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baud_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in serial_btn.
function serial_btn_Callback(hObject, eventdata, handles)
% hObject    handle to serial_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
com_port_index = get(handles.port_menu,'Value');
items = get(handles.port_menu,'String');
try
com_port = items{com_port_index};
catch
    com_port = items;
end
try
    baud_rate = str2double(get(handles.baud_rate, 'String'));
catch
    baud_rate = 9600;
end
set_serial_port(com_port, baud_rate);

% sets the serial port to initialize the communication
function set_serial_port(COM_Port, baud_rate)
global s;
s = serialport(COM_Port, baud_rate);


function [t,x] = get_sensor_value(s)
     x = get_next(s);
     t = get_next(s);


function x = get_next(s)
    x = str2double(regexprep(readline(s),'\s+',''));

function plot_data(x1,y1,x2,y2,x3,y3,x4,y4)
        subplot(4,1,1);
        plot(x1,y1);
        subplot(4,1,2);
        plot(x2,y2)
        subplot(4,1,3);
        plot(x3,y3)
        subplot(4,1,4);
        plot(x4,y4)

function decode_serial_data()
global s
x = regexprep(readline(s),'\s+','');
global y1 y2 y3 y4 t1 t2 t3 t4
    if (contains(x,'@'))
        % start
        [t,x]  = get_sensor_value(s);
        y1 = [y1 x];
        t1 = [t1 t];
        [t,x]  = get_sensor_value(s);
        y2 = [y2 x];
        t2 = [t2 t];
        [t,x]  = get_sensor_value(s);
        y3 = [y3 x];
        t3 = [t3 t];
        [t,x]  = get_sensor_value(s);
        y4 = [y4 x];
        t4 = [t4 t];
        plot_data(t1,y1,t2,y2,t3,y3,t4,y4)
    end
    
    
    

% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%disp("motion")


% --- Executes on scroll wheel click while the figure is in focus.
function figure1_WindowScrollWheelFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	VerticalScrollCount: signed integer indicating direction and number of clicks
%	VerticalScrollAmount: number of lines scrolled for each click
% handles    structure with handles and user data (see GUIDATA)


function set_sensor_labels(handles)
global y1 y2 y3 y4
try
set(handles.sensor1_value, 'String', y1(end));
set(handles.sensor2_value, 'String', y2(end));
set(handles.sensor3_value, 'String', y3(end));
set(handles.sensor4_value, 'String', y4(end));
catch
%%TODO show bug
end
% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
switch eventdata.Key
    case 'p'
        while(get(handles.run_radio_btn,'Value'))
            decode_serial_data()
            set_sensor_labels(handles);
        end
end



% --- Executes on button press in run_radio_btn.
function run_radio_btn_Callback(hObject, eventdata, handles)
% hObject    handle to run_radio_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%get(hObject,'Value')
% Hint: get(hObject,'Value') returns toggle state of run_radio_btn
