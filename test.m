clc;
clear all;
close all;

%%%%%%%%%%%%%
InputImage = imresize(im2gray(imread('mri1.png')),[512,512]);
Image = uint8(dwt2(im2gray(InputImage),'haar'));

[n, m]=size(Image);
NumberOfBlocks=64;

Key = randperm(NumberOfBlocks);
invKey=InverseKey(Key);

for k=1:NumberOfBlocks
    Keys{k}=randperm(n*m/NumberOfBlocks);
    invKeys{k}=InverseKey(Keys{k});
end

BlockPermuteImage = BlockPermute(Image,NumberOfBlocks,Key);

PixelPermuteImage = PixelPermute(BlockPermuteImage,NumberOfBlocks,Keys);

invPixelPermuteImage = PixelPermute(PixelPermuteImage,NumberOfBlocks,invKeys);

invBlockPermuteImage = BlockPermute(invPixelPermuteImage,NumberOfBlocks,invKey);

figure
subplot(2,2,1)
imshow(InputImage,[])
subplot(2,2,2)
imshow(BlockPermuteImage,[])
subplot(2,2,3)
imshow(PixelPermuteImage, []);
subplot(2,2,4)
imshow(invBlockPermuteImage, []);
