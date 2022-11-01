clear
A = [3 1 1;-1 3 1 ];
[n,m] = size(A);
[eVectors,eValues] = eig(A*A');
[~,sortedIndices1] = sort(diag(eValues),'descend');
Sigma = zeros(n,m);
for i=1:n
    Sigma(i,i) = sqrt(eValues(sortedIndices1(i),sortedIndices1(i)));
end

U = eVectors(:,sortedIndices1);

[eVectors,eValues] = eig(A'*A);
[~,sortedIndices2] = sort(diag(eValues),'descend');
V = eVectors(:,sortedIndices2);

A = A(sortedIndices1,:)
SVDRes = U*Sigma*V'
minx = V(:,end)
normx = norm(minx)
minAx = norm(A*minx,2)

maxx = V(:,1)
normx = norm(maxx)
maxAx = norm(A*maxx,2)
normA = norm(A)