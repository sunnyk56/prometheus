#!/bin/zsh
echo "-----------Installing_dependencies---------------"
apt-get install --no-install-recommends -yq software-properties-common \
    curl \
    git \
    tar \
    make

echo "--------------install_golang---------------------------"
curl https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz --output go.tar.gz
tar -C $HOME -xzf go.tar.gz
PATH="$HOME/go/bin:$PATH"
GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

echo "--------------install_node and npm---------------------------"
curl -sL https://deb.nodesource.com/setup_16.x  | bash -
apt-get -y install nodejs

echo "--------------get clone_prometheus repo ---------------------------"
PROMETHEUS_DIR=$GOPATH/src/github.com/prometheus
git clone https://github.com/sunnyk56/prometheus.git $PROMETHEUS_DIR
cd $PROMETHEUS_DIR
make build
cp prometheus $GOPATH/bin/prometheus

# ./prometheus --config.file="deploy/config/config.yml"


echo "export PATH=$PATH" >> ~/.bashrc