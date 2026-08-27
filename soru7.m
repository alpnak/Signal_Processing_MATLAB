%% SORU 7
% Bu soruda bir ses sinyalini zaman alanında ve frekans alanında analiz edeceksiniz, 
% sinyale yankı ekleyeceksiniz, gürültü ekleyip filtreleyeceksiniz ve AM haberleşmenin 
% aşamaları olan modülasyon ve demodülasyon yapacaksınız.
%% 
% *a)* Size verilen gitar sesini Matlab’da açınız ve dinleyiniz. Örnekleme frekansını 
% bulunuz. Kaç örnek olduğunu bulunuz. Süresini bulunuz. Ses sinyalini zamana 
% bağlı olarak çizdiriniz.

[ses_vektor, frekans] = audioread("gitar.wav");

% Proje dosyası MATLAB'da açıldığında sesi açmak için kullanılan "audioread()" fonksiyonuna
% parametre olarak, dosya yolu MATLAB tarafından bilindiği için sadece ilgili ses
% dosyasının ismi, "gitar.wav" girilmiştir.
% Ses dosyasına ait iki değer döndüren, örneklme değerlerinden oluşan nx1 boyutunda bir vektör
% ve örnekleme frekansının değeri, "audioread("gitar.wav")" komutu ile gitar sesinin
% bulunduğu dosyanın örnekleme değerlerinden oluşan nx1 boyutlu vektör
% "ses_vektor" değişkenine ve örnekleme frekansı değeri "frekans" değişkenine atandı.


sound(ses_vektor, frekans);
pause(6);

% "sound(ses_vektor, frekans)" komutu, örnekleme değerleri "ses_vektor" değişkeninde tutulan
% ve örnekleme frekansı "frekans" değişkeninde tutulan sesin dinlenmesini sağladı.


fprintf("Gitar sesinin örnekleme frekansı: %d Hz", frekans);


ornek_sayisi = length(ses_vektor);
fprintf("Gitar sesinin örnekleme sayısı: %d", ornek_sayisi);

% "length(ses_vektor)" komutu ile "ses_vektor" değişkeninin kaç adet
% örnekleme değerinden oluştuğu bulundu ve "ornek_sayisi" değişkenine atandı.


gitar_ses_bilgi = audioinfo("gitar.wav");
ses_suresi = gitar_ses_bilgi.Duration;
fprintf("Gitar sesinin süresi: %.5f s", ses_suresi);

% "audioinfo("gitar.wav")" komutu ile "gitar.wav" ses dosyasına ait olan
% bilgiler "gitar_bilgi" değişkenine atandı. Bir struct olan bu
% değişkenin "Duration" elemanına "." operatörü ile erişilerek sesin saniye
% cinsinden süresine ulaşıldı ve "ses_suresi" değişkenine atandı.


zaman = (0:(ornek_sayisi - 1)) / frekans;

% Örnek sayısı ve frekanstan, ses sinyalinin her bir örnekleme zamanının
% bilgisini içeren zaman vektörü bulunup "zaman" değişkenine atandı.


figure();
plot(zaman, ses_vektor);
xlabel("Zaman (s)");
ylabel("Ses Sinyali");
title("Ses sinyalinin zamana bağlı grafiği");
%% 
% *b)* Ses sinyalinin Fourier dönüşümünü alarak frekans spektrum grafiğini çizdiriniz 
% ve yorumlayınız.

gitar_ses_fft = fft(ses_vektor);

% İçine parametre olarak girilen değişkenin ayrık fourier dönüşümünü alan "fft()"
% fonksiyonu kullanılarak, "fft(ses_vektor)" komutu ile gitar sesinin örnekleme değerlerini
% içeren "ses_vektor" değişkeninin fourirer dönüşümü alınıp "gitar_ses_fft"
% değişkenine atandı.


frekans_bilesenleri = (0:(ornek_sayisi - 1)) * (frekans / ornek_sayisi);

% Örnek sayısı ve frekanstan, ses sinyalinin frekans değerlerini içeren
% vektör bulunup "frekans_bilesenleri" değişkenine atandı.


figure();
plot(frekans_bilesenleri, abs(gitar_ses_fft));
xlabel("Frekans (Hz)");
ylabel("Genlik");
title("Gitar Sesinin Frekans Spektrumu");
%% 
% *c)* Sese yankı eklemek için bir dürtü fonksiyonunu bulunuz. Sistemin çıktısı 
% olan sinyal, orijinal ses sinyalini, 1 saniye sonra orijinal sinyalin 1/4’ü 
% büyüklüğünde bir yankıyı ve 2 saniye sonra ise orijinal sinyalin 1/16’sı büyüklüğünde 
% bir yankıyı içermeli. Sistemi aşağıdaki gibi ifade edebiliriz.
% 
% 
% 
% Dürtü fonksiyonunu giriş sinyaline uygulayarak çıkış sinyalini bulunuz. Çıkış 
% sinyalini kaydediniz ve dinleyiniz. Süresini bulunuz ve orijinal sinyal ile 
% karşılaştırınız. Zamana bağlı grafiğini çizdiriniz. Frekans spektrum grafiğini 
% çizdiriniz, karşılaştırınız ve yorumlayınız.

durtu_fonk = zeros(1, 2 * frekans + 1);
durtu_fonk(1) = 1;
durtu_fonk(frekans + 1) = 1 / 4;
durtu_fonk(2 * frekans + 1) = 1 / 16;

% Belirtilen dürtü fonksiyonu, 1. ve 2. saniyelerde yankı olacak şekilde,
% "zeros(1, 2 * frekans + 1)" komutu ile ilk başta tüm elemanları 0 olarak
% oluşturulup verilen fonksiyona göre ilgili zamanlar için değerlerde
% değişiklik yapılarak, dürtü fonksiyonunu temsil eden "durtu_fonk"
% değişkeni oluşturuldu.


yankili_ses = conv(ses_vektor, durtu_fonk);

% Gitar sesinin örnekleme değerleri ve dürtü fonksiyonunun konvolüsyonu,
% "conv(ses_vektor, durtu_fonk)" komutu ile alınıp "yankili_ses"
% değişkenine atandı.


audiowrite("yankili_gitar.wav", yankili_ses, frekans);

% Dosya adını, ses sinyalinin örnekleme değerlerini içeren vektörü ve
% örnekleme frekansını parametre olarak alan "audiowrite()" fonksiyonu ile,
% oluşturulan yankılı ses "yankili_gitar.wav" dosyasına kaydedildi.


sound(yankili_ses, frekans);
pause(8);

% "sound(yankili_ses, frekans)" komutu, örnekleme değerleri "yankili_ses" değişkeninde tutulan
% ve örnekleme frekansı "frekans" değişkeninde tutulan sesin dinlenmesini sağladı.


yankili_ses_bilgi = audioinfo("yankili_gitar.wav");
yankili_ses_suresi = yankili_ses_bilgi.Duration;
fprintf("Yankılı gitar sesinin süresi: %.5f s", yankili_ses_suresi);

% "audioinfo("yankili_gitar.wav")" komutu ile "yankili_gitar.wav" ses dosyasına ait olan
% bilgiler "yankili_gitar_bilgi" değişkenine atandı. Bir struct olan bu
% değişkenin "Duration" elemanına "." operatörü ile erişilerek sesin saniye
% cinsinden süresine ulaşıldı ve "yankili_ses_suresi" değişkenine atandı.


yankili_ornek_sayisi = length(yankili_ses);
yankili_zaman = (0:(yankili_ornek_sayisi - 1)) / frekans;

% "length(yankili_ses)" komutu ile "yankili_ses" değişkeninin kaç adet
% örnekleme değerinden oluştuğu bulundu ve "yankili_ornek_sayisi" değişkenine atandı.


figure();
plot(yankili_zaman, yankili_ses);
xlabel("Zaman (s)");
ylabel("Ses Sinyali");
title("Yankılı ses sinyalinin zamana bağlı grafiği");


yankili_gitar_ses_fft = fft(yankili_ses);

% İçine parametre olarak girilen değişkenin ayrık fourier dönüşümünü alan "fft()"
% fonksiyonu kullanılarak, "fft(yankili_ses)" komutu ile yankılı gitar sesinin örnekleme değerlerini
% içeren "yankili_gitar" değişkeninin fourirer dönüşümü alınıp "yankili_gitar_ses_fft"
% değişkenine atandı.


yankili_frekans_bilesenleri = (0:(yankili_ornek_sayisi - 1)) * (frekans / yankili_ornek_sayisi);

% Örnek sayısı ve frekanstan, ses sinyalinin frekans değerlerini içeren
% vektör bulunup "yankili_frekans_bilesenleri" değişkenine atandı.


figure();
plot(yankili_frekans_bilesenleri, abs(yankili_gitar_ses_fft));
xlabel("Frekans (Hz)");
ylabel("Genlik");
title("Yankılı Gitar Sesinin Frekans Spektrumu");
%% 
% *d)* Bu sinyali de cos (2𝜋𝑓𝑐 𝑡) sinyali ile çarpıp modüle ediniz. 𝑓𝑐 
% = 1𝑘𝐻𝑧 𝑣𝑒 10𝑀ℎ𝑧 için iki farklı sinyal oluşturunuz. İkisini de dinleyin. 
% Ne fark ettiniz?

module_edilmis_1 = yankili_ses .* cos(2 * pi * 1000 * yankili_zaman)';

% "cos(2 * pi * 1000 * zaman)" ifadesi ile belirtilen sinyal 1 kHz frekans
% için oluşturulmuş oldu. Ancak bu sinyal 1xn boyutunda olduğundan nx1
% boyutunda bir vektör elde etmek için bu sinyal üzerinde transpoz alma işlemi
% uygulandı. Bu sinyal "yankili_ses" değişkeni ile çarpılırken elemanları bire
% bir çarpmak için ".*" operatörü kullanıldı. Sonuçta oluşan yeni sinyal
% "module_edilmis_1" değişkenine atandı.


sound(module_edilmis_1, frekans);
pause(8);

% "sound(module_edilmis_1, frekans)" komutu, örnekleme değerleri "module_edilmis_1"
% değişkeninde tutulan ve örnekleme frekansı "frekans" değişkeninde tutulan sesin
% dinlenmesini sağladı.


module_edilmis_2 = yankili_ses .* cos(2 * pi * 10000000 * yankili_zaman)';

% "cos(2 * pi * 10000000 * zaman)" ifadesi ile belirtilen sinyal 10 MHz frekans
% için oluşturulmuş oldu. Ancak bu sinyal 1xn boyutunda olduğundan nx1
% boyutunda bir vektör elde etmek için bu sinyal üzerinde transpoz alma işlemi
% uygulandı. Bu sinyal "yankili_ses" değişkeni ile çarpılırken elemanları bire
% bir çarpmak için ".*" operatörü kullanıldı. Sonuçta oluşan yeni sinyal
% "module_edilmis_2" değişkenine atandı.


sound(module_edilmis_2, frekans);
pause(8);

% "sound(module_edilmis_2, frekans)" komutu, örnekleme değerleri "module_edilmis_2"
% değişkeninde tutulan ve örnekleme frekansı "frekans" değişkeninde tutulan sesin
% dinlenmesini sağladı.
%% 
% *e)* Taşıyıcı sinyal ile modüle edilmiş sinyal için zamana bağlı ve frekans 
% spektrum grafiğini çizdiriniz. Ne fark ettiniz? 𝑓𝑐 = 10𝑀𝐻𝑧

figure();
plot(yankili_zaman, module_edilmis_2);
xlabel("Zaman (s)");
ylabel("Ses Sinyali");
title("Modüle edilmiş ses sinyalinin zamana bağlı grafiği");


module_edilmis_2_fft = fft(module_edilmis_2);

% İçine parametre olarak girilen değişkenin ayrık fourier dönüşümünü alan "fft()"
% fonksiyonu kullanılarak, "fft(module_edilmis_2)" komutu ile modüle edilmiş gitar sesinin
% örnekleme değerlerini içeren "module_edilmis_2" değişkeninin fourirer dönüşümü
% alınıp "module_edilmis_2_fft" değişkenine atandı.


figure();
plot(yankili_frekans_bilesenleri, abs(module_edilmis_2_fft));
xlabel("Frekans (Hz)");
ylabel("Genlik");
title("Modüle Edilmiş Gitar Sesinin Frekans Spektrumu");
%% 
% *f)* Bu sinyali de tekrardan cos (2𝜋𝑓𝑐 𝑡) sinyali ile çarpıp Frekans spektrumunu 
% inceleyiniz. Ardından alçak geçirgen filtreye sokup demodüle ediniz. Frekans 
% spektrumunu inceleyiniz 𝑓𝑐 = 10𝑀𝐻𝑧

module_edilmis_3 = module_edilmis_2 .* cos(2 * pi * 10000000 * yankili_zaman)';

% "cos(2 * pi * 10000000 * zaman)" ifadesi ile belirtilen sinyal 10 MHz frekans
% için oluşturulmuş oldu. Ancak bu sinyal 1xn boyutunda olduğundan nx1
% boyutunda bir vektör elde etmek için bu sinyal üzerinde transpoz alma işlemi
% uygulandı. Bu sinyal "module_edilmis_2" değişkeni ile çarpılırken elemanları bire
% bir çarpmak için ".*" operatörü kullanıldı. Sonuçta oluşan yeni sinyal
% "module_edilmis_3" değişkenine atandı.


module_edilmis_3_fft = fft(module_edilmis_3);

% İçine parametre olarak girilen değişkenin ayrık fourier dönüşümünü alan "fft()"
% fonksiyonu kullanılarak, "fft(module_edilmis_3)" komutu ile modüle edilmiş gitar sesinin
% örnekleme değerlerini içeren "module_edilmis_3" değişkeninin fourirer dönüşümü
% alınıp "module_edilmis_3_fft" değişkenine atandı.


figure();
plot(yankili_frekans_bilesenleri, abs(module_edilmis_3_fft));
xlabel("Frekans (Hz)");
ylabel("Genlik");
title("Tekrar Modüle Edilmiş Gitar Sesinin Frekans Spektrumu");


[pay1, payda1] = butter(5, 10000 / (frekans / 2), "low");
filtreli_ses = filter(pay1, payda1, module_edilmis_3);

% "butter(5, 10000 / (frekans / 2), "low")" komutu ile; filtre derecesi,
% kesim frekansı ve filtre tipini parametre olarak alan "butter()"
% fonksiyonu ile 10000000 Hz frekaans ile modüle edilmiş sinyal,
% Butterworth alçak geçirgen filtre ile filtrelenmiş oldu ve sonuç
% "filtreli_ses" değişkenine atandı.


filtreli_ses_fft = fft(filtreli_ses);

% İçine parametre olarak girilen değişkenin ayrık fourier dönüşümünü alan "fft()"
% fonksiyonu kullanılarak, "fft(filtreli_ses)" komutu ile modüle edilmiş gitar sesinin
% örnekleme değerlerini içeren "filtreli_ses" değişkeninin fourirer dönüşümü
% alınıp "filtreli_ses_fft" değişkenine atandı.


figure();
plot(yankili_frekans_bilesenleri, abs(filtreli_ses_fft));
xlabel("Frekans (Hz)");
ylabel("Genlik");
title("Alçak Geçirgen Filtreyle Demodüle Edilmiş Gitar Sesinin Frekans Spektrumu");
%% 
% *g)* Bu sinyale rastgele bir gürültü ekleyiniz. Mesela White Gaussian Noise 
% olabilir. Gürültülü sesi dinleyiniz. Sesteki gürültünün kulakla duyulur seviyede 
% olduğundan emin olunuz. Frekans spektrumunu çizdiriniz. 

gurultulu_ses = awgn(filtreli_ses, 25, 1);

% "awgn(filtreli_ses, 25, 1)" komutu ile bir sinyali üzerine doğrudan, girilen
% parametrelere bağlı olaraak gürültü eklenmesini sağlayan "awgn()"
% fonksiyonu kullanıldı. Burada "filtreli_ses" üzerine, bu ses sinyaalinin
% dB cinsinden 0.04 katı kadar güçte olan gürültü eklendi.


sound(gurultulu_ses, frekans);
pause(8);

% "sound(gurultulu_ses, frekans)" komutu ile, örnekleme değerleri "gurultulu_ses"
% değişkeninde tutulan ve örnekleme frekansı "frekans" değişkeninde tutulan sesin
% dinlenmesi sağlandı.


figure();
plot(yankili_zaman, gurultulu_ses);
xlabel("Zaman (s)");
ylabel("Ses Sinyali");
title("Gürültülü ses sinyalinin zamana bağlı grafiği");


gurultulu_ses_fft = fft(gurultulu_ses);

% İçine parametre olarak girilen değişkenin ayrık fourier dönüşümünü alan "fft()"
% fonksiyonu kullanılarak, "fft(gurultulu_ses)" komutu ile modüle edilmiş gitar sesinin
% örnekleme değerlerini içeren "gurultulu_ses" değişkeninin fourirer dönüşümü
% alınıp "gurultulu_ses_fft" değişkenine atandı.


figure();
plot(yankili_frekans_bilesenleri, abs(gurultulu_ses_fft));
xlabel("Frekans (Hz)");
ylabel("Genlik");
title("Gürültülü Gitar Sesinin Frekans Spektrumu");
%% 
% *h)* Bu gürültüyü filtreleyiniz. Filtreledikten sonra ekolu ses ile aynı spektrumu 
% elde edip etmediğinizi karşılaştırınız.

[pay2, payda2] = butter(20, 10000 / (frekans / 2), "low");
filtreli_ses2 = filter(pay2, payda2, gurultulu_ses);

% "butter(5, 10000 / (frekans / 2), "low")" komutu ile; filtre derecesi,
% kesim frekansı ve filtre tipini parametre olarak alan "butter()"
% fonksiyonu ile gürültülü sinyal, Butterworth alçak geçirgen filtre ile
% filtrelenmiş oldu ve sonuç "filtreli_ses2" değişkenine atandı.


filtreli_ses2_fft = fft(filtreli_ses2);

% İçine parametre olarak girilen değişkenin ayrık fourier dönüşümünü alan "fft()"
% fonksiyonu kullanılarak, "fft(filtreli_ses2)" komutu ile modüle edilmiş gitar sesinin
% örnekleme değerlerini içeren "filtreli_ses2" değişkeninin fourirer dönüşümü
% alınıp "filtreli_ses2_fft" değişkenine atandı.


figure();
subplot(1, 2, 1);
plot(yankili_frekans_bilesenleri, abs(filtreli_ses2_fft));
xlabel("Frekans (Hz)");
ylabel("Genlik");
title("Filtreli Gitar Sesinin Frekans Spektrumu");

subplot(1, 2, 2);
plot(yankili_frekans_bilesenleri, abs(yankili_gitar_ses_fft));
xlabel("Frekans (Hz)");
ylabel("Genlik");
title("Yankılı Gitar Sesinin Frekans Spektrumu");

sgtitle("Yankılı gitar sesi ile filtreli gitar sesinin frekans spektrumu karşılaştırması");
%% 
% *i)* c şıkkındaki dürtü tepkisini kullanarak orijinal sinyali geri bulunuz. 
% Bu sesi kaydediniz ve dinleyiniz. Frekans spektrumunu çizdiriniz. İlk ses ile 
% aynı mı?