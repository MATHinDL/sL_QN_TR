%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________
% 
% Create a table whose values are the elements of vec

function layeredVec = vec_2_table(dlNet, vec)

end_array     = 0;
num_of_layers = size( dlNet.Learnables, 1 );
layeredVec    = dlNet.Learnables; % a table

for layer = 1: num_of_layers 
    layer_size                 = size( dlNet.Learnables.Value{layer,1} );
    layer_length               = prod(layer_size);
    start_array                = end_array + 1;
    end_array                  = end_array + layer_length;
    vec_segment                = vec(start_array : end_array);
    layer_tensor               = reshape(vec_segment, layer_size);
    layer_tensor_to_dlarray    = dlarray(single(layer_tensor));
    layeredVec.Value{layer, 1} = layer_tensor_to_dlarray; 
end

end