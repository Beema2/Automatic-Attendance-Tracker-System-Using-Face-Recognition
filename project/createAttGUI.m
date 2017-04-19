function varargout = createAttGUI(varargin)

% CREATEATTGUI MATLAB code for createAttGUI.fig
%      CREATEATTGUI, by itself, creates a new CREATEATTGUI or raises the existing
%      singleton*.
%
%      H = CREATEATTGUI returns the handle to a new CREATEATTGUI or the handle to
%      the existing singleton*.
%
%      CREATEATTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATEATTGUI.M with the given input arguments.
%
%      CREATEATTGUI('Property','Value',...) creates a new CREATEATTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before createAttGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to createAttGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help createAttGUI

% Last Modified by GUIDE v2.5 17-Apr-2017 21:06:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @createAttGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @createAttGUI_OutputFcn, ...
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


% --- Executes just before createAttGUI is made visible.
function createAttGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to createAttGUI (see VARARGIN)

% Choose default command line output for createAttGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes createAttGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = createAttGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = get(handles.popupmenu1,'Value');
switch contents
    case 1   
        folderName = 'C:\Users\Beema Thangarani\project\1A';
        mkdir(folderName);  
    case 2  
        folderName = 'C:\Users\Beema Thangarani\project\1B';
        mkdir(folderName); 
    case 3
        folderName = 'C:\Users\Beema Thangarani\project\2A';
        mkdir(folderName); 
    case 4    
        folderName = 'C:\Users\Beema Thangarani\project\2B';
        mkdir(folderName); 
    case 5   
        folderName = 'C:\Users\Beema Thangarani\project\3A';
        mkdir(folderName); 
    case 6    
        folderName = 'C:\Users\Beema Thangarani\project\3B';
        mkdir(folderName); 
    case 7    
        folderName = 'C:\Users\Beema Thangarani\project\4A';
        mkdir(folderName); 
    case 8    
        folderName = 'C:\Users\Beema Thangarani\project\4B';
        mkdir(folderName); 
    case 9    
        folderName = 'C:\Users\Beema Thangarani\project\5A';
        mkdir(folderName); 
    case 10
        folderName = 'C:\Users\Beema Thangarani\project\5B';
        mkdir(folderName);
    case 11    
        folderName = 'C:\Users\Beema Thangarani\project\6A';
        mkdir(folderName); 
    case 12
        folderName = 'C:\Users\Beema Thangarani\project\6B';
         mkdir(folderName); 
    case 13    
        folderName = 'C:\Users\Beema Thangarani\project\7A';
        mkdir(folderName); 
    case 14
        folderName = 'C:\Users\Beema Thangarani\project\7B';
        mkdir(folderName); 
    case 15    
        folderName = 'C:\Users\Beema Thangarani\project\8A';
        mkdir(folderName); 
    case 16
        folderName = 'C:\Users\Beema Thangarani\project\8B';
        mkdir(folderName); 
    otherwise
     
        
end
cls = getCurrentPopupString(handles.popupmenu1);
%var1 = folderName;
%setappdata(handles.figure1,var1,'Value');
setappdata(0,'evalue',folderName);
setappdata(0,'cvalue',cls);
addStudents;

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

% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
