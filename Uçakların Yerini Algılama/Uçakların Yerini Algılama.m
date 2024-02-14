r1= imread("ucak1.jpg");
r2=imread("ucak2.jpg");

figure,imshow(r1);
figure,imshow(r2);

fark=imsubtract(r1,r2);
figure,imshow(fark)

imgFark=imbinarize(fark,20/255);
figure,imshow(imgFark)

imgFark2=fark>20;
figure,imshow(imgFark2);

imgFark =bwareaopen(imgFark2,30);
figure,imshow(imgFark)

se=strel('square',4);
imgDilate=imdilate(imgFark,se);
figure,imshow(imgDilate)

[etiketler, ucakSayisi]=bwlabel(imgDilate);
ucakOzellikleri=regionprops(etiketler,'all');

merkezler=[ucakOzellikleri.Centroid];

figure,imshow(r1);

x = merkezler(1:2:end);
y = merkezler(2:2:end);

hold on
plot(x,y, 'yo', 'MarkerSize',35,'LineWidth',4);




