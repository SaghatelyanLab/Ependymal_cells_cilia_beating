function [ mostFrequentDistance stats] = beadWFhistogram( difference )
%beadWFhistogram plot the histogram for x and y of the time lapse, in frame, between two adjacents peaks. Also returns the most frequent lapse

t_x=0;
t_y=0;
figure(2);
fx=histogram(difference{1},'BinWidth',1);
hold on
fy=histogram(difference{2},'BinWidth',1);
hold off

for i = 1:length(fx.BinEdges)
    t_x=t_x+fx.Values(i);
    if t_x > sum(fx.Values)*0.85
        counts_x = sum(fx.Values(1:i));
        total_x = sum(fx.Values(1:i).*fx.BinEdges(1:i));
        avg_x = total_x/counts_x;
        stDev_x = sqrt(sum(fx.Values(1:i).*(fx.BinEdges(1:i)).^2)/counts_x-avg_x^2);
        break
    end
end

for i = 1:length(fy.BinEdges)
    t_y=t_y+fy.Values(i);
    if t_y > sum(fy.Values)*0.85
        counts_y = sum(fy.Values(1:i));
        total_y = sum(fy.Values(1:i).*fy.BinEdges(1:i));
        avg_y = total_y/counts_y;
        stDev_y = sqrt(sum(fy.Values(1:i).*(fy.BinEdges(1:i)).^2)/counts_y-avg_y^2);
        break
    end
end
supx=fx.BinEdges(find(fx.Values==max(fx.Values),2));
supy=fy.BinEdges(find(fy.Values==max(fy.Values),2));

if (max(fx.Values)/counts_x)<0.1 | (max(fy.Values)/counts_y)<0.1
    warndlg('Bead = immobile')
end
mostFrequentDistance = [supx supy];
stats = [avg_x stDev_x;avg_y stDev_y];
end

