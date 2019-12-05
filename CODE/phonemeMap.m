


%% Position the phonemes, currently based on 
% https://www.englishclub.com/pronunciation/phonemic-chart.htm
% a 6 x 8 location with 3 spaces separation

horizontal_Location     = 1:4:4*8;
vertical_Location       = 1:3:3*6;
 
[x,y]                   = meshgrid(horizontal_Location,vertical_Location);

xx                      = x(:);
yy                      = y(:);
numberPhonemes          = numel(xx);
radii                   = ones(numberPhonemes,1);
names                   = num2str((1:numberPhonemes)');
%weights                 = 3*rand(48,1);
cla
minCircleSize           = 0.7;
weights(weights<minCircleSize)    = minCircleSize;
textSize                = 20*ones(numberPhonemes,1);
viscircles([xx(:) yy(:)],weights);

hText = text(xx(:)-0.2*weights, yy(:),names2,'fontsize',24);
for k=1:numberPhonemes
    hText(k).FontSize = textSize(k)*weights(k);
end
grid on;axis tight
axis equal
axis off
axis ij
%%
names2 = {'?','i:','?','u:','e','?:','?','?:','æ','?','?','?:','e?','??','a?','e?','??','??','??','a?','/','p' ,'f','?','t','s','?','?','k','b','v'	'ð','d','z','?','?','g','m','n','?','h','w','l','r','j','','',''};
%ship,sheep,book,shoot
% left,her,teacher,door
% hat,up,on,far
% wait,coin,like
% hair,here,tourist
% show,mouth, 
% unvoiced consonants
% pea,free,thing,tree,see,sheep,cheese,coin
% voiced consonants
% boat,video,this,dog,zoo,television,joke,go
 

