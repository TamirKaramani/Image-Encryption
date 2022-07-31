function [CipherImage] = PixelPermute(InputImage,NumberOfBlocks,Keys)
%PixelPermute
[n, m]=size(InputImage);
A = slice(InputImage,sqrt(NumberOfBlocks),sqrt(NumberOfBlocks));
B=A;
for k=1:NumberOfBlocks
	B{k}=BlockPermute(A{k},n*m/NumberOfBlocks,Keys{k});    
end
cellContents = cell2mat(B); % Convert from cell to double.
CipherImage = reshape(cellContents, [n, m]);
end

