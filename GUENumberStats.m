trials = 10000000;
nn=10;
%edges=[0 pi/sqrt(nn) 2*pi/sqrt(nn) 3*pi/sqrt(nn) ];
edges=8*[-50:50]/50;
H=zeros(1,length(edges)-1);
%data=zeros(1,trials);
t=cputime;
figure(1)
parfor ii = 1: trials
    ii;
     m=randn(nn)+sqrt(-1)*randn(nn);
    %m=randn(nn);
    L=(m+m')/2;
    ev=eig(L);
    H=H+histcounts(ev,edges);
    % bar(edges(1:end-1), H, 'histc'); 
end
cputime-t
H
%H/trials
%var(data)
figure(2)
bar(edges(1:end-1), H, 'histc'); 