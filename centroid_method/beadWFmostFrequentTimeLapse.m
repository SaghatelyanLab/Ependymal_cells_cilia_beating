function [ time, centroid, bw, mostFrequentDistance, stats] = beadWFmostFrequentTimeLapse( )
%OSCILLATIONFREQUENCY returns the oscillation frequency (dah) of A SINGLE magnetic beads 

% Opens an interface to select wich file(s) you want to load 
[ fullFileName ] = UIgetStackFileInfo(  );

% Defines loadStuck function
I = loadStack(fullFileName);

% Let the user select the ROI of interest --> an area where ONLY ONE bead is visible
[ ROI, time ] = UIbeadWFselectROIs( fullFileName );

% Returns the position and the diameter for every images of the stack
[ centroid, bw, diameter ] = beadWFcentroidPosition( ROI );

% Determines the number of frames required for the beads to perform a complete oscillation
[ difference ] = beadWFoscillationFrequency( centroid );

% Plot the histogram for x and y of the time lapse, in frame, between two adjacents peaks. Also returns the most frequent lapse
[ mostFrequentDistance, stats] = beadWFhistogram( difference );

end

