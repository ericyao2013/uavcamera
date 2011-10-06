
clear all
close all

% load clown
load mandrill

X = (X-min(min(X)))./max(max(X-min(min(X))));

%% fft

freqX = fft2(X);

testFreqX = zeros(size(freqX));

shiftedFreqX = fftshift(freqX);

centre = size(freqX)/2;
figure

for z = 10:-0.5:1.5
    squarewidth = round(centre(1)/z);
    squareheight = round(centre(2)/z);
    % squarewidth = 10;
    % squareheight = 16;
    testFreqX = zeros(size(freqX));
    
    for x = -squarewidth:squarewidth;
        for y = -squareheight:squareheight;
            testFreqX(centre(1)+x,centre(2)+y) = shiftedFreqX(centre(1)+x,centre(2)+y);
        end
    end
    
    testFreqX = fftshift(testFreqX);
    
    testX = abs(ifft2(testFreqX));
    
    imagesc(testX)
    colormap gray
    drawnow
    pause(0.1)
end

%% dct

cfreqX = dct2(X);
bigness = size(cfreqX);

% squarewidth = 10;
% squareheight = 16;
for z = 10:-0.5:1.5
    
    ctestFreqX = zeros(size(cfreqX));
    
    squarewidth = round(bigness(1)/z);
    squareheight = round(bigness(2)/z);
    
    for x = 1:squarewidth;
        for y = 1:squareheight;
            ctestFreqX(x,y) = cfreqX(x,y);
        end
    end
    
    testX = abs(idct2(ctestFreqX));
    
    imagesc(testX)
    colormap gray
    drawnow
    pause(0.1)
end







