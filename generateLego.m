function legos = generateLego(RGB)
% Takes in a M x 3 matrix containing RGB colors
% Gives back a 1 x M cell array containing the legos
% The legos are [30x30x3]-matrices in RGB
% RGB range: [0,1]

    load('brickStructure.mat');
    legos = cell(1,length(RGB(:,1)));


%%%%%%%%%%%%%%%%%%%   CREATE LEGOS  %%%%%%%%%%%%%%%%%%%%%%%

    emptyLego = cat(3, zeros(30), zeros(30), zeros(30));
    for i = 1:length(RGB(:,1))

        tempLego = emptyLego;

        tempLego(:,:,1) = RGB(i,1);
        tempLego(:,:,2) = RGB(i,2);
        tempLego(:,:,3) = RGB(i,3);

        tempLego = rgb2lab(tempLego);
        tempLego(:,:,1) = tempLego(:,:,1) + Lmap;
        tempLego = lab2rgb(tempLego);


%%%%%%%%%%%%%   REMOVE ALL VALUES THAT EXCEEDS 1    %%%%%%%%%%%%%%

        if(max(max(tempLego(:,:,1))) > 1)
            logical = (tempLego(:,:,1) > 1);    % A map of all the values that exceeds 1
            [row,col] = find(logical);          % Returns all the indices where matrix exceeded 1 
            for j = 1:length(row)
                tempLego(row(j), col(j), 1) = 1;
            end
        end

        if(max(max(tempLego(:,:,2))) > 1)
            logical = (tempLego(:,:,2) > 1);   
            [row,col] = find(logical);       
            for j = 1:length(row)
                tempLego(row(j), col(j), 2) = 1;
            end
        end

        if(max(max(tempLego(:,:,3))) > 1)
            logical = (tempLego(:,:,3) > 1);   
            [row,col] = find(logical);        
            for j = 1:length(row)
                tempLego(row(j), col(j), 3) = 1;
            end
        end


%%%%%%%%%%%%%%%%%   REMOVE ALL NEGATIVE VALUES    %%%%%%%%%%%%%%%%%%


        if(min(min(tempLego(:,:,1))) < 0)
            logical = (tempLego(:,:,1) < 0);    % A map of all the values that are below 0
            [row,col] = find(logical);          % Returns all the indices where matrix was below 0 
            for j = 1:length(row)
                tempLego(row(j), col(j), 1) = 0;
            end
        end

        if(min(min(tempLego(:,:,2))) < 0)
            logical = (tempLego(:,:,2) < 0);   
            [row,col] = find(logical);       
            for j = 1:length(row)
                tempLego(row(j), col(j), 2) = 0;
            end
        end

        if(min(min(tempLego(:,:,3))) < 0)
            logical = (tempLego(:,:,3) < 0);   
            [row,col] = find(logical);        
            for j = 1:length(row)
                tempLego(row(j), col(j), 3) = 0;
            end
        end

        legos{i} = tempLego; 

    end
end