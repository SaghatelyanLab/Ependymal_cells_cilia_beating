function [ difference,arc ] = beadWFdifference( freq,aa )
%beadWFoscillationFrequency determines the number of frames required for the beads do perform a round trip 

difference = [];
arc=[];

[ax bx] = findpeaks(freq(2:end),'Threshold',0.005);

for i = 1:(length(bx)-1)
difference(i)=bx(i+1)-bx(i);
differenceTemp(i)=bx(i+1)-bx(i);
if difference(i) > 6
    difference(i) = [];
end
    
end
difference(difference == 0)=[];
if length(difference)/length(freq) < 0.01
    difference =[];
end
arc(1,:)=bx(1:end-1);
arc(2,:)=differenceTemp;
figure(3);
scatter(arc(1,:),arc(2,:));
ylim([1 10]);
xlabel('Frame #')
ylabel('Time between 2 pics (#frames)')
end





