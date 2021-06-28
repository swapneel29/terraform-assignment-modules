cd /etc/ansible
publicip=$(cat publicip.txt)
echo [demo] >> hosts
echo node1 ansible_host=$publicip ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/devops1.pem >> hosts
echo [local] >> hosts
echo master ansible_host=172.31.35.175 ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/devops1.pem >> hosts
