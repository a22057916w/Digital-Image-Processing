function result = LabelCC(img, num)
% component labeling with num-connected (num =4 or 8)

    if num == 4
        % ------ implement your 4-connected components labeling algorithm here ------
        % result = your answer 
        result = Label4Connected(img); % return a matrix that labels seperated components
    elseif num == 8
        % ------ implement your 8-connected components labeling algorithm here ------
        % result = your answer 
        result = Label8Connected(img);
    else
        error('MyFunc:InputMustbe4or8','The second argument should be 4 or 8.')
    end
end


function labeledImage = Label4Connected(img)
    [height, width] = size(img);
    labeledImage = zeros(size(img));    % initial a matrix wiht zero values tha has the same size of img
    label = 0;
    
    for row = 1:height
        for col = 1:width
            if img(row, col) == 1 && labeledImage(row, col) == 0
                label = label + 1;
                dfs(row, col, label);
            end
        end
    end

    function dfs(x, y, currentLabel)
        if (x < 1 || x > height) || (y < 1 || y > width) || img(x, y) == 0 || labeledImage(x, y) > 0
            return;
        end

        labeledImage(x, y) = currentLabel;
        dfs(x - 1, y, currentLabel);
        dfs(x + 1, y, currentLabel);
        dfs(x, y - 1, currentLabel);
        dfs(x, y + 1, currentLabel);
    end
end


function labeledImage = Label8Connected(img)
    [height, width] = size(img);
    labeledImage = zeros(size(img));
    label = 0;
    
    for row = 1:height
        for col = 1:width
            if img(row, col) == 1 && labeledImage(row, col) == 0
                label = label + 1;
                dfs(row, col, label);
            end
        end
    end

    function dfs(x, y, currentLabel)
        if (x < 1 || x > height) || (y < 1 || y > width) || img(x, y) == 0 || labeledImage(x, y) > 0
            return;
        end

        labeledImage(x, y) = currentLabel;
        dfs(x - 1, y, currentLabel);
        dfs(x + 1, y, currentLabel);
        dfs(x, y - 1, currentLabel);
        dfs(x, y + 1, currentLabel);
        
        % diagonal search
        dfs(x - 1, y + 1, currentLabel);
        dfs(x + 1, y + 1, currentLabel);
        dfs(x - 1, y - 1, currentLabel);
        dfs(x + 1, y - 1, currentLabel);
    end
end