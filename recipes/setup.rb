package 'emacs'

package 'tree' do
 action :install
end

package 'git' do
 action :install
end

package 'ntp' do 
 action :install
end

file '/etc/motd' do
 content "This server belongs to Dylan, the stats for this machine are
 HOSTNAME: #{node['hostname']}
 IPADDRESS: #{node['ipaddress']} 
 CPU: #{node['cpu']['0']['mhz']}
 MEMORY: #{node['memory']['total']}
"
 action :create
 owner 'root'
 group 'root'
end

service 'ntpd' do
 action [ :enable, :start ]
end
