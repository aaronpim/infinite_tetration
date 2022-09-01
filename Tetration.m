N = 4001;
space_max = 4;
[X,Y] = meshgrid(linspace(-space_max,space_max,N),linspace(-space_max,space_max,N));
Z = X +1i*Y;
% This creates the subset of the complex numbers z in space_max*((-1,1)+i(-1,1))
C=zeros(N,N);
parfor j = 1:N
    for k = 1:N
        [~,~,C(j,k)] = tetr(Z(j,k));
        % This approximates the function y(n+1) = z^y(n), for y(0)=z, for n=1000.
        % It then computes if the sequence diverges to infinity, converges to a point or if it cycles between a series of values.
        % C(j,k) = 0 implies that the point z is such that y(n) diverges.
        % C(j,k) = 1 implies that the point z is such that y(n) converges to a point.
        % C(j,k) = N > 1 implies that the point z is such that the sequence y(n) is periodic with period N. 
    end
end
s = pcolor(X,Y,C); s.EdgeColor = 'none';
