# odroid-c2-linux-4.12-ansible
Ansible Role to compile Linux 4.12 kernel and u-boot 2017.07 on an Odroid C2 with one command

## Purpose
Hardkernel Odroid C2 comes with Ubuntu and a legacy Linux 3.14 kernel.
They took a lot of effort to get support for that board into Mainline, now, with Linux kernel 4.12 it is supported.

**For now, please do not use that on a machine, you expect to work reliable.**

This playbook just works fine for me and is made to show all necessary steps. But if you have a spare sd card and some time, try it out!

## What this playbook does:
Everything is done on Odroid C2 target machine. With meson-tools, there is no need to sign u-boot locally on X86 anymore.

* install all dependencies for compiling kernel and u-boot
* clone official kernel.org Mainline repository with git
* compile and install kernel 4.12 image and modules
* clone and compiles Mainline u-boot 2017.07 from official repository
* clone and builds meson-tools from repository
* clone legacy hardkernel u-boot repository with git 
* build fip_create from hardkernels u-boot and copy needed binary blobs
* build amlbootsig from meson-tools
* generate ramdisk uInitrd
* sign u-boot image with amlbootsig from meson-tools (replaces aml_encrypt_gxb)
* flash hardkernel blobs and signed u-boot to sd card or emmc
* generate boot.scr
* umount and fsck fat partition

## What this playbook does not:
* build u-boot and kernel packages
* mark any installed packages as hold

## How to use

### Ansible
This role needs Ansible >=2.2. If you have installed an older version, you can easily update to 2.2:
http://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-apt-ubuntu

### Preparing target machine
Default Python version in Ubuntu 16.04 is Python 3, Ansible still needs 2.7, therefore (on **target** machine):

apt-get install python-minimal

### Set target host in playbook
Edit playbook.yml and set host: to your target host you want to update.

### Run playbook

ansible-playbook playbook.yml

### Reboot
When playbook finished (it takes some hours), just reboot and enjoy your new kernel.
