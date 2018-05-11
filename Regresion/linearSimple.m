clc; clear
% y = b1x + b2 + e
x = rand(20,1)*10; % X es VI se manipula
Y = 4*x + 3 + randn(20,1); % Y is VD se mide, se corre un modelo fordward + se agrega ruido

% encontramos una soluci?n, ie busca b1=4 y b2=3
X = [x ones(20,1)]; %Ones es para b2 que no es una funcion de x pero una constante para agregar

% Una simple soluci?n es multiplicar por la transpuesta
% Hacer la matriz  X'X al cuadrado
% Y = XB --> X'Y = X'XB --> inv(X'X)X'Y = inv(X'X)X'XB --> but inv(X'X)X'X 

B = inv(X'*X)*X'*Y;

% check what it looks like
Yhat = X*B; % Yhat is the model
Res  = Y - Yhat; % Residual (error)

% get some statistics
% = estimate if the model Yhat explain above the error Res

SStotal  = norm(Y-mean(Y)).^2; % what is the norm of a vector? = sum((Y-mean(Y)).^2)
SSeffect = norm(Yhat-mean(Yhat)).^2; % just like in books, sum of the difference xi - mean(x)
SSerror  = norm(Res-mean(Res)).^2;
df       = rank(X)-1; % what is the rank ? see also http://en.wikipedia.org/wiki/Linear_independence
dferror  = length(Y) - df - 1;

R2 = SSeffect / SStotal; % how much we explain of the total
F  = (SSeffect / df) / (SSerror / dferror); % how much is explain given the error, this is the same as R2*dfe / (1-R2)*df
p  = 1 - fcdf(F,df,dferror);

% make a figure
figure('Name','Simple Regression');
subplot(1,2,1); plot(Y,'x','LineWidth',5);  hold on
plot(Yhat,'r','LineWidth',2); grid on;
title(['Data and model F=' num2str(F) ' p=' num2str(p)])
subplot(1,2,2); normplot(Res);