%% Test 1: Correct application of dirichlet boundaries
% Test that the addition of dirichlet boundaries is correct for a non zero
% source term
lmda = -9; %diffusion coefficient
D = 1;
eID=1; %element ID
msh = OneDimLinearMeshGen(0,1,4);
k = 0;
b1 = 'd';
b1value = 0;
b2 = 'd';
b2value = 1;
f = [1;2;3;4;5];

[bcs, sourceVector] = boundaryConditions(D,b1,b1value,b2,b2value,msh,f);

assert(isequal(sourceVector,[0;2;3;4;1]))
%% Test 2: Correct application of Neumann boundary
% Test that the addition of a neumann boundary is correct for a non zero
% source term
lmda = -9; %diffusion coefficient
D = 1;
eID=1; %element ID
msh = OneDimLinearMeshGen(0,1,4);
k = 0;
b1 = 'd';
b1value = 0;
b2 = 'n';
b2value = 1;
f = [1;2;3;4;5];

[bcs, sourceVector] = boundaryConditions(D,b1,b1value,b2,b2value,msh,f);

assert(isequal(sourceVector,[0;2;3;4;6]))
%% Test 2: Correct application of alternate Neumann boundary
% Test that the addition of a neumann boundary is correct for a non zero
% source term
lmda = -9; %diffusion coefficient
D = 1;
eID=1; %element ID
msh = OneDimLinearMeshGen(0,1,4);
k = 0;
b1 = 'n';
b1value = 1;
b2 = 'd';
b2value = 0;
f = [1;2;3;4;5];

[bcs, sourceVector] = boundaryConditions(D,b1,b1value,b2,b2value,msh,f);

assert(isequal(sourceVector,[0;2;3;4;0]))