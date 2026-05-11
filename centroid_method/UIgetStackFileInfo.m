function [ fullFileName ] = UIgetStackFileInfo(  )
%UIgetStackFile opens an interface to select wich file(s) you want to load 

[FileName,PathName] = uigetfile('*.tif;.tiff;.mov;.avi;.txt','Select the video, previously converted and trimmed');
fullFileName=fullfile(PathName,FileName);

end


