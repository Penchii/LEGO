function [legos_general, dtbase_general] = generalOptimization(legos, dtbase, n)

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
[dtbase_general, I] = sortrows(dtbase, 1);
legos_general = legos(1, I);

clear I dtbase legos

% Print full database
figure
cols = 10;
rows = ceil(length(dtbase_general)/cols);

for i = 1:length(dtbase_general)
    subplot(rows, cols, i)
    imshow(legos_general{1,i})
end

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

clear cols rows

end

% THIS IS OLD VERY BAD VERSION DONT USE IT SUCK
% %%%%% For testing purposes 
% % load('legos.mat'), load('dtbase.mat'), n = 50;
% 
% a = length(dtbase) - n; % Numbers of legos to remove
% b = floor(a*0.2);         % Remove through luma optimization
% % b = 0;
% c = a-b;                % Remove through chroma optimization
% 
% clear a
% 
% %%%%%%%%%% Luma optimization %%%%%%%%%%%
% % Sort the databases from dark to bright
% [dtbase_general, I] = sortrows(dtbase, 1);
% legos_general = legos(1, I);
% 
% clear legos dtbase I
% 
% % Remove some dark and some bright LEGOS
% dark = floor(b*0.5);
% bright = b-dark;
% 
% clear b
% 
% for i = 1:dark
%    dtbase_general(2, :) = [];      % the darkest one will always be saved
%    legos_general(2) = [];
% end
% 
% for i = 1:bright
%    index = length(dtbase_general)-1;  % the brightest one will always be saved
%    dtbase_general(index,:) = [];      
%    legos_general(index) = [];
% end
% 
% clear dark bright index
% 
% % show the database after Luma
% figure
% cols = 10;
% rows = ceil(length(dtbase_general)/cols);
% 
% for i = 1:length(dtbase_general)
%     subplot(rows, cols, i)
%     imshow(legos_general{1,i})
% end
% 
% clear i cols rows
% 
% %%%%%%%% Chroma optimization %%%%%%%%%
% % Remove the c bricks that are close to each other in color
% 
% % make dtbase a matrix instead of vector, so matlab can recognize every
% % entry as a pixel
% 
% dtbase_generalM = cat(3, dtbase_general(:,1), dtbase_general(:,2), dtbase_general(:,3));
% ab = dtbase_generalM(:,:,2:3); % only the a and b channels
% ab = im2single(ab);
% nColors = n;
% attempts = 3;   % number of attempts in clustering
% labels = imsegkmeans(ab,nColors,'NumAttempts',attempts);
% 
% % remove all the entries that has the same label
% % idx = find(labels == 6);
% 
% toRemove = zeros(1,c);
% counter = 1;
% for i = 1:nColors
%     idx = find(labels == i);
%     if length(idx)>1
%        % If more than 2 entries in the database has the same label, store
%        % all indices except one in a vector
%        % Later, remove all these entries from the dtbase
%        for j = 1: length(idx)-1
%            toRemove(counter) = idx(j);
%            counter = counter + 1;
%        end
%     end
% end
% 
% clear c counter i idx n nColors attempts j dtbase_generalM labels ab
% 
% % now, remove all the entries corresponding to toRemove, from
% % dtbase_general and legos_general
% 
% %
% dtbase_general(toRemove, :) = [];
% legos_general(toRemove) = [];
% 
% % Show the database shrinked after Luma and Chroma
% figure
% cols = 10;
% rows = ceil(length(dtbase_general)/cols);
% 
% for i = 1:length(dtbase_general)
%     subplot(rows, cols, i)
%     imshow(legos_general{1,i})
% end
% 
% clear cols rows