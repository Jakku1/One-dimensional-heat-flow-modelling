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
k = 1;

localVector = localSourceVector(k,eID,msh);
correctLocalVector = [0.0417;0.0833];

iswithintol = ismembertol(localVector, correctLocalVector, 0.05, 'ByRows', true);
assert(all(iswithintol))


%% Test 2: Correct size of sourceVector produced
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
k = 1;

solution = Solver(lmda,D,k,eID,msh,b1,b1value,b2,b2value);
length = length(solution);

assert(length == 5)