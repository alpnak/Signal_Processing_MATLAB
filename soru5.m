%% SORU 5
% Aşağıda verilen dürtü fonksiyonunu resme uygulayarak (konvolüsyon) resimdeki 
% kenarları tespit edeceksiniz.
%% 
% *a)* Şehir resmini Matlab’da açınız. Resmi gri tonlamalı resme çevirin. Aşağıdaki 
% 1x2 boyutundaki dürtü tepkisi matrisi ile konvolüsyonunu alınız. Yeni resim 
% ile orijinal resmi yan yana koyarak tek figürde gösteriniz. Sonuçları yorumlayınız.
% 
% 

sehir_resim = imread("sehir.jpg", "jpg");

% Proje dosyası MATLAB'da açıldığında resmi açmak için kullanılan "imread()" fonksiyonuna
% parametre olarak, dosya yolu MATLAB tarafından bilindiği için sadece ilgili resim
% dosyasının ismi ve dosya formatı, "sehir.jpg" (dosya adı ) ve "jpg" (dosya formatı) girilmiştir.
% "imread("sehir.jpg", "jpg")" komutu ile şehie resminin bulunduğu dosyanın verileri,
% 3 boyutlu bir dizi olan ve her bir pikselin renk bilgisini taşıyan "sehir_resim"
% değişkenine aktarıldı.    


sehir_resim_gri = rgb2gray(sehir_resim);

% "rgb2gray(sehir_resim)" komutu ile gri tona dönüştürülen ve her bir piksel değeri
% için 0 ile 255 arasındaki değerlerin siyah ile beyaz arasındaki renkleri temsil
% ettiği matris, "sehir_resim_gri" değişkenine atandı.


durtu_tepkisi = [0.02 -0.02];

% Belirtilen koşullara uygun olarak 1x2 boyutunda dürtü tepkisi
% "durtu_tepkisi" değişkeniyleoluşturuldu.


sehir_resim_gri_K = conv2(durtu_tepkisi, sehir_resim_gri, "full");

% "conv2()" fonksiyonu kullanılarak "durtu_tepkisi" ile "sehir_resim_gri"
% değişkenlerinin 2 boyutlu konvolüsyonu alındı ve "sehir_resim_gri_K"
% değişkenine atandı.


figure();
subplot(1, 3, 1);
imshow(sehir_resim);
title("Orijinal şehir resmi");

subplot(1, 3, 2);
imshow(sehir_resim_gri);
title("Değiştirilmiş resim 1");
xlabel("(Gri tonlamalı)");

subplot(1, 3, 3);
imshow(sehir_resim_gri_K);
title("Değiştirilmiş resim 2");
xlabel("(Konvolüsyonu alınmış)");

sgtitle("Orijinal şehir resmi ve değiştirilmiş diğer resimler", "FontSize", 15);