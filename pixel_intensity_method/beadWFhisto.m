function [  stats] = beadWFhisto( difference )
%beadWFhistogram plot the histogram for x and y of the time lapse, in frame, between two adjacents peaks. Also returns the most frequent lapse

figure(2);
fx=histogram(difference);


stats = [mean(difference) std(difference)];

end

