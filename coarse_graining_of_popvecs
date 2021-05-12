%% COMBINE POP VECTORS FOR TIME BINS BASED ON K (COARSE GRAINING FACTOR) VALUE 
k_range = 10;
coarse_array = zeros(k_range, length(PopVecThr));
k = 1;
for k = 1:k_range
    remainder1 = length(PopVecThr) ./ k;
    remainder2 = 1-(remainder1 - floor(remainder1));
    bins_2_be_added = remainder2 * k; % number of bins added for vector to have even split 

    PopVecThr_Coarse = PopVecThr(:,2)'; % only gets the pop vector values from the original
    PopVecThr_Coarse(end:end+bins_2_be_added) = NaN; % add proper number of 0 so that can reshape can be done properly 
    reshaped_pop_vectors = (reshape(PopVecThr_Coarse', [k, length(PopVecThr_Coarse) ./ k]))'; % splits the pop vec values to rows, each one with k number values 
    new_pop_vectors_coarse_grained = sum(reshaped_pop_vectors, 2)'; % sums each row that was split from overall vector
    
    coarse_array(k, 1:length(new_pop_vectors_coarse_grained)) = new_pop_vectors_coarse_grained(1:end); 
    PopVecThr_Coarse = [];
end
