## Automated ELK Stack Deployment
## Michael W. He

The files in this repository were used to configure the network depicted below.

> Images/Network_Diagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. Alternatively, select portions of the Ansible playbook file may be used to install only certain pieces of it, such as Filebeat.

Included Files:

> Files/install-ELK.yml
> Files/filebeat-playbook.yml
> Files/filebeat-config.yml
> Files/metricbeat-config.yml
> Files/ansible.cfg
> Files/hosts
> Files/DVWA.yml

Included Screenshots:

> Images/dockerps.png
> Images/Kibana-Filebeat.png

Table of Contents:
1. Description of the Topology
2. Access Policies
3. ELK Configuration
4. Target Machines & Beats
5. How to Use the Ansible Build


### 1. Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

What aspect of security do load balancers protect? What is the advantage of a jump box?

Load balancing ensures that the application will be highly available, in addition to restricting access to the network (single access point). A jump box provides a virtual environment to test and deploy resources to the cloud environment.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.

What does Filebeat watch for? New content added to log files.
What does Metricbeat record? System metrics and statistics from the operating system.

The configuration details of each machine may be found below.

| Name          | Function      | IP Address    | Operating System |
|---------------|---------------|---------------|------------------|
| Jump Box      | Gateway       | 10.0.0.1      | Linux            |
| Web-1         | Web App Host  | 10.0.0.8      | Linux            |
| Web-2         | Web App Host  | 10.0.0.9      | Linux            |
| Web-3         | Web App Host  | 10.0.0.10     | Linux            |
| Load Balancer | Load Balancer | 52.136.124.25 | Linux            |
| ELK Server    | ELK Host      | 10.1.0.5      | Linux            |

### 2. Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Load Balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
 108.x.x.x

Machines within the network can only be accessed by SSH.

Which machine did you allow to access your ELK VM? What was its IP address?

Windows local machine (108.x.x.x)

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses |
|-------------|---------------------|----------------------|
| Jump Box    | No                  | 20.55.12.15          |
| HTTP to LB  | Yes                 | 108.x.x.x            |
| Allow RDP   | No                  | 10.0.0.0/16          |
| SSH Windows | Yes                 | 108.x.x.x            |

### 3. ELK Configuration

Ansible was used to automate configuration of the ELK server. No configuration was performed manually.

What is the main advantage of automating configuration with Ansible?
Eliminate repetitive tasks. Fewer mistakes or errors.

The playbook implements the following tasks:
- Install Docker
- Download docker container wiht ELK stack image (sebp/elk:761)
- Configure ports 5601, 9200, 5044
- Enable docker service with systemd

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Images/dockerps.png

### 4. Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.8
- 10.0.0.9
- 10.0.0.10

We have installed the following Beats on these machines:
Filebeat, Metricbeat

These Beats allow us to collect the following information from each machine:
`Filebeat` collects system logs, which we use to monitor system commands and events.
`Metricbeat` collects system metrics and statistics, which we use to monitor performance over time.

### 5. Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml file to /etc/ansible/roles.
- Update the filebeat-config file to include the internal IP address of the ELK VM.
- Run the playbook, and navigate to 'http://{ELK_VM_publicIPaddress}:5601/app/kibana' to check that the installation worked as expected.

Which file is the playbook? Where do you copy it?

`install-ELK.yml` is an Ansible playbook file. It should be copied to the /etc/ansible directory.
`filebeat-playbook.yml` is an Ansible playbook file. It should be copied to the /etc/ansible/roles directory.

Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?

The `ansible.cfg` configuration file is updated to allow a remote user to connect to a machine (remote_user=). The `hosts` file is updated to list IP addresses to use in the Ansible playbooks.
One list in the hosts file (`elk`) contains the private IP address of the ELK server and another list in the hosts file (`webservers`) contains the private IP addresses of the DVWA virtual machines.

Which URL do you navigate to in order to check that the ELK server is running?
Navigate to 'http://{ELK_VM_publicIPaddress}:5601/app/kibana'.

An example of a live Kibana dashboard in provided in the following screenshot:

Images/Kibana-Filebeat.png
