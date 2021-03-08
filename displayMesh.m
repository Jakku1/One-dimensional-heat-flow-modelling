function displayMesh(mesh, solution)

  x = mesh.nvec;
  y = solution;
  n = 0:0.1:1;
  %c = (exp(3)/(exp(6)-1))*(exp(3*n)-exp(-3*n));
  c = 2*(1-n);
 
  %y = zeros(mesh.ngn,1);
  plot(x,y,'-ok');
  hold on
  %plot (n,c);
  hold off

end
