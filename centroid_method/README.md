# Ependymal_cells_cilia_beating
Base code for analysing the beating of cilia in ependymal cells.

# Instructions
1.	Add the path to the MATLAB folder and select the folder containing the codes for beads analysis.
2.	Open in MATLAB the file beadWFmostFrequentTimeLapse.
3.	Open in MATLAB the file beadWFcentroidPosition and adjust the parameters of minDiameter and maxDiameter according to the recording conditions to correctly identify and filter the bead.
4.	In the Command window of MATLAB, type and enter: [ time, centroid, bw, mostFrequentDistance, stats] = beadWFmostFrequentTimeLapse( ).
5.	Select the TIF file.
6.	Select the frame where the bead is clearly visible (open the video in ImageJ to pre-select the best frame where you can see the bead) and draw the Region of Interest (ROI). Once you have correctly selected the ROI for the bead, draw the ROI for the background.
7.	Once the program has finished, it will display a histogram representing the different frame values for which the bead has made a complete oscillation in X and Y.
8.	In the Command window of MATLAB, type and enter: stats, in order to obtain the values of the mean complete oscillation of bead in X and Y, and the standard deviation. The mean complete oscillation value indicates the number of frames that occurs most often; it represents a complete oscillation of the bead (back and forth to the initial point). If the standard error is too large, redo the analysis and choose a frame where the bead is more visible.
9.	To obtain the frequency of the bead, divide the imaging acquisition rate (in frames per second) by the mean number of frames it takes for the bead to complete one full oscillation. 
