% Niveetha Wijendran, Nijash Sooriyakumaran
% Lab 3 - Question 1
clear all;
close all;
clc;

pic = imread("KillarneyPic.png");
fileInfo = imfinfo("KillarneyPic.png")
pic2 = im2double(pic);

figure
imshow(pic2);
title("Original Picture of Killarney")

figure
imshow(pic2);
colormap("gray"); % NEED TO CHANGE TO 1-gray, but don't know how
title("Colourmap: gray")

%% Impulse sampling at 1/5 of original rate
impulse_sampled = pic2;
count=0;
for i=1:length(pic2(1,:))
    for j=1:length(pic2(:,1))
        if(count==0)
            count=count+1;
            continue;
        end
        
        impulse_sampled(j,i) = 0;
        count=count+1;

        if(count==5)
            count=0;
        end
    end
end

figure
imshow(impulse_sampled)
title("Impulse Sampled at 1/5 of Original Rate")

%% Downsampling by a factor of 5
downsampled = pic2(1:5:length(pic2(:,1)),1:5:length(pic2(1,:)));

figure
imshow(downsampled)
title("Downampled by a factor of 5")

%% Zero-order hold construction from part 2
count2=0;

for i=1:length(downsampled(:,1))
    count1=0;
    for j=1:length(downsampled(1,:))
        for k=1:5
            for l=k:5
                zero_order(count2*5+(k),count1*5+l) = downsampled(i,j);
                zero_order(count2*5+l,count1*5+(k)) = downsampled(i,j);
            end
        end
        count1 = count1 + 1;
    end
    count2 = count2+1;    
end

figure
imshow(zero_order)
title("Zero-Order Hold Reconstruction")

%% First-order hold construction from part 2
figure
a = interp2(downsampled,2);
imshow(a)

figure
b = imresize(downsampled, [5*length(downsampled(:,1)), 5*length(downsampled(1,:))], "bilinear");
imshow(b)

count2=0;
count = 0;
for i=1:length(downsampled(:,1))
    count1=0;
    for j=1:length(downsampled(1,:))
        for k=1:5
            for l=k:5
                if(i<length(downsampled(:,1)) && j<length(downsampled(1,:)))
                    first_order(count2*5+(k),count1*5+l) = interpolate(downsampled,i+1,j+1,i,j,count2*5+k,count1*5+l);
                    first_order(count2*5+l,count1*5+(k)) = interpolate(downsampled,i+1,j+1,i,j,count2*5+l,count1*5+k);
                elseif (i==length(downsampled(:,1)) && j==length(downsampled(1,:)))
                    count = count + 1;
                    if(j+1<length(downsampled(1,:)))
                        first_order(count2*5+(k),count1*5+l) = interpolate(downsampled,i-1,j,i,j+1,count2*5+k,count1*5+l);
                        first_order(count2*5+l,count1*5+(k)) = interpolate(downsampled,i-1,j,i-1,j+1,count2*5+l,count1*5+k);
                    end
                end
            end 
        end
        count1 = count1 + 1;
    end
    count2 = count2+1;    
end

figure
imshow(first_order)

function f = interpolate(arr, x1, y1, x2, y2, x, y)
    f1 = ((x2-x)/(x2-x1))*arr(x1,y1) + ((x-x1)/(x2-x1))*arr(x2,y1);
    f2 = ((x2-x)/(x2-x1))*arr(x1,y2) + ((x-x1)/(x2-x1))*arr(x2,y2);
    f = ((y2-y)/(y2-y1))*f1 + ((y-y1)/(y2-y1))*f2;
end