[x,t] = simplefit_dataset;
net = feedforwardnet(20);
net = train(net,x,t);
y = net(x);
[r,m,b] = regression(t,y)
plotregression(t,y)


%clear;
%clc;
%n = 1000;
%noise = rand(n,1);
%x = rand(n,1).*10;
%y = 2 + 3.5 + x + noise;
%plot (x,y,'.')
%lsline
%X =  [ones(size(x)) x];
%beta = regress(y,X)




% a=1;
% b=2;
% 
% x = (1:10000)';
% yTrue = a + b*x;
% 
% NoiseStd = 0.5;
% err = NoiseStd*randn(length(x),1);
% yExpt = yTrue + err;
% 
% A= [ones(size(x)) x] ;
% betaHat = A \ yExpt
% plot(x, yExpt, 'ro', 'MarkerSize', 8)
% hold on
% xFit = (1:0.1:10)';
% yFit = [ones(size(xFit)) xFit]*betaHat;
% plot(xFit, yFit, 'b-', 'LineWidth', 2)
% xlim([0,11])
% ylim([0,23])
% xlabel('x')
% ylabel('y')
% grid on
% legend('Data', 'Fit', 'Location', 'NW')
