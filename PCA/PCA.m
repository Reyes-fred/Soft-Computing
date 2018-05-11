load magic2.txt;
figure('Name','DataSet', 'NumberTitle','off');
plot(magic2(1,:),'o:r', 'LineWidth',2);
hold; 
plot(magic2(19020,:),'o:b', 'LineWidth',2);
title('Dos clases Magic DataSet ')
xlabel('Muestra');
ylabel('Amplitud (mV)');
nobservations=size(magic2,1)
nfeatures=size(magic2,2)

c = linspace(1,10,length(magic2(:,1)));
figure('Name','Magic DataSet', 'NumberTitle','off');
scatter3(magic2(:,1),magic2(:,2),magic2(:,3),[],c);
title('Magic DataSet entero')
xlabel('1^{st} feature (mV)');
ylabel('2^{nd} feature (mV)');
zlabel('3^{rd} feature (mV)');

[coeff,score,latent,tsquare] = princomp(zscore(magic2));

percent=latent./sum(latent)*100;
figure('Name','PCA Valores Propios', 'NumberTitle','off');
plot(1:length(latent),percent,'o:b', 'LineWidth',2);
grid;
xlabel('Valores Propios');
ylabel('Peso (%)');

figure('Name','3D Reducci?n PC', 'NumberTitle','off');
scatter3(score(:,1),score(:,2),score(:,3),[]);
title('Reducci?n por PCA');
xlabel('1^{st} feature (mV)');
ylabel('2^{nd} feature (mV)');
zlabel('3^{rd} feature (mV)');

figure('Name','Reducido vs NO reducido', 'NumberTitle','off');
subplot(1,2,1); 
scatter(score(:,1),score(:,2),[]);
title('Reduced set');
xlabel('1^{st} feature (mV)');
ylabel('2^{nd} feature (mV)');
subplot(1,2,2); 
scatter(magic2(:,1),magic2(:,2),[]);
title('NOT reduced set');
xlabel('1^{st} feature (mV)');
ylabel('2^{nd} feature (mV)');

fid=fopen('MyFile2.txt','w');
fprintf(fid, '%f %f %f \n', score(:,1),score(:,2),score(:,3));
fclose(fid);