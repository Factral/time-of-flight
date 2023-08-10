load("Img_100.mat")
load("data.mat")



c = {};
for i=1:1288
c{end+1} = squeeze(data(1,i,:));
end

c_1 = {};
for i=1:1288
c_1{end+1} = squeeze(data(2,i,:));
end

c_2 = {};
for i =1:1288
c_2{end+1} = names(i,:);
end

field = 'Wavelength';
field1 = 'Reflectance';
field2 = 'Class';
value = c;
value1 = c_1;
value2 = c_2;
s = struct(field,value,field1,value1,field2,value2);



cube = permute(cube, [2,1,3]);

numEndmembers = countEndmembersHFC(cube,'PFA',10^-27);
endMembers = nfindr(cube,numEndmembers);

figure
plot(endMembers,'LineWidth',2)
axis tight
xlabel('Wavelength (nm)')
ylabel('Data Values')
title('Endmembers Extracted using N-FINDR')
num = 1:numEndmembers;
legendName = strcat('Endmember',{' '},num2str(num'));
legend(legendName)

wavelength = [360, 370, 380, 390, 400, 410, 420, 430, 440, 450, 460, 470, 480, 490, 500, 510, 520, 530, 540, 550, 560, 570, 580, 590, 600, 610, 620, 630, 640, 650, 660];

detection = cell(1,1);
cnt = 1;
queryEndmember = 1:8;

for num = 1:numel(queryEndmember)
    spectra = endMembers(:,queryEndmember(num));
    scoreValues = spectralMatch(s,spectra,wavelength,'Method','sid');
    [~, matchIdx] = max(scoreValues);
    detection{cnt} = s(matchIdx).Class;
    disp(strcat('Endmember spectrum ',{' '},num2str(queryEndmember(num)),' is identified as ',{' '},detection{cnt}))
    cnt=cnt+1;
end










threshold = 15;
rgbImg = cube(:,:,10:12);
overlayImg = rgbImg;
labelColor = {'Blue','Green','Red', 'Yellow', 'magenta', 'Green', 'Blue', 'cyan'};
segmentedImg = cell(size(cube,1),size(cube,2),numel(queryEndmember));
for num = 1:numel(queryEndmember)
    scoreMap = sid(cube,endMembers(:,queryEndmember(num)));
    segmentedImg{num} = scoreMap <= threshold;
    overlayImg = imoverlay(overlayImg,segmentedImg{num},labelColor{num});   
end




figure('Position',[0 0 900 400])
plotdim = [0.02 0.2 0.3 0.7;0.35 0.2 0.3 0.7];
for num = 1:numel(queryEndmember)
    subplot('Position',plotdim(num,:))
    imagesc(segmentedImg{num})
    title(strcat('region :',{' '},detection{num}));
    colormap([0 0 0;1 1 1])
    axis off
end



