clc; clear; close

% y = b1x1 + b2x2 + b3x3 + b4x4 + b5

load hald;
Y=hald(:,5) ;
X=hald(:,1:4);

% Buscamos una soluci?n
X = [X ones(length(X),1)];
B    = inv(X'*X)*X'*Y; 
Yhat = X*B;
Res  = Y - Yhat;

SStotal = norm(Y - mean(Y)).^2;
SSeffect = norm(Yhat - mean(Yhat)).^2;
SSerror  = norm(Res-mean(Res)).^2;

df      = rank(X)-1;
dferror = length(Y) - df - 1;
R2      = SSeffect / SStotal;
F       = (SSeffect / df) / (SSerror / dferror);
p       = 1 - fcdf(F,df,dferror);

% make a figure
figure('Name','Multiple Regression');
subplot(1,2,1); plot(Y,'x','LineWidth',5);  hold on
plot(Yhat,'r','LineWidth',2); grid on;
title(['R^2 ' num2str(R2) ' Data and model F=' num2str(F) ' p=' num2str(p)],'FontSize',14)
subplot(1,2,2); normplot(Res);


% ------------------------------------
% semi-partial correlation coefficient
% ------------------------------------
% let's think of the model and what it means it terms of geometry.
% the data Y can be described as a vector and a point in R_20
% a space with 20 dimensions. We then establish a model X with 5
% regressors; that is we look for a combination of these 5 vectors which
% will get as close as possible to Y. To find the actual contribution of x1
% to the data for this model one needs to look at how much x1 explains
% to the total variance, ie we want to compare the R2 between the full and
% a reduced model without x1 - the difference will be how much x1 explains in Y.

Xreduced    = X(:,2:end); % reduced model all minus 1st regressor
Breduced    = inv(Xreduced'*Xreduced)*Xreduced'*Y;
Yhatreduced = Xreduced*Breduced;
Resreduced  = Y - Yhatreduced;

dfreduced       = rank(Xreduced) -1 ;
dferrorreduced = length(Y) - dfreduced - 1;
SSeffectreduced = norm(Yhatreduced-mean(Yhatreduced)).^2;
SSerrorreduced  = norm(Resreduced-mean(Resreduced)).^2;
R2reduced       = SSeffectreduced / SStotal;
Freduced       = (SSeffectreduced / dfreduced) / (SSerrorreduced / dferrorreduced);
preduced       = 1 - fcdf(Freduced,dfreduced,dferrorreduced);

Semi_Partial_corr_coef = R2 - R2reduced;
dfe_semi_partial_coef  = df - dfreduced;
F_semi_partail_coef    = (Semi_Partial_corr_coef*dferror) / ...  % variance explained by x1
                         ((1-R2)*dfe_semi_partial_coef); % unexplained variance overall
p_semi_partial_coef    = 1 - fcdf(Semi_Partial_corr_coef, df, dfe_semi_partial_coef); % note df is from the full model

% make a figure
figure('Name','Regresi?n Multiple - Modelo Reducido');
subplot(2,2,1); plot(Y,'x','LineWidth',5);  hold on
plot(Yhat,'r','LineWidth',2); grid on;
title(['Data and Modelo F=' num2str(F) ' p=' num2str(p)])
subplot(2,2,2); plot(Y,'x','LineWidth',5);  hold on
plot(Yhatreduced,'r','LineWidth',2); grid on;
title(['Data and Modelo reducido F=' num2str(Freduced) ' p=' num2str(preduced)])
subplot(2,2,3); plot(Yhat,'b','LineWidth',2); grid on; hold on
plot(Yhatreduced,'r','LineWidth',2);
title('Modelado de data para los dos modelos')
subplot(2,2,4); plot((Res-Resreduced).^2,'k','LineWidth',2); grid on; hold on
title('Diferencia cuadrada de residuos')


% --------------------------------
% partial correlation coefficient
% --------------------------------
% As we shall see below, this is easily obtained using projections - but
% for now let just think about what we want to measure. We are interested
% in knowing the correlation between y and x1 controlling for the effect of
% the other xs, that is removing the effect of other xs. Compred to
% semi-parital coef we also want to remove the effect of xs on y or if you
% prefer we want to compute how much of x1 we need to get to the point
% defined by the xs which is the closest to Y

% above we removed X(:,2:end) from Y and got Resreduced
% we need to do the same for x1 so that we can correlate x1 and y witout xs
x = X(:,1);
B = inv(Xreduced'*Xreduced)*Xreduced'*x;
xhat = Xreduced*B;
Resx = x - xhat;

% the correlation between Resreduced and Resx is the partial coef
Partial_coef = corr(Resx,Resreduced);

% --------------------------------------------------