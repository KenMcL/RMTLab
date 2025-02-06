trials = 10000000;
nn=2;
%edges=sqrt(2*nn)*1.5*(-1+2*[0:500]/500);
edges=5*(-1+2*[0:500]/500);
H=zeros(1,length(edges)-1);
t=cputime;
parfor ii = 1: trials
    ii;
     m=randn(nn)+sqrt(-1)*randn(nn);
    %m=randn(nn);
    L=(m+m')/2;
    ev=eig(L);
    H=H+histcounts(ev,edges);
end
figure(1)
plot(edges(1:500),H*50/trials,'.')
cputime-t
