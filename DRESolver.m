function solution = DRESolver(D,lmda,eID,msh)

%n = number of nodes in the mesh
n = length(msh.nvec);

%create empty 2x2 matrix for local Matrix
localMatrix = zeros(2,2);

%create empty nxn matrix to store the global values
globalMatrix = zeros(n,n);

%loop through each element in the matrix
for i = 1:n-1
    
    %create Local Diffusion Matrix for current element
    localDiff = LaplaceElemMatrix(D,eID,msh);
    
    %create Local Reation matrix for current element
    localReac = LaplaceReacElementMatrix(lmda,eID,msh);
    
    %add diffusion and reaction matricies
    localMatrix = localDiff + localReac;
    
    %add local matrix to global matrix in the correct position
    globalMatrix(i:i+1,i:i+1) = globalMatrix(i:i+1,i:i+1)+localMatrix;
    
end

%add boundary condition
%dirichlet boundary condition
dbc1 = zeros(n,1);
dbc1(1) = 1;
dbcn = zeros(n,1);
dbcn(n) = 1;

%neumann boundary condition
dcdx = 2;
nbc = zeros(1,n);
nbc(1) = -D*dcdx;
nbc(n) = D*dcdx;

%set the boundaries
globalMatrix(1,:) = dbc1;
globalMatrix(n,:) = dbcn;

%define vector with dirichlet conditions
boundaryVector = zeros(1,n);
boundaryVector = [2;0;0;0;0];

%neumann boundary conditions
% boundary vector = boundaryVector + nbc;

%divide the boundary vector by the diffusion matrix
solution = globalMatrix\boundaryVector;

end