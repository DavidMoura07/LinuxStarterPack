#!/bin/bash

echo 'HORARIO DE INICIO'
timedatectl

#Pegar as informações de usuário
read -p 'DIGITE O NOME DE USUÁRIO PARA A CONFIGURAÇÃO: ' usuario
#####################################################################
# update do apt
yes | apt-get update

#####################################################################
# upgrade do sistema
yes | apt-get upgrade

#####################################################################
# Pacotes básicos
apt-get install build-essential xz-utils curl apt-utils git wget postgresql-client guake mongodb-clients sqlite3 umbrello net-tools unzip steam mysql-workbench -y

#####################################################################
# Google Chrome
yes | sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
apt-get update
apt-get install google-chrome-stable

#####################################################################
# Kernel headers
yes | apt-get install linux-headers-$(uname -r)

#####################################################################
# instalação do Nodejs e NPM
mkdir /usr/local/bin/node
cd /usr/local/bin/node
curl https://nodejs.org/dist/v10.15.0/node-v10.15.0-linux-x64.tar.xz --output node.tar.xz
tar -Jxxvf node.tar.xz
rm node.tar.xz
cp node-v10.15.0-linux-x64/* . -R
chown $USER * -R
echo 'export PATH="$PATH:/usr/local/bin/node/bin"' >> /home/$USER/.profile
export PATH="$PATH:/usr/local/bin/node/bin"
npm install -g npm

#####################################################################
# Nestjs Framework
npm i -g @nestjs/cli typescript

#####################################################################
# Docker
cd /$USER/Downloads
curl get.docker.com -Lo - | sh
usermod -aG docker $USER
curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#####################################################################
#VSCode
curl https://az764295.vo.msecnd.net/stable/61122f88f0bf01e2ac16bdb9e1bc4571755f5bd8/code_1.30.2-1546901646_amd64.deb --output vscode.deb
dpkg -i vscode.deb

#####################################################################
#Postman
cd /usr/share
curl https://dl.pstmn.io/download/latest/linux64 --output postman.tar.gz
tar -zxvf postman.tar.gz
rm postman.tar.gz
chmod +x Postman/Postman
chown $USER Postman -R
echo 'export PATH="$PATH:/usr/share/Postman"' >> /home/$USER/.profile

# Gerando o ícone do Postman
touch /usr/share/applications/Postman.desktop
echo "[Desktop Entry]" >> /usr/share/applications/Postman.desktop
echo "Type=Application" >> /usr/share/applications/Postman.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/Postman.desktop
echo "Name=Postman" >> /usr/share/applications/Postman.desktop
echo "Comment=Postman" >> /usr/share/applications/Postman.desktop
echo "Exec=/usr/share/Postman/Postman" >> /usr/share/applications/Postman.desktop
echo "Icon=/usr/share/Postman/app/resources/app/assets/icon.png" >> /usr/share/applications/Postman.desktop
echo "Terminal=false" >> /usr/share/applications/Postman.desktop
echo "Type=Application" >> /usr/share/applications/Postman.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/Postman.desktop
echo "StartupNotify=true" >> /usr/share/applications/Postman.desktop

#####################################################################
#DBeaver
# yes | echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
# wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
# apt-get update
apt-get install dbeaver-ce -y

#####################################################################
# Eclipse
cd /usr/share
curl http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2018-12/R/eclipse-jee-2018-12-R-linux-gtk-x86_64.tar.gz --output eclipse.tar.gz
tar -zxvf eclipse.tar.gz
rm eclipse.tar.gz
chmod +x eclipse/eclipse
chown $USER eclipse -R
echo 'export PATH="$PATH:/usr/share/eclipse"' >> /home/$USER/.profile
# Gerando o ícone do Eclipse
touch /usr/share/applications/Eclipse.desktop
echo "[Desktop Entry]" >> /usr/share/applications/Eclipse.desktop
echo "Type=Application" >> /usr/share/applications/Eclipse.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/Eclipse.desktop
echo "Name=Eclipse" >> /usr/share/applications/Eclipse.desktop
echo "Comment=Eclipse" >> /usr/share/applications/Eclipse.desktop
echo "Exec=/usr/share/eclipse/eclipse" >> /usr/share/applications/Eclipse.desktop
echo "Icon=/usr/share/eclipse/icon.xpm" >> /usr/share/applications/Eclipse.desktop
echo "Terminal=false" >> /usr/share/applications/Eclipse.desktop
echo "Type=Application" >> /usr/share/applications/Eclipse.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/Eclipse.desktop
echo "StartupNotify=true" >> /usr/share/applications/Eclipse.desktop

#####################################################################
# sonar-scanner
cd /usr/share
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip
unzip sonar-scanner-cli-3.3.0.1492-linux.zip
rm sonar-scanner-cli-3.3.0.1492-linux.zip
chmod +x sonar-scanner-3.3.0.1492-linux/bin/sonar-scanner
chown $USER sonar-scanner-3.3.0.1492-linux -R
echo 'export PATH="$PATH:/usr/share/sonar-scanner-3.3.0.1492-linux/bin"' >> /home/$USER/.profile

#####################################################################
# robo 3t
cd /usr/share
wget https://download.robomongo.org/1.2.1/linux/robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz
tar -zxvf robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz
rm robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz
chown $USER robo3t-1.2.1-linux-x86_64-3e50a65/ -R
cd robo3t-1.2.1-linux-x86_64-3e50a65/
chmod +x bin/robo3t
chown $USER sonar-scanner-3.3.0.1492-linux -R
echo 'export PATH="$PATH:/usr/share/robo3t-1.2.1-linux-x86_64-3e50a65/bin"' >> /home/$USER/.profile

# Gerando o ícone do robo3t
touch /usr/share/applications/Robo3t.desktop
echo "[Desktop Entry]" >> /usr/share/applications/Robo3t.desktop
echo "Type=Application" >> /usr/share/applications/Robo3t.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/Robo3t.desktop
echo "Name=Robo3t" >> /usr/share/applications/Robo3t.desktop
echo "Comment=Robo3t" >> /usr/share/applications/Robo3t.desktop
echo "Exec=/usr/share/robo3t-1.2.1-linux-x86_64-3e50a65/bin/robo3t" >> /usr/share/applications/Robo3t.desktop
echo "Terminal=false" >> /usr/share/applications/Robo3t.desktop
echo "Type=Application" >> /usr/share/applications/Robo3t.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/Robo3t.desktop
echo "StartupNotify=true" >> /usr/share/applications/Robo3t.desktop
#####################################################################

# DotNet Core 2.1 SDK
cd /home/$USER/Downloads
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
yes | add-apt-repository universe
yes | apt-get install apt-transport-https
yes | apt-get update
yes | apt-get install dotnet-sdk-2.1

#####################################################################
# Heroku CLI
curl https://cli-assets.heroku.com/install.sh | sh

#####################################################################
# Android Studio
cd /usr/share
wget https://dl.google.com/dl/android/studio/ide-zips/3.2.1.0/android-studio-ide-181.5056338-linux.zip
unzip android-studio-ide-181.5056338-linux.zip
rm android-studio-ide-181.5056338-linux.zip
cd android-studio
chmod +x bin/* -R 
echo 'export PATH="$PATH:/usr/share/android-studio/bin"' >> /home/$USER/.profile
chown $USER /usr/share/android-studio -R
touch /usr/share/applications/AndroidStudio.desktop
echo "[Desktop Entry]" >> /usr/share/applications/AndroidStudio.desktop
echo "Type=Application" >> /usr/share/applications/AndroidStudio.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/AndroidStudio.desktop
echo "Name=Android Studio" >> /usr/share/applications/AndroidStudio.desktop
echo "Comment=Android Studio" >> /usr/share/applications/AndroidStudio.desktop
echo "Exec=/usr/share/android-studio/bin/studio.sh" >> /usr/share/applications/AndroidStudio.desktop
echo "Path=/usr/share/android-studio/bin" >> /usr/share/applications/AndroidStudio.desktop
echo "Icon=/usr/share/android-studio/bin/studio.png" >> /usr/share/applications/AndroidStudio.desktop
echo "Terminal=false" >> /usr/share/applications/AndroidStudio.desktop
echo "Type=Application" >> /usr/share/applications/AndroidStudio.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/AndroidStudio.desktop
echo "StartupNotify=true" >> /usr/share/applications/AndroidStudio.desktop

#####################################################################
echo 'HORARIO SEMI-FINAL'
timedatectl

# Os próximos pacotes necessitam de confirmação do usuário durante a execução e foram deixados por último
#####################################################################
# VirtualBox
apt-get install virtualbox virtualbox-qt virtualbox-ext-pack virtualbox-guest-additions-iso virtualbox-guest-utils -y

#####################################################################
# instalação do Oracle Java 8
yes | apt-get purge openjdk*
add-apt-repository ppa:webupd8team/java -y
yes | apt-get update
apt-get install oracle-java8-installer -y
apt-get install maven ant gradle -y

#####################################################################
# instalação do PDI
cd /usr
wget https://ufpr.dl.sourceforge.net/project/pentaho/Pentaho%208.2/client-tools/pdi-ce-8.2.0.0-342.zip
unzip pdi-ce-8.2.0.0-342.zip
rm pdi-ce-8.2.0.0-342.zip
chown $USER /usr/data-integration -R
chmod +x /usr/data-integration/spoon.sh

# Gerando o ícone do PDI
touch /usr/share/applications/pdi.desktop
echo "[Desktop Entry]" >> /usr/share/applications/pdi.desktop
echo "Type=Application" >> /usr/share/applications/pdi.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/pdi.desktop
echo "Name=Pentaho Data Integration" >> /usr/share/applications/pdi.desktop
echo "Comment=PDI" >> /usr/share/applications/pdi.desktop
echo "Exec=/usr/data-integration/spoon.sh" >> /usr/share/applications/pdi.desktop
echo "Icon=/usr/data-integration/spoon.ico" >> /usr/share/applications/pdi.desktop
echo "Terminal=false" >> /usr/share/applications/pdi.desktop
echo "Type=Application" >> /usr/share/applications/pdi.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/pdi.desktop
echo "StartupNotify=true" >> /usr/share/applications/pdi.desktop

#####################################################################
# logstash
cd /usr/share/
wget https://artifacts.elastic.co/downloads/logstash/logstash-6.6.1.tar.gz
tar -zxvf logstash-6.6.1.tar.gz
rm logstash-6.6.1.tar.gz
mv logstash-6.6.1/ logstash
chmod +x logstash/bin/ -R
chown $USER logstash -R
echo 'export PATH="$PATH:/usr/share/logstash/bin"' >> /home/$USER/.profile
source /home/$USER/.profile
mkdir logstash/activemq
curl http://central.maven.org/maven2/org/apache/activemq/activemq-all/5.15.8/activemq-all-5.15.8.jar -o /usr/share/logstash/activemq/activemq-all-5.15.8.jar
logstash-plugin install logstash-output-jdbc
logstash-plugin install logstash-filter-json_encode
logstash-plugin install logstash-output-mongodb
logstash-plugin install logstash-input-jms
wget https://github.com/Microsoft/mssql-jdbc/releases/download/v7.0.0/mssql-jdbc-7.0.0.jre8.jar -o /usr/share/logstash/mssql-jdbc-7.0.0.jre8.jar

#####################################################################
# updates
apt-get update -y
apt-get upgrade -y
#####################################################################
# 


echo 'HORARIO FINAL'
timedatectl
