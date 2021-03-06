# encoding: utf-8

netdata_user = 'netdata'
netdata_group = 'netdata'
netdata_directory = '/opt/netdata'
netdata_conf_dir = '/etc/netdata'
netdata_conf = netdata_conf_dir + '/netdata.conf'
netdata_service = 'netdata'

netdata_url = 'http://localhost:19999'


##
## environment checks
##

describe user(netdata_user) do
  it { should exist }
end

describe group(netdata_group) do
  it { should exist }
end

describe directory(netdata_directory) do
  it { should be_directory }
end
describe directory(netdata_conf_dir) do
  it { should be_directory }
end
describe file(netdata_conf) do
  it { should exist }
end

describe service(netdata_service) do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end


##
## functional
##

describe http(netdata_url) do
  its('status') { should cmp 200 }
end

# test allmetrics endpoint
describe http(netdata_url + '/api/v1/allmetrics?format=shell') do
  its('status') { should cmp 200 }
end
