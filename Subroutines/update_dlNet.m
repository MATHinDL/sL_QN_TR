%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________
% 
% Create a new dlNet with current properties (layers, state, Learnables, ...)

function dlNet_new = update_dlNet(dlNet, layeredVec)

dlNet_new     = dlNet;    
num_of_Layers = size( dlNet.Learnables, 1 );
for layer = 1: num_of_Layers           % Update only Learnables property
    dlNet_new.Learnables.Value{layer, 1} = dlNet.Learnables.Value{layer,1} + layeredVec.Value{layer,1};
end
end

