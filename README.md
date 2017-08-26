ansible-role-netdata
=========

[![Build Status](https://travis-ci.org/avishefi/ansible-role-netdata.svg?branch=master)](https://travis-ci.org/avishefi/ansible-role-netdata)

Ansible role to install & configure [netdata](https://github.com/firehol/netdata). By default installs the latest netdata version using the kickstart script, can be customized by overriding the variable `netdata_version`.

Note: This role does not compile netdata, it just downloads and executes the netdata self-extracting installation archive. The role is tested on Ubuntu only, however it uses the netdata installer which is intended to work on most any Linux systems.

Configuration Files
-------------------

The netdata configuration files are deployed by the netdata [makeself](http://makeself.io/) self-extracting installation script and are therefore not provided by this role. You should create a role/playbook that runs `ansible-role-netdata` and then deploys your netdata version-controlled configuration files.

A sample role which can be copied and used, together with netdata configuration template files, can be found under the `sample_netdata_role` directory on the `ansible-role-netdata` git repository.

Requirements
------------

Role Variables
--------------

The variable `netdata_version` can be either `latest` or a valid netdata version string: `vN.N.N-xxx-<hash>` (default is `latest`).

The following default variables are also configurable:
- `netdata_force_install` controls installation even when netdata is already installed (defaults to `true`)
- `netdata_kickstart_download_url` is the kickstart shell script to install the latest netdata version
- `netdata_base_url` is the base binary packages GitHub URL
- `netdata_installer_tmp_dir` is the temporary location where the kickstart script or makeself *.run file is downloaded to, default: `/tmp` (assumes it already exists)

Example Playbook
----------------

``` yaml
- hosts: all
  become: yes
  roles:
  - { role: ansible-role-netdata }
```

Testing
-------

A testing playbook that uses `ansible-role-netdata` can be found on: `tests/test.yml`. The role is tested using InSpec for basic netdata installation testing.

Vagrant
-------

Execute `vagrant up` to provision a guest VirtualBox machine with netdata installed using this role. Upon completion, netdata will be available at <http://localhost:19999/>.

The `Vagrantfile` supports a netdata version argument passed as an environment variable, for example: `NETDATA_VERSION=vx.y.z-NNN-<hash> vagrant up`. Check the [binary-packages GitHub repository](https://github.com/firehol/binary-packages) for the list of netdata versions.

The default value for `NETDATA_VERSION` is `latest`.

License
-------

MIT
