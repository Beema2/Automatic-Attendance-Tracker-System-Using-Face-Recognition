function faceCrop(directoryPath)

clc;
%Detect objects using Viola-Jones Algorithm

%To detect Face
FaceDetect = vision.CascadeObjectDetector;
%if(directoryPath = ' ')
 %   warndlg('Choose an Image File to Mark Attendance');
%else 
%Read the input image
I = imread(directoryPath);
%scaleFactor = 150/size(I, 1); 
%I = imresize(I, scaleFactor); 

%Returns Bounding Box values based on number of objects

figure(1);
imshow(I);
     
BB = step(FaceDetect,I);
figure(2),imshow(I);

 for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',3,'LineStyle','-  ','EdgeColor','r');
 end
 for i = 1:size(BB,1)
 J= imcrop(I,BB(i,:));
 figure(3),subplot(5,5,i);imshow(J);
 folder = 'C:\Users\Beema Thangarani\project\Faces\';
 newimagename = [folder 'image_' num2str(i) '.jpg'];
 imwrite(J,newimagename)
 end
%end
end
 
