trials=1000000;
nn=2;
edges=sqrt(2*nn)*(  (-1+4*[0:500]/500)/(nn^(1/6)));
H=zeros(1,length(edges)-1);
t=cputime;
parfor ii=1:trials
  a=randn(nn)+sqrt(-1)*randn(nn);
a=(a+a')/2;
lm=eigs(a,1,'largestreal');

%L(ii)=n^(1/6)*(lmax-sqrt(2*n));
H=H+histcounts(lm,edges);
end
figure(4)
plot(edges(1:length(edges)-1),H,'.')
cputime-t