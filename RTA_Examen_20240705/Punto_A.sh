sudo fdisk /dev/sdc
sudo pvcreate /dev/sdc1
sudo pvcreate /dev/sdc2
sudo vgcreate vg_datos /dev/sdc1 /dev/sdc2
sudo lvcreate -l +100%FREE vg_datos -n lv_workareas
sudo fdisk /dev/sdd
sudo pvcreate /dev/sdd1
sudo vgcreate vg_temp /dev/sdd1
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
sudo lvcreate -l +100%FREE vg_temp -n lv_swap
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo swapon /dev/mapper/vg_temp-lv_swap
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker
sudo mkdir /work
sudo mount /dev/mapper/vg_datos-lv_workareas /work
sudo vim cerianaAltaUser-Groups.sh
