
function A = slice(B,H,W)
%slice
[n, m] = size(B);

if W > 1
   nmax = floor([(n/W).*(1:W-1), n]);
   nmin = [1,nmax(1:end-1)+1];
else
   nmax = n;
   nmin = 1;
end

if H > 1
   mmax = floor([(m/H)*(1:H-1), m]);
   mmin = [1,mmax(1:end-1)+1];
else
   mmax = m;
   mmin = 0;
end

for i=1:length(nmin)
   for j=1:length(mmin)   
    A{i,j} =  B(nmin(i):nmax(i),mmin(j):mmax(j));
   end
end  
