function [bcs, sourceVector] = boundaryConditions(D,b1,b1value,b2,b2value,msh,sourceVector)

n = length(msh.nvec);
bcs=zeros(2,n);

switch b1
    case 'd'
        bcs(1,1) = 1;
        sourceVector(1)=b1value;
    case 'n'
        sourceVector(1)=sourceVector(1)-D*b1value;
    otherwise
        error('incorrect boundary condition has been stated');
end
    
switch b2
    case 'd'
        bcs(2,n) = 1;
        sourceVector(n)=b2value;
    case 'n'
        sourceVector(n)=sourceVector(n)+D*b2value;
    otherwise
        error('incorrect boundary condition has been stated')
end
end