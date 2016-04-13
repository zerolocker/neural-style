function draw4BoundingBoxes(filename)
    [~,image_name,~] = fileparts(filename);
    I = imread(filename);
    figure, imshow(I);
    prompts = {'Draw left eye bounding box', 'Draw right eye bounding box', ...
        'Draw nose bounding box', 'Draw mounth bounding box'};
    rects = [];
    for i = 1:4
        title(prompts{i});
        rect = int32(getrect);
        rects = [rects;rect];
        hold on;
        rectangle('Position',rect,'EdgeColor',[1 1 0])
    end
    
    fout = fopen(sprintf('%s.rect.txt',image_name),'w');
    for i = 1:size(rects,1)
        fprintf(fout,'%d ',rects(i,:));
        fprintf(fout,'\n');
    end
    fclose(fout);
end