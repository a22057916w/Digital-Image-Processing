% change size of z to view the differences of low pass filter
[xLena, map]=imread('lena.bmp'); % xLena = imread('lena.bmp') -> [xLena, map] = imread('lena.bmp')
xLenaf=fftshift(fft2(xLena));
flog = log(1+abs(xLenaf));
fm = max(flog(:));
fig = figure();
fig.Position(3:4) = [1000, 1500];
subplot(3,2,1)
image(xLena);
colormap(map), axis('square')
subplot(3,2,2)
image(flog*255/fm);
colormap(map), axis('square')
[x,y]= meshgrid(-256:255,-256:255);
z = sqrt(x.^2+ y.^2);
% clf= (z<15);
clf = (z < 100); % set z < 100
subplot(3,2,4)
image(255*clf);
colormap(map), axis('square')
subplot(3,2,6)
yLenaf=xLenaf.*clf;
flog = log(1+abs(yLenaf));
fm = max(flog(:));
image(flog*255/fm);
colormap(map), axis('square')
yLena=ifft2(yLenaf);
subplot(3,2,5)
image(abs(yLena));
colormap(map), axis('square')

% If z goes larger, less high-frequency gets filtered out, the resulting
% image become sharper.
% If z goes smaller, more high-frequency get filter out, the resulting
% image become smoother.
