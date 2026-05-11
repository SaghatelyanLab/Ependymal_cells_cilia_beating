function [ freq, aa  ] = beadWFfreq2( ROI,ROIR )
%beadWFcentroidPosition Returns the position and the diameter for every images of the stack

freq=[];

for i = 1:size(ROI,3)

c(i)=sum(sum(ROI(:,:,i)))/(size(ROI,1)*size(ROI,2));
cR(i)=sum(sum(ROIR(:,:,i)))/(size(ROIR,1)*size(ROIR,2));

freq(i)=cR(i)-c(i);
aa = max(cR(2:end))-min(cR(2:end));


end

end

