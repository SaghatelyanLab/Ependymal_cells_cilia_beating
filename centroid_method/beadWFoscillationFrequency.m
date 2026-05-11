function [ difference ] = beadWFoscillationFrequency( centroid )
%beadWFoscillationFrequency determines the number of frames required for the beads to perform a complete oscillation

differencex = [];
[ax bx]=findpeaks(centroid(:,1),'MinPeakDistance',2,'Threshold',1);
for i = 1:(length(bx)-1)
differencex(i)=bx(i+1)-bx(i);
end
differencey = [];
[ay by]=findpeaks(centroid(:,2),'MinPeakDistance',2,'Threshold',1);
for i = 1:(length(by)-1)
differencey(i)=by(i+1)-by(i);
end
difference{1}=differencex;
difference{2}=differencey;

end


