#!/bin/bash

if [[ "$(whoami)" != root ]]; then
	exec sudo -- "$0" "$@"
fi

clear

cat << EOF
#############################################
# Oracle Java 8 Kurulumu ve Ayarlaması      #
# Pardus 19 Sürümleri için hazırlanmıştır.  #
# Hazırlayan: Yahya YILDIRIM                #
# http://github.com/yahyayildirim           #
#############################################
EOF

echo "Oracle Java 8 indiriliyor."
sudo apt install oracle-java8-jdk 

echo "JAVA_HOME ayarlanıyor..."
export JAVA_HOME="/usr/lib/jvm/oracle-java8-jdk-amd64"


set java jar javaws
for A;
do
	echo
	echo "$A için eski yapılandırma ayarları siliniyor..."; sleep 1
	sudo update-alternatives --remove-all "$A"
	echo "$A için yeni yapılandırma ayarları tanımlanıyor..."; sleep 2
	sudo update-alternatives --install "/usr/bin/$A" "$A" "/usr/lib/jvm/oracle-java8-jdk-amd64/bin/$A" 318
	echo
done

echo "Java 8 Web Start için Uygulamalar Menüsüne Kısayol oluşturuluyor..."

tee > /usr/share/applications/javaws.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Name=Java 8 Web Start
Comment=Java 8 Web Start
Exec=/usr/lib/jvm/oracle-java8-jdk-amd64/bin/javaws %u
Terminal=false
Type=Application
Icon=javaws
Categories=Application;Network;
MimeType=application/x-java-jnlp-file;
EOF
chmod +xr /usr/share/applications/javaws.desktop

echo "Java Ayarları için Uygulamalar Menüsüne Kısayol oluşturuluyor..."
tee > /usr/share/applications/javawsviewer.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Name=Java Ayarları
Comment=Java Ayarları
Exec=javaws -viewer
Terminal=false
Type=Application
Icon=javaws
Categories=Application;Network;
EOF
chmod +xr /usr/share/applications/javawsviewer.desktop

echo -e "\nDeğerli Hocam;"
echo -e "Uygulamalar menüsünden Java Ayarlarını açın ve aşağıdaki değişiklikleri yapın.\n"; sleep 2
echo -e "1) Network Setting'e tıkla, en altta Direct connection aktif et, sonra OK ile kapat.\n"; sleep 2
echo -e "2) Settings'e tıkla, en üstteki tiki kaldır. Sonra Delete Files'e tıkla hepsini işaretle ve OK ve tekrar Ok ile kapat.\n";sleep 2
echo "3) Mavi renkli olan See the Security Tab'a tıkla, eğer https://kesenek.sgk.gov.tr/ ekli değil ise,"
echo "   Edit Site List'e tıkla Add tıkla ve https://kesenek.sgk.gov.tr/ ekle ve sırasıyla OK -- Apply -- OK ile ekranı kapat.\n";sleep 2
echo -e "\n4) Firefox ve Google Chrome'den kesenek sitesine gir, herhangi birisine tıkla açılan ekranda kaydet veya sakla diyerek kaydedin."
echo "   Sonra indirdiğiniz dosyanın üzerinde sağ tıklayıp özellikler diyin ve Birlikte Aç menüsünden Java 8 Web Start bulup işaretleyin"
echo "   ve Öntanımlı Olarak Ayarlaya tıklayın ve ekranı kapatın.";sleep 2
echo -e "\n5) Artık ilgili dosyanın üzerine çift tıklayarak sorunsuz bir şekilde .jnlp dosyalarını açabilirsiniz...\n";
