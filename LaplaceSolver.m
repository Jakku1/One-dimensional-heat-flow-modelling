function solution = LaplaceSolver(lmda,D,k,eID,msh,b1,b1value,b2,b2value)

%n = number of nodes in the mesh
n = length(msh.nvec);

%create empty 2x2 matrix for local Matrix
localMatrix = zeros(2,2);

%create empty 2x1 matrix for local source Vector
localSource = zeros(2,1);

%create empty nxn matrix to store the global values
globalMatrix = zeros(n,n);

%create empty nx1 matrix to store the final source Vector
sourceVector = zeros(n,1);

%loop through each element in the matrix
for i = 1:n-1
    
    %create Local Diffusion Matrix for current element
    localDiff = LaplaceElemMatrix(D,i,msh);
    
    %create Local Reation matrix for current element
    localReac = LaplaceReacElementMatrix(lmda,i,msh);
    
    %create local Source Vector for current elemnt
    localSource = localSourceVector(k,i,msh);
    
    %add local source vector to the final source vector in the correct
    %position
    sourceVector(i:i+1) = sourceVector(i:i+1) + localSource;
    
    %combine diffusion and reaction matricies
    localMatrix = localDiff - localReac;
    
    %add local matrix to global matrix in the correct position
    globalMatrix(i:i+1,i:i+1) = globalMatrix(i:i+1,i:i+1)+localMatrix;
    
end

% calculate boundary update conditions 
%return updates for global matrix and final boundary Vector
[bcs, boundaryVector] = boundaryConditions(D,b1,b1value,b2,b2value,msh,sourceVector);

%update global matrix depending on the type of boundary condition.
switch b1
    case 'd'
        %replace line in global matrix to update
        globalMatrix(1,:) = bcs(1,:);
    case 'n' 
        %add boundary update to current line in global matrix
        globalMatrix(1,:) = globalMatrix(1,:) + bcs(1,:);
    otherwise 
        %if incorrect letter is found, flag an error
        error('boundary condition entered is not valid');
end

%update second boundary condition.
switch b2
    case 'd'
        globalMatrix(n,:) = bcs(2,:);
    case 'n'
        globalMatrix(n,:) = globalMatrix(n,:) + bcs(2,:);
    otherwise
        error('boundary condition entered is not valid');
end

%divide the boundary vector by the diffusion matrix
solution = globalMatrix\boundaryVector;

%plot the result c matrix
displayMesh(msh, solution);

end