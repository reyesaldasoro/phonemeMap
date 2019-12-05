


h0          = figure(1);
h0.Position = [    891   361   939   612];
h1          = gca;
h1.Position = [0.0601    0.0642    0.8542    0.8782];



%% Position the phonemes, currently based on 
% https://www.englishclub.com/pronunciation/phonemic-chart.htm
% a 6 x 8 location with 3 spaces separation
stepX = 5;
stepY = 4;
horizontal_Location     = 1:stepX:stepX*8;
vertical_Location       = 1:stepY:stepY*6;
 
[x,y]                   = meshgrid(horizontal_Location,vertical_Location);
% Transpose so that the names will be in order when in tables:
% [ 1 2 3 4; 5 6 7 8; ...] and not [1 5 9; 2 6 10 ; 3 7 11; ...]

x                       = x';
y                       = y';
xx                      = x(:);
yy                      = y(:);
numberPhonemes          = numel(xx);
radii                   = ones(numberPhonemes,1);
names                   = num2str((1:numberPhonemes)');
weights                 = 3*rand(48,1);
% colour allocation
% circ_colour             = rand(48,3);
circ_colour             = zeros(48,3);
circ_colour([1:4  9:12 17:20],1)    = 0.7;
circ_colour([5:8 13:16 21:24],2)    = 0.4;
circ_colour([25:48],3)              = 0.6;


cla
hold on
minCircleSize           = 0.7;
weights(weights<minCircleSize)    = minCircleSize;
weights([7 8 16]) = 0.0001;
textSize                = 20*ones(numberPhonemes,1);
%hCircles                = viscircles([xx(:) yy(:)],weights,'color',0.7*[1 1 1]);

%hText = text(xx(:)-0.4*weights, yy(:),names2,'fontsize',24);
for k=1:numberPhonemes
    hCircles(k)         = plot(xx(k),yy(k),'o','markersize',40*(weights(k)),'color',circ_colour(k,:),'markerfacecolor',circ_colour(k,:),'linewidth',0.5);
    hText(k)            = text(xx(k)-0.4*weights(k),yy(k),names2{k},'fontsize',23);
    hText(k).FontSize   = textSize(k)*weights(k);
    hText(k).Color      = 'w';%circ_colour(k,:); % colour allocation
    %hCircles(k)         = viscircles([xx(k) yy(k)],weights(k),'color',circ_colour(k,:),'linewidth',weights(k));
end
grid on;axis tight
axis equal
axis off
axis ij
%%
%names2 = {'?','i:','?','u:','??','e?','','e','?','?:','?:','??','??','??','æ','?','?:','?','e?','a?','a?','/','p','b','t','d','?','?','k','g','f','v','?','ð','s','z','?','?','m','n','?','h','l','r','w','j'};
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
 
plosive     = {'p','b',' ',' ',' ',' ','t','d',' ',' ','?','?','c','?','k','?','q','?',' ',' ','?',' '};
nasal       = {' ','m',' ','?',' ',' ',' ','n',' ',' ',' ','?',' ','?',' ','?',' ','?',' ',' ',' ',' '};
trill       = {' ','?',' ',' ',' ',' ',' ','r',' ',' ',' ',' ',' ',' ',' ',' ',' ','?',' ',' ',' ',' '};
TapFlap     = {' ',' ',' ','?',' ',' ',' ','?',' ',' ',' ','?',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
Fricative   = {'?','?','f','v','?','ð','s','z','?','?','?','?','ç','?','x','?','?','?','?','?','h','?'};
LateralF    = {' ',' ',' ',' ',' ',' ','?','?',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};  
Approximant = {' ',' ',' ','?',' ',' ',' ','?',' ',' ','','?','j','?'};
LateralAp   = {' ',' ',' ',' ',' ',' ',' ','l',' ',' ','?','?','?','?'};

%names2={'m?','m','?','n?','n?','n','??','?','??','?','??','?','?','p','b','p?','b?','t?','d?','t','d','?','?','c','?','k','?','q','?','?','?','ts','dz','t??',...    
% 'd??','??','??','t?','d?','p?','b?','p?f','','b?v','t??','d?ð','t???','d??','t?????','','d????','cç','??','kx','??','q?','??','?h','s','z','?','?','?','?','?',...
% '?','?','?','f','v','??','ð?','?','ð','','??','ð?','????','???','??','ç','?','','x','?','?','?','?','?','h','?','','??','?','??','?','','??','?','j?','j',...
% '??','?','??','??','?','??','??','?','??','?','','??','??','??','?','r?','r','??r?','?r','??','','?','?','?','t?','d?','????','c???','k???','','???','?','?','???','??','???','??',...
% '???','??','l?','l','??','?','??','?','??','?','??','?','??','??','??'};
