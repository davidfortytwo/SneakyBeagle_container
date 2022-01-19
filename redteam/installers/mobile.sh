#!/bin/bash

WORKDIR="/root/RedTeamToolkit/mobile"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing mobile tools"
cd $WORKDIR
git clone $GITHUB/MobSF/Mobile-Security-Framework-MobSF.git
cd $WORKDIR
git clone https://github.com/optiv/mobile-nuclei-templates
echo "Done"