function [ time freq  stats ROI arc] = beadWFInOutFrequency( )

%OSCILLATIONFREQUENCY returns the oscillation frequency of a single magnetic bead

% Opens an interface to select wich file(s) you want to load 
[ fullFileName ] = UIgetStackFileInfo(  );

% Defines loadStuck function
I = loadStack(fullFileName);

% Let the user select the ROI of interest --> an area where ONLY ONE bead is visible
[ ROI, time, ROIR, data ] = UIbeadWFselectROIs( fullFileName );

% Returns the position and the diameter for every images of the stack
[  freq,aa  ] = beadWFfreq2( ROI,ROIR);

% Determines the number of frames required for the beads do perform a round trip
[ difference, arc ] = beadWFdifference( freq, aa );

% Plot the histogram for x and y of the time lapse, in frame, between two adjacents peaks. Also returns the most frequent lapse
[ stats ] = beadWFhisto( difference );

end

