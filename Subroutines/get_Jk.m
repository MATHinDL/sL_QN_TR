%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
% This code should be modified later to be more optimal.
%_________________________________________________________________
% 
% This program create multi-batches with one of following properties:
% Batch (J_k) formation:
% (1) os(overlap size) is NOT a multiple of N (number of samples)
%  ____________________
% |___set1___|__set2___|
%             __________________
%            |___set1__|__set2__|
%                       _________________________
%                      |__set1__|__mid__|__set2__|  end of first epoch
%                                        _________________
%                                       |__set1__|__set2__| new epoch

% 
%(2) os(overlap size) is a multiple of N (number of samples)
%  ____________________
% |___set1___|__set2___|
%             __________________
%            |___set1__|__set2__|
%                       __________________
%                      |___set1__|__set2__|     end of first epoch
%                                 __________________
%                                |___set1__|__set2__|     new epoch


function [XTrain_set1, YTrain_set1, XTrain_set2, YTrain_set2, XTrain_mid, YTrain_mid, shuffel_index] =...
    get_Jk(k, Nb, rsremainSize, overSize, num_of_data, XTrain, YTrain, shuffel_index)

executionEnvironment = "auto";

if mod( k+1, Nb )~= 0
    rangeSet1     = [mod(k,Nb)     , mod(k,Nb) + 1];
    rangeSet2     = [mod(k,Nb) + 1 , mod(k,Nb) + 2];
    
    
    indexSet1     = shuffel_index( rangeSet1(1)*overSize + 1 : rangeSet1(2)*overSize );
    indexSet2     = shuffel_index( rangeSet2(1)*overSize + 1 : rangeSet2(2)*overSize );
    
    
    XTrain_set1   = XTrain(:,:,:,indexSet1);
    XTrain_set1   = dlarray(single(XTrain_set1),'SSCB');
    if (executionEnvironment == "auto" && canUseGPU) || executionEnvironment == "gpu"
        XTrain_set1 = gpuArray(XTrain_set1);
    end
    YTrain_set1   = YTrain(:,indexSet1);
    
    XTrain_mid = [];
    YTrain_mid = [];
    
    XTrain_set2   = XTrain(:,:,:,indexSet2);
    XTrain_set2   = dlarray(single(XTrain_set2),'SSCB');
    if (executionEnvironment == "auto" && canUseGPU) || executionEnvironment == "gpu"
        XTrain_set2 = gpuArray(XTrain_set2);
    end
    YTrain_set2   = YTrain(:,indexSet2); 
    
else % mod( k+1, Nb )== 0
    
    if rsremainSize == 0 %  2taei
        
        rangeSet1     = [mod(k,Nb)     , mod(k,Nb) + 1];
        rangeSet2     = [mod(k,Nb) + 1 , mod(k,Nb) + 2];
        
        indexSet1     = shuffel_index( rangeSet1(1)*overSize + 1 : rangeSet1(2)*overSize );
        indexSet2     = shuffel_index( rangeSet2(1)*overSize + 1 : rangeSet2(2)*overSize );
        
        XTrain_set1   = XTrain(:,:,:,indexSet1);
        XTrain_set1   = dlarray(single(XTrain_set1),'SSCB');
        if (executionEnvironment == "auto" && canUseGPU) || executionEnvironment == "gpu"
            XTrain_set1 = gpuArray(XTrain_set1);
        end
        YTrain_set1   = YTrain(:,indexSet1);
        
        XTrain_mid   = [];
        YTrain_mid   = [];
        
        XTrain_set2   = XTrain(:,:,:,indexSet2);
        XTrain_set2   = dlarray(single(XTrain_set2),'SSCB');
        if (executionEnvironment == "auto" && canUseGPU) || executionEnvironment == "gpu"
            XTrain_set2 = gpuArray(XTrain_set2);
        end
        YTrain_set2   = YTrain(:,indexSet2);
        
    else % 3taei
        
        rangeSet1     = [mod(k,Nb)     , mod(k,Nb) + 1];
        rangeSet2     = [mod(k,Nb) + 1 , mod(k,Nb) + 2];
        
        indexSet1     = shuffel_index( rangeSet1(1)*overSize                + 1  : rangeSet1(2)*overSize );
        indexSet3     = shuffel_index( rangeSet2(1)*overSize                + 1  : rangeSet2(1)*overSize +  rsremainSize);
        indexSet2     = shuffel_index( rangeSet2(1)*overSize + rsremainSize + 1  : end );
        
        XTrain_set1   = XTrain(:,:,:,indexSet1);
        XTrain_set1   = dlarray(single(XTrain_set1),'SSCB');
        if (executionEnvironment == "auto" && canUseGPU) || executionEnvironment == "gpu"
            XTrain_set1 = gpuArray(XTrain_set1);
        end
        YTrain_set1   = YTrain(:,indexSet1);
        
        XTrain_mid    = XTrain(:,:,:,indexSet3);
        XTrain_mid   = dlarray(single(XTrain_mid),'SSCB');
        if (executionEnvironment == "auto" && canUseGPU) || executionEnvironment == "gpu"
            XTrain_mid = gpuArray(XTrain_mid);
        end
        YTrain_mid    = YTrain(:,indexSet3);
        
        XTrain_set2   = XTrain(:,:,:,indexSet2);
        XTrain_set2   = dlarray(single(XTrain_set2),'SSCB');
        if (executionEnvironment == "auto" && canUseGPU) || executionEnvironment == "gpu"
            XTrain_set2 = gpuArray(XTrain_set2);
        end
        YTrain_set2   = YTrain(:,indexSet2);
        
    end
    %
    % --> SHUFFLING
    %
    
    fprintf('\n Shuffeling....\n')
    
    % new shuffle:
    last_indexes           = indexSet2;
    shuffel_index          = randperm( num_of_data );
    
    % reordering new shuffle:
    place_of_last_indexes = [];
    for j = 1: overSize
        p = find( shuffel_index == last_indexes(j) );
        place_of_last_indexes = [place_of_last_indexes, p];
    end
    
    shuffel_index(:,place_of_last_indexes) = [];
    shuffel_index                          = [last_indexes, shuffel_index];
    
end

end
