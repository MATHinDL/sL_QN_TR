%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________
function [total_number,number_of_parameters_per_layer] = find_num_parameters(dlnet)
layers = dlnet.Learnables.Value;
num_layers = size(layers,1);
total_number = 0;
for i = 1:num_layers
   n =  prod(size(layers{i}));
   number_of_parameters_per_layer(i) = n;
   total_number = total_number + parameter_number;
end
end