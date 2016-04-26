function showBoundingBoxes(filename)
    [~,image_name,~] = fileparts(filename);
    I = imread(filename);
    figure, imshow(I);
    
    fid = fopen(sprintf('%s.rect.txt',image_name),'r');
    tline = fgetl(fid);
    while ischar(tline)
        rect = str2num(tline);
        hold on;
        rectangle('Position',rect,'EdgeColor',[1 1 0])
        tline = fgetl(fid);
    end
    fclose(fid);
end
