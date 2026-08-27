%% SORU 2
% Gri tonlamalı (grayscale) resim, RGB resimden farklı olarak 2 boyutludur (x,y). 
% Her piksel için bir renk değeri vardır ve bu değer bu noktanın siyah ile beyaz 
% arasındaki seviyeyi belirtir.
%% 
% *a)* Renkli resmi, gri tonlamalı resme çevirin ve figür olarak gösteriniz.

aslan_resim_gri = rgb2gray(aslan_resim);

% "rgb2gray(aslan_resim)" komutu ile gri tona dönüştürülen ve her bir piksel değeri
% için 0 ile 255 arasındaki değerlerin siyah ile beyaz arasındaki renkleri temsil
% ettiği matris, "aslan_resim_gri" değişkenine atandı.


figure();
imshow(aslan_resim_gri);
title("Gri tonlamalı aslan resmi", "FontSize", 10);
%% 
% *b)* (371,371) konumunda bulunan pikselin değerini söyleyiniz.

GRI_deger = aslan_resim_gri(371, 371);

% "aslan_resim_gri(371, 371)" komutu ile oluşturulan gri tondaki resmin (371, 371)
% konumunda bulunan pikselin 0 ile 255 arasındaki değerinin siyah ile beyaz arasındaki
% rengi temsil ettiği renk değeri "GRI_deger" değişkenine atandı.


fprintf("Resmin (371, 371) konumunda bulunan pikselin değeri: %d\n",  GRI_deger);
%% 
% *c)* Gri tonlamalı resmin histogramını çıkartınız. X ekseni piksel renk değerlerini, 
% Y ekseni kaç tane olduğunu göstermelidir.

figure();
imhist(aslan_resim_gri);
ylabel("Renk sayısı");
title("Gri tonlamalı resmin histogramı", "FontSize", 10);
%% 
% *d)* Gri tonlamalı resimden rastgele bir piksel aldığımız zaman renk değerinin 
% 131’den büyük olma olasılığını bulunuz.

deney_sayisi = 1000000;

% Olasılık değerini hesaplarken, en iyi yakınsamayı elde edebilmek için yüksek
% tutulan, bir pikselin rastgele olarak kaç defa seçilip kontrol edileceğini gösteren
% "deney_sayisi" değişkeni.


kontrol_tutucu = zeros(1, deney_sayisi);

% 1 x deney_sayisi boyutunda olan ve döngü içerisinde kontrol saayısına göre
% ilgili indisteki değeri 1 olarak değiştirilip toplama işleminde kullanmak üzere
% oluşturulan "kontrol_tutucu" matrisi.


for i = 1:deney_sayisi

    rastgele_piksel = randperm(1024, 2);

    if(aslan_resim_gri(rastgele_piksel(1), rastgele_piksel(2)) > 131)

        kontrol_tutucu(i) = 1;
    end
end

% "deney_saiyisi" değişkeninin değeri kadar dönen ve istenilen durum için kontrol işlemini
% gerçekleştiren döngü. "randperm(1024, 2)" komutu ile 0 ve 1024 arasından rastgele olarak
% seçilen ikililer "rastgele_piksel" değişkenine aktarıldı. "rastgele_piksel" matrisinin elemanları
% "aslan_resim_gri" matrisine indis olarak verilip kontrol sayısına (131) göre kontrol edildi
% ve daha önce oluşturulmuş olan "kontrol_tutucu" matrisinin ilgili indisi 1 olarak değiştirildi.


olasilik = sum(kontrol_tutucu) / deney_sayisi;

% İstenilen durumların sayısını öğrenmek için oluşturulaan "kontrol_tutucu" matrisinin
% elemaanları toplanarak istenilen durum sayısı bulundu ve toplamda gerçekleştirilen deney
% sayısına bölünerek gri tondaki resimden rastgele bir piksel alındığı zaman renk değerinin
% 131'den büyük olma olasılığı bulundu.


fprintf("Gri tonlamalı resimden rastgele bir piksel alındığı zaman renk değerinin 131'den büyük olma olasılığı: %.6f", olasilik);
%% 
% *e)* İki tane eşik değeri verilecektir. Eğer resimdeki pikselin değeri ilk 
% eşikten küçükse ve eşitse siyaha, ikinci eşiğe küçük eşitse ve ilk eşikten büyükse 
% kırmızıya, ikinci eşikten büyükse sarıya boyayın. Resmi figür olarak gösterin. 
% İlk eşik 92, ikinci eşik 171 olarak alınız.

yeni_resim = zeros(1024, 1024, 3);

% Değişiklerin yapılmasından sonra oluşaacak yeni resim için, "zeros(1024, 1024, 3)" komutu
% ile tüm elemanları 0 olarak oluşturulan "yeni_resim" değişkeni.


for en = 1:1024

    for boy = 1:1024

        gri_piksel = aslan_resim_gri(en, boy);

        if(gri_piksel <= 92)

            yeni_resim(en, boy, :) = [0, 0, 0];

        elseif(gri_piksel <= 171)

            yeni_resim(en, boy, :) = [255, 0, 0];

        else

            yeni_resim(en, boy, :) = [255, 255, 0];
        end
    end
end

% resmin eni ve boyu kadar dönen ve istenilen durumlar için kontrol işlemini gerçekleştiren döngü.
% "aslan_resim_gri(en, boy)" komutu ile oluşturulan gri tondaki resmin (en, boy) konumunda bulunan
% pikselin 0 ile 255 arasındaki değerinin siyah ile beyaz arasındaki rengi temsil ettiği renk
% değeri "gri_piksel" değişkenine atandı ve kontrol blokları ile istenilen durumlar için kontrol edildi.
% "yeni_resim(en, boy, :) = [0, 0, 0];" satırı ile 92'den küçük olan değerler için resmin ilgili
% indisindekideğer [0, 0, 0] (siyah), "yeni_resim(en, boy, :) = [255, 0, 0];" satırı ile 92'den büyük
% 171'den küçük olan değerler için resmin ilgili indisindeki değeri [255, 0, 0] (kırmızı) ve
% "yeni_resim(en, boy, :) = [255, 255, 0];" satırı ile diğer durumlar için resmin ilgili indisindeki
% değeri [255, 255, 0] (sarı) olarak değiştirldi.


figure();
imshow(yeni_resim);
title("Yeni aslan resmi", "FontSize", 10);
%% 
% *f)* Yeni resmin hem ende hem boyda 200 ile 824. pikselleri arasında kalan 
% bölgeyi ayrı bir figür olarak gösteriniz.

figure();
imshow(yeni_resim(200:824, 200:824, :));
title("Kırpılmış yeni aslan resmi", "FontSize", 10);