function [legos_general, dtbase_general] = kmeansOptimization(legos, dtbase, n)

% Takes in a set of legos, list of the colors of the legos, and a number.
% Gives back a shrinked set of n legos, and list of its colors.

%%%%%%%%%%%%%%%%%%% In parameters %%%%%%%%%%%%%%%%%%%%%
% legos             1xM cell array containing M legos   
% dtbase            Mx3 double containing M CIELab colors
% n                 number of legos in the shrinked set


%%%%%%%%%%%%%%%%%%% Out parameters %%%%%%%%%%%%%%%%%%%%
% legos_general     1xn cell array containing n legos         
% dtbase_general    nx3 double containing n CIELab colors

%%%%% For testing purposes 
% load('legos.mat'), load('dtbase.mat'), n = 50;

% Sort the databases from dark to bright
if (n>length(dtbase))
    n = length(dtbase);
end

[dtbase_general, I] = sortrows(dtbase, 1);
legos_general = legos(1, I);

clear I dtbase legos

% Print the input database
figure
cols = 10;
rows = ceil(length(dtbase_general)/cols);

for i = 1:length(dtbase_general)
    subplot(rows, cols, i)
    imshow(legos_general{1,i})
end
sgtitle('Database before kmeans');

clear i cols rows dtbase legos


% Remove the bricks that are close to each other in color
labels = kmeans(dtbase_general,n);

toRemove = zeros(1,length(dtbase_general) - n);
counter = 1;
for i = 1:n
    idx = find(labels == i);
    if length(idx)>1
       % If more than 2 entries in the database has the same label, store
       % all indices except one in toRemove
       for j = 1: length(idx)-1
           toRemove(counter) = idx(j);
           counter = counter + 1;
       end
    end
end

clear c counter i idx n nColors attempts j dtbase_generalM labels ab

% now, remove all the entries corresponding to toRemove, from
% dtbase_general and legos_general

dtbase_general(toRemove, :) = [];
legos_general(toRemove) = [];

figure
cols = 10;
rows = ceil(length(dtbase_general)/cols);

for i = 1:length(dtbase_general)
    subplot(rows, cols, i)
    imshow(legos_general{1,i})
end
sgtitle('Database after kmeans');
clear cols rows

end