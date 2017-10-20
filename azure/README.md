# Cloud development VM

Credits
* https://github.com/khenidak/kubernetes-dev-on-azure

```bash
# Create a resource group to hold your dev environment
az group create -n devbox -l westus2

# Create a VM with attached managed disk
# Note: you can change later via `az vm resize`
az vm create -n devbox -g devbox --public-ip-address-dns-name noel --image UbuntuLTS --data-disk-sizes-gb 1024 --size Standard_D8_v3
```

> [azureprice.net](http://azureprice.net) is a great resource to compare VM SKU's and prices

```js
// TODO: look into managed disk SKUs and caching modes
// TODO: Auto-shutdown rule
```

Connect to the VM via SSH

```bash
# List block devices to find the data disk (likely /dev/sdc)
lsblk

# Format it with ext4
sudo mkfs.ext4 /dev/sdc

# Create a mount point
sudo mkdir /data
sudo chown $USER:$USER /data
chmod +rw /data

# Mount the disk
sudo mount /dev/sdc /data
```

Cool, you've got the disk mounted, but it's going to disappear on reboot. Let's fix that now by updating `/etc/fstab`

```bash
# Find the UUID of the drive
UUID=$(sudo -i blkid | sed -n "s/^\/dev\/sdc: UUID=\"\(\S*\)\".*$/\1/p")

# Add a line to the end of /etc/fstab
sudo echo -e "UUID=$UUID\t/data\text4\tdefaults,nofail,discard\t1\t2" | sudo tee -a /etc/fstab
```

Install Docker

```bash
# Add Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the package index
sudo apt-get update

# Update packages
sudo apt-get upgrade -y

# Install Docker CE and build tools
sudo apt-get install -y docker-ce build-essential

# Add yourself to the docker group, and login to it
sudo usermod -aG docker $USER
newgrp docker

# Test docker with the hello-world container
docker run --rm hello-world
```

Move Docker data directory to the data drive

```bash
# Create a new directory to hold images
mkdir /data/docker

# This will be the new Docker startup command
EXECSTART='/usr/bin/dockerd -H fd:// --graph="/data/docker"'

# Replace the startup params in the config file
sudo sed -i "s|^ExecStart=\(.*\)$|ExecStart=$EXECSTART|" /lib/systemd/system/docker.service

# Restart Docker
sudo systemctl daemon-reload
sudo service docker restart

# See the files on disk
ls /data/docker
```

Install Go

```bash
# Download tarball
# Get latest versions from https://golang.org/dl/
curl -O https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.9.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" | sudo tee --append /etc/profile
source /etc/profile
```

Get Kubernetes

1. Fork [Kubernetes](https://github.com/kubernetes/kubernetes)
2. Clone Kubernetes locally

```bash
user={your github profile name}
git clone https://github.com/$user/kubernetes.git ~/go/src/k8s.io/kubernetes

cd go/src/k8s.io/kubernetes
git remote add upstream https://github.com/kubernetes/kubernetes.git
git remote set-url --push upstream no_push
git remote -v
```

Build Kubernetes (hyperkube) and push to Docker Hub

```bash
# Kubernetes uses Docker + Docker Hub to build
docker login

export REGISTRY={your docker hub username}
export VERSION={your dev image tag}
./hack/dev-push-hyperkube.sh
```

(Install Azure CLI)[https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest#install-on-debianubuntu-with-apt-get]

```bash
# Modify sources
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
  sudo tee /etc/apt/sources.list.d/azure-cli.list

# Install Azure CLI
sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli
```

Maintenance
```bash
# Upgrade all packages
sudo apt-get upgrade
```

Zsh

```bash
# Install Zsh
sudo apt-get install zsh
```

Using Zsh as default
* https://serverfault.com/questions/202468/changing-the-shell-using-chsh-via-the-command-line-in-a-script

Oh My Zsh
```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Others
* tmux config
* Start tmux at interactive login


Accessing
* Use Chrome Secure Shell
  * Pass -A to SSH parameters
  * Custom colors, CSS, and font