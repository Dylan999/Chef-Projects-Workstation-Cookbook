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
 content 'This server belongs to Dylan, go away'
 action :create
 owner 'root'
 group 'root'
end

service 'ntpd' do
 action [ :enable, :start ]
end
