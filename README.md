ansible-role-netdata
=========

[![Build Status](https://travis-ci.org/avishefi/ansible-role-netdata.svg?branch=master)](https://travis-ci.org/avishefi/ansible-role-netdata)

Ansible role to install & configure [netdata](https://github.com/firehol/netdata). By default installs the latest netdata version using the kickstart script, can be customized by overriding the variable `netdata_version`.

Note: This role does not compile netdata, it just downloads and executes the netdata self-extracting installation archive.

Configuration Files
-------------------

The netdata configuration files are deployed by the netdata makeshell installer self-extracting script and are therefore not provided by this role. You should create a role/playbook that runs `ansible-role-netdata` and then deploys your netdata version-controlled configuration files.

Sample configuration files can be found under the `sample_conf_files` directory on the `ansible-role-netdata` git repository.

Requirements
------------

Role Variables
--------------

The variable `netdata_version` can be either `latest` or a valid netdata version string: `vN.N.N-xxx-<hash>` (default is `latest`).

The following default variables are also configurable:
- `netdata_force_install` controls installation even when netdata is already installed (defaults to `true`)
- `netdata_kickstart_download_url` is the kickstart shell script to install the latest netdata version
- `netdata_base_url` is the base binary packages GitHub URL
- `netdata_installer_tmp_dir` is the temporary location where the kickstart script or makeshell *.run file is downloaded to, default: `/tmp` (assumes it already exists)

Example Playbook
----------------

``` yaml
- hosts: all
  become: yes
  roles:
  - { role: ansible-role-netdata }
```

Take a look also on the testing playbook: `tests/test.yml`

Testing
-------

Vagrant
-------

Use the command `vagrant up` to bring up a guest VirtualBox machine with netdata installed using this role. Upon completion, netdata will be available at <http://localhost:19999/>.

The `Vagrantfile` supports a netdata version argument passed as an environment variable, for example: `NETDATA_VERSION=vx.y.z-NNN-<hash> vagrant up`. Check the [binary-packages GitHub repository](https://github.com/firehol/binary-packages) for the list of netdata versions.

The default value for `NETDATA_VERSION` is `latest`.

License
-------

MIT
