ansible-role-netdata
=========

Ansible role to install & configure netdata. By default installs the latest netdata version using the kickstart script, can be customized by overriding the variable `netdata_version`.

Configuration Files
-------------------

The netdata configuration files are deployed by the netdata makeshell installer self-extracting script and are therefore not provided by this role. You should create a role/playbook that runs `ansible-role-netdata` and then deploys your netdata version-controlled configuration files.

Sample configuration files can be found under the `sample_conf_files` directory on the `ansible-role-netdata` git repository.

Requirements
------------

Role Variables
--------------

The variable `netdata_version` can be either `latest` or a valid netdata version string: `vN.N.N-xxx-<hash>`.

The following default variables are also configurable:
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

License
-------

MIT
