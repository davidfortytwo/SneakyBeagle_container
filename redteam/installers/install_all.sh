#!/bin/bash
echo "Installing all Red Team tools..."
./activedirectory.sh
./anon.sh
./evasion.sh
./exfiltration.sh
./exploitation.sh
./mobile.sh
./osint.sh
./phishing.sh
./postexploitation.sh
./privilege_escalation.sh
./vulnscan.sh
./weaponization.sh
rm *.sh
apt autoremove -y
echo "Done!"