function [XTrain, yTrain, XTest, yTest] = loadDataCifar10
addpath([matlabroot,'/examples','/deeplearning_shared','/main']);
[trainingImages, yTrain, testImages, yTest] = helperCIFAR10Data.load('Cifar10Data');

XTrain    = double(trainingImages)./255;
XTest     = double(testImages)./255;

end

%figure
%thumbnails = trainingImages(:,:,:,1:5);
%montage(thumbnails)



% function y_ = Find_label(y)
% 	  y_ = zeros(size(y, 1), size(y, 2));                                                           % Initialize new labels, same size as input labels
% 
% 	  for i = 1:length(y)                                                                         
% 	      current = y(i);                                                               
% 	      switch current                                                                        
% 	          case "airplane"                                                               
% 	              y_(i) = 0;
% 	          case "automobile"                                                                
% 	              y_(i) = 1;
% 	          case "bird"                                                  
% 	              y_(i) = 2;
% 	          case "cat"                                                                           
% 	              y_(i) = 3;
% 	          case "deer"   
% 	              y_(i) = 4;
% 	          case "dog"           
% 	              y_(i) = 5;
% 	          case "frog"                                               
% 	              y_(i) = 6;
% 	          case "horse"                                                                      
% 	              y_(i) = 7;
% 	          case "ship"                                                                          
% 	              y_(i) = 8;
% 	          case "truck"                                                                          
% 	              y_(i) = 9;
% 	      end
% 	  end
% end
