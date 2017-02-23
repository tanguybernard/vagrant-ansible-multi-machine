# vagrant-ansible-multi-machine

This personal development VM with Ansible provisioning. CONSTRUCTION IN PROGRESS !!!!


## Guest OS

I am using the lastest CentOS 7 x64 image from official [Hashicorp](https://atlas.hashicorp.com/centos/7) (thanks)

## Prerequisites / Requirements

- [Virtualbox platform](https://www.virtualbox.org/wiki/Downloads) (Tested with version 5.1.4)
- [Vagrant](https://docs.vagrantup.com/v2/installation/) (Tested with version 1.8.6)
- guest additions to Vagrant
  - `vagrant plugin install vagrant-vbguest`
  - `vagrant plugin install vagrant-hostmanager`
  - `vagrant plugin install vagrant-env`
- [Git](https://git-scm.com/)
- [Ansible](http://docs.ansible.com/ansible/intro_installation.html) (Tested with version 2.2.0.0)
- [sshpass] 
  - OSX :
  (brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb)

## Box

### Add the vagrant user to sudoers file:
  - `$ sudo su -`
  - `$ visudo`
  - `# Add the following line to the end of the file.`
  - `vagrant ALL=(ALL) NOPASSWD:ALL`


## Usage

Check vagrant machines: 

    vagrant global-status

If you would like to provision only certain node:

    vagrant up prod

## ...

ansible-playbook -i ansible/development ansible/site.yml --user user --ask-pass -vvvv



## Credits
This repository was inspired and designed around vagrant-centos7-ansible-lamp:
    
    https://github.com/skecskes/vagrant-centos7-ansible-lamp


- https://github.com/enginyoyen/vagrant-multi-machine
- https://github.com/frankdejonge/vagrant-nginx-loadbalancing
- http://blog.scottlowe.org/2014/10/22/multi-machine-vagrant-with-yaml/
- https://www.theodo.fr/blog/2015/10/best-practices-to-build-great-ansible-playbooks/  => AWESOME

