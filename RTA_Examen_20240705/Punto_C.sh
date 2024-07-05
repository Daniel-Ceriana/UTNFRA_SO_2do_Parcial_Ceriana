cd UTN-FRA_SO_Examenes/202406/docker/ 
vim index.html
vim Dockerfile
mkdir web
mv index.html web/
sudo fdisk /dev/sdc
sudo pvcreate /dev/sdc5
sudo vgextend vg_datos /dev/sdc5
sudo lvextend -l 100%FREE /dev/mapper/vg_datos-lv_docker
sudo resize2fs /dev/mapper/vg_datos-lv_docker
docker build -t web1-ceriana:v1 .
echo "docker run -d -p 8080:80 web1-ceriana:v1" >> run.sh
