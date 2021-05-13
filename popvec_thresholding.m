%% GET THE ABSOLUTE POPULATION VECTORS FOR EACH TIME BIN 
[tmax, c] = size(RASTER);
PopVec = [[1:tmax]' abs(sum(RASTER,2))]; % absolute pop vector - in the second column of PopVec, it is the sum of 
                                         % all elements in each row
PopVecMax = max(PopVec(:,2));

% check pop value distribution
nbins = 100;
[N, edges] = histcounts(PopVec(:,2),nbins);
figure; plot(log10(edges(2:nbins+1)), log10(N),'o-');
title(raster_file_name)
xlabel('PopVec value (uV)')
ylabel('P(s)')

%% THRESHOLD THE TOTAL POPULATION ACTIVITY (POP VECTOR) FOR EACH TIMEBIN 
threshold_min = 0.01;
threshold_max = 0.5;
threshold_resolution = 10;

threshold_jump = (threshold_max - threshold_min) / threshold_resolution;
FracThr = threshold_min; 

while FracThr <= threshold_max
    PopVecThr = zeros(tmax,2); % resets the PopVecThr each time, for each threshold 
    AbsThr = FracThr*PopVecMax;
    ThrTimes = find(PopVec(:,2) > AbsThr); % reads through pop vector values in second column for each time bin 
                                           % that are above the threshold
    PopVecThr(ThrTimes,:) = PopVec(ThrTimes,:);

    subplot(2,2,3);
    scatter(PopVecThr(:, 1), PopVecThr(:, 2), 1, 'blue', '.');
    hold on 
    title('Thresholded Population Vectors', 'FontSize', 10);
    subtitle(strcat(['Threshold = ', num2str(FracThr*100), '%']), 'FontSize', 8)
    ylabel('Pop Vector LFP Size (uV)', 'FontSize', 10);
    xlabel('TimeBin (n)', 'FontSize', 10);
    legend(strcat(['Above ', num2str(FracThr), ' threshold']), 'FontSize', 7);
    axis square;
    set(gca,'XScale','log')
    set(gca,'YScale','log')
    ax.YScale = 'log';
    pause(5)
    FracThr = FracThr + threshold_jump; 
end
