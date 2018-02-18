
% Limpiamos todo
clear all;
close all;

%Seleccionamos el DATA SET

%load iris_1.dat; Xin = iris_1;
load glass.dat; Xin = glass;
%load ecoli.dat; Xin = ecoli;


% ----------------------------------------------------------------------
% Plot input feature vectors
figure; plot(Xin(:,1),Xin(:,2),'o')
title ('Vectores Entrantes');

% ----------------------------------------------------------------------
% Numero de Clusters
%Iris Data
%nC = 3;

%Glass Data
nC = 5;

%Ecoli Data
%nC = 5;

% ----------------------------------------------------------------------
% Opciones
m = 2.0;
term_thr = 0.00001;
eta = 2.0;
max_iter = 100;
info_display = 1;

init_V = Xin(1:nC, :);

% ----------------------------------------------------------------------
% FCM
[V,U,E] = Yf_FCMC1 (Xin, nC, [m; max_iter; term_thr; info_display; 1], init_V);

V_FCM = V
U_FCM = U;

% ----------------------------------------------------------------------
% PCM
init_V_PCM = V_FCM;
w = Yf_PCMC1_FindWeights1 (Xin, U, V, m, 1);
[V,T,E] = Yf_PCMC1 (Xin, nC, w, [m; max_iter; term_thr; info_display; 1], init_V_PCM);

V_PCM = V
T_PCM = T;

% ----------------------------------------------------------------------
% FPCM
[V,U,T,E] = Yf_FPCMC1 (Xin, nC, [m; eta; max_iter; term_thr; info_display; 1], init_V);

V_FPCM = V
U_FPCM = U;
T_FPCM = T;

% ----------------------------------------------------------------------
% 
m
eta

V_FCM'
V_PCM'
V_FPCM'

U_FCM'
T_PCM'
U_FPCM'
T_FPCM'

% ----------------------------------------------------------------------
% Plot termination measure values
figure;
plot(E);
title ('Valores finales (FPCM)');
xlabel ('No. Iteraci?n');
ylabel ('Medidas finales');

% ----------------------------------------------------------------------
cMarker = ['+' 'o' '*' '.' 'x' 's' 'd' '^' 'v' '>' '<' 'p' 'h'];
cColor =  ['r' 'g' 'b' 'm' 'c' 'y' 'k' 'r' 'g' 'b' 'y' 'm' 'c'];

% ----------------------------------------------------------------------
% Plot clustered feature vectors
figure;
maxU = max(U);
for c = 1:nC
    index_c = find(U(c, :) == maxU);

    line(Xin(index_c, 1), Xin(index_c, 2), 'linestyle',...
        'none','marker', cMarker(c), 'color', cColor(c));
    
    hold on
    plot(V(c,1),V(c,2),['k' cMarker(c)],'markersize',15,'LineWidth',2)
end
title ('Vectores de agrupamiento (FPCM)');

figure;
maxU = max(U_FCM);
for c = 1:nC
    index_c = find(U_FCM(c, :) == maxU);

    line(Xin(index_c, 1), Xin(index_c, 2), 'linestyle',...
        'none','marker', cMarker(c), 'color', cColor(c));
    
    hold on
    plot(V_FCM(c,1),V_FCM(c,2),['k' cMarker(c)],'markersize',15,'LineWidth',2)
end
title ('Vecotres de agrupamiento (FCM)');

% ----------------------------------------------------------------------
% Plot membership functions
figure; hold on;
subplot (nC, 1, 1)
plot (U(1, :), cColor(1))
title ('Funciones de agrupamiento (FPCM)');
for c = 2:nC
    subplot (nC, 1, c)
    plot (U(c, :), cColor(c))
end

figure; hold on;
subplot (nC, 1, 1)
plot (U_FCM(1, :), cColor(1))
title ('Membership functions (FCM)');
for c = 2:nC
    subplot (nC, 1, c)
    plot (U_FCM(c, :), cColor(c))
end
