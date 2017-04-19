img = imread('a.jpg');
sizeNormalizedImage = imresize(rgb2gray(img),[150 150]);
[hogFeature, visualization]= ...
    extractHOGFeatures(sizeNormalizedImage);
figure;
subplot(2,1,1);imshow(img);title('Input Face');
subplot(2,1,2);plot(visualization);title('HoG Feature');