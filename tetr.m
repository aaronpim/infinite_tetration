function [F,diver,cycle] = tetr(z,N_iter,epsilon)
% Default entries
if nargin ==1
    N_iter = 1000; epsilon = 0.01;
elseif nargin ==2
    epsilon = 0.001;
end
%%
% Set entries
F = zeros(N_iter+1,1);
diver = 0;
cycle = 0;
%%
% Iterate values
for n = 1:N_iter
    F(n+1)=z^(F(n));
    if isnan(F(n+1))||isinf(F(n+1))
        % If the value has diverged stop iterating and flag that it has
        % diverged.
        F(n+1:end)=NaN;
        diver = 1;
        break
    elseif (abs(F(n+1)-F(n))==0)
        % If the value has perfectly converged then stop iterating and flag
        % that it has a cycle of 1.
        F(n+1:end)=F(n+1);
        cycle = 1;
        break
    end
end
%%
% If the value has not diverged and has not converged perfectly. Then check
% to see if it is cyclical.
if diver==0 && cycle==0
    b = F(floor(0.9*end):end);
    %If 
    if abs(diff(b))<epsilon
        cycle = 1;
    else
        [c,~] = autocorr(abs(b));
        cycle = find(c(2:end)==max(c(2:end)));
        if length(cycle)~=1 || sum(isnan(c))>0
            diver = 1;
            cycle = 0;
        end
    end
end
end
