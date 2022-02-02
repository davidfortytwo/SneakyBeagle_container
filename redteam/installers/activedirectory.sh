#!/bin/bash

WORKDIR="/root/RedTeamToolkit/activedirectory"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing AD tools"
python3 -m venv env
source env/bin/activate
apt-get update && apt upgrade -y && apt-get install -y bloodhound golang-go pipenv
pip3 install ldap3 dnspython future ldapdomaindump kerberoast requests==2.26
cd $WORKDIR
git clone https://github.com/python-ldap/python-ldap.git && cd python-ldap && python setup.py build && python setup.py install
cd $WORKDIR
git clone $GITHUB/SecuProject/ADenum.git && cd ADenum && pip3 install -r requirements.txt
cd $WORKDIR
git clone  $GITHUB/lkarlslund/adalanche.git && cd adalanche && ./build.sh
cd $WORKDIR
git clone $GITHUB/DanMcInerney/icebreaker.git && cd icebreaker && ./setup.sh && pipenv install --three && pipenv shell
cd $WORKDIR
git clone $GITHUB/TarlogicSecurity/kerbrute && cd kerbrute && pip install -r requirements.txt
cd $WORKDIR
git clone https://github.com/CravateRouge/bloodyAD && cd bloodyAD && pip3 install -r requirements.txt
cd /root/RedTeamToolkit/
rm activedirectory.sh
apt-get autoremove -y && apt-get autoclean -y
echo "Done"