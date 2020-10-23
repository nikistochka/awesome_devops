## devops repo

### ./ansible:
* Playbooks
* Roles
* Inventory script for GCE

### ./project-templates:
* Multistage.Dockerfile template
* docker-compose.yml template

### ./packer
* Hashicorp Packer template for creation Ubuntu AMI wich is added to your ECS cluster.

Use command: `packer build -var 'ECS_CLUSTER=your_cluster_name' ecs-ubuntu.json`
