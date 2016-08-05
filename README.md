# vagrant-ansible-multi-machine

This personal development VM with Ansible provisioning. Fully working example LAMP stack for my personal application.


## Guest OS

I am using the lastest CentOS 7 x64 image from official [Hashicorp](https://atlas.hashicorp.com/centos/7) (thanks)

## Prerequisites / Requirements

- [Virtualbox platform](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://docs.vagrantup.com/v2/installation/)
- guest additions to Vagrant
  - `vagrant plugin install vagrant-vbguest`
  - `vagrant plugin install vagrant-hostmanager`
- [Git](https://git-scm.com/)
- [Ansible](http://docs.ansible.com/ansible/intro_installation.html)


## Usage

Check vagrant machines: 

    vagrant global-status

If you would like to provision only certain node:

    vagrant up prod



## Credits
This repository was inspired and designed around vagrant-centos7-ansible-lamp:
    
    https://github.com/skecskes/vagrant-centos7-ansible-lamp


- https://github.com/enginyoyen/vagrant-multi-machine
- https://github.com/frankdejonge/vagrant-nginx-loadbalancing
- http://blog.scottlowe.org/2014/10/22/multi-machine-vagrant-with-yaml/
- https://www.theodo.fr/blog/2015/10/best-practices-to-build-great-ansible-playbooks/  => AWESOME

