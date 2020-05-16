%% Create mock data to run the ANOVA on

% Set the number of samples in each group
group_sizes = [8000,250];
num_groups = numel(group_sizes);

% Randomly assign the population means of the groups
%group_means = rand(1,num_groups);

% Set the level of variation
%sigma = 0.3;

% Make a cell array, each cell element contains the values from one group
group_vals = cell(size(2, 1));

group_vals{1,1} = zscore(JUNs(:,1));
group_vals{2,1} = zscore(medJUN(:,1));

% Assign the sample values in the groups
% for kk = 1:num_groups
%    
%     % Make values distributed normally around group mean with standard
%     % deviation sigma
%     group_vals{kk} = group_means(kk)+sigma.*randn(group_sizes(kk),1);
%     
% end

%% Prepare for and execute ANOVA

% Make the sample value and group membership vector
sample_vec = [];
membership_vec = [];

for kk = 1:num_groups
    % Iterate through all groups
    
    % Add this group's values to the value vector
    sample_vec = [sample_vec;group_vals{kk}];
    
    % Add the membership values to the membership vector
    membership_vec = [membership_vec;kk.*ones(numel(group_vals{kk}),1)];
    
end

[p_val,ANOVA_table,mult_comp_stats] = anova1(sample_vec,membership_vec)


%% Go into multiple comparison to find out where differences reside

multcompare(mult_comp_stats) % this is a Tukey test