% change size of D and n to view the differences of Butterworth low-pass filter
% ======== new =========
[xLena, map]=imread('lena.bmp');
xLenaf=fftshift(fft2(xLena));
% ======================
fig = figure(); 
fig.Position(3:4) = [1000, 1500]; 
subplot(3,2,1) 
image(xLena); 
colormap(map), axis('square') 

subplot(3,2,2) 
flog = log(1+abs(xLenaf)); 
fm = max(flog(:)); 
image(flog*255/fm); 
colormap(map), axis('square') 

%D=15, n=2 
D=2048; % set D = 2048
n=8;    % set n = 8
[x,y]=meshgrid(-256:255,-256:255); 
blf=1./(1+((x.^2+y.^2)/D).^n); 
subplot(3,2,4) 
image(255*blf); 
colormap(map), axis('square') 

yLenaf=xLenaf.*blf; 
flog = log(1+abs(yLenaf)); 
fm = max(flog(:)); 
subplot(3,2,6)
image(flog*255/fm); 
colormap(map), axis('square') 

yLena=ifft2(yLenaf); 
subplot(3,2,5) 
image(abs(yLena)); 
colormap(map), axis('square')

% if D goes larger, more frequency would be covered/retained, resulting a clearer(less blur) image.
% if n goes larger, more frequency would be filtered out, resulting a blurer image, and when n reach a certain value, the effect becomes no longer significant.