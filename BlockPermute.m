function [CipherImage] = BlockPermute(InputImage,NumberOfBlocks,Key)
%BlockPermute
[n, m]=size(InputImage);
A=slice(InputImage,sqrt(NumberOfBlocks),sqrt(NumberOfBlocks));
B=A;
for ii=1:NumberOfBlocks
    B(ii)=A(Key(ii));
end
cellContents = cell2mat(B); % Convert from cell to double.
CipherImage = reshape(cellContents, [n, m]);
end

