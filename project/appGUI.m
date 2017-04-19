function varargout = appGUI(varargin)
hfig = figure();
setappdata(hfig,'directoryPath','');
% APPGUI MATLAB code for appGUI.fig
%      APPGUI, by itself, creates a new APPGUI or raises the existing
%      singleton*.
%
%      H = APPGUI returns the handle to a new APPGUI or the handle to
%      the existing singleton*.
%
%      APPGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPGUI.M with the given input arguments.
%
%      APPGUI('Property','Value',...) creates a new APPGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before appGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to appGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help appGUI

% Last Modified by GUIDE v2.5 14-Apr-2017 15:38:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @appGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @appGUI_OutputFcn, ...
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


% --- Executes just before appGUI is made visible.
function appGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to appGUI (see VARARGIN)

% Choose default command line output for appGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes appGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = appGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu_Tag.
function menu_Tag_Callback(hObject, eventdata, handles)
% hObject    handle to menu_Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_Tag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_Tag


% --- Executes during object creation, after setting all properties.
function menu_Tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function date_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to date_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of date_Edit as text
%        str2double(get(hObject,'String')) returns contents of date_Edit as a double


% --- Executes during object creation, after setting all properties.
function date_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in choose_Button.
function choose_Button_Callback(hObject, eventdata, handles)
% hObject    handle to choose_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Create a UICALENDAR with the following properties:  
% 1) Highlight weekend dates.  
% 2) Only allow a single date to be selected at a time.  
% 3) Send the selected date to the edit box uicontrol.  
uicalendar('Weekend', [1 0 0 0 0 0 1], ...  
'SelectionType', 1, ...  
'DestinationUI', handles.date_Edit);


% --- Executes on button press in browse_Button.
function browse_Button_Callback(hObject, eventdata, handles)
% hObject    handle to browse_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 %   Two persistent varables are needed
        persistent StartPicDirectory hImageAxes
        
    %   Initilize the StartPicDirectory if first time through
        if isempty(StartPicDirectory)
            StartPicDirectory = cd;
        end
    
    %   Get the file name from the user
        [PicNameWithTag, PicDirectory] = uigetfile({'*.jpg;*.tif;*.png','Image Files'},...
            'Select an image file',StartPicDirectory);

        if PicNameWithTag == 0,
            %   If User canceles then display error message
                errordlg('You should select an Image File');
            return
        end
        
    %   Set the default directory to the currently selected directory
        StartPicDirectory = PicDirectory;

    %   Build path to file
        PicFilePath = strcat(PicDirectory,PicNameWithTag);
            
    %   Load the image
        InitPicRGB = imread(PicFilePath);
        set(handles.browse_EditTag,'String',PicFilePath);
        disp(PicFilePath);
        setappdata(hObject.Parent,'directoryPath',PicFilePath);
        figure; imshow(InitPicRGB);


% --- Executes on button press in detect_Button.
function detect_Button_Callback(hObject, eventdata, handles)
% hObject    handle to detect_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in attendance_Button.
function attendance_Button_Callback(hObject, eventdata, handles)
% hObject    handle to attendance_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryPath = getappdata(hObject.Parent,'directoryPath');
faceCrop(directoryPath);
cls = getCurrentPopupString(handles.menu_Tag);
folderPath = 'C:\Users\Beema Thangarani\project\students';
folderPath = strcat(folderPath,cls);
setappdata(0,'dvalue',folderPath);
FaceRecognition;

function str = getCurrentPopupString(hh)
%# getCurrentPopupString returns the currently selected string in the popupmenu with handle hh

%# could test input here
if ~ishandle(hh) || strcmp(get(hh,'Type'),'popupmenu')
error('getCurrentPopupString needs a handle to a popupmenu as input')
end

%# get the string - do it the readable way
list = get(hh,'String');
val = get(hh,'Value');
if iscell(list)
   str = list{val};
else
   str = list(val,:);
end


function browse_EditTag_Callback(hObject, eventdata, handles)
% hObject    handle to browse_EditTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of browse_EditTag as text
%        str2double(get(hObject,'String')) returns contents of browse_EditTag as a double


% --- Executes during object creation, after setting all properties.
function browse_EditTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to browse_EditTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
