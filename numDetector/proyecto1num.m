
x=[1 0 1 1 1 1 1 1 1 1;1 0 1 1 0 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1 1;1 0 0 0 1 1 1 0 1 1;
    0 0 0 0 0 0 0 0 0 0;1 1 1 1 1 0 0 1 1 1;
    1 0 1 1 1 1 1 0 1 1;0 0 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1 1;1 0 1 0 0 0 1 0 1 0;
    0 0 0 0 0 0 0 0 0 0;1 1 0 1 1 1 1 1 1 1;
    1 0 1 1 0 1 1 0 1 0;1 0 1 1 0 1 1 0 1 0;
    1 1 1 1 1 1 1 1 1 1];

d=[0 0 0 0 0 0 0 0 0 1;0 0 0 0 0 0 0 0 1 0;
    0 0 0 0 0 0 0 1 0 0;0 0 0 0 0 0 1 0 0 0;
    0 0 0 0 0 1 0 0 0 0;0 0 0 0 1 0 0 0 0 0;
    0 0 0 1 0 0 0 0 0 0;0 0 1 0 0 0 0 0 0 0;
    0 1 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0];

red=newp([0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1],10);
red=train(red,x,d);% Entrenamiento de la red
view(red);
%validacion de la red (patron de prueba el # 9)

v = [  1 1 1 0 0 1 1 1 1 1 0 0 1 1 1]% Vector de prueba tipo fila

prueba = v';% Transpuesta del vector

a=sim(red,prueba);

b=a'
 
if a==[0;0;0;0;0;0;0;0;0;0]%numero 0
    salida=0                    
elseif a== [0;0;0;0;0;0;0;0;1;0]%numero 1
    salida=1
elseif a== [0;0;0;0;0;0;0;1;0;0]%numero 2
    salida=2
elseif a== [0;0;0;0;0;0;1;0;0;0]%numero 3
    salida=3
elseif a== [0;0;0;0;0;1;0;0;0;0]%numero 4
    salida=4
elseif a== [0;0;0;0;1;0;0;0;0;0]%numero 5
    salida=5
elseif a== [0;0;0;1;0;0;0;0;0;0]%numero 6
    salida=6
elseif a== [0;0;1;0;0;0;0;0;0;0]%numero 7
    salida=7
elseif a== [0;1;0;0;0;0;0;0;0;0]%numero 8
    salida=8
elseif a==[1;0;0;0;0;0;0;0;0;0]%numero 9
    salida=9
else
end
