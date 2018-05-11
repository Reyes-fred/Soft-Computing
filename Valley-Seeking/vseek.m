function [cls,icount,G]=vseek(X,r,cls0)
%{
Clustering algorithm based on a valley seeking algorithm as
described in:
[1] Warren L.G. Koontz and Keinosuke Fukunaga. A nonparametric valley-seeking tech-
nique for cluster analysis. IEEE Transactions on Computers, (2):171{178, 1972.
[2] Warren L.G. Koontz and Keinosuke Fukunaga. Asymptotic analysis of a nonparametric
clustering technique. Computers, IEEE Transactions on, 100(9):967{974, 1972.

Inputs:
    X: Matrix of data to be clustered. Each row corresponds
       to an object in the data set and each column is an
       attribute of the object.
    r: A threshold distance that governs the behavior of the
       algorithm.
    cls0: Either a vector of the initial cluster indexes of the
       objects or a scalar integer specifying the maximum number 
       of clusters
Outputs:
    cls: A vector of the cluster indices of the objects
    icount: The number of iterations required to obtain the final
        clustering
    G: A graph object based on the objects connectivity
%}
[N,~]=size(X);
r2=r^2; % square r for quicker comparison
% Create connectivity graph
B=floor(N^2/20); % block size
nlist=zeros(B,2); % allocate one block
NP=0; % track list size
NPmax=B; % track list space
for i=2:N % for all i,j such that j < i
    for j=1:i-1
        if (sum((X(i,:)-X(j,:)).^2)<=r2) % neighbors?
            NP=NP+1;
            if NP>NPmax % need more space?
                nlist=[nlist; zeros(B,2)];
                NPmax=NPmax+B;
            end
            nlist(NP,1)=i;
            nlist(NP,2)=j;
        end
    end
end
if NP==0 % r too small?
    fprintf('No neighbors - Consider increasing r\n')
    cls=0; icount=0; G=[];
    return
end

G=graph(nlist(1:NP,1),nlist(1:NP,2),[],N);

% initial clustering
if isscalar(cls0)
    cls=kmeans(X,cls0); % use k-means
    M=cls0;
else
    cls=cls0; % use input
    M=max(cls);
end
% Apply valley-seeking iterations
ncls=zeros(N,1);
icount=0; % iteration count
while true
    icount=icount+1;
    for n=1:N
        votes=zeros(M,1);
        for k=neighbors(G,n)' % collect votes from neighbors
            votes(cls(k))=votes(cls(k))+1;
        end
        [~,m]=max(votes); % and the winner is ...
        ncls(n)=m;
    end
    if isequal(ncls,cls) %done?
        break
    end
    cls=ncls;
end