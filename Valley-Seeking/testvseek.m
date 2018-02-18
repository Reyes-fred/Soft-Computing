load iris.dat
X=iris(:,1:4);


[N,~]=size(X);
% Compute r based on maximum inter-object distance
dmax=0;
for i=2:N
    for j=1:i-1
        dij=sum((X(i,:)-X(j,:)).^2);
        if (dij>dmax)
            dmax=dij;
        end
    end
end
r=sqrt(dmax)/12; % Tweak this for different results
M=5;
[cls,count,G]=vseek(X,r,M);
fprintf('%d Iteraciones\n',count)
% Color-coded scatter plot of first two attributes
scatter(X(:,1),X(:,2),[],cls,'filled')
xlabel('Largo Sepal ')
ylabel('Acho Sepal')

figure(2)
scatter3(X(:,1),X(:,2),degree(G),[],cls,'filled')
xlabel('Largo Sepal')
ylabel('Ancho Sepal')
zlabel('Vecino')

conf=zeros(M,3);
for n=1:N
    i=cls(n);
    j=iris(n,5);
    conf(i,j)=conf(i,j)+1;
end
fprintf('Cluster     Setosa Versicolor  Virginica\n')
for i=1:M
    fprintf('%7d',i)
    for j=1:3
        fprintf('%11d',conf(i,j))
    end
    fprintf('\n')
end