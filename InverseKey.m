function [invKey] = InverseKey(Key)
%InversKey
[n,m]=size(Key);
invKey = 1:(n*m);
invKey (Key) = invKey ;
end

