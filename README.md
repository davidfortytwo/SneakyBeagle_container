# SneakyBeagle container

Simple docker compose file and Dockerfiles to build a kali container, a Nessus container, a container with a complete toolkit for Red Team operations, and a container with Infection Monkey for continuous pentesting, and attack simulations. Made to simplify deployments during pentests, vulnerability scans and Red Team Campaigns.

Exposes ports 2222,5000 and 8834 on the hosting machine. Port 2222 is used to SSH into the kali container and port 8834 is used to expose Nessus. Infection Monkey exposes port 5000. Settings can be changed in the environment file, see [Step 1](#step-1).

# Create containers:

## Step 1:

Copy "env" to ".env".

```
cp env .env
```

Enter (in .env) the Nessus activation code, a username and a password, and a password to ssh into the kali machine.

You can also change the default port for Infection Monkey.

As in the following example:

```
 Nessus
ACTIVATION_CODE=AAAA-BBBB-CCCC-DDDD
USERNAME=admin
PASSWORD=awesomepassword
NESSUSHOSTPORT=8834

# SSH
SSHPASSWORD=anotherawesomepassword
SSHHOSTPORT=2222
```

Optionally, you can also configure the ports that the hosting machine will expose for the services.

### [Optional] Step 1.2:

A number of optional tools can be installed in the Kali container. This is disabled by default to speed up the build, but can be enabled by uncommenting the following lines in the [Kali Dockerfile](kali/Dockerfile):

```
## UNCOMMENT TO INSTALL OPTIONAL
#COPY files/install_optional.sh /root/install_optional.sh
#RUN chmod +x /root/install_optional.sh && /root/install_optional.sh && rm /root/install_optional.sh
```

The default tools can be found [here](#kali) and the optional tools can be found [here](#optional)

## Step 2:

```
docker-compose build [service]
```

This will parse the docker-compose.yml file and start building the images accordingly. You can either build all services by running:

```
docker-compose build
```

Or build a specific service, like for example only Nessus, by running

```
docker-compose build nessus
```

Instead of building them, you can also download prebuilt images for kali and redteam (step 3 can be ignored in this case):

```
docker pull dvd42/sneakykali

docker pull dvd42/sneakyredteam

```

and run them with

```
docker run -it dvd42/sneakykali

docker run -it dvd42/sneakyredteam
```

## Step 3:

Depending on what service(s) you want to run, the following commands can be used:

```
docker-compose up -d
```

```
docker-compose up -d nessus
```

```
docker-compose up -d kali
```

```
docker-compose up -d redteam
```

The Infection Monkey container is executed by an independent script, located under infectionmonkey/ directory, that downloads required files and executes them.

```
sudo infection_docker.sh
```

# Stop containers

To stop the containers, run:

```
docker-compose stop
```

# Remove containers

To remove the containers, once stopped, run:

```
docker-compose rm
```

# Installed tools

## Kali

- curl
- netcat-traditional
- nmap
- gobuster
- python3
- python3-pip
- iproute2
- dnsutils
- iputils-ping
- emacs-nox
- sqlmap
- whois
- nikto
- wget
- ssh
- net-tools
- git
- nfs-common
- tcpdump
- seclists
- kali intel suite

## Optional

- man-db
- w3m
- exploitdb
- smbclient
- dsniff
- testssl.sh
- commix
- hydra
- vim
- golang-go
- mydumper
- PayloadsAllTheThings
- kali-whoami

# Red Team

Split into categories, each script installs a defined toolkit for all red team phases and attack vectors.
With sometools.sh script you can add some more tools or keep the installed ones updated.
Full container with all dependencies and tools is around 42GB. Recommended to execute individual scripts for each category to use. With enough space available, you can do a full install
with only one script.

* Active Directory

  * ADEnum
  * Bloodhound
  * ADalanche
  * LDAPdomaindump
  * Icebreaker
  * Kerberoast
  * Kerbrute

* Anon

  * TOR
  * TORsocks
  * ProxyChains
  * OpenVPN
  * Wireguard
  * TorGhost

* Evasion

  * UACME
  * mortar
  * DKMC
  
* Exfiltration

  * Mistica
  * DNSExfiltration
  * Egress-assess
  * Data Exfiltration Toolkit
  * Powershell-RAT
  * PyExfil

* Exploitation

  * impacket
  * BEEF
  * bettercap
  * Metasploit Framework
  * CVE-2021-44228 PoC log4j bypass words
  * Log4Shell RCE Exploit

* Mobile

  * Mobile Security Framework
  * Nuclei Mobile templates
  * Frida
  * Frida scripts
  * Fida iOS dump
  * Fridump
  * Scrounger
  * APKleaks
  * Drozer
  * APKtool
  * APKX
  * dex2jar
  * enjarify
  * jadx
  * jd-gui
  * qark

* OSINT / Recon

  * TIDoS Framework
  * terra
  * Phoneinfoga
  * Buster
  * pwnedOrNot
  * nmap
  * theHarvester
  * metagoofil
  * recon-ng
  * skiptracer
  * Just-Metadata
  * spiderfoot
  * FinalRecon
  * nmap Automator
  * OsintGram
  * Social Mapper
  * CrossLinked
  * ADRecon
  * Email Harvester
  * tinfoleak

* Phishing

  * Social Engineer Toolkit
  * Phishing Pretexts
  * Phishery
  * ZPhisher
  * King Phiser
  * Evilginx2
  * evil-ssdp
  * FiercePhish
  * GoPhish
  * ReelPhish
  * CredSniper

* PostExploitation

  * Empire Framework 4
  * Starkiller
  * StarFighters
  * Pupy
  * gcat
  * Merlin
  * weevely
  * Powersploit

* Privilege Escalation

  * BeRoot
  * LinEnum
  * Linux Exploit Suggester
  * linuxprivchecker
  * Linux Smart Enumeration
  * JAWS
  * Windows Exploit Suggester NG
  * WindowsEnum
  * Log4j CVE-2021-45046
  * Responder
  * Windows Kernel Exploits
  * CVE-2021-4034

* Vulnerability Scan

  * CVE-2021-44228 Scanner
  * Log4J CVE Detect
  * espoofer
  * Domain Security Scanner
  * dkimsc4n
  * testssl.sh
  * Nuclei
  * Vulmap

* Weaponization

  * jok3r Framework
  * CVE-2018-20250
  * CVE-2017-8759
  * CVE-2017-0199
  * CVE-2017-8570
  * demiguise
  * Malicious Macro Generator
  * Office DDE Payloads
  * DZGEN
  * EmbedinHTML
  * Macro Pack
  * DInjector
  * Unicorn
  * The Backdoor Factory
  * Generate Macro
  * MaliciousMacroMSBuild
  * wePWNise
  * trojanizer
  * Macro Shop
  * EvilClippy
  * donut
  * Evilgrade

# Infection Monkey

Refer to [documentation](https://www.guardicore.com/infectionmonkey/docs/) for further information.
