
clear all
close all


h0          = figure(1);
h0.Position = [    891   361   939   612];
h1          = gca;
h1.Position = [0.0601    0.0642    0.8542    0.8782];

 

plosive     = {'p b','   ','   ','t d','   ','? ?','c ?','k ?','q ?','?  ','?  '};
nasal       = {'  m','  ?','   ','  n','   ','  ?','  ?','  ?','  ?','   ','   '};
trill       = {'  ?','   ','   ','  r','   ','   ','   ','   ','  ?','   ','   '};
TapFlap     = {'   ','  ? ?','   ','  ?','   ','  ?','   ','   ','   ','   ','   '};
Fricative   = {'? ?','f v','? ð','s z','? ?','? ?','ç ?','x ?','? ?','? ?','h ?'};
LateralF    = {'   ','   ','   ','? ?','   ','   ','   ','   ','   ','   ','   '};  
Approximant = {'   ','  ?','   ','  ?','   ','  ?','  j','  ?','   ','   ','   '};
LateralAp   = {'   ','   ','   ','  l','   ','  ?','  ?','  ?','   ','   ','   '};

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
%%
for k1=1:numberGroups
    for k2 = 1:numberPhonemes
        isPhonemePresent(k1,k2) = ~strcmp(PhonemeNames{k1}{k2},'   ');
    end
end
isPhonemePresent        = isPhonemePresent';
isPhonemePresent2       = isPhonemePresent(:);
%%

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
%weights                 = 1*ones(numberGroups*numberPhonemes,1);

weights1                 = 1.69343*rand(numberGroups*numberPhonemes,1);


% colour allocation
% RANDOM
% circ_colour             = rand(numberGroups*numberPhonemes,3);
% WHITE
% circ_colour             = ones(numberGroups*numberPhonemes,3);
% BLACK
% circ_colour             = zeros(numberGroups*numberPhonemes,3);
% PER LINE
 circ_colour              = 8*[-9+yy +9+yy 51-yy]/255;
circ_colour(circ_colour<0) = 0;
circ_colour(circ_colour>1) = 1;

% circ_colour([1:4  9:12 17:20],1)    = 0.7;
% circ_colour([5:8 13:16 21:24],2)    = 0.4;
% circ_colour([25:48],3)              = 0.6;


cla
hold on
minCircleSize           = 0.7;
weights1(weights1<minCircleSize)    = minCircleSize;
weights                 = weights1.*isPhonemePresent2+0.001;
%weights([7 8 16]) = 0.0001;
textSize                = 20*ones(numberGroups*numberPhonemes,1);
%hCircles                = viscircles([xx(:) yy(:)],weights,'color',0.7*[1 1 1]);

%hText = text(xx(:)-0.4*weights, yy(:),names2,'fontsize',24);
for k=1:numberGroups*numberPhonemes

        hCircles(k)         = plot(xx(k),yy(k),'o','markersize',50*(weights(k)),'color',circ_colour(k,:),'markerfacecolor',circ_colour(k,:),'linewidth',0.5);
        hText(k)            = text(xx(k)-0.9*weights(k),yy(k),names2{k},'fontsize',3);
        hText(k).FontSize   = textSize(k)*weights(k);
        hText(k).Color      = 'k';%circ_colour(k,:); % colour allocation

end
grid on;axis tight
axis equal
axis off
axis ij
%%
%vowels = {'?','i:','?','u:','??','e?','','e','?','?:','?:','??','??','??','æ','?','?:','?','e?','a?','a?','/','p','b','t','d','?','?','k','g','f','v','?','ð','s','z','?','?','m','n','?','h','l','r','w','j'};

%names2={'m?','m','?','n?','n?','n','??','?','??','?','??','?','?','p','b','p?','b?','t?','d?','t','d','?','?','c','?','k','?','q','?','?','?','ts','dz','t??',...    
% 'd??','??','??','t?','d?','p?','b?','p?f','','b?v','t??','d?ð','t???','d??','t?????','','d????','cç','??','kx','??','q?','??','?h','s','z','?','?','?','?','?',...
% '?','?','?','f','v','??','ð?','?','ð','','??','ð?','????','???','??','ç','?','','x','?','?','?','?','?','h','?','','??','?','??','?','','??','?','j?','j',...
% '??','?','??','??','?','??','??','?','??','?','','??','??','??','?','r?','r','??r?','?r','??','','?','?','?','t?','d?','????','c???','k???','','???','?','?','???','??','???','??',...
% '???','??','l?','l','??','?','??','?','??','?','??','?','??','??','??'};
