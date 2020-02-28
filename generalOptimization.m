% function [legos_general, dtbase_general] = generalOptimization(legos, dtbase, n)

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
load('legos.mat'), load('dtbase.mat'), n = 50;

legos_general = legos;
dtbase_general = dtbase;

a = length(dtbase) - n; % Numbers of legos to remove
b = floor(a/2);         % Remove through luma optimization
c = a-b;                % Remove through chroma optimization

% Luma optimization
L = dtbase(:,1);

% The LEGOS, darkest to brightest
[B,I] = sort(L);            %(L(I) = B)

% Remove some dark and some bright LEGOS
dark = floor(b/2);
bright = b-dark;

for
    % B(i) the value to be removed
    % L(I(i)) corresponding element in L
    % I(i) is the entry to be removed from legos and dtbase
end


% for i = (length(dtbase_general)-bright):length(dtbase_general)
%     % B(i) the value to be removed
%     % L(I(i)) corresponding element in L
%     % I(i) is the entry to be removed from legos and dtbase
%     legos_general(I(i)) = [];
%     dtbase_general(I(i),:) = [];
% end





% % The distances between Luma values among the darkest LEGOS
% for i = 1:(b+floor(b/3))-1
%     distances(i) = B(i+1)-B(i);
% end
% 
% % The same thing sorted
% [closestDistances, J] = sort(distances);        % distances(J) = closestDistances
% 
% % Find the indices in the database that corresponds to the chosen distances
% % to remove
% for j = 1:b
%     idx(j) = find(distances(J(j)) == distances); % the index of the distance to be removed
% end

% for i = 1:(b+floor(b/3))-1
%     for j = i+1:(b+floor(b/3))
%         deltaE(j) = norm(B(i),B(j));
%         
%     end
%     % for what j was the distance between j and i the smallest?
%     [~,J] = min(deltaE);        
%     E(i) = [i, J];      % The pair that was closest to i 
% end




% sedan kolla på skillnad i färgkanalerna a och b, endast två variabler,
% lättare att jämföra



% end