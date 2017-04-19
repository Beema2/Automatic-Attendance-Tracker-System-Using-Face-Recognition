function varargout = addStudents(varargin)
 
 
% ADDSTUDENTS MATLAB code for addStudents.fig
%      ADDSTUDENTS, by itself, creates a new ADDSTUDENTS or raises the existing
%      singleton*.
%
%      H = ADDSTUDENTS returns the handle to a new ADDSTUDENTS or the handle to
%      the existing singleton*.
%
%      ADDSTUDENTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADDSTUDENTS.M with the given input arguments.
%
%      ADDSTUDENTS('Property','Value',...) creates a new ADDSTUDENTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before addStudents_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to addStudents_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help addStudents

% Last Modified by GUIDE v2.5 17-Apr-2017 21:38:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @addStudents_OpeningFcn, ...
                   'gui_OutputFcn',  @addStudents_OutputFcn, ...
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


% --- Executes just before addStudents is made visible.
function addStudents_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to addStudents (see VARARGIN)

% Choose default command line output for addStudents
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes addStudents wait for user response (see UIRESUME)
% uiwait(handles.figure2);


% --- Outputs from this function are returned to the command line.
function varargout = addStudents_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%   Two persistent varables are needed
% get the handle of Gui1
 
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
        a = getappdata(0,'evalue');
    %   Load the image
        name = get(handles.edit1,'String');
        disp(PicFilePath);
        disp(a);
        disp(name);
        myFolder = [a '\' name];
        mkdir(myFolder);
        disp(myFolder);
        copyfile(PicFilePath,myFolder);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    c = getappdata(0,'cvalue');
    a = getappdata(0,'evalue');
    subfolderFaceCrop(a,c);
