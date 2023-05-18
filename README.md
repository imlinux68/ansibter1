# Terraform + Ansible
## _How to run LoadBalancer in docker compose on EC2 using Terraform and Ansible_

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

## First step - prepare environment
### ssh
Creating an ssh key-pair, but if you **have it already**, !then! change variables of 2 files
**_key name_** in **_main_** terraform file
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
Use the terraform [installation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) link
```bash
python3 -m pip install --user ansible

python3 -m pip install --upgrade --user ansible

python3 -m pip show ansible

ansible --version
```


## Second step
### EC2
Creating ec2 with terraform and install docker and docker-compose from user_data template file
- terraform initializing
- terraform planning
- terraform applying
- terraform destrpoying    # terraform destroy

```sh
terraform init
terraform plan
terraform apply --auto-approve
```

## Third Step
### Running load balancer
terraform will output a public ip
take it and put it into **_inventory.txt_**
into  **ansible_host variable**

after saving this file
run 
```sh
ansible-playbook lb.yaml
```

and check the public ip
```sh
curl http://<public_p>
firefox http://<public_ip>
```


## License

MIT

**Free Software, Hell Yeah!**
