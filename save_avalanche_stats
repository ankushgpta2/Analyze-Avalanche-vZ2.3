%% SAVE / LOAD IMPORTANT VARIABLES IN MATLAB AS A FILE 
save(fullfile(avalanche_figure_path, strcat('stats_', raster_file_name)),'AvalStats');
clear AvalStats
AvalStats = load(['stats_' raster_file_name]);
AvalStats = struct2cell(AvalStats);
AvalStats = AvalStats{1,1};
