%% Test 1: Correct Output matrix size
% Test that the output matrix is the correct size for a 4 node mesh

lmda = -9; %diffusion coefficient
D = 1;
eID=1; %element ID
msh = OneDimLinearMeshGen(0,1,4);
k = 0;
b1 = 'd';
b1value = 0;
b2 = 'd';
b2value = 1;


solution = Solver(lmda,D,k,eID,msh,b1,b1value,b2,b2value); 


assert(length(solution) == 5)
%% Test 2: Correct Output matrix size for large Mesh
% Test that the output matrix is the correct size for a 4 node mesh

lmda = -9; %diffusion coefficient
D = 1;
eID=1; %element ID
msh = OneDimLinearMeshGen(0,1,9);
k = 0;
b1 = 'd';
b1value = 0;
b2 = 'd';
b2value = 1;


solution = Solver(lmda,D,k,eID,msh,b1,b1value,b2,b2value); 


assert(length(solution) == 10)
%% Test 3: Correct Solution
% Test that the output matrix gives the correct solution
lmda = -9; %diffusion coefficient
D = 1;
eID=1; %element ID
msh = OneDimLinearMeshGen(0,1,4);
k = 0;
b1 = 'd';
b1value = 0;
b2 = 'd';
b2value = 1;


solution = Solver(lmda,D,k,eID,msh,b1,b1value,b2,b2value); 


correctSolution = zeros(5,1);
for i=1:5
    x = msh.nvec(i);
    correctSolution(i) = (exp(3)/(exp(6)-1))*(exp(3*x)-exp(-3*x));
end

iswithintol = ismembertol(solution, correctSolution, 0.01, 'ByRows', true);
assert(all(iswithintol))
%% Test 4: Correct Solution for large matrix
% Test that the output matrix gives the correct solution
lmda = -9; %diffusion coefficient
D = 1;
eID=1; %element ID
msh = OneDimLinearMeshGen(0,1,9);
k = 0;
b1 = 'd';
b1value = 0;
b2 = 'd';
b2value = 1;


solution = Solver(lmda,D,k,eID,msh,b1,b1value,b2,b2value); 

correctSolution = zeros(10,1);
for i=1:10
    x = msh.nvec(i);
    correctSolution(i) = (exp(3)/(exp(6)-1))*(exp(3*x)-exp(-3*x));
end

iswithintol = ismembertol(solution, correctSolution, 0.05, 'ByRows', true);
assert(all(iswithintol))