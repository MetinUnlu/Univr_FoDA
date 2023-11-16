%% MNIST data set

clear all
close all

set(0,'DefaultAxesTickLabelInterpreter','latex')
set(0,'DefaultTextInterpreter','latex')
set(0,'DefaultAxesFontSize',18)
set(0,'DefaultLineLineWidth',2.5);


load mnist

label = double(trainY);
data  = double(trainX);
idx1  = label==3;
idx2  = label==8 ;
idx   = logical(idx1+idx2);
A     = data(idx,:);
A1    = data(idx1,:);
A2    = data(idx2,:); 
plot_dim = 3;         % plot-dimension


[n, d] = size(A);
edge  = 50;
ndim  = 28;
idim  = 1:ndim;
jdim  = 1:ndim;
dtot  = edge*ndim;
All = zeros(dtot,dtot);
k   = 0;
figure
for i = 0:ndim:ndim*(edge-1)
    for j = 0:ndim:ndim*(edge-1)
        k = k+1;
        All(i+idim,j+jdim) = ((reshape(A(k,:),ndim,ndim)))';
        drawnow
    end
end

% PCA:
% At = (A - ones(n,1)*sum(A))/sqrt(n-1);
% Bt     = At'*At;

Bt  = A;
figure(1)
image(All), colormap gray

[U,S,V] = svd(Bt,'econ');

% singular values
figure(2)
semilogy(diag(S),'-o'), axis('square'),
ylabel('$\sigma$')
% singular vectors:
ncol = 4;
nrow = 2;
for j =1:ncol*nrow;
    figure(3)
    Vc{j} = reshape(S(j,j)*V(:,j),ndim,ndim);
    subplot(nrow,ncol,j)
    image(Vc{j}), axis('square'),colormap gray
    drawnow
end

% subplot(1,4,2)
% image(V1'), axis('square'),colormap gray
% subplot(1,4,3)
% image(V2'), axis('square'),colormap gray
% subplot(1,4,4)
% image(V3'), axis('square'),colormap gray
%% Project over principal components:

% 2D:
pc1 = 1;
pc2 = 2;
pc3 = 3;
    U1 = A*V(:,pc1)./S(pc1,pc1);
    U2 = A*V(:,pc2)./S(pc2,pc2);
    U3 = A*V(:,pc3)./S(pc3,pc3);
    
    figure(4)
switch plot_dim
    case 2
        scatter(U1,U2,'.'); axis('square')
    case 3      
        scatter3(U1,U2,U3,'.');axis('square')
end
hold on
pause
U1 = A2*V(:,pc1)./S(pc1,pc1);
U2 = A2*V(:,pc2)./S(pc2,pc2);
U3 = A2*V(:,pc3)./S(pc3,pc3);
switch plot_dim
    case 2
        scatter(U1,U2,'r.'); axis('square')
    case 3      
        scatter3(U1,U2,U3,'r.');axis('square')
end






