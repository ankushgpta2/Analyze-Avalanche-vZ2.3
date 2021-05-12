%% SAVE GENERATED SUBPLOT UNDER PROPER NAME AND IN CORRECT LOCATION 
sgtitle(raster_file_name);
set(gcf,'WindowState','maximized');

save_file_name = strsplit(raster_file_name, '.');
save_file_name2 = strcat(string(char(save_file_name(1))), '_analysis');

saveas(gcf, fullfile(avalanche_figure_path, save_file_name2), 'epsc');
saveas(gcf, fullfile(avalanche_figure_path, save_file_name2), 'pdf');
hold off 
