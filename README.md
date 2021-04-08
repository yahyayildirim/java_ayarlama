# java_ayarlama
Öncelikle bu scriptleri kişisel kullanım için hazırlıyorum. Bu sebeple; kod bütünlüğü olmayacaktır. Eleştirmekten ziyade tavsiyelere her zaman açık olduğumu belirtmek istiyorum.


Bu script ile /usr/lib/jvm/ altında bulunan tüm dizin/dosyalar silinecek ve oracle-java8-jdk paketi pardus depolarından indirilecek ve yüklenecektir. Eğer yüklü ise --reinstall komutu ile tekrar yüklenecek ve tüm linklemeleri otomatik kendisi yapacaktır. Ayrıca, /usr/share/applications/ dizinine iki adet kısayol oluşturacaktır. Bu sayede Java 8 Web Start ve Java Ayarları uygulama menüsünden erişilebilir olacaktır. Yükleme tamamlandıktan sonra scriptin sonunda yapılması tavsiye edilenleri yapmayı unutmayınız...

# Kurulum
```wget -nc O- https://raw.githubusercontent.com/yahyayildirim/java_ayarlama/main/java_ayarlama.sh```

```chmod +x java_ayarlama.sh```

```./java_ayarlama.sh```
