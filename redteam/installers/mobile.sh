#!/bin/bash

WORKDIR="/root/RedTeamToolkit/mobile"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing mobile tools"
python3 -m venv env
source env/bin/activate
pip3 install colorama prompt-toolkit pygments frida frida-tools
apt update && apt install -y gradlew
cd $WORKDIR
git clone $GITHUB/MobSF/Mobile-Security-Framework-MobSF.git
cd $WORKDIR
git clone $GITHUB/mobile-nuclei-templates
cd $WORKDIR
git clone $GITHUB/nettitude/scrounger.git && cd scrounger && pip install -r requirements.txt && python setup.py install
cd $WORKDIR
git clone git@github.com:dstotijn/hetty.git && cd hetty && make build
cd $WORKDIR
# git clone https://github.com/frida/frida.git && cd frida && make
git clone $GITHUB/Nightbringer21/fridump.git
cd $WORKDIR
git clone $GITHUB/0xdea/frida-scripts.git
git clone $GITHUB/AloneMonkey/frida-ios-dump.git
cd $WORKDIR
git clone $GITHUB/dwisiswant0/apkleaks && cd apkleaks && pip3 install -r requirements.txt
cd $WORKDIR
git clone $GITHUB/FSecureLABS/drozer.git && cd drozer && make deb
cd $WORKDIR
git clone $GITHUB/iBotPeaches/Apktool.git && cd Apktool && ./gradlew build shadowJar
cd $WORKDIR
git clone $GITHUB/b-mueller/apkx && cd apkx && ./install.sh
cd $WORKDIR
git clone $GITHUB/pxb1988/dex2jar.git
git clone $GITHUB/Storyyeller/enjarify.git
git clone $GITHUB/skylot/jadx.git && cd jadx && ./gradlew dist
cd $WORKDIR
git clone $GITHUB/java-decompiler/jd-gui.git && cd jd-gui && ./gradlew build
cd $WORKDIR
git clone $GITHUB/linkedin/qark && cd qark && pip install -r requirements.txt && pip install . --user
cd $WORKDIR
rm mobile.sh
apt autoremove -y
echo "Done"