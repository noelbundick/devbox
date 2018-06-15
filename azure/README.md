# Cloud development VM

Azure setup

```bash
# Create a resource group to hold your dev environment
az group create -n devbox-ubuntu1804 -l westus2

PUBLICKEY=`cat ~/.ssh/id_rsa.pub`

# Create a VM from the ARM template
az group deployment create -g devbox-ubuntu1804 --template-file devbox-linux.json --parameters dnsName=mydnsname name=devbox1804 sshPublicKey=$PUBLICKEY

# ssh to the VM
ssh mydnsname@westus2.cloudapp.azure.com
```

VM setup

```bash
# Run Ansible playbook from https://github.com/noelbundick/devbox/tree/master/linux
curl https://raw.githubusercontent.com/noelbundick/devbox/master/linux/init.sh | sudo bash

# Set up data disk
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

# Make sure it comes back on reboot
# Find the UUID of the drive
UUID=$(sudo -i blkid | sed -n "s/^\/dev\/sdc: UUID=\"\(\S*\)\".*$/\1/p")

# Add a line to the end of /etc/fstab
sudo echo -e "UUID=$UUID\t/data\text4\tdefaults,nofail,discard\t1\t2" | sudo tee -a /etc/fstab

# Set up common folders
mkdir /data/code
ln -s /data/code ~/code
mkdir /data/temp
ln -s /data/temp ~/temp
```