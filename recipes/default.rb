#
# Cookbook Name:: cddemo-base
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'less'
package 'htop'
package 'vim'
package 'curl'
package 'unzip'
package 'ncdu'
package 'telnet'
package 'git'

# Installing ssh keys (ie for git-server access)
directory "/home/heise/.ssh" do
  owner "heise"
  group "heise"
  mode "0700"
  action :create
end

cookbook_file "vagrant_id_rsa" do
  path "/home/heise/.ssh/id_rsa"
  owner "heise"
  group "heise"
  mode "0600"
  action :create_if_missing
end

cookbook_file "vagrant_id_rsa.pub" do
  path "/home/heise/.ssh/id_rsa.pub"
  owner "heise"
  group "heise"
  mode "0644"
  action :create_if_missing
end

# Setting up a proper .vimrc
cookbook_file ".vimrc" do
  path "/home/heise/.vimrc"
  owner "heise"
  group "heise"
  mode "0644"
  action :create_if_missing
end

bash "set_editor_vim_heise" do
  user "heise"
  cwd "/home/heise"
  code <<-EOF
  echo "export EDITOR=vi" >> .bashrc
  EOF
  not_if "grep 'EDITOR=vi' /home/heise/.bashrc", :user => 'heise'
end

bash "set_editor_vim_root" do
  user "root"
  cwd "/root"
  code <<-EOF
  echo "export EDITOR=vi" >> .bashrc
  EOF
  not_if "grep 'EDITOR=vi' /root/.bashrc", :user => 'root'
end

# Install .gitconfig
cookbook_file ".gitconfig" do
  path "/home/heise/.gitconfig"
  owner "heise"
  group "heise"
  mode "0644"
  action :create_if_missing
end
