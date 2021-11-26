function [XTrain,YTrain, XTest, YTest] = loadData_FashionMnist()
TrainimageFileName = 'train-images-idx3-ubyte';
TrainlabelFileName = 'train-labels-idx1-ubyte';
TestimageFileName = 't10k-images-idx3-ubyte';
TestlabelFileName = 't10k-labels-idx1-ubyte';

[XTrain,YTrain] = processFashionMNISTdata(TrainimageFileName,TrainlabelFileName);
[XTest,YTest] = processFashionMNISTdata(TestimageFileName,TestlabelFileName);

end


% I add following line:
% L_category = categorical(L_category);
%_____________________________________________

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Process fashion MNIST data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [X,L_category] = processFashionMNISTdata(imageFileName,labelFileName)
class_names = {'T-shirt/top', 'Trouser', 'Pullover', 'Dress', 'Coat', ...
               'Sandal', 'Shirt', 'Sneaker', 'Bag', 'Ankle boot'};
[fileID,errmsg] = fopen(imageFileName,'r','b');
if fileID < 0
    error(errmsg);
end
%%
% First read the magic number. This number is 2051 for image data, and
% 2049 for label data
magicNum = fread(fileID,1,'int32',0,'b');
if magicNum == 2051
    fprintf('\nRead MNIST image data...\n')
end
%%
% Then read the number of images, number of rows, and number of columns
numImages = fread(fileID,1,'int32',0,'b');
fprintf('Number of images in the dataset: %6d ...\n',numImages);
numRows = fread(fileID,1,'int32',0,'b');
numCols = fread(fileID,1,'int32',0,'b');
fprintf('Each image is of %2d by %2d pixels...\n',numRows,numCols);
%%
% Read the image data
X = fread(fileID,inf,'unsigned char');
%%
% Reshape the data to array X
X = reshape(X,numCols,numRows,1,numImages);
X = permute(X,[2 1 3 4]);
X = X./255;
%%
% Then flatten each image data into a 1 by (numRows*numCols) vector, and 
% store all the image data into a numImages by (numRows*numCols) array.
% X = reshape(X,numRows*numCols,numImages)';
fprintf(['The image data is read to a matrix of dimensions: %6d by %4d...\n',...
    'End of reading image data.\n'],size(X,1),size(X,2));
%%
% Close the file
fclose(fileID);
%%
% Similarly, read the label data.
[fileID,errmsg] = fopen(labelFileName,'r','b');
if fileID < 0
    error(errmsg);
end
magicNum = fread(fileID,1,'int32',0,'b');
if magicNum == 2049
    fprintf('\nRead MNIST label data...\n')
end
numItems = fread(fileID,1,'int32',0,'b');
fprintf('Number of labels in the dataset: %6d ...\n',numItems);
L = fread(fileID,inf,'unsigned char');
L_category=cell(numel(L),1);
for i=1:numel(L)
    L_category{i}=class_names{L(i)+1};
end
%
L_category = categorical(L_category);
%
fprintf(['The label data is read to a matrix of dimensions: %6d by %2d...\n',...
    'End of reading label data.\n'],size(L,1),size(L,2));
fclose(fileID);
end
