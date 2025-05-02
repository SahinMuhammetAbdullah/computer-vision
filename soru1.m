% Paket
pkg load image

% Boyutlar
n = 512;
[x, y] = meshgrid(linspace(-pi, pi, n), linspace(-pi, pi, n));

R = sin(5*x) + cos(5*y);
G = x.^2 - y.^2;
B = sin(sqrt(x.^2 + y.^2));

% Normalize işlemi (0-1 arası)
R_norm = (R - min(R(:))) / (max(R(:)) - min(R(:)));
G_norm = (G - min(G(:))) / (max(G(:)) - min(G(:)));
B_norm = (B - min(B(:))) / (max(B(:)) - min(B(:)));

% RGB birleşik görüntü
RGB = cat(3, R_norm, G_norm, B_norm);

% RGB resmi göster
figure;
imshow(RGB);
title('RGB Birleşik Görüntü');

% Her kanalın sadece kendi renginde gösterilmesi
R_img = cat(3, R_norm, zeros(size(R_norm)), zeros(size(R_norm)));
G_img = cat(3, zeros(size(G_norm)), G_norm, zeros(size(G_norm)));
B_img = cat(3, zeros(size(B_norm)), zeros(size(B_norm)), B_norm);

figure;

subplot(1,3,1);
imshow(R_img);
title('R Kanalı - Kırmızı');

subplot(1,3,2);
imshow(G_img);
title('G Kanalı - Yeşil');

subplot(1,3,3);
imshow(B_img);
title('B Kanalı - Mavi');

% Fonksiyonların 3D mesh gösterimi, kendi renklerinde!
figure;

subplot(1,3,1);
mesh(x, y, R, 'EdgeColor', 'r');   % Kırmızı çizim
title('R Kanalı Fonksiyonu (Kırmızı)');

subplot(1,3,2);
mesh(x, y, G, 'EdgeColor', 'g');   % Yeşil çizim
title('G Kanalı Fonksiyonu (Yeşil)');

subplot(1,3,3);
mesh(x, y, B, 'EdgeColor', 'b');   % Mavi çizim
title('B Kanalı Fonksiyonu (Mavi)');

