N = 4001;
space_max = 4;
[X,Y] = meshgrid(linspace(-space_max,space_max,N),linspace(-space_max,space_max,N));
Z = X +1i*Y;
C=zeros(N,N);
parfor j = 1:N
    for k = 1:N
        [~,~,C(j,k)] = tetr(Z(j,k));
    end
end
s = pcolor(X,Y,C); s.EdgeColor = 'none';
