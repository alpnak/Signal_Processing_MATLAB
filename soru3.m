%% SORU 3
%% 
% *a)* Renkli resimde tüm piksellerin ortalama renk (R,G,B) değerlerini bulunuz.

kirmizi_matris = aslan_resim(:, :, 1);
kirmizi_toplam = sum(kirmizi_matris(:));
kirmizi_ortalama = kirmizi_toplam / (1024 * 1024);
fprintf("Renkli resimde RGB kırmızı renk ortalama değeri: %.5f", kirmizi_ortalama);

% "aslan_resim(:, :, 1)" komutu ile resmin RGB kırmızı renk bilgisini içeren değerler
% "kirmizi_matris" değişkenine atandı. Bu matrisin tüm elemanları toplanarak "kirmizi_toplam"
% değişkenine atandı ve bu değişkenin tuttuğu değer toplam eleman sayısına (1024 * 1024)
% bölünerek kırmızı renk için ortalama değer elde edildi ve bu değer "kirmizi_ortalama"
% değişkenine atanıp ekrana yazdırıldı.


yesil_matris = aslan_resim(:, :, 2);
yesil_toplam = sum(yesil_matris(:));
yesil_ortalama = yesil_toplam / (1024 * 1024);
fprintf("Renkli resimde RGB yeşil renk ortalama değeri: %.5f", yesil_ortalama);

% "aslan_resim(:, :, 2)" komutu ile resmin RGB yeşil renk bilgisini içeren değerler
% "yesil_matris" değişkenine atandı. Bu matrisin tüm elemanları toplanarak "yesil_toplam"
% değişkenine atandı ve bu değişkenin tuttuğu değer toplam eleman sayısına (1024 * 1024)
% bölünerek yeşil renk için ortalama değer elde edildi ve bu değer "yesil_ortalama"
% değişkenine atanıp ekrana yazdırıldı.


mavi_matris = aslan_resim(:, :, 3);
mavi_toplam = sum(mavi_matris(:));
mavi_ortalama = mavi_toplam / (1024 * 1024);
fprintf("Renkli resimde RGB mavi renk ortalama değeri: %.5f", mavi_ortalama);

% "aslan_resim(:, :, 3)" komutu ile resmin RGB mavi renk bilgisini içeren değerler
% "mavi_matris" değişkenine atandı. Bu matrisin tüm elemanları toplanarak "mavi_toplam"
% değişkenine atandı ve bu değişkenin tuttuğu değer toplam eleman sayısına (1024 * 1024)
% bölünerek mavi renk için ortalama değer elde edildi ve bu değer "mavi_ortalama"
% değişkenine atanıp ekrana yazdırıldı.
%% 
% *b)* Resimdeki tüm piksellerden bu ortalama değerleri çıkartın. Yeni resmi 
% figür olarak gösteriniz.

yeni_resim2 = zeros(1024, 1024, 3);

% Değişiklerin yapılmasından sonra oluşaacak yeni resim için, "zeros(1024, 1024, 3)" komutu
% ile tüm elemanları 0 olarak oluşturulan "yeni_resim2" değişkeni.


for i = 1:3

    for en = 1:1024

        for boy = 1:1024

            switch(i)

                case(1)
                    yeni_resim2(en, boy, i) = aslan_resim(en, boy, i) - kirmizi_ortalama;
                case(2)
                    yeni_resim2(en, boy, i) = aslan_resim(en, boy, i) - yesil_ortalama;
                case(3)
                    yeni_resim2(en, boy, i) = aslan_resim(en, boy, i) - mavi_ortalama;
                otherwise
                    fprintf("x");
            end
        end
    end
end

% resmin boyutları kadar dönen ve ortalama değerleri normal değerlerden çıkaran döngü.
% i. indisin RGB kırmızı, yeşil ve mavi renklerinin değerini gösterdiği "aslan_resim(en, boy, i)" komutu
% ile normaal resmin değerlerine erişildi ve bu değerlerden yukarıda elde edilen ortalama değerleri
% çıkartıldı.


yeni_resim2 = uint8(yeni_resim2);

% Çıkarma işlemi sonrası negatif değerli sayıların oluşabilme ihtimaalinden dolayı renk bilgisini
% veren değerlerin 0 ile 255 aralığında değerler olarak işlenmesi için "yeni_resim2" değişkeninin
% uint8 dönüşümü yapıldı.


figure();
imshow(yeni_resim2);
title("Yeni aslan resmi", "FontSize", 10);
%% 
% *c)* Resmin tersini alınız. Resmin tersi, resmin renk değerlerini 255’e tamlayan 
% renk değerlerine sahip olan resim olarak tanımlanabilir. Bunu tüm değerleri 
% 255’ten çıkararak bulabilirsiniz. Resmin tersini figür olarak gösteriniz.

ters_resim = 255 - aslan_resim;

% "255 - yeni_resim2" komutu ile 255'den her bir pikselin renk değeri
% çıkarılıp "ters_resim" değişkenine atandı.


figure();
imshow(ters_resim);
title("Tersi alınmış aslan resmi", "FontSize", 10);
%% 
% *d)* Resmin tersi ile orijinal resmi toplayıp figür olarak gösteriniz. Ne 
% fark ettiniz?

son_resim = ters_resim + aslan_resim;

% "ters_resim + aslan_resim" komutu ile tersi alınmış olan aslan resmi ile
% orijinal aslan resmi toplandı ve sonuç "son_resim" adlı değişkene atandı.


figure();
imshow(son_resim);
title("Tersi alınmış aslan resmi ile orijinal aslan resminin toplanmış hali", "FontSize", 10);