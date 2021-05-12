%% TEMPORAL COARSE GRAINING (k) VS SLOPE (a)
% interpolate and plot 
figure;
for ii = 1:3
    if sum(slope_array(ii,:) == inf) ~= 0 || sum(~isnan(slope_array(ii,:))) ~= 10
        indexes1 = find(slope_array(ii, :)) == inf; 
        indexes2 = ~isnan(slope_array(ii,:));
        for i = 1:10
            if indexes1(i) == 1 || indexes2(i) == 0
                if i ~= 1
                    slope_array(ii, i) = (slope_array(ii, i-1));
                else
                    if slope_array(ii,i) == inf 
                        slope_array(ii, i) = 0
                    end
                end
            end
        end
    end
    plot(1:k_range, slope_array(ii,:), '-o')
    hold on 
end

% labels
title('Coarse Graining vs Avalanche Scaling', 'FontSize', 10)
xlabel('Temporal Coarse Graining Factor (K = 1-10)', 'FontSize', 10);
ylabel('Slope For Line Of Best Fit in Log-Log (\alpha)', 'FontSize', 10);
axis square;
lgd = legend('PDF of Size', 'Mean Size vs Duration', 'PDF of Duration', 'Location', 'northwest');
lgd.FontSize = 10;
