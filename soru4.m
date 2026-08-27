%% SORU 4
% Bu soruda çeşitli yöntemlerle alt örnekleme (downsampling) yapacaksınız. Bu 
% sayede resmi kalitesinden olabildiğince az ödünç vererek sıkıştıracağız.
%% 
% *a)* Öncelikle orijinal renkli resmin boyutunun kaç kilobayt olduğunu bulunuz.

aslan_resim_bilgi = imfinfo("aslan.jpeg");
kilobayt = (aslan_resim_bilgi.FileSize) / 1024;

% "whos("aslan_resim")" komutu ile "aslan_resim" değişkenine ait olan
% bilgiler "aslan_resim_bilgi" değişkenine atandı. Bir struct olan bu
% değişkenin "bytes" elemanına "." operatörü ile erişilerek resmin bayt
% cinsinden boyutuna ulaşıldı. "(aslan_resim_bilgi.bytes) / 1000" komutu
% ile bayt cinsinden olan değer kilobayta çevirilmiş oldu ve "kilobayt"
% değişkenine atandı.


fprintf("Orjinal renkli resmin boyutu: %.3f kB", kilobayt);
%% 
% *b)* Resmin çift satırlarını ve çift sütunlarını resimden çıkarıp kalan pikselleri 
% birleştirin. Yeni resmi kaydedip boyutunu bulunuz.

yeni_resim3 = aslan_resim(1:2:end, 1:2:end, :);

% "aslan_resim(1:2:end, 1:2:end, :)" komutu ile 1:2:end en-boy aralığındaki
% tüm RGB değerler "yeni_resim3" değişkenine atandı ve böylece resmin çift
% satırları ve çift sütunları yeni resime dahil olmamış oldu.


imwrite(yeni_resim3, "yeni_resim3.jpeg", "jpg");

% "imwrite()" fonksiyonu kullanılarak, sıkıştırılmış "yeni_resim3" değişkenini
% "jpg" formatında "yeni_resim3.jpg" dosya adı ile kaydedilmiş oldu.


yeni_resim3_bilgi = imfinfo("yeni_resim3.jpeg");
kilobayt2 = (yeni_resim3_bilgi.FileSize) / 1024;

% "whos("yeni_resim3")" komutu ile "yeni_resim3" değişkenine ait olan
% bilgiler "yeni_resim3_bilgi" değişkenine atandı. Bir struct olan bu
% değişkenin "bytes" elemanına "." operatörü ile erişilerek resmin bayt
% cinsinden boyutuna ulaşıldı. "(yeni_resim3_bilgi.bytes) / 1000" komutu
% ile bayt cinsinden olan değer kilobayta çevirilmiş oldu ve "kilobayt2"
% değişkenine atandı.


fprintf("2x satır ve sütunları atılıp diğerleri birleştirilen resmin boyutu: %.3f kB", kilobayt2);
%% 
% *c)* Şimdi de resmin dördün katı olan satır ve sütunlarını birleştirin diğer 
% satır ve sütunları atın. Yeni resmi kaydedip boyutunu bulunuz. Bu 3 resmi aynı 
% pencerede yan yana koyarak inceleyiniz.

yeni_resim4 = aslan_resim(4:4:end, 4:4:end, :);

% "yeni_resim4 = aslan_resim(4:4:end, 4:4:end, :)" komutu ile 4:4:end en-boy
% aralığındaki tüm RGB değerler "yeni_resim4" değişkenine atandı ve böylece
% resmin dördün katı olan satır ve sütunları birleştirilmiş diğer satır ve sütunlar
% dahil edilmemiş oldu.


imwrite(yeni_resim4, "yeni_resim4.jpeg", "jpg");

% "imwrite()" fonksiyonu kullanılarak, sıkıştırılmış "yeni_resim4" değişkenini
% "jpg" formatında "yeni_resim4.jpg" dosya adı ile kaydedilmiş oldu.imwrite(yeni_resim4, "yeni_resim4.jpeg", "jpg");


yeni_resim4_bilgi = imfinfo("yeni_resim4.jpeg");
kilobayt3 = (yeni_resim4_bilgi.FileSize) / 1024;

% "whos("yeni_resim4")" komutu ile "yeni_resim4" değişkenine ait olan
% bilgiler "yeni_resim4_bilgi" değişkenine atandı. Bir struct olan bu
% değişkenin "bytes" elemanına "." operatörü ile erişilerek resmin bayt
% cinsinden boyutuna ulaşıldı. "(yeni_resim4_bilgi.bytes) / 1000" komutu
% ile bayt cinsinden olan değer kilobayta çevirilmiş oldu ve "kilobayt3"
% değişkenine atandı.


fprintf("4x satır ve sütunları birleştirilip diğerleri atılan resmin boyutu: %.3f kB", kilobayt3);

figure();
subplot(1, 3, 1);
imshow(aslan_resim);
title("Orijinal resim");

subplot(1, 3, 2);
imshow(yeni_resim3);
xlabel("(2x satır ve sütunlar çıkartılan)", "FontSize", 7);
title("Sıkıştırılmış resim 1");

subplot(1, 3, 3);
imshow(yeni_resim4);
xlabel("(4x satır ve sütunları tutulan)", "FontSize", 8);
title("Sıkıştırılmış resim 2");

sgtitle("Orijinal aslan resmi ve sıkıştırılmış diğer resimler", "FontSize", 15);
%% 
% *d)* Maxpooling, Minpooling, Average Pooling yöntemleri yapay zeka uygulamalarında 
% da kullanılan sıkıştırma yöntemleridir. Farklı boyutlarda olabilmekle birlikte 
% bu soruda 2x2 pooling uygulayacaksınız. Bu şekilde aşağıdaki resimde görüldüğü 
% gibi 4 tane komşu pikselin değerlerinden maksimum olanı, ortalamalarını veya 
% minimum olanı tek piksele yazıp bu şekilde resmi dörtte birine indiriyoruz. 
% Buna göre bu 3 yöntemi ayrı ayrı uygulayınız ve yeni resimler ile orijinal resmi 
% aynı pencerede 2x2 layout şeklinde gösteriniz ve resimlerin boyutlarını bulunuz.
% 
% 

figure();
subplot(2, 2, 1);
imshow(aslan_resim);
title("Orijinal resim");


for i = 1:3
    for en = 1:2:1023
        for boy = 1:2:1023
            max_pooled(ceil(en/2), ceil(boy/2), i) = max(max(aslan_resim(en:(en + 1), boy:(boy + 1), i)));
        end
    end
end

imwrite(max_pooled, "max_pooled.jpg", "jpg");

max_pooled_bilgi = imfinfo("max_pooled.jpg");
kilobayt_max = (max_pooled_bilgi.FileSize) / 1024;

subplot(2, 2, 2);
imshow(uint8(max_pooled));
title("Max Pooling");


for i = 1:3
    for en = 1:2:1023
        for boy = 1:2:1023
            min_pooled(ceil(en/2), ceil(boy/2), i) = min(min(aslan_resim(en:(en + 1), boy:(boy + 1), i)));
        end
    end
end

imwrite(min_pooled, "min_pooled.jpg", "jpg");

min_pooled_bilgi = imfinfo("min_pooled.jpg");
kilobayt_min = (min_pooled_bilgi.FileSize) / 1024;

subplot(2, 2, 3);
imshow(uint8(min_pooled));
title("Min Pooling");


for i = 1:3
    for en = 1:2:1023
        for boy = 1:2:1023
            average_pooled(ceil(en/2), ceil(boy/2), i) = mean(mean(aslan_resim(en:(en + 1), boy:(boy + 1), i)));
        end
    end
end

imwrite(average_pooled, "average_pooled.jpg", "jpg");

average_pooled_bilgi = imfinfo("average_pooled.jpg");
kilobayt_average = (average_pooled_bilgi.FileSize) / 1024;

subplot(2, 2, 4);
imshow(uint8(average_pooled));
title("Average Pooling");

sgtitle("Orijinal aslan resmi ve diğer sıkıştırılmış resimler");


fprintf("Orijinal resmin boyutu: %.3f kB", kilobayt);
fprintf("Max pooling uygulanmış resmin boyutu: %.3f kB", kilobayt_max);
fprintf("Min pooling uygulanmış resmin boyutu: %.3f kB", kilobayt_min);
fprintf("Average pooling uygulanmış resmin boyutu: %.3f kB", kilobayt_average);
%% 
% *e)* Resim kalitelerini ve boyutları göz önüne aldığınızda en iyi yöntem olarak 
% hangisini tercih edersiniz? Karşılaştırın ve açıklayın.

% Resimlerin karşılaştırması yapmak için orijinal resmin ve diğer sıkıştırılmış
% 3 resmin bilirli bir bölgesi yakılaştırılarak aynı pencerede gösterilmiştir.

figure();
subplot(2, 2, 1);
imshow(aslan_resim(150:250, 66:166, :));
title("Orijinal resim");

subplot(2, 2, 2);
imshow(uint8(max_pooled(75:125, 35:85, :)));
title("Max pooling");

subplot(2, 2, 3);
imshow(uint8(min_pooled(75:125, 35:85, :)));
title("Min pooling");

subplot(2, 2, 4);
imshow(uint8(average_pooled(75:125, 35:85, :)));
title("Average pooling");

sgtitle("Orijinal aslan resmi ve sıkıştırılmış diğer resimlerin karşılaştırması");