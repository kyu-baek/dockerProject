# ssh 연결하기
# port forwarding
# virtualbox -> settings -> Network(picture) -> Advanced ->
# Port Forwarding -> Host IP mac ip(ifconfing 참조) Host Port 2222
#                 -> Guest IP virtualbox(10.0.2.15고정) Guest Port 22
#                 -> OK
# visual Studio code를 킴 -> Extensions Remote - ssh다운로드
# cmd + shift + p -> remote ssh - open ssh configuration host
#Host hena42@10.12.9.5:2222
#    HostName 10.12.9.5
#    User hena42
# cmd + shift + p -> connection to host 클릭

# su -
apt-get update
apt-get install -y sudo
sudo apt-get install -y apt-transport-https
sudo apt-get install -y ca-certificates
sudo apt-get install -y curl
sudo apt-get install -y software-properties-common
sudo apt-get install -y git
sudo apt-get install -y make
sudo apt-get install -y vim
sudo apt-get install -y systemd

# docker 설치
sudo apt-get update
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker.io
sudo chmod 666 /var/run/docker.sock
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo su -c 'printf "{\n\t\"live-restore\": true\n}" > /etc/docker/docker.json'
sudo systemctl restart docker

# google clome 다운로드
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y