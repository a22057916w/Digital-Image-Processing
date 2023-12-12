% change size of z to view the differences of high pass filter
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
[x,y]=meshgrid(-256:255,-256:255);
z=sqrt(x.^2+y.^2);
% chf=(z>15);
chf = (z > 65); % set z > 65
subplot(3,2,4)
image(255*chf);
colormap(map), axis('square')
yLenaf=xLenaf.*chf;
flog = log(1+abs(yLenaf));
fm = max(flog(:));
subplot(3,2,6)
image(flog*255/fm);
colormap(map)
yLena=ifft2(yLenaf);
subplot(3,2,5)
image(abs(yLena));
colormap(map), axis('square')

% If z goes larger, more frequency gets filtered out, the resulting image become sharper (more edge detail).
% However, if z goes too large, the high frequency would also be filter out, resulting a dark image.

% If z goes smaller, less frequency gets filtered out, the resulting image become less sharp. 
