clear; clc; close all;

testI1 = imread('circuit.tif');
testI2 = imread('face.tif');
testI3 = imread('moon.tif');

%% Show (a)
Q3_show(testI1, 'medianfilter(I, 5)', 'medianfilterred image')
Q3_show(testI2, 'medianfilter(I, 5)', 'medianfilterred image')

%% Show (b)
Q3_show(testI1, 'gaussfilter(I, 1, 5, 10)', 'gaussfilterred image')
Q3_show(testI2, 'gaussfilter(I, 1, 5, 10)', 'gaussfilterred image')

%% Show (c)
Q3_show(testI3, 'highboostfilter(I, 2, 5)', 'highboostfiltered image')

%%
function O = medianfilter(I, filter_size)
    % O is filtered image, I is original image
    % your implementation here ...

    [rows, cols] = size(I); % Get image dimensions  
 
    pad_size = floor(filter_size / 2);  % Get the padding size
    IPadded = padarray(I, [pad_size pad_size]); % Pad array with zeros
    
    O = zeros(rows, cols);  % Create output array
    
    % Coordinates for output image
    x = 0; 
    y = 0;

    % Loop through image, the origin in original image is loated on (1 + pad_size, 1 + pad_size)
    for i = 1 + pad_size : rows + pad_size
        x = x + 1;
        y = 0;
        for j = 1 + pad_size : cols + pad_size 
            y = y + 1;
            % Get neighborhood and center
            kernel = IPadded(i - pad_size : i + pad_size, j - pad_size : j + pad_size);
            % Compute median
            O(x, y) = median(kernel(:));
        end
        
    end
    O = uint8(O);
end

function O = gaussfilter(I, K, filter_size, sigma)
    % O is filtered image, I is original image
    % your implementation here ...

    [rows, cols] = size(I); % Get image dimensions  
 
    pad_size = floor(filter_size / 2);  % Get the padding size
    IPadded = padarray(I, [pad_size pad_size]); % Pad array with zeros
    
    % Initializ two matrix a grid with X have all rows equal to
    % pad_size:pad_size, Y have all cols euqal to that too
    [X,Y] = meshgrid(-pad_size:pad_size, -pad_size:pad_size);   
    
    % Compute Gaussian kernel
    kernel = K * exp(-(X.^2 + Y.^2) / (2*sigma^2));
    kernel = kernel / sum(kernel(:));
    
    O = zeros(rows, cols);  % Create output array

    % Coordinates for output image
    x = 0; 
    y = 0;

    % Loop through image
    for i = 1 + pad_size : rows + pad_size
        x = x + 1;
        y = 0;
        for j = 1 + pad_size : cols + pad_size
            y = y + 1;

            % Get neighborhood and center
            neighbor = IPadded(i - pad_size : i + pad_size, j - pad_size : j + pad_size);
            neighbor = double(neighbor);    % Change double to do dot product
            prod = kernel .* neighbor;
            O(x, y) = sum(prod(:));
        end
    end
    O = uint8(O);
end

function O = highboostfilter (I, A, filter_size)
    % O is filtered image, I is original image
    % your implementation here ...

    % Subtract the blurred image(lowpass filterd image)
    mask = I - gaussfilter(I, 1, filter_size, 10);
    % Add the mask to the original image
    O = I + mask * A;

    O = uint8(O);
end

function Q3_show(I, string, titlestr)
    figure()
    result = eval(string);
    subplot(1,2,1); imshow(I); title("Original image");
    subplot(1,2,2); imshow(result); title(titlestr);
end