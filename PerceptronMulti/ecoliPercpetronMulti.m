function s_RnaPrueba() %
%%% Redes neuronales para diabetes
%%% Clasificador RNA
%%%Crea el vector de neuronas por capas
NoCapas=4;
NeuronasXcapa=zeros(1,NoCapas);
for i=1:NoCapas
NeuronasXcapa(1,i)=randi([3 6]);
end
%%% trainFcn es el m?todo de encendido de cada neurona
%%% Verificar documentaci?n
sNet.trainFcn = 'trainbfg';
%%%Se crea la red neuronal
sNet = feedforwardnet(NeuronasXcapa,sNet.trainFcn);
%sNet.trainParam.epochs = 10;
sNet.trainParam.goal=0.001;
sNet.trainParam.max_fail=1000;
%%%Se entrena la red neuronal
Datos_Entrenamiento=	[0.49,0.29,0.48,0.50,0.56,0.24,0.35;...
            0.07,0.40,0.48,0.50 , 0.54  ,0.35  ,0.44;...
            0.56  ,0.40 , 0.48 , 0.50  ,0.49,  0.37,  0.46;...
            0.59 , 0.49,  0.48  ,0.50  ,0.52,  0.45,  0.36;...
            0.23  ,0.32,  0.48 , 0.50  ,0.55,  0.25,  0.35;...
            0.67 , 0.39,  0.48 , 0.50 , 0.36 , 0.38,  0.46;...
            0.29 , 0.28,  0.48 , 0.50 , 0.44 , 0.23,  0.34;...
            0.21 , 0.34,  0.48 , 0.50 , 0.51 , 0.28,  0.39;...
            0.20 , 0.44,  0.48 , 0.50 , 0.46 , 0.51,  0.57;...
            0.42 , 0.40,  0.48 , 0.50 , 0.56 , 0.18,  0.30;...
            0.42 , 0.24,  0.48 , 0.50 , 0.57 , 0.27,  0.37;...
            0.25 , 0.48,  0.48 , 0.50 , 0.44 , 0.17,  0.29;...
            0.39 , 0.32,  0.48 , 0.50 , 0.46 , 0.24,  0.35;...
            0.51 , 0.50,  0.48 , 0.50 , 0.46 , 0.32,  0.35;...
            0.22 , 0.43,  0.48 , 0.50 , 0.48 , 0.16,  0.28;...
            0.25 , 0.40,  0.48 , 0.50 , 0.46 , 0.44,  0.52;...
            0.34 , 0.45,  0.48 , 0.50 , 0.38 , 0.24,  0.35;...
            0.44 , 0.27,  0.48 , 0.50 , 0.55 , 0.52,  0.58;...
            0.23 , 0.40,  0.48 , 0.50 , 0.39 , 0.28,  0.38;...
            0.41 , 0.57,  0.48 , 0.50 , 0.39 , 0.21,  0.32;...
            0.40 , 0.45,  0.48 , 0.50 , 0.38,  0.22,  0.00;...
            0.31 , 0.23,  0.48 , 0.50 , 0.73 , 0.05,  0.14;...
            0.51 , 0.54,  0.48 , 0.50 , 0.41 , 0.34,  0.43;...
            0.30 , 0.16,  0.48 , 0.50 , 0.56 , 0.11,  0.23;...
            0.36 , 0.39,  0.48 , 0.50 , 0.48 , 0.22,  0.23;...
            0.29 , 0.37,  0.48 , 0.50 , 0.48 , 0.44,  0.52;...
            0.25 , 0.40,  0.48 , 0.50 , 0.47 , 0.33,  0.42;...
            0.21 , 0.51,  0.48 , 0.50 , 0.50 , 0.32,  0.41;...
            0.43 , 0.37,  0.48 , 0.50 , 0.53 , 0.35,  0.44;...
            0.43 , 0.39,  0.48 , 0.50 , 0.47 , 0.31,  0.41;...
            0.53 , 0.38,  0.48 , 0.50 , 0.44 , 0.26,  0.36;...
            0.34 , 0.33,  0.48 , 0.50 , 0.38 , 0.35,  0.44;...
            0.56 , 0.51,  0.48 , 0.50 , 0.34 , 0.37,  0.46;...
            0.40 , 0.29,  0.48 , 0.50 , 0.42 , 0.35,  0.44;...
            0.24 , 0.35,  0.48 , 0.50 , 0.31 , 0.19,  0.31;...
            0.36 , 0.54,  0.48 , 0.50 , 0.41 , 0.38,  0.46;...
            0.29 , 0.52,  0.48 , 0.50 , 0.42 , 0.29,  0.39;...
            0.65 , 0.47,  0.48 , 0.50 , 0.59 , 0.30,  0.40;...
            0.32 , 0.42,  0.48 , 0.50 , 0.35 , 0.28,  0.38;...
            0.38 , 0.46,  0.48 , 0.50 , 0.48 , 0.22,  0.29;...
            0.33 , 0.45,  0.48 , 0.50 , 0.52 , 0.32 , 0.41;...
            0.30 , 0.37,  0.48 , 0.50 , 0.59 , 0.41 , 0.49;...
            0.40 , 0.50,  0.48 , 0.50 , 0.45 , 0.39 , 0.47;...
            0.28 , 0.38,  0.48 , 0.50 , 0.50 , 0.33 , 0.42;...
            0.61 , 0.45,  0.48 , 0.50 , 0.48 , 0.35 , 0.41;...
            0.17 , 0.38,  0.48 , 0.50 , 0.45 , 0.42 , 0.50;...
            0.44 , 0.35,  0.48 , 0.50 , 0.55 , 0.55 , 0.61;...
            0.43 , 0.40,  0.48 , 0.50 , 0.39 , 0.28 , 0.39;...
            0.42 , 0.35,  0.48 , 0.50 , 0.58 , 0.15 , 0.27;...
            0.23 , 0.33,  0.48 , 0.50 , 0.43 , 0.33 , 0.43;...
            0.37 , 0.52,  0.48 , 0.50 , 0.42 , 0.42 , 0.36;...
            0.29 , 0.30,  0.48 , 0.50,  0.45 , 0.03 , 0.17;...
            0.22 , 0.36,  0.48 , 0.50,  0.35 , 0.39 , 0.47;...
            0.23 , 0.58,  0.48 , 0.50,  0.37 , 0.53 , 0.59;...
            0.47 , 0.47,  0.48 , 0.50 , 0.22 , 0.16 , 0.26;...
            0.54 , 0.47,  0.48 , 0.50 , 0.28 , 0.33 , 0.42;...
            0.51 , 0.37,  0.48 , 0.50 , 0.35 , 0.36 , 0.45;...
            0.40 , 0.35,  0.48 , 0.50 , 0.45 , 0.33 , 0.42;...
            0.44 , 0.34,  0.48 , 0.50 , 0.30 , 0.33 , 0.43;...
            0.42 , 0.38,  0.48 , 0.50 , 0.54 , 0.34 , 0.43;...
            0.44 , 0.56,  0.48 , 0.50 , 0.50 , 0.46 , 0.54;...
            0.52 , 0.36,  0.48 , 0.50 , 0.41 , 0.28 , 0.38;...
            0.36 , 0.41,  0.48 , 0.50 , 0.48 , 0.47 , 0.54;...
            0.18 , 0.30,  0.48 , 0.50 , 0.46 , 0.24 , 0.35;...
            0.47 , 0.29,  0.48 , 0.50 , 0.51 , 0.33 , 0.43;...
            0.24 , 0.43,  0.48 , 0.50 , 0.54 , 0.52 , 0.59;...
            0.25 , 0.37,  0.48 , 0.50 , 0.41 , 0.33 , 0.42;...
            0.52 , 0.57,  0.48 , 0.50 , 0.42 , 0.47 , 0.54;...
            0.25 , 0.37,  0.48 , 0.50 , 0.43 , 0.26 , 0.36;...
            0.35 , 0.48,  0.48 , 0.50 , 0.56 , 0.40 , 0.48;...
            0.26 , 0.26,  0.48 , 0.50 , 0.34 , 0.25 , 0.35;...
            0.44 , 0.51,  0.48 , 0.50 , 0.47 , 0.26 , 0.36;...
            0.37 , 0.50,  0.48 , 0.50 , 0.42 , 0.36 , 0.45;...
            0.44 , 0.42,  0.48 , 0.50 , 0.42 , 0.25 , 0.20;...
            0.24 , 0.43,  0.48 , 0.50 , 0.37 , 0.28 , 0.38;...
            0.42 , 0.30,  0.48 , 0.50 , 0.48 , 0.26 , 0.36;...
            0.48 , 0.42,  0.48 , 0.50 , 0.45 , 0.25 , 0.35;...
            0.41 , 0.48,  0.48 , 0.50 , 0.51 , 0.44 , 0.51;...
            0.44 , 0.28,  0.48 , 0.50 , 0.43 , 0.27 , 0.37;...
            0.29 , 0.41,  0.48 , 0.50 , 0.48 , 0.38 , 0.46;...
            0.34 , 0.28,  0.48 , 0.50 , 0.41 , 0.35 , 0.44;...
            0.41 , 0.43,  0.48 , 0.50 , 0.45 , 0.31 , 0.41;...
            0.29 , 0.47,  0.48 , 0.50 , 0.41 , 0.23 , 0.34;...
            0.34 , 0.55,  0.48 , 0.50 , 0.58 , 0.31 , 0.41;...
            0.36 , 0.56,  0.48 , 0.50 , 0.43 , 0.45 , 0.53;...
            0.40 , 0.46,  0.48 , 0.50 , 0.52 , 0.49 , 0.56;...
            0.50 , 0.49 , 0.48 , 0.50 , 0.49 , 0.46 , 0.53;...
            0.52 , 0.44,  0.48 , 0.50 , 0.37 , 0.36 , 0.42;...
            0.50 , 0.51,  0.48 , 0.50 , 0.27 , 0.23 , 0.34;...
            0.53 , 0.42,  0.48 , 0.50 , 0.16 , 0.29 , 0.39;...
            0.34 , 0.46  ,0.48 , 0.50 , 0.52 , 0.35 , 0.44;...
            0.40 , 0.42 , 0.48 , 0.50 , 0.37 , 0.27 , 0.27;...
            0.41 , 0.43 , 0.48 , 0.50 , 0.50 , 0.24 , 0.25;...
            0.30 , 0.45 , 0.48 , 0.50 , 0.36 , 0.21 , 0.32;...
            0.31 , 0.47 , 0.48 , 0.50 , 0.29 , 0.28 , 0.39;...
            0.64 ,0.76  ,0.48 , 0.50  ,0.45  ,0.35  ,0.38;...
            0.35 , 0.37 , 0.48 , 0.50 , 0.30 , 0.34 , 0.43;...
            0.57 , 0.54 , 0.48 , 0.50 , 0.37 , 0.28 , 0.33;...
            0.65 , 0.55 , 0.48 , 0.50 , 0.34 , 0.37 , 0.28;...
            0.51 , 0.46 , 0.48 , 0.50 , 0.58,  0.31 , 0.41;...
            0.38 , 0.40 , 0.48 , 0.50 , 0.63,  0.25 , 0.35;...
            0.24 , 0.57 , 0.48 , 0.50 , 0.63,  0.34  ,0.43;...
            0.38 , 0.26 , 0.48 , 0.50 , 0.54,  0.16  ,0.28;...
            0.33 , 0.47 , 0.48 , 0.50 , 0.53 , 0.18  ,0.29;...
            0.24 , 0.34 , 0.48 , 0.50 , 0.38 , 0.30  ,0.40;...
            0.26 , 0.50 , 0.48 , 0.50 , 0.44 , 0.32  ,0.41;...
            0.44,  0.49 , 0.48 , 0.50 , 0.39 , 0.38  ,0.40;...
            0.43 , 0.32 , 0.48 , 0.50 , 0.33 , 0.45  ,0.52;...
            0.49 , 0.43 , 0.48 , 0.50 , 0.49 , 0.30  ,0.40;...
            0.47 , 0.28 , 0.48 , 0.50 , 0.56 , 0.20  ,0.25;...
            0.32 , 0.33 , 0.48 , 0.50 , 0.60 , 0.06  ,0.20;...
            0.34 , 0.35 , 0.48 , 0.50 , 0.51 , 0.49  ,0.56;...
            0.35 , 0.34 , 0.48 , 0.50 , 0.46 , 0.30  ,0.27;...
            0.38 , 0.30 , 0.48 , 0.50 , 0.43 , 0.29  ,0.39;...
            0.38 , 0.44 , 0.48 , 0.50 , 0.43 , 0.20  ,0.31;...
            0.41 , 0.51 , 0.48 , 0.50 , 0.58 , 0.20  ,0.31;...
            0.34 , 0.42 , 0.48 , 0.50 , 0.41 , 0.34  ,0.43;...
            0.51 , 0.49 , 0.48 , 0.50 , 0.53 , 0.14  ,0.26;...
            0.25 , 0.51 , 0.48 , 0.50 , 0.37 , 0.42  ,0.50;...
            0.29 , 0.28 , 0.48 , 0.50 , 0.50 , 0.42  ,0.50;...
            0.25 , 0.26 , 0.48 , 0.50 , 0.39 , 0.32  ,0.42;...
            0.24 , 0.41 , 0.48 , 0.50 , 0.49 , 0.23  ,0.34;...
            0.17 , 0.39 , 0.48 , 0.50 , 0.53 , 0.30  ,0.39;...
            0.04 , 0.31 , 0.48 , 0.50 , 0.41 , 0.29  ,0.39;...
            0.61 , 0.36 , 0.48 , 0.50 , 0.49 , 0.35  ,0.44;...
            0.34 , 0.51 , 0.48 , 0.50 , 0.44 , 0.37  ,0.46;...
            0.28 , 0.33 , 0.48 , 0.50 , 0.45 , 0.22  ,0.33;...
            0.40 , 0.46 , 0.48 , 0.50 , 0.42 , 0.35  ,0.44;...
            0.23 , 0.34 , 0.48 , 0.50 , 0.43 , 0.26  ,0.37;...
            0.37 , 0.44 , 0.48 , 0.50 , 0.42 , 0.39  ,0.47;...
            0.00 , 0.38 , 0.48 , 0.50 , 0.42 , 0.48  ,0.55;...
            0.39 , 0.31 , 0.48 , 0.50 , 0.38 , 0.34  ,0.43;...
            0.30 , 0.44 , 0.48 , 0.50 , 0.49 , 0.22  ,0.33;...
            0.27 , 0.30 , 0.48 , 0.50 , 0.71 , 0.28  ,0.39;...
            0.17 , 0.52 , 0.48 , 0.50 , 0.49 , 0.37  ,0.46;...
            0.36 , 0.42 , 0.48 , 0.50 , 0.53 , 0.32  ,0.41;...
            0.30 , 0.37 , 0.48 , 0.50 , 0.43 , 0.18  ,0.30;...
            0.26 , 0.40 , 0.48 , 0.50 , 0.36 , 0.26  ,0.37;...
            0.40 , 0.41 , 0.48 , 0.50 , 0.55 , 0.22  ,0.33;...
            0.22 , 0.34 , 0.48 , 0.50 , 0.42 , 0.29  ,0.39;...
            0.44 , 0.35 , 0.48 , 0.50 , 0.44 , 0.52  ,0.59;...
            0.27 , 0.42 , 0.48 , 0.50 , 0.37 , 0.38  ,0.43;...
            0.16 , 0.43 , 0.48 , 0.50 , 0.54 , 0.27 , 0.37;...
            0.06  ,0.61 , 0.48 , 0.50 , 0.49 , 0.92 , 0.37;...
            0.44  ,0.52 , 0.48 , 0.50 , 0.43 , 0.47 , 0.54;...
            0.63  ,0.47 , 0.48 , 0.50 , 0.51 , 0.82 , 0.84;...
            0.23 , 0.48 , 0.48 , 0.50 , 0.59 , 0.88 , 0.89;...
            0.34 , 0.49 , 0.48 , 0.50 , 0.58 , 0.85 , 0.80;...
            0.43 , 0.40 , 0.48 , 0.50 , 0.58 , 0.75 , 0.78;...
            0.46 , 0.61 , 0.48 , 0.50 , 0.48 , 0.86 , 0.87;...
            0.27  ,0.35 , 0.48 , 0.50 , 0.51 , 0.77 , 0.79;...
            0.52  ,0.39 , 0.48 , 0.50 , 0.65 , 0.71 , 0.73;...
            0.29,  0.47 , 0.48 , 0.50 , 0.71 , 0.65 , 0.69;...
            0.55,  0.47 , 0.48 , 0.50 , 0.57 , 0.78 , 0.80;...
            0.12,  0.67 , 0.48 , 0.50 , 0.74 , 0.58 , 0.63;...
            0.40,  0.50 , 0.48 , 0.50 , 0.65 , 0.82 , 0.84;...             
            0.73,  0.36 , 0.48 , 0.50 , 0.53 , 0.91 , 0.92;...
            0.84,  0.44 , 0.48 , 0.50 , 0.48 , 0.71 , 0.74;...
            0.48,  0.45 , 0.48 , 0.50 , 0.60 , 0.78 , 0.80;...
            0.54,  0.49 , 0.48 , 0.50 , 0.40 , 0.87 , 0.88;...
            0.48,  0.41 , 0.48 , 0.50 , 0.51 , 0.90 , 0.88;...
            0.50,  0.66 , 0.48 , 0.50 , 0.31 , 0.92 , 0.92;...
            0.72,  0.46 , 0.48 , 0.50 , 0.51 , 0.66 , 0.70;...  
            0.47,  0.55 , 0.48 , 0.50 , 0.58 , 0.71 , 0.75;...
            0.33,  0.56 , 0.48 , 0.50 , 0.33 , 0.78 , 0.80;...
            0.64,  0.58 , 0.48 , 0.50 , 0.48 , 0.78 , 0.73;...
            0.54,  0.57 , 0.48 , 0.50 , 0.56 , 0.81 , 0.83;...
            0.47,  0.59 , 0.48 , 0.50 , 0.52 , 0.76 , 0.79;...
            0.63 , 0.50 , 0.48 , 0.50 , 0.59 , 0.85 , 0.86;...
            0.49 , 0.42 , 0.48 , 0.50 , 0.53 , 0.79 , 0.81;...
            0.31 , 0.50 , 0.48 , 0.50 , 0.57 , 0.84 , 0.85;...
            0.74 , 0.44 , 0.48 , 0.50 , 0.55 , 0.88 , 0.89;...
            0.33 , 0.45 , 0.48 , 0.50 , 0.45 , 0.88 , 0.89;...
            0.45 , 0.40 , 0.48 , 0.50 , 0.61 , 0.74 , 0.77;...
            0.71  ,0.40,  0.48 , 0.50 , 0.71 , 0.70 , 0.74;...
            0.50  ,0.37 , 0.48 , 0.50 , 0.66 , 0.64 , 0.69;...
            0.66  ,0.53 , 0.48 , 0.50 , 0.59 , 0.66 , 0.66;...
            0.60  ,0.61 , 0.48 , 0.50 , 0.54 , 0.67 , 0.71;...
            0.83  ,0.37 , 0.48 , 0.50 , 0.61 , 0.71 , 0.74;...
            0.34  ,0.51 , 0.48 , 0.50 , 0.67 , 0.90 , 0.90;...
            0.63  ,0.54 , 0.48 , 0.50 , 0.65 , 0.79 , 0.81;...
            0.70  ,0.40 , 0.48 , 0.50 , 0.56 , 0.86 , 0.83;...
            0.60  ,0.50 , 1.00 , 0.50 , 0.54 , 0.77 , 0.80;...
            0.16  ,0.51 , 0.48 , 0.50 , 0.33 , 0.39 , 0.48;...
            0.74  ,0.70 , 0.48 , 0.50 , 0.66 , 0.65 , 0.69;...
            0.20  ,0.46 , 0.48 , 0.50 , 0.57 , 0.78 , 0.81;...
            0.89  ,0.55 , 0.48 , 0.50 , 0.51 , 0.72 , 0.76;...
            0.70  ,0.46 , 0.48 , 0.50 , 0.56 , 0.78 , 0.73;...
            0.12  ,0.43 , 0.48 , 0.50 , 0.63 , 0.70 , 0.74;...
            0.61  ,0.52 , 0.48 , 0.50 , 0.54 , 0.67 , 0.52;...
            0.33  ,0.37 , 0.48 , 0.50 , 0.46 , 0.65 , 0.69;...
            0.63  ,0.65 , 0.48 , 0.50 , 0.66 , 0.67 , 0.71;...
            0.41  ,0.51 , 0.48 , 0.50 , 0.53 , 0.75 , 0.78;...
            0.34  ,0.67 , 0.48 , 0.50 , 0.52 , 0.76 , 0.79;...
            0.58  ,0.34 , 0.48,  0.50 , 0.56 , 0.87 , 0.81;...
            0.59  ,0.56 , 0.48,  0.50 , 0.55 , 0.80 , 0.82;...
            0.51  ,0.40 , 0.48,  0.50 , 0.57 , 0.62 , 0.67;...
            0.50  ,0.57 , 0.48 , 0.50 , 0.71 , 0.61 , 0.66;...
            0.60  ,0.46 , 0.48 , 0.50 , 0.45 , 0.81 , 0.83;...
            0.37  ,0.47 , 0.48 , 0.50 , 0.39,  0.76 , 0.79;...
            0.58  ,0.55 , 0.48 , 0.50 , 0.57,  0.70 , 0.74;...
            0.36  ,0.47 , 0.48 , 0.50 , 0.51,  0.69 , 0.72;...
            0.39  ,0.41 , 0.48 , 0.50 , 0.52  ,0.72,  0.75;...
            0.35  ,0.51 , 0.48 , 0.50 , 0.61 , 0.71 , 0.74;...
            0.31  ,0.44 , 0.48 , 0.50 , 0.50  ,0.79 , 0.82;...
            0.61  ,0.66 , 0.48 , 0.50 , 0.46 , 0.87 , 0.88;...
            0.48  ,0.49 , 0.48 , 0.50 , 0.52 , 0.77 , 0.71;...
            0.11  ,0.50 , 0.48 , 0.50 , 0.58 , 0.72 , 0.68;...
            0.31  ,0.36 , 0.48 , 0.50 , 0.58 , 0.94 , 0.94;...
            0.68  ,0.51 , 0.48 , 0.50 , 0.71 , 0.75 , 0.78;...
            0.69  ,0.39 , 0.48 , 0.50 , 0.57 , 0.76 , 0.79;...
            0.52  ,0.54 , 0.48 , 0.50 , 0.62 , 0.76 , 0.79;...
            0.46  ,0.59 , 0.48 , 0.50 , 0.36 , 0.76 , 0.23;...
            0.36  ,0.45 , 0.48 , 0.50 , 0.38 , 0.79 , 0.17;...
            0.00  ,0.51 , 0.48 , 0.50 , 0.35 , 0.67 , 0.44;...
            0.10  ,0.49 , 0.48 , 0.50  ,0.41 , 0.67 , 0.21;...
            0.30  ,0.51 , 0.48 , 0.50  ,0.42 , 0.61 , 0.34;...
            0.61  ,0.47 , 0.48 , 0.50  ,0.00 , 0.80 , 0.32;...
            0.63  ,0.75 , 0.48 , 0.50,  0.64 , 0.73 , 0.66;...
            0.71  ,0.52 , 0.48 , 0.50,  0.64 , 1.00 , 0.99;...
            0.85  ,0.53 , 0.48 , 0.50,  0.53 , 0.52 , 0.35;...
            0.63  ,0.49 , 0.48 , 0.50,  0.54 , 0.76 , 0.79;...
            0.75  ,0.55 , 1.00 , 1.00,  0.40 , 0.47 , 0.30;...
            0.70  ,0.39 , 1.00 , 0.50,  0.51 , 0.82 , 0.84;...
            0.72  ,0.42 , 0.48  ,0.50,  0.65 , 0.77 , 0.79;...
            0.79  ,0.41 , 0.48 , 0.50,  0.66 , 0.81 , 0.83;...
            0.83  ,0.48 , 0.48 , 0.50,  0.65 , 0.76 , 0.79;...
            0.69  ,0.43 , 0.48 , 0.50,  0.59 , 0.74 , 0.77;...
            0.79  ,0.36 , 0.48 , 0.50,  0.46 , 0.82 , 0.70;...
            0.78  ,0.33 , 0.48 , 0.50,  0.57 , 0.77 , 0.79;...
            0.75  ,0.37 , 0.48 , 0.50,  0.64 , 0.70 , 0.74;...
            0.59  ,0.29 , 0.48 , 0.50,  0.64 , 0.75 , 0.77;...
            0.67  ,0.37 , 0.48 , 0.50,  0.54 , 0.64 , 0.68;...
            0.66  ,0.48 , 0.48 , 0.50,  0.54 , 0.70 , 0.74;...
            0.64  ,0.46 , 0.48 , 0.50,  0.48 , 0.73 , 0.76;...
            0.76  ,0.71 , 0.48 , 0.50,  0.50 , 0.71 , 0.75;...
            0.84  ,0.49 , 0.48 , 0.50,  0.55 , 0.78 , 0.74;...
            0.77  ,0.55  ,0.48 , 0.50,  0.51 , 0.78 , 0.74;...
            0.81  ,0.44 , 0.48 , 0.50,  0.42 , 0.67 , 0.68;...
            0.58  ,0.60  ,0.48 , 0.50,  0.59 , 0.73 , 0.76;...
            0.63  ,0.42  ,0.48 , 0.50,  0.48 , 0.77 , 0.80;...
            0.62  ,0.42  ,0.48 , 0.50,  0.58 , 0.79 , 0.81;...
            0.86  ,0.39  ,0.48 , 0.50,  0.59 , 0.89 , 0.90;...
            0.81  ,0.53  ,0.48 , 0.50,  0.57 , 0.87 , 0.88;...
            0.87  ,0.49  ,0.48 , 0.50,  0.61 , 0.76 , 0.79;...
            0.47  ,0.46  ,0.48 , 0.50,  0.62 , 0.74 , 0.77;...
            0.76  ,0.41  ,0.48 , 0.50,  0.50 , 0.59 , 0.62;...
            0.70  ,0.53  ,0.48 , 0.50,  0.70 , 0.86 , 0.87;...
            0.64  ,0.45  ,0.48 , 0.50,  0.67 , 0.61 , 0.66;...
            0.81  ,0.52  ,0.48 , 0.50,  0.57 , 0.78 , 0.80;...
            0.73  ,0.26  ,0.48 , 0.50,  0.57 , 0.75 , 0.78;...
            0.49  ,0.61  ,1.00 , 0.50,  0.56 , 0.71 , 0.74;...
            0.88  ,0.42  ,0.48 , 0.50,  0.52 , 0.73 , 0.75;...
            0.84  ,0.54  ,0.48 , 0.50,  0.75 , 0.92 , 0.70;...
            0.63  ,0.51  ,0.48 , 0.50,  0.64 , 0.72 , 0.76;...
            0.86  ,0.55  ,0.48 , 0.50,  0.63 , 0.81 , 0.83;...
            0.79  ,0.54  ,0.48 , 0.50,  0.50 , 0.66 , 0.68;...
            0.57  ,0.38  ,0.48 , 0.50,  0.06 , 0.49 , 0.33;...
            0.78  ,0.44  ,0.48 , 0.50,  0.45 , 0.73 , 0.68;...
            0.78  ,0.68  ,0.48 , 0.50,  0.83 , 0.40 , 0.29;...
            0.63  ,0.69  ,0.48 , 0.50,  0.65 , 0.41 , 0.28;...
            0.67  ,0.88  ,0.48 , 0.50,  0.73 , 0.50 , 0.25;...
            0.61  ,0.75  ,0.48 , 0.50,  0.51 , 0.33 , 0.33;...
            0.67  ,0.84  ,0.48 , 0.50,  0.74 , 0.54 , 0.37;...
            0.74  ,0.90  ,0.48 , 0.50,  0.57 , 0.53 , 0.29;...
            0.73  ,0.84  ,0.48 , 0.50,  0.86 , 0.58 , 0.29;...
            0.75  ,0.76  ,0.48 , 0.50,  0.83 , 0.57 , 0.30;...
            0.77  ,0.57  ,0.48 , 0.50,  0.88 , 0.53 , 0.20;...
            0.74  ,0.78  ,0.48 , 0.50,  0.75 , 0.54 , 0.15;...
            0.68  ,0.76  ,0.48 , 0.50,  0.84 , 0.45 , 0.27;...
            0.56  ,0.68  ,0.48 , 0.50,  0.77  ,0.36 , 0.45;...
            0.65  ,0.51  ,0.48 , 0.50,  0.66  ,0.54 , 0.33;...
            0.52  ,0.81  ,0.48 , 0.50,  0.72  ,0.38 , 0.38;...
            0.64  ,0.57  ,0.48 , 0.50,  0.70  ,0.33 , 0.26;...
            0.60  ,0.76  ,1.00 , 0.50,  0.77  ,0.59 , 0.52;...
            0.69  ,0.59  ,0.48 , 0.50,  0.77 , 0.39 , 0.21;...
            0.63  ,0.49  ,0.48 , 0.50,  0.79 , 0.45 , 0.28;...
            0.71  ,0.71  ,0.48 , 0.50,  0.68 , 0.43 , 0.36;...
            0.68  ,0.63  ,0.48 , 0.50,  0.73 , 0.40 , 0.30;...
            0.77  ,0.57  ,1.00 , 0.50,  0.37,  0.54 , 0.01;...
            0.66 , 0.49  ,1.00 , 0.50,  0.54,  0.56  ,0.36;...
            0.71 , 0.46  ,1.00 , 0.50,  0.52,  0.59  ,0.30;...
            0.67 , 0.55  ,1.00 , 0.50,  0.66,  0.58  ,0.16;...
            0.68 , 0.49  ,1.00 , 0.50,  0.62,  0.55  ,0.28]
%284
for i=1:143  
  for j=1:7
       if j ~= 1
           clases_Entrenamiento(i,j) = 0;
       else
           clases_Entrenamiento(i,j) = 1;
       end
       
    end    
end 

for i=144:220
  for j=1:7
      if j ~= 2
           clases_Entrenamiento(i,j) = 0;
       else
           clases_Entrenamiento(i,j) = 1;
       end
  end
end 
for i=221:222
  for j=1:7
       if j ~= 3
           clases_Entrenamiento(i,j) = 0;
       else
           clases_Entrenamiento(i,j) = 1;
       end
  end
end 
for i=223:224
  for j=1:7
       if j ~= 4
           clases_Entrenamiento(i,j) = 0;
       else
           clases_Entrenamiento(i,j) = 1;
       end
  end
end 
for i=225:259
  for j=1:7
       if j ~= 5
           clases_Entrenamiento(i,j) = 0;
       else
           clases_Entrenamiento(i,j) = 1;
       end
  end
end 
for i=260:279
  for j=1:7
       if j ~= 6
           clases_Entrenamiento(i,j) = 0;
       else
           clases_Entrenamiento(i,j) = 1;
       end
  end
end 
for i=280:284
  for j=1:7
       if j ~= 7
           clases_Entrenamiento(i,j) = 0;
       else
           clases_Entrenamiento(i,j) = 1;
       end
  end
end 

display(clases_Entrenamiento)

         
Datos_Prueba=[0.49,0.29,0.48,0.50,0.56,0.24,0.35;...
              0.44 ,0.52, 0.48, 0.50, 0.43 ,0.47, 0.54;...
              0.85 ,0.53, 0.48, 0.50, 0.53 ,0.52, 0.35;...
              0.75 ,0.55, 1.00, 1.00, 0.40 ,0.47, 0.30;...
              0.72 ,0.42, 0.48, 0.50, 0.65 ,0.77, 0.79;...
              0.78 ,0.68, 0.48, 0.50, 0.83 ,0.40, 0.29;...
              0.77 ,0.57, 1.00, 0.50, 0.37 ,0.54, 0.01]

clases_Prueba=[1 0 0 0 0 0 0;...
			 0 1 0 0 0 0 0;...
			 0 0 1 0 0 0 0;...
			 0 0 0 1 0 0 0;...
			 0 0 0 0 1 0 0;...
			 0 0 0 0 0 1 0;...
			 0 0 0 0 0 0 1]
%se entrena la RNA
sNet = train(sNet,Datos_Entrenamiento',clases_Entrenamiento');
%%%Se visualiza la red neuronal
view(sNet)
%%% Una prueba para validad la red neuronal
salida = sim(sNet,Datos_Prueba');


salida=round(salida')

%%9 es el tama?o de las matrices de prueba
contador=0;tam=7;
for i=1:tam
	if salida(i,:)==clases_Prueba(i,:)
	contador=contador+1;
	end
end

Porcentaje=contador*100/tam
disp(strcat('El porcentaje es ',num2str(Porcentaje)));