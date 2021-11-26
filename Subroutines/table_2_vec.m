%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________
% 
% Create a vectore whose elements are the values of the table layeredVec
% - if we need w as parameters: layeredVec = dlnet.Learnables (table)
% - if we need g as gradients : layeredVec = gradients (table)

function vec = table_2_vec(layeredVec)
vec   = [];
for layer   = 1: size(layeredVec,1)
    Val     = double( gather( extractdata( layeredVec.Value{layer,1} )));
    vec     = [vec; Val(:)]; 
end
end




