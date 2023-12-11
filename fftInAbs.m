[x, map] = imread('lena.bmp');
xf = fftshift(fft2(x));
fabs = abs(xf);
fm = max(fabs(:));
subplot(1,2,1)
image(x);
colormap(map), axis('square')
axis('square')
subplot(1,2,2)
image(fabs*255/fm);
colormap(map), axis('square')