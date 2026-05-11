function [ ROI, time, ROIR, data ] = UIbeadWFselectROIs( fullFileName )
%UIbeadWFselectROI : Let the user select the ROI of interest --> an area where only bead is visible

%% Scale the image

I  = loadStack(fullFileName);
% Exception
%%%%%%%%%%
if size(I,4) ~= 1 
    h=warndlg('Hey amigo, only Grayscale image for this function')
end
%%%%%%%%%%
I  = im2double(I);
I = mat2gray(I); 

%% Make sure the user is happy with his crop
button = []; 
while strcmp(button,'Yes') == 0
    x = inputdlg('Enter the frame of the picture you want to visualise');
    data = str2num(x{1}); 
imshow(I(:,:,data),'InitialMagnification',1000); 

% Determine manually the ROI
tic;
h=imrect;
pause(toc); 
pos = round(getPosition(h));  
ROI = I(pos(1,2):(pos(1,2)+pos(1,4)), pos(1,1):(pos(1,1)+pos(1,3)), :, :);
figure(2)
tic;
montage(ROI,'Indices',2:17)
pause(toc); 

button = questdlg('Has this ROI been adequatly chosen? ');
if strcmp(button,'Yes') == 1
    break
else
    continue
end
end

button = []; 
while strcmp(button,'Yes') == 0
imshow(I(:,:,data),'InitialMagnification',1000); 


% Determine manually the ROI-Ref
tic;
u=imrect;
pause(toc); 
posi = round(getPosition(u));
ROIR=I(posi(1,2):(posi(1,2)+posi(1,4)), posi(1,1):(posi(1,1)+posi(1,3)), :, :);
figure(3)
tic;
montage(ROIR,'Indices',2:17)
pause(toc); 

button = questdlg('Has this ROI been adequatly chosen? ');
if strcmp(button,'Yes') == 1
    break
else
    continue
end
end
ROI=squeeze(ROI);
ROIR=squeeze(ROIR);
time=[0:(1/81):(size(ROI,3)/81)-(1/81)];
end
