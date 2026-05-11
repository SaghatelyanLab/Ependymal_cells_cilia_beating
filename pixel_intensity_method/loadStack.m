function I = loadStack(fileName)
    % loadStack loads a TIFF file
    
    % Get file extension and check if it's a TIFF file
    [~, ~, ext] = fileparts(fileName);  

    if strcmp(ext, '.tif') || strcmp(ext, '.tiff')
        % Get metadata about the TIFF file
        info = imfinfo(fileName);  
        
        % Check if it's a single-page or multi-page TIFF
        numFrames = numel(info);  
        % If the TIFF file contains multiple frames (multi-page TIFF)
        if numFrames > 1
            I = zeros(info(1).Height, info(1).Width, numFrames, 'uint8');  % Assuming uint8 images (adjust if needed)
            
            % Read each frame of the TIFF stack
            for k = 1:numFrames
                I(:,:,k) = imread(fileName, 'Index', k);  
            end

    end
end
