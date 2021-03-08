function elemat = SourceVector(k,eID,msh)

%get appropriate J value from mesh data structure
J = msh.elem(eID).J;

%get value of Xi
Xi = msh.nvec(length(msh.nvec));

%create 2x2 matrix to store diffusion values
elemat = zeros(2,2);

%fill in each term in the empty matrix
%spatially varying source term matrix
elemat(1,1) = (-k*J/12)*((1-Xi)^3-(1-(-Xi))^3); 
elemat(1,2) = (k*J/4)*((Xi-(Xi^3)/3)-(-Xi-((-Xi)^3)/3));
elemat(2,1) = (k*J/4)*((Xi-(Xi^3)/3)-(-Xi-((-Xi)^3)/3));
elemat(2,2) = (k*J/12)*((1+Xi)^3-(1-(+Xi))^3); 

end
