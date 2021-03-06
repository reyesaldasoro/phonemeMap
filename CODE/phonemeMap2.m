
clear all
close all


h0          = figure(1);
h0.Position = [    891   361   939   612];
h1          = gca;
h1.Position = [0.0601    0.0642    0.8542    0.8782];



plosive     = {'p','b',' ',' ',' ',' ','t','d',' ',' ','?','?','c','?','k','?','q','?',' ',' ','?',' '};
nasal       = {' ','m',' ','?',' ',' ',' ','n',' ',' ',' ','?',' ','?',' ','?',' ','?',' ',' ',' ',' '};
trill       = {' ','?',' ',' ',' ',' ',' ','r',' ',' ',' ',' ',' ',' ',' ',' ',' ','?',' ',' ',' ',' '};
TapFlap     = {' ',' ',' ','?',' ',' ',' ','?',' ',' ',' ','?',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
Fricative   = {'?','?','f','v','?','�','s','z','?','?','?','?','�','?','x','?','?','?','?','?','h','?'};
LateralF    = {' ',' ',' ',' ',' ',' ','?','?',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};  
Approximant = {' ',' ',' ','?',' ',' ',' ','?',' ',' ',' ','?',' ','j',' ','?',' ',' ',' ',' ',' ',' '};
LateralAp   = {' ',' ',' ',' ',' ',' ',' ','l',' ',' ',' ','?',' ','?',' ','?',' ',' ',' ',' ',' ',' '};

PhonemeNames{1,1} =plosive;
PhonemeNames{2,1} =nasal;
PhonemeNames{3,1} =trill;
PhonemeNames{4,1} =TapFlap;
PhonemeNames{5,1} =Fricative;
PhonemeNames{6,1} =LateralF;
PhonemeNames{7,1} =Approximant;
PhonemeNames{8,1} =LateralAp;
names2 =[plosive nasal trill TapFlap Fricative LateralF Approximant LateralAp];

%% Position the phonemes, currently based on 
% https://www.englishclub.com/pronunciation/phonemic-chart.htm
% a 6 x 8 location with 3 spaces separation
numberGroups            = size(PhonemeNames,1);
numberPhonemes          = size(PhonemeNames{1},2);
stepX = 5;
stepY = 4;
horizontal_Location     = 1:stepX:stepX*numberPhonemes;
vertical_Location       = 1:stepY:stepY*numberGroups;
 

[x,y]                   = meshgrid(horizontal_Location,vertical_Location);

x                       = x';
y                       = y';
xx                      = x(:);
yy                      = y(:);

% Transpose so that the names will be in order when in tables:
% [ 1 2 3 4; 5 6 7 8; ...] and not [1 5 9; 2 6 10 ; 3 7 11; ...]
weights                 = 1*ones(numberGroups*numberPhonemes,1);

%weights                 = 3*rand(numberGroups*numberPhonemes,1);
% colour allocation
 circ_colour             = rand(numberGroups*numberPhonemes,3);
% circ_colour             = zeros(48,3);
% circ_colour([1:4  9:12 17:20],1)    = 0.7;
% circ_colour([5:8 13:16 21:24],2)    = 0.4;
% circ_colour([25:48],3)              = 0.6;


cla
hold on
minCircleSize           = 0.7;
weights(weights<minCircleSize)    = minCircleSize;
%weights([7 8 16]) = 0.0001;
textSize                = 20*ones(numberGroups*numberPhonemes,1);
%hCircles                = viscircles([xx(:) yy(:)],weights,'color',0.7*[1 1 1]);

%hText = text(xx(:)-0.4*weights, yy(:),names2,'fontsize',24);
for k=1:numberGroups*numberPhonemes


%for kvert =1:counterGroup
%    for khor =1:counterPhonemes
        hCircles(k)         = plot(xx(k),yy(k),'o','markersize',30*(weights(k)),'color',circ_colour(k,:),'markerfacecolor',circ_colour(k,:),'linewidth',0.5);
        hText(k)            = text(xx(k)-0.4*weights(k),yy(k),names2{k},'fontsize',3);
        hText(k).FontSize   = textSize(k)*weights(k);
        hText(k).Color      = 'k';%circ_colour(k,:); % colour allocation
        %hCircles(k)         = viscircles([xx(k) yy(k)],weights(k),'color',circ_colour(k,:),'linewidth',weights(k));
%    end
end
grid on;axis tight
axis equal
axis off
axis ij
%%
%vowels = {'?','i:','?','u:','??','e?','','e','?','?:','?:','??','??','??','�','?','?:','?','e?','a?','a?','/','p','b','t','d','?','?','k','g','f','v','?','�','s','z','?','?','m','n','?','h','l','r','w','j'};

%names2={'m?','m','?','n?','n?','n','??','?','??','?','??','?','?','p','b','p?','b?','t?','d?','t','d','?','?','c','?','k','?','q','?','?','?','ts','dz','t??',...    
% 'd??','??','??','t?','d?','p?','b?','p?f','','b?v','t??','d?�','t???','d??','t?????','','d????','c�','??','kx','??','q?','??','?h','s','z','?','?','?','?','?',...
% '?','?','?','f','v','??','�?','?','�','','??','�?','????','???','??','�','?','','x','?','?','?','?','?','h','?','','??','?','??','?','','??','?','j?','j',...
% '??','?','??','??','?','??','??','?','??','?','','??','??','??','?','r?','r','??r?','?r','??','','?','?','?','t?','d?','????','c???','k???','','???','?','?','???','??','???','??',...
% '???','??','l?','l','??','?','??','?','??','?','??','?','??','??','??'};
