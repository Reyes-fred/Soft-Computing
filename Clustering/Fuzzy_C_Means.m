
% Limpiamos todo
clear all;
close all;

%Seleccionamos el DATA SET

%load iris_1.dat; Xin = iris_1;
%load glass.dat; Xin = glass;
load ecoli.dat; Xin = ecoli;

% ----------------------------------------------------------------------
% Plot 
figure; plot(Xin(:,1),Xin(:,2),'o')
title ('Vectores Entrantes');

% ----------------------------------------------------------------------
% Numero de Clusters
%Iris Data
%nC = 3;

%Glass Data
%nC = 5;

%Ecoli Data
nC = 6;

% ----------------------------------------------------------------------
% Clusters Iniciales
init_V = Xin(1:nC, :);

% ----------------------------------------------------------------------
% Funci?n principal
[V,U,E] = Yf_FCMC1 (Xin, nC, [2; 100; 0.01; 1; 1], init_V);

% ----------------------------------------------------------------------
% Display
V

% ----------------------------------------------------------------------
% Plot 
figure;
plot(E);
title ('Medidas finales');
xlabel ('No. Iteraci?n');
ylabel ('Medidas finales');

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
title ('Vectores Agrupados');

% ----------------------------------------------------------------------
% Plot 
figure; hold on;
subplot (nC, 1, 1)
plot (U(1, :), cColor(1))
title ('Funciones de agrupaci?n');
for c = 2:nC
    subplot (nC, 1, c)
    plot (U(c, :), cColor(c))
end

