# Kickstart file automatically generated by anaconda.

#version=DEVEL
install
url --url=http://mirror.centos.org/centos/6.4/os/x86_64/
lang fr_FR.UTF-8
keyboard fr-latin9
network --onboot yes --device eth0 --bootproto dhcp --noipv6
rootpw  --iscrypted $6$j8O897IeqPTLmdlj$mR/xVgLSndu9QIAe2xUyD.kd6CsxKeVKmlI6T8dYmTP7k01PPSXX3ZqRHL9E5FXsbwRMu9mNZL6ppUOOu99MF0
firewall --service=ssh
authconfig --enableshadow --passalgo=sha512
selinux --enforcing
timezone Pacific/Tahiti
bootloader --location=mbr --driveorder=sda --append="crashkernel=auto rhgb quiet"

# Partitionnement
clearpart --all --drives=sda
volgroup disks pv.01
logvol /        --fstype=ext4   --name=root             --vgname=disks  --size=8000
logvol /usr	--fstype=ext4   --name=usr		--vgname=disks  --size=8000
logvol /tmp	--fstype=ext4   --name=tmp		--vgname=disks  --size=2024
logvol /var	--fstype=ext4   --name=root             --vgname=disks  --size=1	--grow

part /boot --fstype=ext4 --size=256
part swap  --fstype=swap --size=256
part pv.01 --grow --size=1


repo --name="CentOS"  --baseurl=http://mirror.centos.org/centos/6.4/os/x86_64/ --cost=100

%packages --nobase
@core
%end

