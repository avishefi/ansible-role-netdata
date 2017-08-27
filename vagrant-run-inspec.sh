#!/bin/bash
if [[ "${DEBUG:-}" == "1" ]]; then
  set -x
fi

IFS='' _vagrant_ssh_config=$(vagrant ssh-config)
_vagconf() {
  echo "$_vagrant_ssh_config" | grep -E "$1\s" 2>/dev/null | awk '{print $2}' 2>/dev/null | tr -d '[:space:]'
}


hostname=$(_vagconf 'HostName')
username=$(_vagconf 'User')
port=$(_vagconf 'Port')
keyfile=$(_vagconf 'IdentityFile')

inspec exec tests/default -t "ssh://${username}@${hostname}:${port}" -i "${keyfile}"
