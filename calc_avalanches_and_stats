%% PRIMER FOR AVALANCHE DETECTION -- SET UP ARRAY AND PLACE ONES FOR BINS WITH ACTIVITY 
PVTC = zeros(length(coarse_array), k_range*2);
k = 1;
ii = 1;
i = 1;
for k = 1:k_range
    PVTC(:,ii) = 1:length(PVTC);
    PVTC(:,ii+1) = coarse_array(k, 1:length(coarse_array)); % place row vector, for specific k, in as column to PVTC
    ContBin = find(PVTC(:,ii+1) > 0); % find bins with activity 
    PVTC(:,ii+2) = 0; % fill column with zeros 
    PVTC(ContBin, ii+2) = 1; % place the timebins corresponding to activity next to LFP values as 1
    ii = ii + 3;
end

%% CONCATENATE BINS TO GET ACTUAL AVALANCHES 
Aval = [];
frames = length(PVTC);
i= 1;
iii = 1;
n = 1;
for k = 1:k_range
    while i<=frames % cycles through each row in PVTC 
        if PVTC(i, iii+2) == 1 & PVTC(i+1, iii+2) == 1 % determine whether or not two consecutive bins have activity
            I=PVTC(i,iii); % reads ith row and first column (time bin number) per set of three 
            T=1; % initiate avalanche duration counter 
            S=PVTC(i,iii+1); % reads ith row and the second column (LFP value) per set of three
            ii=2; 
            while (i+ii<frames) & PVTC(i+ii,iii+2)==1
                T=T+1; % gets the duration of avalanche
                S=S+PVTC(i+ii,iii+1); % gets the size of avalanche
                ii=ii+1;
            end
            AvalInd = full([I T, S]); 
            Aval(n, iii:iii+2) = AvalInd; % place the information for the avalanche in the set of three columns
            i = i+ii; % goes to next row where avalanche ended 
            n = n + 1; % goes to next row in avalanche array
        else
           i = i+1; 
        end
    end
    % resets folloring variables for next coarse graining factor (k)
    i = 1;
    iii = iii + 3;
    n = 1;
end

%% SORT AVALANCHES BASED ON DURATION VALUE AND CALC STATS
k = 1;
iii = 1;
AvalStats = [];
for k = 1:k_range
    Aval_Portion = Aval(:,iii:iii+2);
    AvalSort = sortrows(Aval_Portion,2);  %sort according to duration
    border_of_zeros = max(find(AvalSort(:,2) == 0)); 
    AvalSort([1:border_of_zeros],:) = [];
    
    borders = [1 ; find(diff(AvalSort(:,2))>0)]; % subtracts duration for time bin from previous one 
    for j=1:length(borders)-1
        avalTSz = [j mean(AvalSort([borders(j):borders(j+1)],3)) ...
                 std(AvalSort([borders(j):borders(j+1)],3))];
        AvalStats(n, iii:iii+2) = avalTSz;
        n = n + 1;
    end
    n = 1;
    iii = iii + 3;
    Aval_Portion = [];
end
