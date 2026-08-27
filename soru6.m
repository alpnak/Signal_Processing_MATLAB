%% SORU 6
% Bu soruda resme gürültü ekleyip ardından filtreleyeceksiniz.
%% 
% *a)* Renkli resme imnoise komutu ile 0.1, 0.4 ve 0.7 varyanslarına sahip gaussian 
% gürültü ekleyin. Orijinal resimle birlikte diğer 3 resmi aynı pencerede tek 
% figürde gösteriniz.

figure();
subplot(2, 2, 1);
imshow(aslan_resim);
title("Orijinal resim");


aslan_resim_noise1 = imnoise(aslan_resim, "gaussian", 0, 0.1);

subplot(2, 2, 2);
imshow(aslan_resim_noise1);
title("Varyans 0.1");

% "imnoise()" fonksiyonu kullanılarak "aslan_resim" değişkenine 0.1
% varyansa sahip gaussian gürültü eklendi ve "aslan_resim_noise1"
% değişkenine atandı.


aslan_resim_noise2 = imnoise(aslan_resim, "gaussian", 0, 0.4);

subplot(2, 2, 3);
imshow(aslan_resim_noise2);
title("Varyans 0.4");

% "imnoise()" fonksiyonu kullanılarak "aslan_resim" değişkenine 0.4
% varyansa sahip gaussian gürültü eklendi ve "aslan_resim_noise2"
% değişkenine atandı.


aslan_resim_noise3 = imnoise(aslan_resim, "gaussian", 0, 0.7);

subplot(2, 2, 4);
imshow(aslan_resim_noise3);
title("Varyans 0.7");

% "imnoise()" fonksiyonu kullanılarak "aslan_resim" değişkenine 0.7
% varyansa sahip gaussian gürültü eklendi ve "aslan_resim_noise3"
% değişkenine atandı.


sgtitle("Orijinal aslan resmi ve gürültü eklenmiş diğer resimler");
%% 
% *b)* 0.1 varyanslı resme imgaussfilt komutu ile gaussian filtre uygulayın. 
% Orijinal resmi, gürültülü resmi ve filtreli resmi tek figürde yan yana koyup 
% karşılaştırınız.

aslan_resim_filtreli1 = imgaussfilt(aslan_resim_noise1);

% "imgaussfilt()" fonksiyonu kullanılarak 0.1 varyansa sahip gaussian gürültü eklenmiş
% "aslan_resim_noise1" değişkeni filtrelenip "aslan_resim_filtreli1" değişkenine atandı.


figure();
subplot(1, 3, 1);
imshow(aslan_resim);
title("Orijinal resim");

subplot(1, 3, 2);
imshow(aslan_resim_noise1);
title("Varyans 0.1");

subplot(1, 3, 3);
imshow(aslan_resim_filtreli1);
title("Filtreli resim");

sgtitle("Orijinal aslan resmi, gürültülü aslan resim ve filtreli aslan resmi");