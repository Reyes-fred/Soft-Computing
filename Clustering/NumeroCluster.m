
% Limpiamos todo
clear all;
close all;

%Seleccionamos el DATA SET

%load iris_1.dat; Xin = iris_1;
load glass.dat; Xin = glass;
%load ecoli.dat; Xin = ecoli;

% ----------------------------------------------------------------------
% Plot 
figure; plot(Xin(:,1),Xin(:,2),'o')
title ('Vectores entrantes');

% ----------------------------------------------------------------------
% Numero maximo de vectores
nCMax = 8;

% ----------------------------------------------------------------------
% Peso del exponente
m = 2;

n = size (Xin, 1);
Xav = sum(Xin)/n;

% ----------------------------------------------------------------------

for nC = 2:nCMax,

    [V,U,E] = Yf_FCMC1 (Xin, nC, [m; 100; 0.001; 0; 0]);
    %[V,U,E] = fcm(Xin, nC);
    
    % ----------------------------------------------------------------------
    % Indice para el cluster optimo
    Pnc(nC) = Yf_OptimalClustersPIdx_1 (Xin, U, V, m, Xav);
    
end

nC = find (Pnc == min(Pnc))

[V,U,E] = Yf_FCMC1 (Xin, nC, [m; 100; 0.001; 0; 0]);

% ----------------------------------------------------------------------
% Plot 
figure;
plot(Pnc);
title ('Indice del cluster optimo');
xlabel ('No. cluster');
ylabel ('valor PI');

% ----------------------------------------------------------------------
% Plot 
figure;
plot(E);
title ('Valores finales');
xlabel ('No. Iteraci?n');
ylabel ('Valores finales');

% ----------------------------------------------------------------------
% Plot 
figure;
maxU = max(U);

cMarker = ['+' 'o' '*' '.' 'x' 's' 'd' '^' 'v' '>' '<' 'p' 'h'];
cColor =  ['r' 'g' 'b' 'm' 'c' 'y' 'k' 'r' 'g' 'b' 'y' 'm' 'c'];

for c = 1:nC
    index_c = find(U(c, :) == maxU);

    line(Xin(index_c, 1), Xin(index_c, 2), 'linestyle',...
        'none','marker', cMarker(c), 'color', cColor(c));
    
    hold on
    plot(V(c,1),V(c,2),['k' cMarker(c)],'markersize',15,'LineWidth',2)
end
title ('Vectores de clusters');

% ----------------------------------------------------------------------
% Plot 
figure; hold on;
subplot (nC, 1, 1)
plot (U(1, :), cColor(1))
title ('Funci?n asociaci?n');
for c = 2:nC
    subplot (nC, 1, c)
    plot (U(c, :), cColor(c))
end

figure;
for c = 1:nC
    x1 = Xin(:, 1)';
    y1 = Xin(:, 2)';
    z1 = U(c, :);
    stem3 (x1, y1, z1, cColor(c));
    hold on;
end


