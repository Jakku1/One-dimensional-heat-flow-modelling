tol = 1e-14;
lmda = 0; %diffusion coefficient
D = 1;
eID=1; %element ID
msh = OneDimLinearMeshGen(0,1,9);

solution = LaplaceSolver(lmda,D,eID,msh); 


correctSolution = zeros(10,1);
for i=1:10
    x = msh.nvec(i);
    correctSolution(i) = 2*(1-x);
end

correctSolution
solution

%a = isequal(solution, correctSolution)
iswithintol = ismembertol(solution, correctSolution, 0.01, 'ByRows', true);
assert(all(iswithintol))