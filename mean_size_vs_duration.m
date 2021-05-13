%% MEAN SIZE VS DURATION PLOT 
% plotting the duration of avalanche by avalanche size
subplot(2,2,2);
k = 1;
iii = 1;
maximum_duration = 1;
for k = 1:k_range
    plot(AvalStats(:,iii), AvalStats(:,iii+1), '-o', 'MarkerSize', 2);
    %errorbar(AvalStats(:,iii), AvalStats(:,iii+1), sqrt(AvalStats(:,iii+2)));
    hold on 
    
    if max(AvalStats(:,iii)) > maximum_duration
        maximum_duration = max(AvalStats(:,iii)); 
    end
    
    iii = iii + 3;
end

% log translating x and y + poly fitting to generate coefficients and line
% of best fit for each k value and storing in array
k = 1;
iii = 1;
for k = 1:k_range
    logx = log10(abs(AvalStats(1:5, iii)));
    logy = log10(AvalStats(1:5, iii+1));
    log_coefficients = polyfit(logx, logy, 1);
    
    slope_array(2, k) = log_coefficients(1);
    
    iii = iii + 3;
end

% to plot the actual line of best fit 
y_vals_for_best_fit = 10.^[polyval(log_coefficients,[logx(1) logx(end)])];
%loglog([AvalStats(1,1) AvalStats(5,1)], y_vals_for_best_fit, '--')
hold on 

% plot reference lines 
logx2 = log10(abs(AvalStats(1:max(AvalStats(:,1)), 1)));

y_vals_for_2 = 10.^[polyval([2, 1.6539],[logx2(1) logx2(end)])];
a = loglog([AvalStats(1,1) max(AvalStats(:,1))], y_vals_for_2, '--', 'LineWidth', 1, 'Color', 'red');
hold on
uistack(a, 'top');
y_vals_for_1andhalf = 10.^[polyval([1.5, 1.6539],[logx2(1) logx2(end)])];
b = loglog([AvalStats(1,1) max(AvalStats(:,1))], y_vals_for_1andhalf, '--', 'LineWidth', 1, 'Color', 'black');
hold on
uistack(b, 'top');
y_vals_for_1 = 10.^[polyval([1, 1.6539],[logx2(1) logx2(end)])];
c = loglog([AvalStats(1,1) max(AvalStats(:,1))], y_vals_for_1, '--', 'LineWidth', 1, 'Color', 'blue');
hold on
uistack(c, 'top');

% adjust the scaling to log and axis limits 
set(gca,'XScale','log')
set(gca,'YScale','log')
ax.YScale = 'log';
ylim([10.^1 2000]);
xlim([0 maximum_duration]);

% specify title and labels 
title('Mean Size Per Duration Type (K = 1-10)', 'FontSize', 10);
ylabel('<Avalanche Size (Î¼V)>', 'FontSize', 10);
xlabel('Avalanche Duration (n)', 'FontSize', 10);
% place text and modify plot 
axis square;
lgd = legend('k = 1', 'k = 2', 'k = 3', 'k = 4', 'k = 5', 'k = 6', 'k = 7', 'k = 8', 'k = 9', 'k = 10', ...
     '\alpha = 2', '\alpha = 1.5', '\alpha = 1', 'Location', 'southeast', 'NumColumns', 2);
lgd.FontSize = 6.5;
