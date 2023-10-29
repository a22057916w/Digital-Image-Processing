clear; clc; close all;

testimg1 = imread('circuit.tif');
testimg2 = imread('face.tif');
testimg3 = imread('moon.tif');

%% Show (a)
Q3_show(testimg1, 'medianfilter(img, 5)', 'medianfilterred image')
Q3_show(testimg2, 'medianfilter(img, 5)', 'medianfilterred image')

%% Show (b)
Q3_show(testimg1, 'gaussfilter(img, 1, 5, 10)', 'gaussfilterred image')
Q3_show(testimg2, 'gaussfilter(img, 1, 5, 10)', 'gaussfilterred image')

%% Show (c)
Q3_show(testimg3, 'highboostfilter(img, 2, 5)', 'highboostfiltered image')

%%
function O = medianfilter(I, filter_size)
    % O is filtered image, I is original image
    
    % your implementation here ...
end

function O = gaussfilter(I, K, filter_size, sigma)
    % O is filtered image, I is original image

    % your implementation here ...
end

function O = highboostfilter (I, A, filter_size)
    % O is filtered image, I is original image

    % your implementation here ...
end

function Q3_show(img, string, titlestr)
    figure()
    result = eval(string);
    subplot(1,2,1); imshow(img); title("Original image");
    subplot(1,2,2); imshow(result); title(titlestr);
end