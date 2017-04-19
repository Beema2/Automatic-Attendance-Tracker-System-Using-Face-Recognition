%% Face Recognition 
clc;
directory = getappdata(0,'dvalue');
disp(directory);

%% Read Face Gallery
faceGallery = imageSet(directory, 'recursive');
galleryNames = {faceGallery.Description};
displayFaceGallery(faceGallery,galleryNames);

%% Create HoG training features from face gallery
trainingFeatures = zeros(19,10404);
featureCount = 1;

for i=1:size(faceGallery,2)
    for j = 1:faceGallery(i).Count
        sizeNormalizedImage = imresize(rgb2gray(read(faceGallery(i),j)),[150 150]);
        trainingFeatures(featureCount,:) = extractHOGFeatures(sizeNormalizedImage);
        trainingLabel{featureCount} = faceGallery(i).Description;    
        featureCount = featureCount + 1;
    end
    personIndex{i} = faceGallery(i).Description;
end

%% Create Classifier 
faceClassifier = fitcecoc(trainingFeatures,trainingLabel);

%% Read test data
testSet = imageSet('Faces');
figure;
figureNum = 1;
n = testSet.Count;
sheet = 'Excel';
for i = 1 : n
    queryImage = read(testSet,i);
    sizeNormalizedImage = imresize(rgb2gray(queryImage),[150 150]);
    queryFeatures = extractHOGFeatures(sizeNormalizedImage);
    personLabel = predict(faceClassifier,queryFeatures);
    booleanIndex = strcmp(personLabel, personIndex);
    integerIndex = find(booleanIndex);
    name = galleryNames(integerIndex);
    subplot(n,2,figureNum);imshow(queryImage);
    present = [name 'present'];
    subplot(n,2,figureNum+1);imshow(imresize(read(faceGallery(integerIndex),1),3));disp(present);
    filename = 'attendanceReport.xlsx';
    range = sprintf('A%i', i);
    xlswrite(filename, present , sheet, range);
    figureNum = figureNum+2;
   
    
end