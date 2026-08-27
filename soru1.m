%% SORU 1
% Size .jpeg uzantılı bir renkli resim verilmiştir. Renkli resim 3 boyutludur 
% (x,y,renk) ve renk içinde kırmızı, yeşil, mavi renklerinin yoğunluk değerlerini 
% (RGB) bulunduran bir vektördür.
%% 
% *a)* Bu resmi Matlab’da açın ve enine ve boyuna kaç piksel olduğunu bulunuz.

aslan_resim = imread("aslan.jpeg", "jpg");

% Proje dosyası MATLAB'da açıldığında resmi açmak için kullanılan "imread()" fonksiyonuna
% parametre olarak, dosya yolu MATLAB tarafından bilindiği için sadece ilgili resim
% dosyasının ismi ve dosya formatı, "aslan.jpeg" (dosya adı ) ve "jpg" (dosya formatı) girilmiştir.
% "imread("aslan.jpeg", "jpg")" komutu ile aslan resminin bulunduğu dosyanın verileri,
% 3 boyutlu bir dizi olan ve her bir pikselin renk bilgisini taşıyan "aslan_resim"
% değişkenine aktarıldı.


[en, boy, RGB] = size(aslan_resim);
fprintf("Resim piksel sayısı (en): %d", en);
fprintf("Resim piksel sayısı (boy): %d", boy);

% aslan_resmi değişkeni size() fonksiyonuna aktarılarak boyutlarına erişildi ve boyutları
% ekrana bastırıldı.
%% 
% *b)* (371,371) konumunda bulunan pikselin RGB değerlerini bulunuz.

RGB_deger = aslan_resim(371, 371, :);

fprintf("Resmin (371, 371) konumunda bulunan pikselin RGB kırmızı değeri: %d\n", RGB_deger(1));
fprintf("Resmin (371, 371) konumunda bulunan pikselin RGB yeşil değeri: %d\n", RGB_deger(2));
fprintf("Resmin (371, 371) konumunda bulunan pikselin RGB mavi değeri: %d\n", RGB_deger(3));
%% 
% *c)* Resmi figür olarak gösteriniz.

figure();
imshow(aslan_resim);
title("Aslan resmi", "FontSize", 10);