echo "Updating apt-get"
apt-get update -qq
echo "installing https"
apt-get install -qq apt-transport-https ca-certificates 2>/dev/null
echo "inserting key"
apt-key adv -qq --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-precise main" > /etc/apt/sources.list.d/docker.list
apt-get update -qq
echo "installing latest docker engine "
apt-get purge -qq --force-yes lxc-docker 2>/dev/null

apt-get install -qq --force-yes docker-engine 2>/dev/null

apt-get upgrade -qq --force-yes docker-engine 2>/dev/null

echo "installing curl"
apt-get install -qqy curl

curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` 2>/dev/null > /usr/local/bin/docker-compose
echo "installing docker-compose"
chmod +x /usr/local/bin/docker-compose

echo "cd /vagrant/consul_template" >> /home/vagrant/.bashrc
