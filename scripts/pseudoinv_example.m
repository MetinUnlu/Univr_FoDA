clear all, close all, clc

set(0,'DefaultAxesTickLabelInterpreter','latex')
set(0,'DefaultTextInterpreter','latex')
set(0,'DefaultAxesFontSize',18)
set(0,'DefaultLineLineWidth',1.5);

% Toy example

x = 3;                       % real slope of the regression
a = [-2:.1:2]';            
b = a*x + 2.5*randn(size(a));  % add noise to real data
b(1) = 50*b(1); 
b(end) = 20*b(end); 

plot(a,x*a,'k')              % true regression
hold on, plot(a,b,'rx')      % noisy measurements

[U,S,V] = svd(a,'econ');     % 
xtilde = V*inv(S)*U'*b;      % Least-square fite
plot(a,xtilde*a,'b--')
% Least-square fit
% Plot fit
return
%%
close all 
clear all
load hald; % Load Portlant Cement dataset
pause
A = ingredients;
b = heat;
[U,S,V] = svd(A,'econ');
x = V*inv(S)*U'*b; % Solve Ax=b using the SVD
plot(b,'k'); hold on
plot(A*x,'r-o'); % Plot data
% Plot fit
x1 = regress(b,A);  % Alternative 1
x2 = pinv(A)*b;     % Alternative 2

plot(A*x1,'g-*'); % Plot data
plot(A*x2,'b-s'); % Plot data
xlabel('Mixtures')
ylabel('Heat [cal/g]')
 
figure
stem(x), 



%% 


