#!/bin/bash

if [[ "$(whoami)" != root ]]; then
	exec sudo -- "$0" "$@"
fi

clear

cat << EOF
#############################################
# Oracle Java 8 Kurulumu ve Ayarlaması      #
# Pardus 19 Sürümleri için hazırlanmıştır.  #
# http://github.com/yahyayildirim           #
#############################################
EOF

echo "Eski java klasörleri kaldırılıyor..."
rm -rf /usr/lib/jvm/*

dpkg -l icedtea-netx > /dev/null 2>&1
if [ $? == "0" ]; then
    echo "İceTea Java Plugin Kaldırılıyor...."
    apt remove --purge icedtea-netx
fi

echo "Eğer yüklü değilse, Oracle Java 8 indirilecek ve kurulacak..."
dpkg -l profelis-diyanet > /dev/null 2>&1
if [ $? == "0" ]; then
    apt install --reinstall profelis-oracle-java
else
	apt install --reinstall oracle-java8-jdk 
fi


echo -e "\nJava 8 Web Start için uygulamalar menüsünde kısayol oluşturuluyor..."

tee > /usr/share/applications/javaws.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Name=Java 8 Web Start
Comment=Java 8 Web Start
Exec=/usr/lib/jvm/oracle-java8-jdk-amd64/jre/bin/javaws %u
Terminal=false
Type=Application
Icon=javaws
Categories=Application
MimeType=application/x-java-jnlp-file
EOF
chmod +xr /usr/share/applications/javaws.desktop

echo -e "Java Ayarları için uygulamalar menüsünde kısayol oluşturuluyor..."
tee > /usr/share/applications/javawsviewer.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Name=Java Ayarları
Comment=Java Ayarları
Exec=jcontrol
Terminal=false
Type=Application
Icon=javaws
Categories=Application
EOF
chmod +xr /usr/share/applications/javawsviewer.desktop

echo -e "\nDeğerli Hocam; Kurulum tamamlandı, şimdi Uygulamalar menüsünden Java Ayarlarını açın ve aşağıdaki değişiklikleri yapın.\n"
echo -e "1) Network Setting'e tıkla, en altta Direct connection aktif et, sonra OK ile kapat.\n"
echo -e "2) Settings'e tıkla, en üstteki tiki kaldır. Sonra Delete Files'e tıkla hepsini işaretle ve OK ve tekrar Ok ile kapat.\n"
echo "3) Mavi renkli olan See the Security Tab'a tıkla, eğer https://kesenek.sgk.gov.tr/ ekli değil ise,"
echo -e "   Edit Site List'e tıkla Add tıkla ve https://kesenek.sgk.gov.tr/ ekle ve sırasıyla OK -- Apply -- OK ile ekranı kapat.\n"
echo -e "Artık sorunsuz bir şekilde kesenek ve bildirge işlemlerinizi yapabilirsiniz.\n"
echo "Eğer çalışmazsa .jnlp olan dosyayı bilgisayara indirin ve sağ tıklayıp Özellikler -> Birlikte Aç diyerek Java 8 Web Start bularak ön tanımlı hale getirin."
