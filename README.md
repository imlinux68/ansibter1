# Terraform + Ansible
## _How to run LoadBalancer in docker compose on EC2 using Terraform and Ansible_

[![Powered By Amazon](https://img.shields.io/badge/Amazon%20EC2-FF9900.svg?style=for-the-badge&logo=Amazon-EC2&logoColor=white)](https://aws.amazon.com)

## First step - prepare environment
### ssh

![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

Creating an ssh key-pair, but if you **have it already**, !then! change variables of 2 files<br>
**_key name_** in **_main_** terraform file<br>
**_ansible_ssh_private_key_file_** in **_inventory.txt_** file

```sh
ssh-keygen -t rsa -b 4096 -f ~/.ssh/ec2-instances
```
### Terraform
Use the terraform [download](https://developer.hashicorp.com/terraform/downloads) link

```bash
wget https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip

unzip terraform_1.4.6_linux_amd64.zip

sudo mv terraform /usr/bin/terraform

terraform --version
```

### Ansible 
Use the Ansible [installation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) link
```bash
python3 -m pip install --user ansible

python3 -m pip install --upgrade --user ansible

python3 -m pip show ansible

ansible --version
```


## Second step
### EC2

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

Creating ec2 with terraform and install docker and docker-compose from user_data template file
- Terraform initializing
- Terraform planning
- Terraform applying
- Terraform destroying    # terraform destroy

```sh
terraform init
terraform plan
terraform apply --auto-approve
```


```sh
# In order to destroy created with terraform
terraform destroy
```

## Third step
### Running load balancer

![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)

Terraform will output a public ip <br>
Take it and put it into **_inventory.txt_** <br>
Into  **ansible_host variable** <br>

After saving this file run next:
```sh
ansible-playbook lb.yaml
```

And check the public ip
```sh
curl http://<public_ip>
firefox http://<public_ip>
```


## License

MIT

**Free Software, Hell Yeah!**

