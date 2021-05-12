%% DENSITY PLOT FOR AVALANCHE DURATION 
% option to use the ksdensity function to predict univariate PDE from gaussian distribution kernel if population is not completely known 
subplot(2,2,4);
iii = 1;

num_of_avalanches_per_duration_k = [];
for k = 1:k_range
    avalanche_k_portion = Aval(:,iii+1);
    avalanche_k_portion = sortrows(avalanche_k_portion, 1);
    for d = 1:max(avalanche_k_portion(:,1))
        index = find(avalanche_k_portion(:,1) == d);
        num_of_avalanches_for_duration = length(index);
        num_of_avalanches_per_duration_k(k, d) = num_of_avalanches_for_duration; 
    end
    
    num_of_avalanches_per_duration_k(k,:) = num_of_avalanches_per_duration_k(k, :) ./ sum(num_of_avalanches_per_duration_k(k,:), 2);
    
    iii = iii + 3;
end

[~, max_duration] = size(num_of_avalanches_per_duration_k);

% plot the probability function for each 
k = 1;
for k = 1:k_range
    correct_index = max(find(num_of_avalanches_per_duration_k(k, :) ~= 0));
    plot(1:correct_index, num_of_avalanches_per_duration_k(k, 1:correct_index), '-o', 'MarkerSize', 2)
    hold on
end

% log translating x and y + poly fitting to generate coefficients and line
% of best fit for each k value and storing in array
k = 1;
for k = 1:k_range
    logx = log10(1:5);
    logy = log10(num_of_avalanches_per_duration_k(k, 1:5));
    log_coefficients = polyfit(logx, logy, 1);
    
    slope_array(3, k) = abs(log_coefficients(1));
end

% labels
title('PDF for Avalanche Duration (K = 1-10)', 'FontSize', 10)
xlabel('Avalanche Duration (n)', 'FontSize', 10);
ylabel('Probability Density Function (PDF)', 'FontSize', 10);
axis square;
lgd = legend('k = 1', 'k = 2', 'k = 3', 'k = 4', 'k = 5', 'k = 6', 'k = 7', 'k = 8', 'k = 9', 'k = 10', '\alpha = 2', '\alpha = 1.5', '\alpha = 1', ...
    'Location', 'southwest', 'NumColumns', 2);
lgd.FontSize = 6.5;

% axis scaling
set(gca,'XScale','log')
set(gca,'YScale','log')
ax.YScale = 'log';
ylim([10.^-4 1]);
xlim([1 max_duration]);

% rotate
%camroll(90);
