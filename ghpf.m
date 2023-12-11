% change size of std (standard deviation)
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
fm = max(flog(:)); image(flog*255/fm); 
colormap(map), axis('square') 

gsize=512; 
std = 3; 
[x,y] = meshgrid(-256:255,-256:255); 
arg = -(x.*x + y.*y)/(2*std*std); 
glf = exp(arg); 
glf(glf<eps*max(glf(:))) = 0; 
sumh = sum(glf(:)); 
%if sumh ~= 0
%glf =glf/sumh; 
%end

% ====== new ======
ghf = 1 - glf;
% =================

subplot(3,2,4) 
image(255*ghf); % glf -> ghf
colormap(map), axis('square') 

yLenaf=xLenaf.*ghf; % glf -> ghf
flog = log(1+abs(yLenaf)); 
fm = max(flog(:)); 
subplot(3,2,6) 
image(flog*255/fm); 
colormap(map), axis("square") 

yLena=ifft2(yLenaf); 
subplot(3,2,5) 
image(abs(yLena)); 
colormap(map),axis('square')

% If std goes larger, more low-frequency will be flitered out, resulting a sharper image, vice versa.