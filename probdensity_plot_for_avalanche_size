%% DENSITY PLOT FOR AVALANCHE SIZE
% plotting actual density
subplot(2,2,1);
iii = 1;
avalanche_size_bin = 1;
minimum = 1000; 
maximum = 0; 
i = 1;

%k_array = [];
avalanche_size_per_duration_k = [];
%for avalanche_size_bin = 1:5:50 % to compare for varying bin widths 
    for k = 1:k_range
        avalanche_k_portion2 = Aval(:,iii+2);
        avalanche_k_portion2 = sortrows(avalanche_k_portion2, 1);
        avalanche_k_portion = avalanche_k_portion2(avalanche_k_portion2 ~= 0);
        
        num_of_bins = ceil((max(avalanche_k_portion)) ./ avalanche_size_bin);
        for avalanche_size_counter = 1:num_of_bins
            lower_bound = (avalanche_size_counter - 1) * avalanche_size_bin;
            upper_bound = avalanche_size_counter * avalanche_size_bin;
            
            index_for_lower = find(avalanche_k_portion(:,1) >= lower_bound);
            index_for_upper = find(avalanche_k_portion(:,1) <= upper_bound);
            total_num = length(intersect(index_for_lower, index_for_upper));
            
            avalanche_size_per_duration_k(k, avalanche_size_counter) = total_num;
        end
        
        if min(avalanche_k_portion) < minimum
            minimum = min(avalanche_k_portion);
        end
        
        avalanche_size_per_duration_k(k,:) = avalanche_size_per_duration_k(k, :) ./ sum(avalanche_size_per_duration_k(k,:), 2);
        
        iii = iii + 3;
        
        %k_array(i, :) = avalanche_size_per_duration_k(k,:);
        %i = i + 1;
    end
    %iii = 1;
    %avlanche_size_counter = 1;
%end

[~, max_num_of_size_bins] = size(avalanche_size_per_duration_k);

% plot the probability function for each 
k = 1;
for k = 1:k_range
    plot(1:max_num_of_size_bins, avalanche_size_per_duration_k(k, :), '.', 'MarkerSize', 3)
    hold on
end

% reference lines with different slopes 
logx2 = log10(minimum:max_num_of_size_bins);

y_vals_for_2 = 10.^[polyval([-2, -0.3],[logx2(1) logx2(end)])];
a = loglog([minimum max_num_of_size_bins], y_vals_for_2, '--', 'LineWidth', 1.5, 'Color', 'black');
hold on
uistack(a, 'top');
y_vals_for_1andhalf = 10.^[polyval([-1.5, -0.3],[logx2(1) logx2(end)])];
b = loglog([minimum max_num_of_size_bins], y_vals_for_1andhalf, '--', 'LineWidth', 1.5, 'Color', 'red');
hold on
uistack(b, 'top');
y_vals_for_1 = 10.^[polyval([-1, -0.3],[logx2(1) logx2(end)])];
c = loglog([minimum max_num_of_size_bins], y_vals_for_1, '--', 'LineWidth', 1.5, 'Color', 'green');
hold on
uistack(c, 'top');
y_vals_for_half = 10.^[polyval([-0.5, -0.3],[logx2(1) logx2(end)])];
d = loglog([minimum max_num_of_size_bins], y_vals_for_half, '--', 'LineWidth', 1.5, 'Color', 'blue');
hold on
uistack(d, 'top');

% log translating x and y + poly fitting to generate coefficients and line
% of best fit for each k value and storing in array (for up to size 100)
k = 1;
iii = 1;
ii = 1;
slope_array = [];

for k = 1:k_range
    after_zero = min(find(avalanche_size_per_duration_k(k,:) ~= 0));
    logx = log10(after_zero:(200 / avalanche_size_bin));
    logy = log10(avalanche_size_per_duration_k(k, after_zero:(200 / avalanche_size_bin)));
    log_coefficients = polyfit(logx, logy, 1);
    
    slope_array(1, k) = abs(log_coefficients(1));
    
    iii = iii + 3;
end

% labels
title('PDF for Avalanche Size (K = 1-10)', 'FontSize', 10);
xlabel('Avalanche Size Bin (1 Î¼V Resolution)', 'FontSize', 10);
ylabel('Probability Density Function (PDF)', 'FontSize', 10);
axis square;
lgd = legend('k = 1', 'k = 2', 'k = 3', 'k = 4', 'k = 5', 'k = 6', 'k = 7', 'k = 8', 'k = 9', 'k = 10', '\alpha = 2', '\alpha = 1.5', '\alpha = 1', '\alpha = 0.5', ...
    'Location', 'northwest', 'Orientation', 'horizontal', 'NumColumns', 2);
lgd.FontSize = 6.5;
set(lgd, 'Position', [.22,.79,.1,.1]);

% axis scaling
set(gca,'XScale','log');
set(gca,'YScale','log');
ax.YScale = 'log';
ax.XScale = 'log';
xlim([minimum 2000]);
ylim([10.^-4 1]);

%rotate
camroll(90);
