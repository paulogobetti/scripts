su

rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;

apt install sudo wget

sudo usermod -aG docker $USER

exit

echo "$(whoami)"

