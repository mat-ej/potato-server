#!/bin/bash

PK="ssh-rsa...."

USERNAME=<username>


sudo useradd -m -s /bin/bash -G docker -d /home/${USERNAME} ${USERNAME}
sudo passwd --delete ${USERNAME}

su - $USERNAME -c "cd"
su - $USERNAME -c "pwd"
su - $USERNAME -c "mkdir .ssh"
su - $USERNAME -c "chmod 700 .ssh"
su - $USERNAME -c "echo $PK > .ssh/authorized_keys"
su - $USERNAME -c "chmod 644 .ssh/authorized_keys"
echo 'check groups'
su - $USERNAME -c "groups"

echo 'check docker'
su - $USERNAME -c "docker run --gpus all --rm -it ubuntu nvidia-smi -L"

echo 'check permissions'
su - $USERNAME -c "ls -la .ssh"

echo 'check authorized keys'
su - $USERNAME -c "cat .ssh/authorized_keys"