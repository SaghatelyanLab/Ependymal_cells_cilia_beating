# Ependymal_cells_cilia_beating
Base code for analysing the beating of cilia in ependymal cells.

# Instructions
1. Open MATLAB and add folder of code to path.
2. In command window of MATLAB, type and enter:  [ time freq stats ROI arc ]= beadwFInOutFrequency( );
4. Select the TIF file of your recording.
5. Select the frame where the bead is clearly visible (open the video in ImageJ to select a frame).
6. Select the frame for the background (the software will subtract the bead signal from the background).
7. Once the program has finished, it will display a histogram representing the different frame values for which the bead has made a complete revolution.
8. In the MATLAB command window, type and enter: stats.
9. The first value indicated is the number of frames that occurs most often; it represents a complete oscillation of the bead (back and forth to the initial point). The second value in stats is the standard error.
10. If the standard error is too large, redo the analysis and choose a frame where the bead is more visible.
11. To obtain the frequency, refer to the acquisition speed. Example: the video was recorded at 81 frames/s or 81 Hz, and the software gives 3 frames.
81 frames/s, so 3 frames represent 3/81 s, and the frequency is 1/(3/81) = 81/3. So, Frequency = 81/3 = 27 Hz.

