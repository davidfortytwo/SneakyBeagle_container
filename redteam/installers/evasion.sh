#!/bin/bash

WORKDIR="/root/RedTeamToolkit/evasion"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing evasion tools"
python3 -m venv env
source env/bin/activate
cd $WORKDIR
git clone $GITHUB/hfiref0x/UACME.git
cd $WORKDIR
git clone $GITHUB/0xsp-SRD/mortar.git
cd $WORKDIR
#git clone $GITHUB/oddcod3/Phantom-Evasion.git && cd Phantom-Evasion && chmod +x phantom-evasion.py && python3 phantom-evasion.py --setup
#cd $WORKDIR
git clone $GITHUB/Mr-Un1k0d3r/DKMC && cd DKMC && mkdir output
cd $WORKDIR
rm evasion.sh
echo "Done"