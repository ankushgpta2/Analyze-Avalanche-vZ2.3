%% CALCULATE DENSITY FOR AVALANCHE DURATION VS SIZE (TILES WITH TOTAL NUM OF POINTS)
% determine the density of points (number of points) in a tile that is 1
% duration (x) and 1 uv in size (y)
tile_array = [];
tile_avalanche_size = 1; 
tile_avalanche_size_step = 1;
tile_avalanche_duration_step = 1;
row = 1;
d = 1;
beginning_of_duration = 1;

avalanche_k_portion = [Aval(:, 2) Aval(:,3)]; % separates the values for the particular k from overall array
avalanche_k_portion = sortrows(avalanche_k_portion, 1); % sort in terms of duration values

while d <= max(Aval(:,2)) 
    sizes_in_duration = avalanche_k_portion(beginning_of_duration:max(find(avalanche_k_portion(:,1) == d)), 2); % separates it from the array 
    sizes_in_duration = sortrows(sizes_in_duration, 1); % now sort this single duration based on size 

    while tile_avalanche_size <= max(avalanche_k_portion(:,2)) % read all the way up the sizes for a single duration 
        num_of_points = max(find(sizes_in_duration < tile_avalanche_size));
        if length(num_of_points) == 0
            num_of_points = 0;
        end
        tile_array(row, d) = num_of_points; % add the total num of points into array 
        tile_avalanche_size = tile_avalanche_size + tile_avalanche_size_step; 
        row = row + 1;
    end
    d = d + tile_avalanche_duration_step;
    row = 1;
    beginning_of_duration = beginning_of_duration + length(sizes_in_duration); 
    tile_avalanche_size = 1; 
end

% take the difference and convert all zeros to NaNs so that it doesnt show
% up on contour plot 
tile_array2 = diff(tile_array);
tile_array3 = tile_array2 ./ (sum(sum(tile_array2))); % this is esentially the prob values of size density for each duration (z values)
tile_array_4_3D = tile_array3;
tile_array3(tile_array3 == 0) = NaN;

%% PLOT 2D CONTOUR AND 3D  
% 3D 
%colorMap = jet(256);
%colormap(colorMap);
%surf(tile_array3);
%hold on 

%title('PDE of Avalanche Size Across Duration (K = 1)');
%xlabel('Avalanche Duration (n)');
%ylabel('Avalanche Size (Î¼V)'); 
%zlabel('PDE Per Bin (20Î¼V x 1n)');
%colorbar

% 2D Contour Plot 
subplot(2,2,3);
colorMap = jet(256);
colormap(colorMap);
contourf(tile_array3)
hold on
colorbar
hold on 
scatter(Aval(:,2), Aval(:,3) ./ tile_avalanche_size, 3, 'filled', 'black');
hold on

[num_rows, num_col] = size(tile_array3);

% reference lines with different slopes 
logx2 = log10(1:num_col);

y_vals_for_2 = 10.^[polyval([2, 0],[logx2(1) logx2(end)])];
a = loglog([1 num_col], y_vals_for_2, '--', 'LineWidth', 1.5, 'Color', 'black');
hold on
uistack(a, 'top');
y_vals_for_1andhalf = 10.^[polyval([1.5, 0],[logx2(1) logx2(end)])];
b = loglog([1 num_col], y_vals_for_1andhalf, '--', 'LineWidth', 1.5, 'Color', 'red');
hold on
uistack(b, 'top');
y_vals_for_1 = 10.^[polyval([1, 0],[logx2(1) logx2(end)])];
c = loglog([1 num_col], y_vals_for_1, '--', 'LineWidth', 1.5, 'Color', 'green');
hold on
uistack(c, 'top');
y_vals_for_half = 10.^[polyval([0.5, 0],[logx2(1) logx2(end)])];
d = loglog([1 num_col], y_vals_for_half, '--', 'LineWidth', 1.5, 'Color', 'blue');
hold on
uistack(d, 'top');

% scale
set(gca,'XScale','log')
set(gca,'YScale','log')
ax.YScale = 'log';
ylim([minimum max(Aval(:,3))]);
axis square;

% labels 
title('PDF for Size vs Duration (K = 1)');
xlabel('Avalanche Duration (n)');
ylabel('Avalanche Size Bin (20 Î¼V Resolution)'); 
zlabel('PDF Per Bin (20 Î¼V x 1 n)');
lgd = legend('PDF Value Per Bin > 0', 'Actual Data Points', '\alpha = 2', '\alpha = 1.5', '\alpha = 1', '\alpha = 0.5', 'Location', 'northwest');
lgd.FontSize = 7;
