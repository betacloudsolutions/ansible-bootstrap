# Ansible betacloud.bootstrap

![Ansible 2.1](https://img.shields.io/badge/Ansible-2.1-green.png?style=flat)
![Ansible 2.2](https://img.shields.io/badge/Ansible-2.2-green.png?style=flat)
![Ansible 2.3](https://img.shields.io/badge/Ansible-2.3-green.png?style=flat)

This is an Ansible role that bootstraps an Ubuntu servers.

Supported Linux distributions
-----------------------------

* Ubuntu 16.04 (Xenial)
* CentOS 7

Dependencies
------------

none

Example Playbook
----------------

```yml
- hosts: all

  roles:
  - role: betacloud.bootstrap
```

License
-------

This file is subject to the terms and conditions defined in file 'LICENSE',
which is part of this repository.

Author information
------------------

This role was created by [Betacloud Solutions GmbH](https://betacloud-solutions.de).
