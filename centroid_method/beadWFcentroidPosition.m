function [ centroid, bw, diameter ] = beadWFcentroidPositionFilter( ROI )
%beadWFcentroidPosition Returns the position and the diameter for every images of the stack

% Number of frames
nFrames = size(ROI,3);

% Preallocate outputs
centroid = NaN(nFrames,2);   
diameter = NaN(nFrames,1);  

for i = 1:size(ROI,3)
%% Determining the treshold
    ROI(:,:,i) = imadjust(ROI(:,:,i));

    bw(:,:,i) = imbinarize(ROI(:,:,i), 'adaptive','Sensitivity', 0.5, 'ForegroundPolarity', 'dark');


    bw(:,:,i) = bwareaopen(bw(:,:,i), 10);
    bw(:,:,i) = ~bw(:,:,i);
    bw(:,:,i) = imfill(bw(:,:,i), 'holes');


%% Identify centroid
    
minDiameter = 10;   % pixels
maxDiameter = 50;  % pixel

    stats = regionprops(bw(:,:,i), 'Centroid', 'EquivDiameter');

    
    if isempty(stats)
        centroid(i,:) = [NaN NaN];
        diameter(i)   = NaN;
        continue
    end

    % Extract diameters
    d = [stats.EquivDiameter];

    % filter by diameter range
    validIdx = find(d >= minDiameter & d <= maxDiameter);

    if isempty(validIdx)
        centroid(i,:) = [NaN NaN];
        diameter(i)   = NaN;
        continue
    end

    %choose the LARGEST bead within the range
    [~, k] = max(d(validIdx));
    idx = validIdx(k);

    %save result
    centroid(i,:) = stats(idx).Centroid;
    diameter(i)   = d(idx);
    
end

