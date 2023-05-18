#!/bin/bash
    yum update -y
    yum install git -y
    
    # Install Docker
    groupadd docker
    amazon-linux-extras install docker -y

    # Start Docker service
    systemctl start docker
    systemctl enable docker
    usermod -aG docker ec2-user 
    
    # Install Docker Compose
    curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    export PATH="/usr/local/bin:$PATH"
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
